use utf8;
use open qw(:std :utf8);
@ARGV=map{glob}@ARGV;
open A, shift or die; #words
open B, shift or die; #patters

while(<A>){

	@a = split /(\P{L}+)/,$_;
	@b = split /(\P{L}+)/,<B>;
	if ($#a != $#b){
		die "Invalid file pair!";
	}
	for($i = 0; $i <= $#a; $i++){
		print ($a[$i]),next if $a[$i]=~/\P{L}/;
		if($b[$i] eq 'x'){ print $a[$i]; }
		elsif($b[$i] eq 'X') { print "\U$a[$i]"; }
		elsif($b[$i] eq 'Xx') { print "\u$a[$i]"; }
		else{
			@wordsplit = split //,$a[$i];
			@patternsplit = split //,$b[$i];
			
			for($j=0;$j<=$#wordsplit;$j++)
			{
				$patternsplit[$j] eq 'x' and print $wordsplit[$j]  or
				$patternsplit[$j] eq 'X' and print "\U$wordsplit[$j]"
			}
		}
	}

}