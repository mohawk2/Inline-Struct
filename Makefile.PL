use ExtUtils::MakeMaker;

WriteMakefile(
  NAME => 'Inline::Struct',
  PREREQ_PM => {
    'Inline' => 0.42,
  },
  VERSION_FROM => 'Struct.pm',
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
