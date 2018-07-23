<?php

namespace App\Repositories;

interface ArrivalItemRepository
{
    const SQL_ID              = "id";
    const SQL_PURCHASEID      = "purchase_id";
    const SQL_ICODE           = "ItemCode";
    const SQL_PEDIM           = "pedimento";
    const SQL_PRODUCTID       = "product_id";
    const SQL_QUANT           = "quantity";
    const CANTIDAD_REC        = "cantidad_rec";
    const SQL_DISTNUMBER      = "DistNumber";
    const SQL_CADUCIDAD       = "u_Caducidad";
    const SQL_CADUCIDADM      = "caducidad_minima";
    const SQL_STATUS          = "status";

    function getList($itemsPerPage, array $search = null);

    function getById($id);

    function getByItemCodeLote($ItemCode, $distNumber);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}