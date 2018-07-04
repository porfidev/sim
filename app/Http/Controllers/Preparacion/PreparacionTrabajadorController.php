<?php

namespace App\Http\Controllers\Preparacion;

use DB;
use Log;
use Auth;

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
}