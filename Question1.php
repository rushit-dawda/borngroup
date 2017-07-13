Question 1:
$a = '1';
$b = &$a;
$b = "2$b";
echo $a.", ".$b;

Answer 1: 
21 21

Reason:
& operator is the main twist. 
line 2 in the code means ($b = &$a;) a & b are pointing at the same value. 
so the output will be 21 21 


If we change the 2 line in code ($b = $a;)
the output will be 
21 1