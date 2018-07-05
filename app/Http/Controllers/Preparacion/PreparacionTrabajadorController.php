<?php

namespace App\Http\Controllers\Preparacion;

use DB;
use Log;
use Auth;
use Validator;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

use App\Repositories\ProductRepository;
use App\Repositories\OrderDetailRepository;
use App\Repositories\OrderRepository;
use App\Repositories\CatalogoRepository;
use App\Repositories\BoxesRepository;
use App\Repositories\AssignmentRepository;

class PreparacionTrabajadorController extends Controller
{
    private $productModel;
    private $orderDetailModel;
    private $orderModel;
    private $catalogModel;
    private $boxModel;
    private $assigmentModel;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        ProductRepository $product,
        OrderDetailRepository $detail,
        OrderRepository $order,
        CatalogoRepository $catalog,
        BoxesRepository $box,
        AssignmentRepository $assigment)
    {
        $this->middleware(['auth', 'permission', 'update.session']);
        $this->productModel     = $product;
        $this->orderDetailModel = $detail;
        $this->orderModel       = $order;
        $this->catalogModel     = $catalog;
        $this->boxModel         = $box;
        $this->assigmentModel   = $assigment;
    }

    /**
     * Función para obtener el listado de tareas de un trabajador
     * en el área de preparación de pedidos.
     *
     * @return View
     */
    public function listadoTareas(Request $request)
    {
        try {
            $listado = $this->assigmentModel->getOPWorks(Auth::id(), 5);

            return view('preparacion.trabajador',
                array(
                    "listado"    => $listado
                )
            );

        } catch (\Exception $e) {
            Log::error( 'PreparacionTrabajadorController - listadoPedidos - Exception: '.$e->getMessage() );
            Log::error( "PreparacionTrabajadorController - listadoPedidos - Trace: \n".$e->getTraceAsString() );
            return view('error',
                array(
                    "error"  => "Ocurrio el siguiente error: ".$e->getMessage(),
                    "titulo" => "Error inesperado"
                )
            );
        }
    }

    /**
     * Función para asignar una caja a una tarea
     *
     * @return json
     */
    public function asignaCaja(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" PreparacionTrabajadorController - asignaCaja ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'id'     => 'required|string|exists:order_designs,id',
                    'caja'   => 'required|string|exists:box_ids,id',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                Log::error("PreparacionTrabajadorController - asignaCaja - Error en validator");
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $box = $this->boxModel->findBoxId($request->caja);
                Log::info("PreparacionTrabajadorController - asignaCaja - caja: ".$box->status);
                if( intval($box->status) < BoxesRepository::BOX_ASSIGN ) {
                    Log::info("PreparacionTrabajadorController - asignaCaja - Cambio de estatus");
                    DB::beginTransaction();
                    $this->boxModel->updateBoxId(
                        $request->caja,
                        array(
                            BoxesRepository::SQL_BOX_ID_STATUS => BoxesRepository::BOX_ASSIGN
                        )
                    );
                    $this->orderModel->updateDesign(
                        $request->id,
                        array(
                            OrderRepository::DESIGN_BOX => $request->caja
                        )
                    );
                    DB::commit();
                } else {
                    Log::error("PreparacionTrabajadorController - asignaCaja - CAJA USADA");
                    $resultado = "ERROR";
                    $mensajes = array( "La caja seleccionada ya ha sido usada" );
                }
            }
        } catch (\Exception $e) {
            Log::error( "PreparacionTrabajadorController - asignaCaja - Exception: ".$e->getMessage() );
            Log::error( "PreparacionTrabajadorController - asignaCaja - Trace: \n".$e->getTraceAsString() );
            DB::rollback();
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

    /**
     * Función que cambia de estatus la asignación a terminada
     *
     * @return json
     */
    public function terminarTarea(Request $request)
    {
        $resultado = "OK";
        $mensajes  = "NA";
        try {
            Log::info(" PreparacionTrabajadorController - terminarTarea ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'tarea' => 'required|string|exists:assignments,id',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                DB::beginTransaction();
                $this->assigmentModel->update(
                    $request->tarea,
                    array(
                        AssignmentRepository::SQL_STATUS => AssignmentRepository::STATUS_FINISH
                    )
                );
                $task  = $this->assigmentModel->getById($request->tarea);
                $order = $task->order;
                if($order->status === OrderRepository::PREPARADO_ESPERA){
                    $this->orderModel->update(
                        $task->id,
                        array(
                            OrderRepository::SQL_ESTATUS => OrderRepository::PREPARADO_PROCESO
                        )
                    );
                }
                DB::commit();
            }
        } catch (\Exception $e) {
            Log::error( 'PreparacionTrabajadorController - terminarTarea - Exception: '.$e->getMessage() );
            Log::error( "PreparacionTrabajadorController - terminarTarea - Trace: \n".$e->getTraceAsString() );
            DB::rollback();
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

}