$pdf_previewer = 'zathura';
$pdf_update_method = 2;
$aux_dir = 'buildtmp'; 

# sub asy {return system("asy -o \$(dirname '$_[0]') '$_[0]'");}
sub asy { return system("asy -o '$_[0]' '$_[0]'"); }
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");

# Add these lines to the local latexmkrc file
# when using pythontex. (Affects the compilation
# time if added globally.)
# sub pythontex {
#     system("pythontex --runall true '$_[0]'");
#     system("touch ./buildtmp/\$(basename '$_[0]').pytxmcr");
#     return;
# }
# add_cus_dep("pytxcode", "pytxmcr", 0, "pythontex");
