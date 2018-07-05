#!/usr/bin/env bash

##############################
# Easy colorized / standardized echoing messages
# @author Anders Wiberg
##############################

# Define a few colors
ESC_SEQ="\x1b["
COLOR_RESET=$ESC_SEQ"39;49;00m"
COLOR_RED=$ESC_SEQ"31;01m"
COLOR_GREEN=$ESC_SEQ"32;01m"
COLOR_YELLOW=$ESC_SEQ"33;01m"
COLOR_BLUE=$ESC_SEQ"34;01m"
COLOR_MAGENTA=$ESC_SEQ"35;01m"
COLOR_CYAN=$ESC_SEQ"36;01m"

function ok() {
	echo -e "[$COLOR_GREEN""ok""$COLOR_RESET] " $1
}

function bot() {
	echo -e "$COLOR_GREEN\(•_•)/$COLOR_RESET$COLOR_CYAN →$COLOR_RESET \"$1\""
}

function running() {
	echo -en "$COLOR_CYAN""⇒ $COLOR_RESET"$1": "
}

function action() {
	echo -e "\n[$COLOR_CYAN""action""$COLOR_RESET]:\n $COLOR_CYAN   ⇒$COLOR_RESET $1..."
}

function warning() {
	echo -e "[$COLOR_YELLOW""warning""$COLOR_RESET] " $1
}

function error() {
	echo -e "[$COLOR_RED""error""$COLOR_RESET] " $1
}

function question() {
	echo -e "[$COLOR_YELLOW""?""$COLOR_RESET] " $1
}