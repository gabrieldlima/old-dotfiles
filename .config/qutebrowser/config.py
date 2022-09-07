config.load_autoconfig(False)

c.auto_save.session = False

# Open a specific page or set of pages
c.url.start_pages = ["https://start.duckduckgo.com/"] 

# Search engines
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'g': 'https://www.google.com/search?q={}', 'yt': 'https://www.youtube.com/results?search_query={}'}

# Dark mode
c.colors.webpage.preferred_color_scheme = 'dark'

# Zoom
c.zoom.default = '100'
c.zoom.levels = ["25%", "50%", "75%", "100%", "110%", "125%", "150%", "175%", "200%"]

# Fonts
c.fonts.default_family = "JetBrains Mono"
c.fonts.default_size = '10pt'
c.fonts.tabs.selected = '11pt JetBrains Mono'
c.fonts.tabs.unselected = '11pt JetBrains Mono'

# Hints
c.hints.border = '1px solid #0d1117'
c.colors.hints.bg = '#f69d50'
c.colors.hints.fg = '#0d1117'
c.colors.hints.match.fg = '#f69d50'

# Tabs
c.colors.tabs.selected.odd.bg = '#0d1117'
c.colors.tabs.selected.odd.fg = '#f8f8f2'
c.colors.tabs.selected.even.bg = '#0d1117'
c.colors.tabs.selected.even.fg = '#f8f8f2'
c.colors.tabs.odd.bg = '#0d1117'
c.colors.tabs.odd.fg = '#8b949e'
c.colors.tabs.even.bg = '#0d1117'
c.colors.tabs.even.fg = '#8b949e'

# Statusbar
c.colors.statusbar.normal.bg = '#0d1117'
c.colors.statusbar.normal.fg = '#c9d1d9'
c.colors.statusbar.insert.bg = '#0d1117'
c.colors.statusbar.insert.fg = '#c9d1d9'
c.colors.statusbar.command.bg = '#0d1117'
c.colors.statusbar.command.fg = '#c9d1d9'
c.colors.statusbar.url.hover.fg = '#6cb6ff'
c.colors.statusbar.url.success.http.fg = '#c9d1d9'
c.colors.statusbar.url.success.https.fg = '#8ddB8c'

# Completion
c.colors.completion.fg = '#c9d1d9'
c.colors.completion.match.fg = '#f47067'
c.colors.completion.category.bg = '#21262d'
c.colors.completion.category.fg = '#c9d1d9'
c.colors.completion.category.border.top = '#21262d'
c.colors.completion.category.border.bottom = '#21262d'
c.colors.completion.odd.bg = '#0d1117'
c.colors.completion.even.bg = '#0d1117'
c.colors.completion.scrollbar.bg = '#0d1117'
c.colors.completion.scrollbar.fg = '#c9d1d9'
c.colors.completion.item.selected.bg = '#c9d1d9' 
c.colors.completion.item.selected.fg = '#0d1117'
c.colors.completion.item.selected.match.fg = '#f47067'
c.colors.completion.item.selected.border.top = '#c9d1d9'
c.colors.completion.item.selected.border.bottom = '#c9d1d9'
