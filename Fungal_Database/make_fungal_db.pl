#!/usr/bin/perl -w
use strict;

my @files = <*.fasta.gz>;

my %used;
open my $out, ">", "Fungal_".$ARGV[1]."_DB.fsa";
open my $out2, ">", "Genomes_used_for_".$ARGV[1]."_DB.txt";
for my $file (@files){
	if($ARGV[1] =~ /mito/i){
		if($file !~ /mito/i){
				next;
		}
	}
	else{
		if($file =~ /mito/i){
			next;
		}
	}
	my $name = substr($file, 0, 3);
	if (exists $used{$name}){
		next;
	}
	else{
		$used{$name}=1;
		`gunzip $file`;
		my $short_file = substr($file, 0, -3);
		open my $tfile, "<", $short_file;
		while(<$tfile>){
			if(/>/){
				my $id = substr($_, 1);
				print $out ">$name\_$id\n";
			}
			else{
				print $out "$_\n";
			}
		}
		close $tfile;
		print $out2 "$short_file\n";

		`gzip $short_file`;
	}
}
	
