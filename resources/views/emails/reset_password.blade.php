<!-- resources/views/emails/reset-password.blade.php -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réinitialisation de mot de passe</title>
</head>
<body>
    <p>Bonjour !</p>
    <p>Vous recevez cet e-mail car nous avons reçu une demande de réinitialisation de mot de passe pour votre compte.</p>
    <p>
        Si vous n'avez pas demandé de réinitialisation de mot de passe, aucune action supplémentaire n'est requise.
    </p>
    <p>
        Pour réinitialiser votre mot de passe, cliquez sur le lien suivant :
        <a href="{{ $resetLink }}">{{ $resetLink }}</a>
    </p>
    <p>
        Ce lien de réinitialisation de mot de passe expirera dans 60 minutes.
    </p>
</body>
</html>
