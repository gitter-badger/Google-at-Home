package IH::Recorder::Sox;
use Moo;
with("IH::Workers::Process");

has 'command'             => ( is => "rw" );
has 'Rate'                => ( is => "rw", default => "16000" );
has 'HW'                  => ( is => "rw", default => "0,0" );
has 'Output'              => ( is => "rw", default => "out.flac" );
has 'beginEnable'         => ( is => "rw", default => "1" );
has 'beginSoundDuration'  => ( is => "rw", default => "0.5" );
has 'beginThreshold'      => ( is => "rw", default => '1%' );
has 'finishEnable'        => ( is => "rw", default => "1" );
has 'finishSoundDuration' => ( is => "rw", default => "2.0" );
has 'finishThreshold'     => ( is => "rw", default => '2%' );
has 'outputDir'           => ( is => "rw", default => "/tmp/sox" );

sub _generateOutputCommand() {
    my $self = shift;

    $self->command(

        "sox -b 32 -t alsa hw:"
            . $self->HW() . " -r "
            . $self->Rate() . " "
            . $self->Output()
            . " silence "
            . $self->beginEnable() . " "
            . $self->beginSoundDuration . " "
            . $self->beginThreshold() . " "
            . $self->finishEnable() . " "
            . $self->finishSoundDuration . " "
            . $self->finishThreshold()
            . " : newfile : restart"

    );
}

1;
