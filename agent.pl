#!/usr/bin/perl
use lib './lib';
use IntelliHomeAgent;

my $IHOutput = new IH::Interfaces::Terminal;

$IHOutput->info("agent started");
#Proc::Daemon::Init();

#use App::Daemon qw( daemonize );
#daemonize();
#my @TEST_PINS=(67,39,60,94,64);

#foreach my $pin (@TEST_PINS){

#my $test= IH::Pin::GPIO->new(Pin=> $pin,Direction=>"out");

#$test->Sync();
#sleep int(rand(20));

#$test->on();
#sleep 1;
#$test->off();

#}
# my $Lampada = IH::Pin::GPIO->new( Pin => 67, Direction => "out" );
# $Lampada->Sync();
# $Lampada->Status(0);

# #$seconds = 5;
# $seconds = 43200;    #12 h
# my $w = AnyEvent->timer(
#     after    => 0,
#     interval => $seconds,
#     cb       => sub { $Lampada->toggle(); print "CAMBIATO LO STATO!!!!!\n"; }
# );

# my $cv = AnyEvent->condvar;
# $cv->recv;