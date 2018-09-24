use utf8;
use open qw/:std :utf8/;

do 'm2getopt.pl';
require '/home/vagrant/localFiles/api/preprocessScripts/abbr8.pl';

#$leftcut_wt='[!?,\/`*"(<\[\-\' \\\\]|–|°|‘|‚|‛|’|“|”|„|‟|“|›|‹|«|»|©|®|™|…|№| |.';
#$rightcut_wt='[",:;!?)>\/\'\]. \\\\*]|‰|‘|‚|‛|’|“|”|„|‟|“|›|‹|«|»|…|™|®|–| ';
#$rightcut_wt=~s/(?<!\\)[.']//g if $keepdot;
$leftcut_wt=qr/\.\.\.|[.!?,\/`*"(<\[\-\' \\–°‘‚‛’“”„‟“›‹«»©®™…№ ]/;
$rightcut_wt=qr/\.\.\.|[.",:;!?)>\/\'\] \\*‰‘‚‛’“”„‟“›‹«»…™®– ]/;
$rightcut_wt=~s/(?<!\\)[.']//g if $keepdot;

#warn "leftcut_wt=$leftcut_wt\n";
#warn "rightcut_wt=$rightcut_wt\n";


sub tokenize
{
	my(@w,$w,$lc,$rc);
	@w=split / +/,$_;
	for(@w)
	{
		$w=$_;
		($lc,$w,$rc)=$w=~/^((?:$leftcut_wt)*)(.*?)((?:$rightcut_wt)*|(?:$rightcut_wt)+\.+)$/o;
		($w,$rc)=("$w$rc",'') if $w=~/^\d+|[IVXL]+$/ && $rc eq '.' || $rc eq '...';
		($w,$rc)=($rc,$w) if $rc && !$w;
		($w,$lc)=($lc,$w) if $lc && !$w;
		($w,$rc)=($w.'...','.') if $rc eq '....';
		$lc="›$lc " if $lc;
		$rc=" ‹$rc" if $rc;

		$_=join '',$lc,$w,$rc;
	}
       	$_=join ' ',@w;

       	s/(\.+)( ‹\S+)?$/ ‹$1$2/;
       	s/ ($abbrpat) ‹./ $1./oi;
       	s/( ‹\.+) ‹(?=\S+)$/$1/;
       	$_.="\n";

}


@ARGV=map{glob}@ARGV;

while(<>)
{
	print tokenize($_);
}
