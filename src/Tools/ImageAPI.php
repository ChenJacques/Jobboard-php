<?php

namespace App\Tools;
use GuzzleHttp\Client;

class ImageAPI
{
    private $client;

    public function __construct()
    {
        $this->client = new Client();
    }

    public function getImage() 
    {

        $response = $this->client->request('GET', 'https://random.imagecdn.app/v1/image?width=200&height=200');
        $image = $response->getBody()->getContents();
        return $image;
    }
}

?>