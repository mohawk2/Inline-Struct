use Test::More;
BEGIN { require './t/common.pl'; }

use Inline C => config => structs => 1;
ok(Inline->bind(C => 'struct Foo {int i;};', force_build => 1));

done_testing;
