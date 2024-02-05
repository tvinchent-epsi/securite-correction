<?php
session_start();

// Génération d'un jeton CSRF unique pour la session
if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Attaque CSRF</h1>

    <h3>Livre d'or</h3>

<?php

$pdo = new PDO("mysql:host=localhost;dbname=securite", 'root', '');
$selectall = $pdo->query("SELECT * FROM livredor");
$result = $selectall->fetchAll();
foreach ($result as $ligne) {
    // Ajout du jeton CSRF à l'URL
    echo $ligne['mot'] . ' <a href="?supp.php?id=' .$ligne['id']. '&csrf_token=' . $_SESSION['csrf_token'] . '">Supprimer le mot</a><br>';
}

// Dans supp.php, vérifiez le jeton CSRF avant de supprimer le mot
if (isset($_GET['csrf_token']) && $_GET['csrf_token'] === $_SESSION['csrf_token']) {
    // Supprimer le mot
} else {
    // Jeton CSRF invalide, afficher une erreur
}

?>

<h3>Exemple d'attaque CSRF</h3>
<p> Jetez un oeil au lien permettant la suppression d'une entrée du livre d'or ;
    <ul>
        <li>celui-ci envoie vers un script (non implémenté pour cet exemple) qui supprime le mot ayant pour id le numéro passé en GET</li>
        <li>Dès lors, si j'envoie un lien à cet admin qui l'envoie vers ?supp.php?id=1, le 1er commentaire sera supprimé..</li><br>
        <li>Comment s'en prémunir ? Attribuer à chaque utilisateur / admin un jeton (token) spécifique.</li>
    </ul>     
</p>

</body>
</html>