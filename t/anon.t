BEGIN {
  print "1..3\n";
} 
use Data::Dumper;
use Inline C => <<'END', STRUCTS => 1;

typedef struct {
    int inum;
    double dnum;
    char *str;
} Foo;

void suppress_warnings() {}

END

my $o = new Inline::Struct::Foo;
$o->inum(10);
$o->dnum(3.1415);
$o->str('Wazzup?');

my %vals = (inum => 10, dnum => 3.1415, str => 'Wazzup?');
my $i = 1;
do { 
  print "not " 
    unless $o->$_() eq $vals{$_};
  print "ok " . $i++ . "\n";
} for @{$o->_KEYS};

my %fields = %{$o->_HASH};
my @keys = @{$o->_KEYS};
my @values = @{$o->_VALUES};

$o->Print;
print Dumper \%fields;
print Dumper \@keys;
print Dumper \@values;

package Inline::Struct::Foo;
sub Print {
    my $o = shift;
    print "Foo {\n" . (join "\n", map { "\t".$o->$_() } @{$o->_KEYS}) . "\n}\n";
}
