use ExtUtils::MakeMaker;

WriteMakefile(
	      NAME => 'Inline::Struct',
	      PREREQ_PM => {
			    'Inline' => 0.42,
			   },
	      VERSION_FROM => 'Struct.pm',
	     );
