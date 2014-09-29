module main_shade (){
difference(){
cylinder(h = 30, r1= 30, r2=10,$fn =100);
translate ([0,0,-3])
cylinder(h = 34, r1= 27, r2=7);
}//end_of_difference
}//_end_module_main_shade




module top_trim(){
difference(){
difference(){
translate([0,0,30])
cylinder(h=8,r=10);
translate([0,0,29])
cylinder(h=10,r=8);
}//end_difference

//end_top_trim
translate([0,0,-1])
for(i=[1:7]){
translate([sin(360*i/7)*6,cos(360*i/7)*6,35])
rotate([90,0,0])
//translate([0,34,6])
resize(newsize=[0,7,10])
sphere(r= 5);
}//end_for_loop
}//end_difference
}//end_module_top_trim



module support_beams()
difference(){
union(){
resize(newsize=[0,28,0])
cube(2,2,1);
resize(newsize=[28,0,0])
cube(2,2,1);
}//end_of_union

difference(){
cylinder(h=2, r=5);
translate([0,0,-1])
cylinder(h=5, r=4);
}

cylinder(h=2, r=5);
translate([0,0,-1])
cylinder(h=5, r=4);



}
difference(){
union(){
mirror([1,1,0]){
resize(newsize=[0,28,0])
cube(2,2,1);
resize(newsize=[28,0,0])
cube(2,2,1);
}//end_mirror
}//end_of_union

cylinder(h=2, r=5);
translate([0,0,-1])
cylinder(h=5, r=4);
}//end_difference




difference(){
cylinder(h=2, r=5);
translate([0,0,-1])
cylinder(h=5, r=4);
}//end_module_support_beams


main_shade();
top_trim();
support_beams();