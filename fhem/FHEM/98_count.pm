# $Id$

package main;
use strict;
use warnings;

sub count_Initialize($$) {

  $cmds{count} = {  Fn => "CommandCount",
                      Hlp=>"[filter],count devices"};
}

sub CommandCount($$)
{
  my ($cl, $param) = @_;
  my $str = "";
  my $fill = "";
  my $n    = 0;
  
  if(!$param) { # List of all devices
    $n = keys %defs;
    $fill = "s" if $n != 1;
    $str = "\nCount: $n device$fill in total.\n";
  } else { # devspecArray
    $n       = 0;
    my @list = devspec2array($param,$cl);
    $n       = int(@list);
    $fill    = "s" if $n != 1;
    $str     = "\nCount: $n device$fill for devspec $param\n";
  }

  return $str;
}

1;

=pod
=begin html

<a name="count"></a>
<h3>count</h3>
<ul>
  <code>count [devspec]</code>
  <br><br>
  Count devices specified by devspec.<br/>
  If no devspec given, count will return number of totally defined devices.<br/>
</ul>

=end html

=cut
