
# This file was automatically generated by Dist::Zilla::Plugin::ModuleBuild v5.015.
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Module::Build::IntelliHome;

my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Domotic control software",
  "dist_author" => [
    "mudler <mudler\@dark-lab.net>"
  ],
  "dist_name" => "IntelliHome",
  "dist_version" => "0.002",
  "license" => "gpl",
  "module_name" => "IntelliHome",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {},
  "script_files" => [
    "bin/intellihome-master",
    "bin/intellihome-node",
    "bin/intellihome-webui",
    "bin/intellihome-deployer",
    "bin/intellihome-docsgen",
    "bin/intellihome-agent"
  ],
  "test_requires" => {}
);


my %fallback_build_requires = (
  "Module::Build" => "0.3601"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build::IntelliHome->new(%module_build_args);

$build->create_build_script;
