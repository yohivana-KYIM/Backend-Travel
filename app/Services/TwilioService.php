<?php
// app/Services/TwilioService.php

namespace App\Services;

use Twilio\Rest\Client;
use Illuminate\Support\Facades\Config;

class TwilioService
{
    protected $twilioSid;
    protected $twilioAuthToken;
    protected $twilioPhoneNumber;

    public function __construct()
    {
        $this->twilioSid = Config::get('services.twilio.sid');
        $this->twilioAuthToken = Config::get('services.twilio.auth_token');
        $this->twilioPhoneNumber = Config::get('services.twilio.phone_number');

        // Vérifiez si les informations d'identification sont disponibles
        if (empty($this->twilioSid) || empty($this->twilioAuthToken) || empty($this->twilioPhoneNumber)) {
            throw new \Exception('Twilio credentials are not configured.');
        }
    }

    public function envoyerSMS($numéroDeTéléphone, $message)
    {
        try {
            $client = new Client($this->twilioSid, $this->twilioAuthToken);

            $client->messages->create(
                $numéroDeTéléphone,
                [
                    'from' => $this->twilioPhoneNumber,
                    'body' => $message,
                ]
            );
        } catch (\Exception $e) {
            // Gérer l'erreur, par exemple, en enregistrant les détails dans les logs
            \Log::error('Erreur Twilio: ' . $e->getMessage());
            throw $e; // Rethrow l'exception pour la propagation
        }
    }
}
