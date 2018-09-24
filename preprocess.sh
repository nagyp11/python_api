#!/bin/bash

preprocessDir=/home/vagrant/localFiles/api/preprocessScripts
processDir=/home/vagrant/localFiles/api/process

#A szoveg megfeleloje gyakorlatilag az osszes europai nyelvben. Az irott szoveg az emberiseg tortenelmeben hatalmas elorelepes, hiszen igy a tortenelme folyaman egyeduli modon lehetove valt az informacio szemelytol terben es idoben fuggetlen tarolasa szemben a szajhagyomannyal, amely mind terben mind idoben adott szemelyhez vagy szemelyekhez kotott

#perl $corpusDir/ekment.pl < $processDir/input > $processDir/input.noacc	# Testing only
perl $preprocessDir/case.pl < $processDir/input.noacc > $processDir/input.case
perl $preprocessDir/tokenize.pl < $processDir/input.noacc > $processDir/input.noacc.tokenized
perl $preprocessDir/lowercase.pl < $processDir/input.noacc.tokenized > $processDir/input.noacc.tokenized.lc
perl $preprocessDir/trsigns.pl < $processDir/input.noacc.tokenized.lc > $processDir/input.noacc.tokenized.lc.noxml