<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Assistant</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2/dist/alpine.min.js" defer></script>
</head>
<!-- ... rest of your code ... -->
<body x-data="{ showInfo: false }" class="bg-gray-100">
    <div class="container mx-auto">
      <div class="flex items-center justify-center h-screen">
        <div class="w-full max-w-md bg-white p-8 rounded shadow-lg" x-show="!showInfo" x-transition>
          <h1 class="text-3xl font-bold mb-4">Bienvenue sur la plateforme Istama-Travel !</h1>
          <p class="text-gray-600 mb-4">Nous sommes ravis de vous accueillir en tant que nouvel étudiant.</p>


        </div>

        <div class="w-full max-w-md bg-white p-8 rounded shadow-lg" x-show="showInfo" x-transition>
          <h1 class="text-3xl font-bold mb-4">Informations importantes</h1>
          <ul class="list-disc pl-6 mb-6">
            <li>Votre numéro d'étudiant : <strong>{{ $student->matricule }}</strong></li>
            <li>Votre adresse e-mail : <strong>{{ $student->User->email }}</strong></li>
           

          </ul>

          <p>Pour vous connecter à votre compte, veuillez utiliser votre adresse e-mail et votre mot de passe que vous avez défini lors de l'inscription.</p>

          <a href="/" class="block bg-blue-500 text-white px-4 py-2 mt-4 rounded hover:bg-blue-600 transition">Commencer</a>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0IlN0l5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
  </html>
