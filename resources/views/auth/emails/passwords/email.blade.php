<!-- resources/views/auth/passwords/email.blade.php -->

<form method="POST" action="{{ route('password.email') }}">
    @csrf

    <label for="email">Email:</label>
    <input type="email" name="email" required>

    <button type="submit">Envoyer le lien de réinitialisation</button>
</form>
