<?php

// app/Notifications/ResetPasswordNotification.php

namespace App\Notifications;

use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPasswordNotification extends Notification
{
    public $token;

    public function __construct($token)
    {
        $this->token = $token;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }



public function toMail($notifiable)
{
    return (new MailMessage)
        ->subject('Réinitialisation de mot de passe')
        ->line('Vous recevez cet e-mail car nous avons reçu une demande de réinitialisation de mot de passe pour votre compte.')
        ->action('Réinitialiser le mot de passe', url(config('app.url') . '/password/reset/' . $this->token))
        ->line('Si vous n\'avez pas demandé de réinitialisation de mot de passe, aucune action supplémentaire n\'est requise.');
}
}