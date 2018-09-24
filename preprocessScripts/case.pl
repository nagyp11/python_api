use utf8;
use open qw(:std :utf8);
@ARGV=map{glob}@ARGV;

while(<>){

	for(split /(\P{L}+)/,$_)
    {
        print ($_),next if /\P{L}/;
        s/^\p{Ll}+$/x/ or
        s/^\p{Lu}+$/X/ or
        s/^\p{Lu}\p{Ll}+$/Xx/ or
        (s/\p{Lu}/X/g,
        s/\p{Ll}/x/g);
        print;
    }

}