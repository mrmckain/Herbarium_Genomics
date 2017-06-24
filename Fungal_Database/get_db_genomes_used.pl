#!/usr/bin/perl -w
use strict;

open my $file, "<", $ARGV[0];

my %ids;
while(<$file>){
	chomp;
	/^(.*?)_.+/;
	$ids{$1}=1;
	
}
close $file;
open my $out, ">", "Genomes_used_for_".$ARGV[2]."_Contamination_DB.txt";
open $file, "<", $ARGV[1];
my %names;
my %used;
while(<$file>){
	chomp;
	/filename\=\"(.*?)_/;
	my $tempid=$1;
	/label\=\"(.*?)\"/;
	my $fullname=$1;
	if(exists $ids{$tempid} && !exists $used{$fullname}){
		#print $out "$fullname\n";
		$used{$fullname}=1;
		$names{$fullname}=1;
	}
}

for my $tid (sort keys %names){
	print $out "$tid\n";
}
	
