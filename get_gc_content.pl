#!/usr/bin/perl -w
use strict;


open my $out, ">", "GC_content.txt";
print $out "Species\tGC\tAT\tTotal_BP\n";
my @files = <*.fq>;
my @files2 = <*.fastq>;

push(@files, @files2);

my $gc;
my $at;
my $total_bp;
for my $filet (@files){

open my $file, "<", $filet;
while(<$file>){
	my $id = $_;
	my $seq = readline($file);
	my $plus = readline($file);
	my $quality = readline($file);
	chomp($seq);
		my @tarray =split(//, $seq);
		$total_bp += scalar @tarray;
		for my $bp (@tarray){
			if($bp =~ /A|T/){
				$at++;
			}
			if($bp =~ /G|C/){
				$gc++;
			}
		}
	}
}

my $pergc = $gc/($gc+$at);
my $perat = $at/($gc+$at);

print $out "$id\t$pergc\t$perat\t$total_bp\n";

		


