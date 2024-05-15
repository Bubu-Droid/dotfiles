$pdf_previewer = 'zathura';
$pdf_update_method = 2;
$aux_dir = 'buildtmp'; 

sub asy {return system("asymptote -o \"$_[0]\" \"$_[0]\"");}
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");
