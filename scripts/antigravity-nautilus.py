# Antigravity Nautilus Extension
#
# Place me in ~/.local/share/nautilus-python/extensions/,
# ensure you have python-nautilus package, restart Nautilus, and enjoy :)
#
# This script is released to the public domain.

from gi.repository import Nautilus, GObject
from subprocess import call
import os

# path to antigravity
ANTIGRAVITY = 'antigravity'

# what name do you want to see in the context menu?
ANTIGRAVITYNAME = 'Antigravity'

# always create new window?
NEWWINDOW = False


class AntigravityExtension(GObject.GObject, Nautilus.MenuProvider):

    def launch_antigravity(self, menu, files):
        safepaths = ''
        args = ''

        for file in files:
            filepath = file.get_location().get_path()
            safepaths += '"' + filepath + '" '

            # If one of the files we are trying to open is a folder
            # create a new instance of Antigravity
            if os.path.isdir(filepath) and os.path.exists(filepath):
                args = '--new-window '

        if NEWWINDOW:
            args = '--new-window '

        call(ANTIGRAVITY + ' ' + args + safepaths + '&', shell=True)

    def get_file_items(self, *args):
        files = args[-1]
        item = Nautilus.MenuItem(
            name='AntigravityOpen',
            label='Open in ' + ANTIGRAVITYNAME,
            tip='Opens the selected files with Antigravity'
        )
        item.connect('activate', self.launch_antigravity, files)

        return [item]

    def get_background_items(self, *args):
        file_ = args[-1]
        item = Nautilus.MenuItem(
            name='AntigravityOpenBackground',
            label='Open in ' + ANTIGRAVITYNAME,
            tip='Opens the current directory in Antigravity'
        )
        item.connect('activate', self.launch_antigravity, [file_])

        return [item]
