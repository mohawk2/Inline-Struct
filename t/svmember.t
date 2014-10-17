use strict;
use warnings;
use Test::More;

use Inline C => <<'END', structs => 1, force_build => 1, clean_after_build => 0;
struct Foo {
  SV *hash;
};
END

my $o = Inline::Struct::Foo->new();
my $HASH = { a => { b => 'c' } };
$o->hash($HASH);
is_deeply $o->hash, $HASH, "hashref retrieved";

done_testing;
