use Test::More;
require 't/common.pl';

use Inline C => <<'END', STRUCTS => 1;
struct Foo {
  int inum;
  double dnum;
  char *str;
};
/*typedef struct Foo Foo;*/
void suppress_warnings() {}
END

run_struct_tests();

done_testing;
