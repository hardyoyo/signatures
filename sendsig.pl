#!/usr/bin/perl
foreach $filename (@ARGV[0]) {
  open(COUNT,"grep -c \"^-- \$\" $filename |");
  $max = <COUNT>;
  chomp $max;
  close(COUNT);
  open(FILE,"<$filename") || die;
  randomize;
  $nr = $count = int rand($max);
#  print "$max - $count\n";
#$nr = $count = 400;
  while ($count > 0) {
    $line = <FILE>;
    if ($line =~ /^-- $/) {
      $count--;
#      print $line;
    }
  }

  $output .= "HARDY POTTINGER <";
  $output .= @ARGV[1];
  $output .= ">\n";
  $output .= "E7CF EB74 A15B 6C82\n";
  $output .= "orcid.org/0000-0001-8549-9354";
  $output .= "\n\n";

  while(true) {
    $line = <FILE>;
    chomp $line;
    if ($line =~ /^-- $/) {
      last;
    } else {
      chomp $line;
      $line .= "\n";
      $output .= $line;
    }
  }
  print $output;

#  $smtp = Net::SMTP->new('mailhost');
}
