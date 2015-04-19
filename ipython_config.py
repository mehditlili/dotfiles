#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
c = get_config()

c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 0
c.InteractiveShellApp.exec_lines = [
    'import numpy',
]
c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = 'LightBG'
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.deep_reload = True
c.InteractiveShell.editor = 'vim'
c.InteractiveShell.xmode = 'Context'

c.PromptManager.in_template = r'{color.Blue}\Y1 [\#]:\n{color.Green}> '
c.PromptManager.in2_template = r'{color.Green}: '
c.PromptManager.out_template = r'> '
c.PromptManager.justify = True

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
 ('ls', 'gls --color=auto'),
 ('la', 'gls --color=auto -al'),
 ('lsa', 'gls --color=auto -lah'),
 ('..', 'cd ..'),
]
