use Test::More;

use Inline C => config => inc => q{-DFORMAT='"i=%d"'}, structs => 1;
use Inline C => <<EOF;
struct Foo {int i;};
typedef struct Foo Foo;

SV *func(Foo *foo) {
  return newSVpvf(FORMAT, foo->i);
}
EOF

my $o = Inline::Struct::Foo->new;
$o->i(17);
is func($o), 'i=17';

done_testing;
