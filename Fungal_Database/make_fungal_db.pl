#!/usr/bin/perl -w
use strict;

my @files = <*Mito*.fasta.gz>;

my %used;
open my $out, ">", "Fungal_MT_DB.fsa";
open my $out2, ">", "Genomes_used_for_MT_DB.txt";
for my $file (@files){
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
	
