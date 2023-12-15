<?php

    if ($_COOKIE['PHPSESSID']) {
        session_start();
        $file = str_replace('../','',$_GET['page']);
    } else { header("Location: ./index.php"); exit(); } //! Revisar location
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="../css/style.css">
        <title>FILES</title>
    </head>
    <body>
        <div>
            <h1>TEST FILE:</h1>
            <p>Testing the file calling functionality, try the following files:</p>
            <ul>
                <li>customers.php</li>
                <li>employed.php</li>
            </ul> 
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="get">
                <label for="page">Mostrar fichero:</label>
                <input type="text" name="page" value<?="$file"?>>
                <button class="button" type="submit"><span>Login</span></button>
            </form>
        </div>
        <?php
            if (isset($file)) {
                echo "$file";
                include("/var/www/html/access/яблоко/$file");  //! Revisar la ruta donde está el fichero vulnerable
            }
        ?>
    </body>
</html>