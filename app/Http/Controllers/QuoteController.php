<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Http;

class QuoteController extends Controller
{
    //
    public function get() : JsonResponse
    {
        $response = Http::get('https://quotes.rest/qod');

        if(!$response->ok()){
            return response()->json([
                'success' => false,
                'message' => 'No quote sorry..'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        return response()->json([
            'success' => true,
            'message' => $response->json('contents.quotes.0.quote'),
            'copyright' => $response->json('copyright'),
        ]);
    }
}
