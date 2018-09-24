#!/bin/bash

postprocessDir=/home/vagrant/localFiles/api/postprocessScripts
#workDir=/home/nagyp11/workDirEkTeszt
#mosesDir=/home/nagyp11/moses/mosesdecoder
processDir=/home/vagrant/localFiles/api/process

#cat $processDir/input.noacc.tokenized.lc.noxml | $mosesDir/bin/moses -f $workDir/phraseTable/model/moses.ini > $processDir/output.tokenized.lc.noxml

perl $postprocessDir/retrsigns.pl < $processDir/output.tokenized.lc.noxml > $processDir/output.tokenized.lc
perl $postprocessDir/recase.pl $processDir/output.tokenized.lc $processDir/input.case > $processDir/output.tokenized
perl $postprocessDir/detokenizer.pl < $processDir/output.tokenized > $processDir/vereb.res.acc
