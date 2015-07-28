#!/usr/bin/perl -w

use strict;
use Curses::UI;
use 5.01;

my $cui = new Curses::UI( -color_support => 1 );
my %plugin_name;

my $win = $cui->add('window_id', 'Window');

my $label = $win->add(
    'mylabel', 'Label',
    -text      => 'Exit: q',
    -bold      => 1,
);

$label->draw;

$cui->set_binding(sub {exit}, "q");

my $supp = $cui->dialog(
    -message => "補完機能を強化したい？",
    -buttons => ['yes','no'],
    -values  => [1,0],
    -title   => 'Question',
);

if ($supp) {
    $plugin_name{"Shougo/neocomplete"} = "https://github.com/Shougo/neocomplete.vim";
}

my $twi = $cui->dialog(
    -message => "Do you want to Twitter in Vim",
    -buttons => ['yes','no'],
    -values  => [1,0],
    -title   => 'Question',
);

if ($twi) {
    $plugin_name{"Shougo/neocomplete"} = "https://github.com/Shougo/neocomplete.vim";
}

my $template = $cui->dialog(
    -message => "You want to ease templete?",
    -buttons => ['yes','no'],
    -values  => [1,0],
    -title   => 'Question',
);

if ($template) {
    $plugin_name{"Shougo/neocomplete"} = "https://github.com/Shougo/neocomplete.vim";
}

my $gist = $cui->dialog(
    -message => "Do You want to use gist in vim?",
    -buttons => ['yes','no'],
    -values  => [1,0],
    -title   => 'Question',
);

if ($gist) {
    $plugin_name{"Shougo/neocomplete"} = "https://github.com/Shougo/neocomplete.vim";
}

my $exit = $cui->dialog(
    -message =>  "Plugin suit to you is\n" . $plugin_name{"Shougo/neocomplete"},
    -values  => [1],
    -title   => 'Question',
);



$cui->mainloop();
