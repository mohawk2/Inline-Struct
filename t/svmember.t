use strict;
use warnings;
use Test::More;

use Inline C => <<'END', structs => 1, force_build => 1;
struct Foo {
  SV *hash;
};
END

my $o = Inline::Struct::Foo->new();
my $HASH = { a => { b => 'c' } };
$o->set_hash($HASH);
is_deeply $o->get_hash, $HASH, "hashref retrieved";

$o = Inline::Struct::Foo->new($HASH);
is_deeply $o->get_hash, $HASH, "hashref as new retrieved";

done_testing;
