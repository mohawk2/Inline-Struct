use Test::More;

# assumes suitable class setup before call
sub run_struct_tests {
  my $o = Inline::Struct::Foo->new->set_inum(10)->set_dnum(3.1415)->set_str('Wazzup?');
  $o->set_inum(10);
  $o->set_dnum(3.1415);
  $o->set_str('Wazzup?');
  my %vals = (get_inum => 10, get_dnum => 3.1415, get_str => 'Wazzup?');
  is $o->$_(), $vals{$_}, $_ for qw(get_inum get_str);
  ok eq_float($o->get_dnum(), $vals{get_dnum}), 'dnum';
  is_deeply [ sort keys %{ $o->_HASH } ], [ qw(dnum inum str) ], '_HASH method';
  is_deeply $o->_KEYS, [ qw(inum dnum str) ], '_KEYS method';
}

my $EPSILON = 1e-6;
# true if same within $EPSILON
sub eq_float {
  my ($f1, $f2) = @_;
  abs(($f1//0) - ($f2//0)) <= $EPSILON;
}

1;

__END__
$o->Print;

package Inline::Struct::Foo;
sub Print {
    my $o = shift;
    print "Foo {\n" . (join "\n", map { "\t".$o->$_() } @{$o->_KEYS}) . "\n}\n";
}
