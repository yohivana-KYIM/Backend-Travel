<?php
// app/Mail/ResetPasswordNotification.php

namespace App\Mail;

use Illuminate\Mail\Mailable;

class ResetPasswordNotification extends Mailable
{
    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.reset_password'); // Assurez-vous d'avoir une vue correspondante
    }
}
