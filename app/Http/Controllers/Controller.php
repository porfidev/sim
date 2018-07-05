<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	const JSON_MESSAGE  = "mensajes";
    const JSON_RESPONSE = "resultado";
    const JSON_DATA     = "datos";
    const JSON_CERRADO  = "cerrado";

    public static $messages = array(
		'required'           => 'El campo :attribute, es requerido',
		'email.required'     => 'El campo correo electrónico, es requerido',
		'password.required'  => 'El campo contraseña, es requerido',
		'email'              => 'El correo electrónico no es válido',
		'min'                => 'El campo :attribute debe tener como mínimo :min caracteres',
		'password.min'       => 'El campo contraseña debe tener como mínimo :min caracteres',
		'confirmed'          => 'La confirmación del campo :attribute no coincide.',
		'password.confirmed' => 'La confirmación de la contraseña no coincide.',
		'exists'             => 'El valor del campo :attribute, no es válido'
	);
}
