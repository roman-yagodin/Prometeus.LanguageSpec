# About Prometeus.LanguageSpec

*Prometeus.LanguageSpec* goal is to create GtkSourceView language specification for the [Prometeus](http://www.prometeus.ru/) distant learning system to allow editing test files in GEdit or other editor based on GtkSourceView with syntax highlighting.

![Screenshot](https://raw.githubusercontent.com/roman-yagodin/Prometeus.LanguageSpec/master/images/screenshot_01.jpg "Using Prometeus language spec in GEdit 2 for Windows")

# Automatic install (Windows)

Use [Windows installer](https://github.com/roman-yagodin/Prometeus.LanguageSpec/releases/tag/v0.3.1) to install Prometeus.LanguageSpec,  GEdit 2.30 or GEdit 3.14 with Prometeus syntax highlighting enabled.

# Manual install (Windows)

1. Install [GEdit for Windows](http://ftp.gnome.org/pub/GNOME/binaries/win32/gedit/2.30/gedit-setup-2.30.1-1.exe). You can always get latest stable version here: http://projects.gnome.org/gedit/

2. Unpack [release](https://github.com/roman-yagodin/Prometeus.LanguageSpec/releases) source package.

3. Copy `prometeus.lang` file in `C:\Program Files\gedit\share\gtksourceview-2.0\language-specs` or `C:\Program Files (x86)\gedit\share\gtksourceview-2.0\language-specs` - or just run `install.cmd`.

# Manual install (Linux)

1. Install GEdit using your package manager. In Debian it should be: `sudo apt-get install gedit` 

2. Unpack [release](https://github.com/roman-yagodin/Prometeus.LanguageSpec/releases) source package. 

3. Copy `prometeus.lang` file in `/usr/share/gtksourceview-2.0/language-specs` and `/usr/share/gtksourceview-3.0/language-specs` - or just run `./install.sh` in a terminal (it would require superuser privileges).

# Test if it works

Open file `sample.<culture-code>.test` file in GEdit - its content should be colored accoding to "Prometeus" test markup language.
 
# Usage tips

Language specification in designed to use with "Full" test markup shema but also works file if you are using "Simplified" markup shema. Don't expect miracles - "Prometeus" test markup language is significantly informal and allow use HTML markup - it's not always safe. But using syntax highlight makes formatting errors in the test much less frequent.

In the current specification version, HTML entity markup is realized, so entities like &amp;nbsp;, &amp;amp;, &amp;#160; are highlighted. HTML tags and angle brackets "<" и ">" highlighted as errors - this one to drive author attention HTML markup in the test.

# Using with "Prometeus" test converter

Before use "Prometeus" test converter utility:

1. Change test file extension from `.test` to `.txt`. 
2. Make sure you are using Windows-style (CR+LF) line endings in file. 
3. For russian / cyrillic users: also make sure that file is in Windows-1251 encoding.

**Note:** For last two points you can use GEdit to save test file with desired line endings and encoding - just specify them in Save-As dialog.

# TO-DO

- [ ] Add README in russian
- [x] Create Windows installer using NSIS
- [ ] More clear HTML/XML support
- [ ] Structurize contexts in the specification
