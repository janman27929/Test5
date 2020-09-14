use lib qw(. .. t lib ../lib);
use Modern::Perl;

package Test1 {
use base qw(RDD);

my %defaults = ();

sub new       {my $self=shift;$self=$self->NEXT::new(%defaults, @_)}
sub setup     {my $self=shift;$self->NEXT::setup(@_)         }
sub teardown  {my $self=shift;$self->NEXT::teardown(@_)      }

sub main     { 
  my $self = shift;  
  $self;
}

1;
}#----- Test1 -----

=head1 NAME

Test1

< description_here NOTE: use "ca<" to change text within > 

=head1 DESCRIPTION

< description_here NOTE: use "ca<" to change text within > 

=head1 SYNOPSIS

< example usage > 

=cut
