package IH::Parser::Base;
use Moose;
use Module::Load;
has 'Config'  => ( is => "rw" );
has 'Plugins' => ( is => "rw", default => sub { {} } );
has 'Output'  => ( is => "rw" );
has 'Backend' => ( is => "rw" );
has 'Node' => ( is => "rw" );

sub detectTasks() {

}

sub detectTriggers() {

}

sub parse() {

}

sub prepare() {

}

sub run_plugin() {
    my $self   = shift;
    my $name   = shift;
    my $method = shift;
    my @args   = @_;
    my $Plugin;
    if ( exists $self->Plugins->{$name} ) {
        $Plugin = $self->Plugins->{$name};
    }
    else {
        $Plugin = 'IH::Plugin::' . $name;
        eval { load $Plugin; };
        if ($@) {
            $self->Output->error("Error loading plugin '$name' $@");
            return 0;
        }
        else {
            $self->Plugins->{$name}
                = $Plugin->new( Config => $self->Config, Parser => $self );
            $self->Plugins->{$name}->prepare()
                if $self->Plugins->{$name}->can("prepare");
            $Plugin = $self->Plugins->{$name};
        }
    }
    return $Plugin->$method(@args) if ( $Plugin->can($method) );
}

1;
