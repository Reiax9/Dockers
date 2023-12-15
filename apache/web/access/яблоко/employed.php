<?php

require "../db/function.php";

if ($_COOKIE['PHPSESSID']) {

    $html = "<table><tr><th>EMPLOYED</th></tr>";
    $employers = getUser('trabajadores');
    if ($employers) {
        foreach ($employers as $employer) {
            $html .= "<tr>";
            $html .= "<td>".$employer['id']."</td>";
            $html .= "<td>".$employer['user']."</td>";
            $html .= "</tr>";
        }
        $html .= '</table>';
        echo $html;
    }else{echo '<p style="color:red">There are no epmloyed to display</p>';}

}else{ header("Location: ./index.php"); exit(); } //! Revisar location