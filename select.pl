#!/usr/bin/perl -w

use strict;
use YAML::Syck ();
use Curses::UI;
use Data::Dumper;
use utf8;
use 5.010;

my $cui = new Curses::UI( -color_support => 1 );
my %you_match_plugin_name;

my $win = $cui->add('window_id', 'Window');

my $label = $win->add(
    'mylabel', 'Label',
    -text      => 'Exit: q',
    -bold      => 1,
);
$label->draw;
$cui->set_binding(sub {exit}, "q");

my $filename = "osusume.yaml";
open(IN, $filename) or die("cannnot open file.");
read(IN, my $input , (-s $filename));
close(IN);


my %ydoc = %{YAML::Syck::Load($input)};

foreach my $data(keys(%ydoc)){
    my $message = $ydoc{$data}[0];
    my $neobundle_name = $ydoc{$data}[1];
    my $url = $ydoc{$data}[2];

    my $template = $cui->dialog(
        -message => $message,
        -buttons => ['yes','no'],
        -values  => [1,0],
        -title   => 'Question',
    );

    if ($template) {
        $you_match_plugin_name{$neobundle_name} = $url;
    }
}



my @plugin_name_value = values(%you_match_plugin_name);
my $text;

$text .= "\n$_" for (@plugin_name_value);

my $exit = $cui->dialog(
    -message =>  "Suits of Vim-Plugin to you is\n" . $text,
    -values  => [1],
    -title   => 'Result',
);



$cui->mainloop();
