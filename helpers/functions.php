<?php
function unit_type($unit_name, $search_array)
{
    if((!in_array($unit_name, $search_array)))
    {
        return 0;
    }
    else
    {
        return 1;
    }
}


function clean_data($input){
    return htmlspecialchars(strip_tags($input));
}
?>