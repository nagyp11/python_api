#!/bin/bash

workDir=/home/vagrant/localFiles/workDirEkTeszt
mosesDir=/home/vagrant/localFiles/moses/mosesdecoder
postprocessDir=/home/vagrant/localFiles/api/postprocessScripts
preprocessDir=/home/vagrant/localFiles/api/preprocessScripts
processDir=/home/vagrant/localFiles/api/process

#perl $corpusDir/ekment.pl < $processDir/input > $processDir/input.noacc	# Testing only
perl $preprocessDir/case.pl < $processDir/input.noacc > $processDir/input.case
perl $preprocessDir/tokenize.pl < $processDir/input.noacc > $processDir/input.noacc.tokenized
perl $preprocessDir/lowercase.pl < $processDir/input.noacc.tokenized > $processDir/input.noacc.tokenized.lc
perl $preprocessDir/trsigns.pl < $processDir/input.noacc.tokenized.lc > $processDir/input.noacc.tokenized.lc.noxml

cat $processDir/input.noacc.tokenized.lc.noxml | $mosesDir/bin/moses -f $workDir/phraseTable/model/moses.ini > $processDir/output.tokenized.lc.noxml

perl $postprocessDir/retrsigns.pl < $processDir/output.tokenized.lc.noxml > $processDir/output.tokenized.lc
perl $postprocessDir/recase.pl $processDir/output.tokenized.lc $processDir/input.case > $processDir/output.tokenized
perl $postprocessDir/detokenizer.pl < $processDir/output.tokenized > $processDir/output.res.acc
