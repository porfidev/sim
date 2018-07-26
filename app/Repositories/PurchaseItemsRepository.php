<?php

namespace App\Repositories;

interface PurchaseItemsRepository
{
	const SQL_ID    = "id";
	const DOCENTRY = "DocEntry";
    const SQL_PURCHASE_ID    = "purchase_id";
    const SQL_ITEMCODE  = "ItemCode";
    const SQL_PRODUCTID  = "product_id";
	const SQL_QUANTITY  = "quatity";
	const SQL_CODEBARS  = "CodeBars";
	const SQL_CANTREQ  = "u_CantReq";
    const SQL_DISTNUMBER  = "DistNumber";
	const SQL_CADUCIDAD  = "u_Caducidad";
	const SQL_STATUS  = "status";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getById($id);

	function getByCode($ItemCode);

	function getByCodeLote($CodeBars, $DistNumber);

	function updateStatus($purchase_id, $ItemCode);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}