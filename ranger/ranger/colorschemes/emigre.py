from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    cyan, magenta, red, white, default,
    normal, bold, reverse,
    default_colors,
)


class Solarized(ColorScheme):
    progress_bar_color = 33

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg = 29  # changed
            if context.selected:
                attr = normal  # changed
                #  attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 235
                bg = 160
            if context.border:
                fg = default
            if context.media:
                if context.image:
                    fg = 136
                else:
                    fg = 166
            if context.container:
                fg = 61
            if context.directory:
                fg = 34  # changed
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                fg = 37  # changed
                attr |= normal  # changed
                #  attr |= bold
            if context.socket:
                fg = 136
                bg = 230
                attr |= bold
            if context.fifo:
                fg = 136
                bg = 230
                attr |= bold
            if context.device:
                fg = 244
                bg = 230
                attr |= bold
            if context.link:
                fg = 66 if context.good else 160  # changed
                attr |= normal  # changed
                #  attr |= bold
                if context.bad:
                    bg = 235

            if context.source_code:
                fg = 110

            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, magenta):
                    fg = white
                else:
                    fg = red
            if not context.selected and (context.cut or context.copied):
                fg = 234
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked: # changed
                    attr |= normal
                    fg = 230
                    bg = 240
            if context.badinfo:
                if attr & reverse:
                    bg = magenta
                else:
                    fg = magenta

            if context.inactive_pane:
                fg = 241

            # changes colour of the selector of the current line
            if context.selected:
                attr = normal
                bg = 65
                if not context.marked:
                    fg = 232

        elif context.in_titlebar:
            fg = 242
            if context.hostname:
                fg = 16 if context.bad else 240
                if context.bad:
                    bg = 166
            elif context.directory:
                fg = 33
            elif context.tab:
                fg = 47 if context.good else 33
                bg = 239
            elif context.link:
                fg = cyan

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 93
                elif context.bad:
                    fg = 160
                    bg = 235
            if context.marked:
                attr |= bold | reverse
                fg = 237
                bg = 47
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 160
                    bg = 235
            if context.loaded:
                bg = self.progress_bar_color

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 93

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        return fg, bg, attr
