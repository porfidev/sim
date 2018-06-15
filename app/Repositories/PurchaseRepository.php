<?php

namespace App\Repositories;

interface PurchaseRepository
{
	const SQL_ID    = "id";
	const SQL_DOCENTRY = "DocEntry";
    const SQL_DOCNUM  = "DocNum";
    const SQL_CARDCODE  = "CardCode";
	const SQL_CARDNAME  = "CardName";
	const SQL_DOCDUEDATE  = "DocDueDate";
	const SQL_ARRIVAL  = "arrival";
	const SQL_STATUS  = "status";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getList($itemsPerPage, array $search = null);

	function getAll(array $search = null);

	function getById($id);

	function getByCode($CardCode);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}