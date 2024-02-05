<?php

if(isset($_POST['signin'])){
    $pdo = new PDO("mysql:host=localhost;dbname=securite", 'root', '');
    
    // 1ère solution : Ajout de la fonction addslashes devant la variable login recupérée du formulaire
    $login = addslashes($_POST['login']);
    $pwd = $_POST['pwd'];

    // 2ème solution (à priviléger) : Utilisation de requêtes préparées pour éviter les injections SQL
    $stmt = $pdo->prepare("SELECT * FROM user WHERE login=:login AND pwd=:pwd");
    $stmt->execute([':login' => $login, ':pwd' => $pwd]);
    $result = $stmt->fetch();

    $counttable = count((is_countable($result)?$result:[]));

    if($counttable!=0){
        echo 'connexion réussie';
    }
    else{
        echo 'utilisateur non reconnu';
    }
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
    <h1>Injection SQL</h1>

    <form method="post" action="#">
        Login : <input type="text" name="login"><br>
        Pwd : <input type="text" name="pwd"><br>
        <input type="submit" value="Sign in" name="signin">
    </form>
    <p>Essayer avec le login <strong>' OR 1=1 OR 1='</strong> : la connexion ne fonctionne plus :-)</p>
</body>
</html>