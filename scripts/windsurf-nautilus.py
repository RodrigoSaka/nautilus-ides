# Windsurf Nautilus Extension
#
# Place me in ~/.local/share/nautilus-python/extensions/,
# ensure you have python-nautilus package, restart Nautilus, and enjoy :)
#
# This script is released to the public domain.

from gi.repository import Nautilus, GObject
from subprocess import call
import os

# path to windsurf
WINDSURF = 'windsurf'

# what name do you want to see in the context menu?
WINDSURFNAME = 'Windsurf'

# always create new window?
NEWWINDOW = False


class WindsurfExtension(GObject.GObject, Nautilus.MenuProvider):

    def launch_windsurf(self, menu, files):
        safepaths = ''
        args = ''

        for file in files:
            filepath = file.get_location().get_path()
            safepaths += '"' + filepath + '" '

            # If one of the files we are trying to open is a folder
            # create a new instance of Windsurf
            if os.path.isdir(filepath) and os.path.exists(filepath):
                args = '--new-window '

        if NEWWINDOW:
            args = '--new-window '

        call(WINDSURF + ' ' + args + safepaths + '&', shell=True)

    def get_file_items(self, *args):
        files = args[-1]
        item = Nautilus.MenuItem(
            name='WindsurfOpen',
            label='Open in ' + WINDSURFNAME,
            tip='Opens the selected files with Windsurf'
        )
        item.connect('activate', self.launch_windsurf, files)

        return [item]

    def get_background_items(self, *args):
        file_ = args[-1]
        item = Nautilus.MenuItem(
            name='WindsurfOpenBackground',
            label='Open in ' + WINDSURFNAME,
            tip='Opens the current directory in Windsurf'
        )
        item.connect('activate', self.launch_windsurf, [file_])

        return [item]
