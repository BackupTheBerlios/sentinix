#!/bin/sh

#cvs -nq update | grep '^\?' | cut -d" " -f2- | while read f
#do
#    cvs add "$f"
#done


#cvs -nq update | grep '^\?' | cut -d" " -f2- | xargs cvs add

cvs -nq update | grep '^U ' | cut -d" " -f2- | xargs cvs rm
