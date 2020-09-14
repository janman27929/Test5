use lib qw(. .. t lib ../lib);

use v5.16;
use Test2::V0; 
use Test2::Plugin::DieOnFail;
use Modern::Perl;
use Carp::Always;
require Rdd_Mocks;

use base qw(Test::Class);

my %global_mocks=();
my $pkg_name = 'Test1';


#-------------------------[ TEST HARNESS METHODS HERE ]-------------------------
# this runs only ONCE, on program startup
sub startup   : Test(startup) {
  my $objs = shift;
  require $pkg_name . ".pm";

  load_mock($pkg_name);
  init_mocks(\%global_mocks);
}

# this runs BEFORE each and every test
sub setup : Test(setup) {
  my $objs = shift;
  $objs->{base} = Test1->new();  
}

# this runs AFTER each and every test
sub teardown : Test(teardown) {
  my $self = shift;
}

# this runs only ONCE, on program exit
sub shutdown  : Test(shutdown) {
  my $self = shift;
}

#-------------------------------[ UNIT TESTS HERE ]-----------------------------

sub test_Test1 : Test(no_plan) {
  #my @mocks = set_mock (qw(MODULE METHOD MOCK));

  my $self  = shift->{base};  
  #$self->setup;
  is  ref $self, 'Test1', 'is: ref $self';
  print '-'x30, '[ test_Test1 ]', '-'x30 ,"\n";
  $DB::single = 1; 
  $DB::single = 1; 
}

#-------------------------------[ Infra commands ]-----------------------------
if (! caller()) {Test::Class->runtests}

