<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SitioController extends Controller
{
    
    public function saludar(Request $request, $nombre){
    	echo "Hello " . $nombre;
    }
}
