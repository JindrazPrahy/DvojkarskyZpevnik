#!/bin/bash

function print_help
{
    echo "$0 [-a] [-f FILE] [-h] [-w]"
    printf "Usage:\nTypesets all modified latex files into PDF format to pdf dir and into text format into txt dir.\n"
    printf "Options:
\t-a\t Typesets all files no matter what.
\t-f FILE\t Typesets only one FILE. Write filename only.
\t-h\t Prints this help and exit.
\t-w\t Do not typeset each individual songs but the whole song book.\n"
}

function check_correct_workdir
{
    last_wd=`pwd | awk 'BEGIN {FS = "/"} {printf "%s/%s", $(NF-1), $(NF)}'`
    if [ $last_wd != "DvojkarskyZpevnik/scripts" ]; then
        echo "Current work dir is \"${last_wd}\", but it should be: \"DvojkarskyZpevnik/scripts\"" >&2
        exit 1
    fi
}

function check_existing_dir
{
    [ -d "../$1" ] || mkdir "../$1"
}

function check_existing_file
{
    if [ -d "../$1" ]; then
        echo "File $1 not exists." >&2
        exit 1
    fi
}

function typeset_songbook
{
    check_correct_workdir
    check_existing_file "Cely_zpevnik/Zpevnik.tex"
    TEXINPUTS=.:../Cely_zpevnik/:$TEXINPUTS pdflatex -synctex=1 -interaction=batchmode -output-directory "../Cely_zpevnik/" "../Cely_zpevnik/Zpevnik.tex"
    [ "$?" == "0" ] || ( echo "Error while typesetting. See Cely_zpevnik/Zpevnik.log" && exit 1 )
    # pdftotext is unable to decode our pdfs
    # less "../Cely_zpevnik/Zpevnik.pdf" > "../txt/Celytxt/Zpevnik.txt"  # Convert pdf to text
    exit 0
}

function typeset_song
{
    check_existing_file "Generator/generator.tex"
    song_filename=$1
    echo "Typesetting ${song_filename}"
    cat "../Generator/generator.tex" | \
        sed -E 's/^\\input\{.*\}/\\input\{\.\.\/songy\/'"$song_filename"'\}/' > "tmpgen.tex"  # Overrides input file in tex source file
    mv "tmpgen.tex" "../Generator/generator.tex"
    TEXINPUTS=.:../Generator/:$TEXINPUTS pdflatex -synctex=1 -interaction=batchmode -output-directory "../Generator/" "../Generator/generator.tex"
    song_prefix=${song_filename%.tex}
    # pdftotext is unable to decode our pdfs
    # less "../Generator/generator.pdf" > "../txt/${song_prefix}.txt"  # Convert pdf to text
    mv "../Generator/generator.pdf" "../pdf/${song_prefix}.pdf"
}


all_flag=false
file_flag=false

while getopts ":haf:w" opt; do
    case $opt in
    h) print_help; exit 0;;
    a) all_flag=true;;
    f) file_flag=true; song=`printf '%q' "${OPTARG}"`;;  # Protection against injection attack
    w) typeset_songbook;;  # Process songbook and exit
    \?) echo "Unknown option: -$OPTARG" >&2; print_help; exit 1;;
    :) echo "Missing option argument for -$OPTARG" >&2; print_help; exit 1;;
    *) echo "Unimplemented option: -$OPTARG" >&2; print_help; exit 1;;
    esac
done
shift $(($OPTIND - 1))


# Check correct conditions
check_correct_workdir
check_existing_dir "pdf"
check_existing_dir "txt"
check_existing_file "Generator/generator.tex"

if ${file_flag} ; then  # Process given song only
    typeset_song ${song}
else                    # Process all songs
    for song in `ls ../songy | grep --only-matching ".*.tex$"`; do
        if [ "../songy/${song}" -nt "../pdf/${song%.tex}.pdf" ] || ${all_flag} ; then
            typeset_song ${song}
        fi
    done
fi

echo "$0: songs done."
