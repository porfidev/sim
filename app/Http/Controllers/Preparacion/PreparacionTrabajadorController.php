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
            Log::error( 'PreparacionJefeController - listadoPedidos - Error'.$e->getMessage() );
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
            Log::info(" PreparacionJefeController - asignaCaja ");
            $validator = Validator::make(
                $request->all(),
                array(
                    'id'     => 'required|string|exists:order_designs,id',
                    'caja'   => 'required|string|exists:box_ids,id',
                ),
                Controller::$messages
            );
            if ($validator->fails()) {
                $resultado = "ERROR";
                $mensajes = $validator->errors();
            } else {
                $this->orderModel->updateDesign(
                    $request->id,
                    array(
                        OrderRepository::DESIGN_BOX => $request->caja
                    )
                );
            }
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - asignaCaja - Error: '.$e->getMessage() );
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
            Log::info(" PreparacionJefeController - terminarTarea ");
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
                $this->assigmentModel->update(
                    $request->tarea,
                    array(
                        AssignmentRepository::SQL_STATUS => AssignmentRepository::STATUS_FINISH
                    )
                );
            }
        } catch (\Exception $e) {
            Log::error( 'PreparacionJefeController - terminarTarea - Error: '.$e->getMessage() );
            $resultado = "ERROR";
            $mensajes  = array( $e->getMessage() );
        }
        return response()->json(array(
            Controller::JSON_RESPONSE => $resultado,
            Controller::JSON_MESSAGE  => $mensajes
        ));
    }

}