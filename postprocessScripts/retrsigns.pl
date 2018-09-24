use utf8;
use open qw(:std :utf8);
@ARGV=map{glob}@ARGV;

while(<>){

	s/\&amp;/\&/g;   # escape escape
	s/\&#124;/\|/g;  # factor separator
	s/\&lt;/\</g;    # xml
	s/\&gt;/\>/g;    # xml
	s/\&apos;/\'/g;  # xml
	s/\&quot;/\"/g;  # xml
	s/\&#91;/\[/g;   # syntax non-terminal
	s/\&#93;/\]/g;   # syntax non-terminal
	#tr/\x00-\x08\x0B-\x0C\x0E-\x1F\x80-\x9F//d;
	print;

}