<?php

namespace App\Repositories;

interface ProductRepository
{
    const SQL_ID      = "id";
    const SQL_SKU     = "sku";
    const SQL_CONCEPT = "concept";
    const SQL_ALIAS   = "alias";
    const SQL_W_P_P   = "weight_per_piece";
    const SQL_I_P_D   = "items_per_display";
    const SQL_D_P_B   = "display_per_box";
    const SQL_W_P_D   = "weight_per_display";
    const SQL_W_P_B   = "weight_per_box";
    const SQL_WIDTH   = "width";
    const SQL_HEIGHT  = "height";
    const SQL_DEPTH   = "depth";
    const SQL_B_C     = "barcode";
    const SQL_D_B_C   = "display_barcode";
    const SQL_C_B_C   = "corrugated_barcode";
    const SQL_USER    = "user_id";
    const SQL_CADM    = "caducidad_minima";

    function getList($itemsPerPage, array $search = null);

    function getById($id);

    function getBySku($sku);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id, $user_id);
}