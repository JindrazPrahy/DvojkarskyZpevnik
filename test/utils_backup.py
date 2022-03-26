import os
import re


def _cleanlatex(raw):
    cleantext = re.sub(re.compile("\\\[^\^\& ]*"), '', raw)
    cleantext = re.sub(re.compile("%%.*"), '', cleantext)
    cleantext = cleantext.replace(" }", " ")
    return cleantext


def get_songname_from_texfile(file):
    with open(file, "r") as f:
        for line in f.readlines():
            if "title=" in line:
                content = line
                break
    songname = _cleanlatex(content.split("\\\\")[0])
    songauthor = _cleanlatex(content.split("\\\\")[1]) if "\\\\" in content else ""
    ret = "{} ({})".format(songname, songauthor)
    ret = re.sub(re.compile("\(\s*"), "(", ret)
    ret = re.sub(re.compile("\s*\)"), ")", ret)
    ret = ret.replace(" ()", "")
    ret = re.sub(re.compile("\s*$"), "", ret)
    return ret


def get_songs_in_songbook():
    songs_dir = os.path.join("..", "..", "DvojkarskyZpevnik", "songy")
    songs = os.listdir(songs_dir)
    songs = list(filter(lambda x: not x.startswith("0") and not x.startswith("ZZ") and x.endswith(".tex"), songs))
    songs.sort()
    return {get_songname_from_texfile(os.path.join(songs_dir, x)): x for x in songs}

