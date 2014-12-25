use strict;
use warnings;
use Test::More;

use Inline C => <<'END', structs => 1, force_build => 1;
struct Foo {
   SV *src;
   SV *dst;
   SV *other;
   char *prt;
};
END

my @KEYS = qw(src dst prt other);
my @GET_KEYS = map { "get_$_" } @KEYS;
my @SET_KEYS = map { "set_$_" } @KEYS;
my $STR = 'longer';
my %VALS = map { ($_ => $STR) } @GET_KEYS;

my $o = Inline::Struct::Foo->new;
$o->$_($STR) for @SET_KEYS;
is $o->$_(), $VALS{$_}, "orig $_" for @GET_KEYS;

my $copy = $o;
is $o->$_(), $VALS{$_}, "orig after copy $_" for @GET_KEYS;
is $copy->$_(), $VALS{$_}, "copy $_" for @GET_KEYS;

done_testing;
