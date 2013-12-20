#!/bin/bash

rm -f syncope-user.wordle

for ((x=1; x<=12 ;x+=1)); 
do curl http://mail-archives.apache.org/mod_mbox/syncope-user/2013`printf "%02d" $x`.mbox | grep ^Subject: | sed 's/Subject: //g' | grep -v ^"Syncope-trunk - Build" | grep -v ^"\[Passed\]" | grep -v ^"\[Broken\]" | grep -v ^"\[Fixed\]" | grep -v ^"\[Errored\]" | sed 's/[Rr][Ee]: //g' | sed 's/[R]: //g' | sed 's/[Aa][Ww]: //g' | sed "s/^.* (SYNCOPE-[^)]*)//" >> syncope-user.wordle;
done

rm -f syncope-dev.wordle

for ((x=1; x<=12 ;x+=1)); 
do curl http://mail-archives.apache.org/mod_mbox/syncope-dev/2013`printf "%02d" $x`.mbox | grep ^Subject: | sed 's/Subject: //g' | grep -v ^"Syncope-trunk - Build" | grep -v ^"\[Passed\]" | grep -v ^"\[Broken\]" | grep -v ^"\[Fixed\]" | grep -v ^"\[Errored\]" | sed 's/[Rr][Ee]: //g' | sed 's/[R]: //g' | sed 's/[Aa][Ww]: //g' | sed "s/^.* (SYNCOPE-[^)]*)//" >> syncope-dev.wordle;
done
