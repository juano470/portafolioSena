<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SitioController extends Controller
{

	
	public function saludar(Request $request, $nombre){
		echo "Hello " . $nombre;
	}

	public function index(){

		echo "Hola mundo";


	}

	public function mario(Request $request, $name, $edad){

		echo "hola" . $name. " tienes " . $edad . "años";

	}
}
