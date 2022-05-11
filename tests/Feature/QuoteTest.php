<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Http\Response;
use Tests\TestCase;

class QuoteTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_check_if_quote_works_properly()
    {
        $response = $this->get(route('get-quote'));

        $response->assertStatus(Response::HTTP_OK);

        $this->assertTrue($response->json('success'));
        $this->assertNotNull($response->json('message'));
    }
}
