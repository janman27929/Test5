use lib qw(. .. t lib ../lib /rdd/proj/lib);

use RDD;
use Test1;

#---------------------[ USER_PARMS_START]---------------------
my $main_tag = 'Test1';

my $defaults = {
};

my $rh_config = { %$defaults };

my $getopt_parms = {
  #'dob=s'	  => \$rh_config->{dob},  
  #'length=i' => \$rh_config->{length},  
  #"verbose"  => \$rh_config->{verbose},
  #"library=s@" => \$rh_config->{library},
  #"defines=s%" => \$rh_config->{defines},
};   

my $usage_msg =<< 'EOF';
--------------------------------------------
Test1.pl -parm1 PARM1 -parm2 PARM2
--------------------------------------------

-parm1 parm1_description
-parm2 parm2_description

EOF

#---------------------[ USER_PARMS_END]---------------------
my $self; 

sub ShowError {
  my ($usage_msg, $sys_err_msg) = @_;
  print $sys_err_msg, "\n" if $sys_err_msg;   
  print $usage_msg, "\n"   if $usage_msg;
  exit $?;
}

eval {
  Getopt::Long::GetOptions (%$getopt_parms) or die ("FAIL: CLI errors");

  $self = $main_tag->new(%$rh_config);

  $self->setup();
  $self->main ();
  $self->teardown();
};

ShowError($usage_msg, $@) if $@;

$DB::single = 1; 
$DB::single = 1; 


