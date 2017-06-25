#!/usr/bin/perl -w
use strict;

open my $file, "<", $ARGV[0];
open my $out, ">", "GC_content.txt";
print $out "Species\tGC\tAT\tTotal_BP\n";
while(<$file>){
        chomp;
        my @tarray=split/\s+/;
        my $tfile;
        my $dir = "/home/mmckain/Transposome/Prepped_Data/Bootstrap_Replicates_TE_Analysis/" . $tarray[0] . "/";
        opendir(DH, "$dir");
        while(my $dfile=readdir(DH)){
        if($dfile =~ /Ready.fasta|singleend.fasta/){
        	print "$dfile\n";
                $tfile=$dir . $dfile;
     	}
}

print "$tarray[0]\n";
my $id = $tarray[0];
open my $file2, "<", $tfile;
my $gc;
my $at;
my $total_bp;
while(<$file2>){
	chomp;
	if(/>/){
		next;
	}
	else{
		my @tarray =split(//);
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
}
		


