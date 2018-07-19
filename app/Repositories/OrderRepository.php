<?php

namespace App\Repositories;

interface OrderRepository
{
	const SQL_ID            = "id";
	const SQL_CODIGO_ORDEN  = "codeOrder";
	const SQL_INICIO        = "start";
	const SQL_FIN           = "end";
	const SQL_CODIGO        = "code";
	const SQL_ESTATUS       = "status";
	const SQL_NUMAT         = "numat";
	const SQL_DIST_ID       = "dist_id";

	const STATUS_OPERATOR   = "operator";
	const STATUS_OPERATOR_2 = "operator_2";
	const SQL_ESTATUS_2     = "status_2";

	const TRACE_SQL_ORER = "order_id";
	const TRACE_SQL_USER = "user_id";
	const TRACE_SQL_TYPE = "trace_type";

	const DESIGN_ORDER        = "order_id";
	const DESIGN_ORDER_DETAIL = "order_detail_id";
	const DESIGN_BOX          = "box_id";
	const DESIGN_QUANTITY     = "quantity";
	const DESIGN_BOX_TYPE     = "box_type_id";
	const DESIGN_SEQUENCE     = "sequence";
	const DESIGN_P_ORDER      = "packing_order";

	/**
	 * Tipos de seguimiento
	 */
	const TRACE_VALDAR_SURTIDO  = 1;
	const TRACE_RECIBIR_SURTIDO = 2;
	const TRACE_VALIDAR_DPP     = 3;
	const TRACE_VALIDAR_PP      = 4;
	const TRACE_RECIBIR_DIST    = 5;

	/**
	 * Estados de error
	 */
	const CANCELADO  = -99;
	const SIN_DATOS  = 0;

	/**
	 * Estados de surtido
	 */
	const SURTIDO_ESPERA  = 1;
	const SURTIDO_PROCESO = 2;
	const SURTIDO_POR_V   = 3;
	const SURTIDO_VALIDO  = 4;

	/**
	 * Estados de preparación de pedidos
	 */
	const PREPARADO_RECIBIDO = 10;
	const PREPARADO_DISENIO  = 11;
	const PREPARADO_ESPERA   = 12;
	const PREPARADO_PROCESO  = 13;
	const PREPARADO_POR_V    = 14;
	const PREPARADO_VALIDADO = 15;

	/**
	 * Estados de preparación de pedidos
	 */
	const DISTRIBUCION_RECIBIDO  = 20;
	const DISTRIBUCION_CITA      = 21;
	const DISTRIBUCION_PROCESO   = 22;
	const DISTRIBUCION_CAMION    = 23;
	const DISTRIBUCION_EXTERNO   = 24;
	const DISTRIBUCION_CLIENTE   = 25;
	const DISTRIBUCION_RECHAZO_T = 26;
	const DISTRIBUCION_RECHAZO_P = 27;

	const DELETED = 0;
	const ACTIVE  = 1;

	function getUsed($order_id, $order_detail_id);

	function getMaxMin($order_id);

	function getDesignListByOrder($order_id);

	function getDesignListByBox($box_id);

	function createDesign(array $attributes);

	function getIdOrdByBox($id);

	function deleteDesign($id);

	function getDesignGroupByItem($order_id);

	function getDesignsByDetail($order_detail_id);

	function updateDesign($id, array $attributes);

	function getAll(array $search = null);

	function getById($id);

	function getByCodeCli($code);

	function getByCodeDist($distId);

	function getByCode($code);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);

	function addTrace(array $attributes);
}