""" Test whether web song generator properly parses tex source files
    
    Run from the root, not from test directory with command:
    python -m unittest discover -s test/ -p 'test_*.py'
"""

import unittest
import re
import os
import sys

web_src = "../dvojkarsky_zpevnik_web/dvojkarsky_zpevnik/homepage"
if os.path.isdir(web_src):
    sys.path.append(os.path.abspath(web_src))
    import utils
else:
    raise NotImplementedError("Testing without web not supported.")
    import test.utils_backup as utils


class TestTexParsing(unittest.TestCase):
    def setUp(self):
        # Go to web execution dir
        self.origin_path = os.path.abspath(os.getcwd())
        os.chdir("../dvojkarsky_zpevnik_web/dvojkarsky_zpevnik")

    def tearDown(self):
        # Revert dir change
        os.chdir(self.origin_path)

    def test_can_get_all_songs_in_songbook(self):
        name2file = utils.get_songs_in_songbook()
        self.assertTrue(len(name2file) > 0)

    def test_does_song_count_fit(self):
        name2file = utils.get_songs_in_songbook()
        songs_dir = os.path.join("..", "..", "DvojkarskyZpevnik", "songy")
        songs = os.listdir(songs_dir)
        songs = list(filter(lambda x: not x.startswith("0") and not x.startswith("ZZ") and x.endswith(".tex"), songs))
        
        for s in songs:
            if "VERII" in s:
                # TODO: Fix this! Na webu se nabidne jedna z moznosti.
                self.skipTest("Existuji ruzne verze jednoho songu.")
        
        self.assertEqual(len(songs), len(name2file))

    def test_name_format(self):
        names = utils.get_songs_in_songbook().keys()
        for name in names:
            self.assertTrue(re.match('[^\(\)]*(\([^\)]+\))?[^\(\)]*', name))
