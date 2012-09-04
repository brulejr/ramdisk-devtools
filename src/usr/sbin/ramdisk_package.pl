#!/usr/bin/perl

use lib '/usr/local/lib/perl5';

use File::Slurp;
use JSON;

my ($base,$cache,$prof,$conf) = @ARGV;

my $raw = read_file($conf);
my $data = decode_json $raw;

my @cmds = ();
foreach my $name (keys $data->{packages}) {
  my $pkg = ${data}->{packages}->{$name};
  my $evar = $pkg->{evar};
  my $path = $pkg->{path};
  my $src = ${cache}/$pkg->{dist};
  push @cmds, "[ -e \"$src\" ] || wget -q -P ${cache} $pkg->{url}";
  push @cmds, "tar zxf $src -C $base";
  push @cmds, "ln -s $base/$pkg->{base} $base/$name";
  push @cmds, "echo 'export $evar=$base/$name' >> $prof";
  push @cmds, "echo 'PATH=\${${evar}}${path}:\${PATH}' >> $prof";
}
print join("\n", @cmds) . "\n";
