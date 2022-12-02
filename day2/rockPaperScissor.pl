#!/usr/bin/perl
use warnings;
# use stricts;

my $file = 'input.txt';
open my $info, $file or die "could not open $file: $!";

my $score = 0;
my $decrypted_score = 0;

# A - Rock
# B - Paper
# C - Scissor

# X - Rock
# Y - Paper
# Z - Scissor

my $win_score = 6;
my $draw_score = 3;
my $lose_score = 0;

my $paper_score = 2;
my $rock_score = 1;
my $scissor_score = 3;

my $ROCK = 'X';
my $PAPER = 'Y';
my $SCISSOR = 'Z';

my $ROCK_ELF='A';
my $PAPER_ELF='B';
my $SCISSOR_ELF='C';

sub handle_round {
    my ($elfchoice,$mychoice) = @_;
    if ($mychoice eq $ROCK) {
      $score += $rock_score;
      if ($elfchoice eq 'A') {
        $score += $draw_score;
      }
      if ($elfchoice eq 'B') {
        $score += $lose_score;
      }
      if ($elfchoice eq 'C') {
        $score += $win_score;
      }
      # print(qq/item: $item/, "\n");
    }
    if ($mychoice eq $PAPER) {
      $score += $paper_score;
      if ($elfchoice eq 'A') {
        $score += $win_score;
      }
      if ($elfchoice eq 'B') {
        $score += $draw_score;
      }
      if ($elfchoice eq 'C') {
        $score += $lose_score;
      }
    }
    if ($mychoice eq $SCISSOR) {
      $score += $scissor_score;
      if ($elfchoice eq 'A') {
        $score += $lose_score;
      }
      if ($elfchoice eq 'B') {
        $score += $win_score;
      }
      if ($elfchoice eq 'C') {
        $score += $draw_score;
      }
    }
}

sub decrypted_round {
  my ($elfchoice,$desired) = @_;
  $LOSE = 'X';
  $DRAW = 'Y';
  $WIN = 'Z';
  if ($desired eq $LOSE) {
    if ($elfchoice eq $ROCK_ELF) {
      $decrypted_score += $scissor_score;
    }
    if ($elfchoice eq $PAPER_ELF) {
      $decrypted_score += $rock_score;
    }
    if ($elfchoice eq $SCISSOR_ELF) {
      $decrypted_score += $paper_score;
    }
  }
  if ($desired eq $DRAW) {
    $decrypted_score += $draw_score;
    if ($elfchoice eq $ROCK_ELF) {
      $decrypted_score += $rock_score;
    }
    if ($elfchoice eq $PAPER_ELF) {
      $decrypted_score += $paper_score;
    }
    if ($elfchoice eq $SCISSOR_ELF) {
      $decrypted_score += $scissor_score;
    }
  }
  if ($desired eq $WIN) {
    $decrypted_score += $win_score;
    if ($elfchoice eq $ROCK_ELF) {
      $decrypted_score += $paper_score;
    }
    if ($elfchoice eq $PAPER_ELF) {
      $decrypted_score += $scissor_score;
    }
    if ($elfchoice eq $SCISSOR_ELF) {
      $decrypted_score += $rock_score;
    }
  }
}

while (my $line = <$info>) {
  @splitted_line = split(' ', $line);
  handle_round(@splitted_line);
  decrypted_round(@splitted_line);
}
print(qq/final score is: $score/, "\n");
print(qq/second round score is: $decrypted_score/, "\n");