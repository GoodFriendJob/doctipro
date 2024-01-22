<?php

require 'simulation.php'; 
require 'validation.php'; 
require 'contestation.php'; 



$codeMedical = 'C1';
$lieuPrestation = '01';
$varMatricule = '1900123456712';
$NombreActeMedical = '1';

$code_prestataire="90813319";
$psEHealthID = "2854201475";

$return_values = simulation($psEHealthID,$code_prestataire,$codeMedical,$lieuPrestation,$varMatricule,$NombreActeMedical);
validation($return_values['identifiantReponseSimulation'],$return_values['CCss'],$return_values['WsuID']);
// contestation($return_values['identifiantReponseSimulation'],$return_values['CCss'],$return_values['WsuID'],$pshealthid,$return_values['varIdMemoireHonoraire']);

// var_dump($a);

?>