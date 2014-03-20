package IntelliHome::Parser::DB::Mongo;
use Moose;
extends 'IntelliHome::Parser::DB::Base';
use IntelliHome::Schema::Mongo::Need;
use IntelliHome::Schema::Mongo::Question;
use IntelliHome::Schema::Mongo::Task;
use IntelliHome::Schema::Mongo::Token;
use IntelliHome::Schema::Mongo::Trigger;
use IntelliHome::Schema::Mongo::Hypo;

sub getTriggers {
    my $self = shift;
    return IntelliHome::Schema::Mongo::Trigger->query( {} )->all();
}

sub installPlugin {
    my $self    = shift;
    my $Options = shift;
    my $Trigger = IntelliHome::Schema::Mongo::Trigger->find_one($Options);
    return $Trigger if ($Trigger);
    $Trigger = IntelliHome::Schema::Mongo::Trigger->new( %{$Options} );
    return $Trigger->save();
}

sub removePlugin {
    my $self    = shift;
    my $Options = shift;
    my $Trigger = IntelliHome::Schema::Mongo::Trigger->find_one($Options);
    return $Trigger->remove();
}

sub updatePlugin {
    my $self          = shift;
    my $Options       = shift;
    my $UpdateOptions = shift;
    return IntelliHome::Schema::Mongo::Trigger->update( %{$Options},
        %{$UpdateOptions} );
}

sub newHypo {
    my $self  = shift;
    my $Hypos = shift;

#  return $_ if IntelliHome::Schema::Mongo::Hypo->find_one( {hypo => $Hypos->{hypo} });
    return IntelliHome::Schema::Mongo::Hypo->new( %{$Hypos} );
}

sub addTask {
    my $self = shift;
    my $Task = shift;
    return IntelliHome::Schema::Mongo::Task->new( %{$Task} );

}

sub addNode {
    my $self = shift;
    my $Args = shift;
    my $Node = IntelliHome::Schema::Mongo::Node->find_one($Args);
    return $Node if ($Node);
    $Node = IntelliHome::Schema::Mongo::Node->new( %{$Args} );
    return $Node->save();
}

sub getNodes {
    my $self  = shift;
    my $Query = shift;
    return IntelliHome::Schema::Mongo::Node->query($Query)->all();
}

sub updateNode {
    my $self          = shift;
    my $Options       = shift;
    my $UpdateOptions = shift;
    return IntelliHome::Schema::Mongo::Node->update( %{$Options}, %{$UpdateOptions} );
}

sub getActiveTasks {
    my $self = shift;
    return IntelliHome::Schema::Mongo::Task->query(
        { status => 1, node => shift->Host } )->all();
}

1;