<?php

require "../db/function.php";

if ($_COOKIE['PHPSESSID']) {

    $html = "<table><tr><th>CUSTOMERS</th></tr>";
    $customers = getUser('clientes');
    if ($customers) {
        foreach ($customers as $customer) {
            $html .= "<tr>";
            $html .= "<td>".$customer['user']."</td>";
            $html .= "<td>".$customer['apellido']."</td>";
            $html .= "<td>".$customer['telefono']."</td>";
            $html .= "<td>".$customer['dni']."</td>";
            $html .= "<td>".$customer['calle']."</td>";
            $html .= "</tr>";
        }
        $html .= '</table>';
        echo $html;
    }else{echo '<p style="color:red">There are no customers to display</p>';}

}else{ header("Location: ./index.php"); exit(); } //! Revisar location