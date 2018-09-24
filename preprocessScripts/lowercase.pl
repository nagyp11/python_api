#!/usr/bin/perl
use utf8;
use open qw(:std :utf8);
@ARGV=map{glob}@ARGV;

while(<>)
{
    print "\L$_";
}
