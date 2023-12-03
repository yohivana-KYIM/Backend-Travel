<?php
// app/Mail/ResetPasswordNotification.php

namespace App\Mail;

use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPasswordNotification extends Notification
{
    public $token;

    public function __construct($token)
    {
        $this->token = $token;
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Réinitialisation de mot de passe')
            ->markdown('emails.reset_password', ['resetLink' => url(config('app.url').route('password.reset', $this->token, false))]);
    }
}
