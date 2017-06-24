#!/usr/bin/env perl -w
use strict;

open my $file, "<", $ARGV[0];
while(<$file>){
	chomp;
	/url=\"(.*?)\"/;
	my $url = $1;
	/filename=\"(.*?)\"/;
	my $filename=$1;
	$url ="http://genome.jgi.doe.gov".$url;
	my $curlcommand = "curl \'".$url."\' -b cookies >".$filename; 
	print "Running: $curlcommand\n";
	`$curlcommand`;
}	
