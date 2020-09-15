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

sub test_manual_constructor : Test(no_plan) {
  my @mocks = set_mock (qw(Test1 rtn_msg mock_rtn_msg));

  my $self  = Test1->new(
    color => 'red',
  );  
  $self->setup;
  is  ref $self, 'Test1', 'is: ref $self';
  is  $self->rtn_msg, 'mock_rtn_msg', 'is: mock_rtn_msg';
  undef @mocks;
  is  $self->rtn_msg, 'rtn_msg', 'is: rtn_msg';
  is  $self->rtn_msg('new_msg'), 'new_msg', 'is: new_msg';
  is  $self->color, 'red', 'is: color:red';
  is  $self->size, 'xl', 'is: size:xl';
  print '-'x30, '[ test_Test1 ]', '-'x30 ,"\n";
  $DB::single = 1; 
  $DB::single = 1; 
}

#-------------------------------[ Infra commands ]-----------------------------
if (! caller()) {Test::Class->runtests}

