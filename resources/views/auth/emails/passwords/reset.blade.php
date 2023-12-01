<!-- resources/views/auth/passwords/reset.blade.php -->

<form method="POST" action="{{ route('password.update') }}">
    @csrf

    <input type="hidden" name="token" value="{{ $token }}">

    <label for="email">Email:</label>
    <input type="email" name="email" value="{{ old('email') }}" required>

    <label for="password">Nouveau mot de passe:</label>
    <input type="password" name="password" required>

    <label for="password_confirmation">Confirmer le nouveau mot de passe:</label>
    <input type="password" name="password_confirmation" required>

    <button type="submit">Réinitialiser le mot de passe</button>
</form>
