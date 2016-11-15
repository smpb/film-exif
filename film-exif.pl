#!/usr/bin/env perl


use v5.10;
use strict;
use warnings;

use Image::ExifTool;
use Getopt::Long;

my $dir = './';
my $date;
my $film;
my $print;
my $cmake;
my $cmodel;
my $lmake;
my $lmodel;
my $comment;
my $pattern = '.tif';

# main

GetOptions(
  'dir=s'     => \$dir,
  'date=s'    => \$date,
  'film=s'    => \$film,
  'print=s'   => \$print,
  'cmake=s'   => \$cmake,
  'cmodel=s'  => \$cmodel,
  'lmake=s'   => \$lmake,
  'lmodel=s'  => \$lmodel,
  'comment=s' => \$comment,
  'pattern=s' => \$pattern,
);

my $tool = Image::ExifTool->new;

opendir(my $dh, $dir) or die "Can't open dir '$dir': $!";
my @files = grep { -f "$dir/$_" && $_ =~ /$pattern/  } readdir($dh);
closedir $dh;

foreach my $file ( @files )
{
  my $changed = 0;

  $tool->ExtractInfo( "$dir/$file" );
  #say join ', ', $tool->GetFoundTags('File');
  say "$file: " . $tool->GetValue('Make') . " " . $tool->GetValue('Model') . " (" . $tool->GetValue('DateTimeOriginal') . ")";

  if (defined $cmake and defined $cmodel)
  {
    $tool->SetNewValue('Make',  $cmake);
    $tool->SetNewValue('Model', $cmodel);
    $tool->SetNewValue('UniqueCameraModel', "$cmake $cmodel");
    say "$file: Changed '<Make> <Model>' to '$cmake' '$cmodel' and '<UniqueCameraModel>' to '$cmake $cmodel'";
    $changed++;
  }

  if (defined $lmake and defined $lmodel)
  {
    $tool->SetNewValue('LensMake',  $lmake);
    $tool->SetNewValue('LensModel', $lmodel);
    $tool->SetNewValue('Lens', "$lmake $lmodel");
    say "$file: Changed '<LensMake> <LensModel>' to '$lmake' '$lmodel' and '<Lens>' to '$lmake $lmodel'";
    $changed++;
  }

  if (defined $date)
  {
    $tool->SetNewValue('DateTimeOriginal', $date);
    say "$file: Changed '<DateTimeOriginal>' to '$date'";
    $changed++;
  }

  my $usercomment = $comment || '';

  if ( $print ) {
    if ( $usercomment ) {
      $usercomment = join('; ', $print, $usercomment);
    } else {
      $usercomment = $print;
    }
  }

  if ( $film ) {
    if ( $usercomment ) {
      $usercomment = join('; ', $film, $usercomment);
    } else {
      $usercomment = $film;
    }
  }

  if (defined $usercomment)
  {
    $tool->SetNewValue('UserComment', $usercomment);
    say "$file: Changed '<UserComment>' to '$usercomment'";
    $changed++;
  }

  $tool->WriteInfo("$dir/$file") if $changed;
}



