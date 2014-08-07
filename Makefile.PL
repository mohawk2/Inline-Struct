use ExtUtils::MakeMaker;

WriteMakefile(
  NAME => 'Inline::Struct',
  PREREQ_PM => {
    'Inline' => 0.66,
    'Inline::C' => 0.62,
    'Test::More' => 0.88,
  },
  VERSION_FROM => 'Struct.pm',
  realclean => { FILES => '_Inline' },
  META_MERGE => {
    "meta-spec" => { version => 2 },
    resources => {
      repository => {
	type => 'git',
	url => 'https://github.com/mohawk2/Inline-Struct.git',
	web => 'https://github.com/mohawk2/Inline-Struct',
      },
    },
  },
);
