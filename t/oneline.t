use Test::More;

use Inline C => config => structs => 1;
ok(Inline->bind(C => 'struct Foo {int i;};'));

done_testing;
