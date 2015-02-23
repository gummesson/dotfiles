#!/usr/bin/env sh

scrpath=$HOME/.irssi/scripts/autorun

curl --fail --location --output \
  $scrpath/adv_windowlist.pl \
  http://anti.teamidiot.de/static/nei/*/Code/Irssi/adv_windowlist.pl

curl --fail --location --output \
  $scrpath/autoaway.pl \
  http://scripts.irssi.org/scripts/autoaway.pl

curl --fail --location --output \
  $scrpath/nickcolor.pl \
  http://scripts.irssi.org/scripts/nickcolor.pl

curl --fail --location --output \
  $scrpath/nm.pl \
  http://scripts.irssi.org/scripts/nm.pl

curl --fail --location --output \
  $scrpath/tmux_away.pl \
  http://scripts.irssi.org/scripts/tmux_away.pl

curl --fail --location --output \
  $scrpath/trackbar.pl \
  http://scripts.irssi.org/scripts/trackbar.pl

curl --fail --location --output \
  $scrpath/sercount.pl \
  http://scripts.irssi.org/scripts/usercount.pl
