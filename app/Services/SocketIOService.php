<?php

namespace App\Services;
use GuzzleHttp\Exception\RequestException;


class SocketIOService
{
    public function __construct()
    {
        $this->httpClient = new \GuzzleHttp\Client();
        $this->host = env('SOCKETIO_HOST').':'.env('SOCKETIO_PORT');
    }

    public function emitMessage($messageType, $payload)
    {
        try {
            $params = [
                'form_params' => [
                    'type' => $messageType,
                    'payload' => $payload
                ],
                //'Origin' => '*'
            ];
            $request = $this->httpClient->request('POST', $this->host.'/socket/emit-message', $params);

            $request->getStatusCode();
        } catch (RequestException $e){
            dd($e->getCode());
            $response = $e->getResponse();
            dd($response);
        }
    }
}