package IntelliHome::RPC::Service::Dummy;

#this is a dummy rpc module only for testing
use Carp::Always;
use Mojo::Base 'MojoX::JSON::RPC::Service';
use Data::Dumper;

has 'IntelliHome';

sub dummy {
    my ( $self, @params ) = @_;
    
    return Dumper($self)."DUMMY-YUMMY! ";
} 

__PACKAGE__->register_rpc_method_names('dummy');

1;