#!/usr/bin/perl
use warnings;
use strict;

my $file = 'input.txt';
open my $info, $file or die "could not open $file: $!";

my $result = 0;
my $groups = [];

sub get_intersection {
  print("\n");
  my $first = $_[0];
  my $second = $_[1];
  my $intersected;
  foreach my $ch (split('', $first)) {
    if (index ($second, $ch) > -1) {
      print qq/there is intersection: $ch\n/;
      $intersected = $ch;
      last;
    }
  }
  return $intersected;
}

while (my $line = <$info>) {
  chomp $line;
  my $row_length = length $line;
  my $first = substr($line, 0, $row_length/2);
  my $second = substr($line, $row_length/2, $row_length);
  my $intersected = get_intersection($first, $second);
  if ($intersected) {
    my $priority = ord($intersected);
    if ($priority > 96) {
      $result += $priority-96;
    } else {
      $result += $priority-38;
    }
  }
}

print($result);

close($file)
