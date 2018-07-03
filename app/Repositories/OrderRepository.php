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
	const SQL_DIST_ID       = "dist_id";

	const STATUS_OPERATOR   = "operator";
	const STATUS_OPERATOR_2 = "operator_2";
	const SQL_ESTATUS_2     = "status_2";

	const TRACE_SQL_ORER = "order_id";
	const TRACE_SQL_USER = "user_id";
	const TRACE_SQL_TYPE = "trace_type";

	/**
	 * Tipos de seguimiento
	 */
	const TRACE_VALDAR_SURTIDO  = 1;
	const TRACE_RECIBIR_SURTIDO = 2;
	const TRACE_VALIDAR_DPP     = 3;
	const TRACE_VALIDAR_PP      = 4;

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
	const PREPARADO_RECIBIDO = 5;
	const PREPARADO_PROCESO  = 6;
	const PREPARADO_POR_V    = 7;
	const PREPARADO_VALIDADO = 8;

	/**
	 * Estados de preparación de pedidos
	 */
	const DISTRIBUCION_RECIBIDO  = 9;
	const DISTRIBUCION_CITA      = 10;
	const DISTRIBUCION_PROCESO   = 11;
	const DISTRIBUCION_CAMION    = 12;
	const DISTRIBUCION_EXTERNO   = 13;
	const DISTRIBUCION_CLIENTE   = 14;
	const DISTRIBUCION_RECHAZO_T = 15;
	const DISTRIBUCION_RECHAZO_P = 16;

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll(array $search = null);

	function getById($id);

	function getByCode($code);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);

	function addTrace(array $attributes);
}