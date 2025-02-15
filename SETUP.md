# <span id="top">Ada Setup</span> <span style="font-size:90%;">[↩](./README.md)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="./docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This document gathers some notes about setting up our <a href="https://www.adacore.com/" rel="external">Ada</a> development environment.
  </td>
  </tr>
</table>

## <span id="aunit">`aunit` Library</span>

We download the archive [`aunit-25.0.0.zip`](https://github.com/AdaCore/aunit/releases/tag/v25.0.0) (October 2024) and extract the source directory `aunit-25.0.0` (which contains the project file `Makefile`).

### Installation requirements

The following requirements must be satisfied to build and install the `aunit` distribution :
- command `sphinx-build` must be on the command path `PATH`.
- extension `sphing_rtd_theme` must be installed <sup id="anchor_01">[1](#footnote_01)</sup>
- command `pdflatex` must be on the command path `PATH`  <sup id="anchor_02">[2](#footnote_02)</sup>.

| `PATH` variable updates                          | Command line tool  |
|:-------------------------------------------------|:-------------------|
| [**`export`**](https://man7.org/linux/man-pages/man1/export.1p.html)` PATH=$PATH:/c/opt/Python-3.11.0/Scripts` | [`sphinx-build.exe`][tool_sphinx-build] |
| [**`export`**](https://man7.org/linux/man-pages/man1/export.1p.html)` PATH=$PATH:/c/opt/GNAT/2021/bin`         | [`gprbuild.exe`][tool_gprbuild]     |
| [**`export`**](https://man7.org/linux/man-pages/man1/export.1p.html)` PATH=$PATH:/c/opt/texlive/bin/win32`     | [`pdflatex.exe`][tool_pdflatex]     |

### <span id="aunit_windows">Windows environment</span>

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html" rel="external">make</a> all</b>
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> doc all</b>
&nbsp;
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/dir">dir</a> /b doc\build\aunit_cb\pdf\*.pdf</b>
aunit_cb.pdf
&nbsp;
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html" rel="external">make</a> install INSTALL=dist</b>
</pre>

### <span id="aunit_msys2">MSYS2 environment</span> [**&#x25B4;**](#top)

<pre style="font-size:80%;">
<b>$ <a href="https://www.gnu.org/software/make/manual/html_node/Running.html" rel="external">make</a> all</b>
<b>$ <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> doc all</b>
&nbsp;
<b>$ <a href="https://man7.org/linux/man-pages/man1/find.1.html">find</a> doc/build -name *.pdf</b>
doc/build/aunit_cb/pdf/aunit_cb.pdf
&nbsp;
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html" rel="external">make</a> install INSTALL=dist</b>
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span>

<span id="footnote_01">[1]</span> Missing extension **`sphinx_rtd_theme`** [↩](#anchor_01)

<dl><dd>

<pre style="font-size:80%;">
<b>&gt; cd</b>
G:\aunit-examples\aunit-25.0.0
&nbsp;
<b>&gt; make doc all</b>
make -C doc
make[1]: Entering directory '/g/aunit-examples/aunit-25.0.0/doc'
make  aunit_cb.html  aunit_cb.pdf  aunit_cb.txt  aunit_cb.info
make[2]: Entering directory '/g/aunit-examples/aunit-25.0.0/doc'
DOC_NAME=aunit_cb sphinx-build -b html   -c ./share -d build/aunit_cb/doctrees . build/aunit_cb/html
Running Sphinx v4.3.2
ignoring Makefile

<span style="color:red;">Extension error:
Could not import extension sphinx_rtd_theme (exception: No module named 'sphinx_rtd_theme')</span>
make[2]: *** [Makefile:53: aunit_cb.html] Error 2
make[2]: Leaving directory '/g/aunit-examples/aunit-25.0.0/doc'
make[1]: *** [Makefile:79: aunit_cb.all] Error 2
make[1]: Leaving directory '/g/aunit-examples/aunit-25.0.0/doc'
make: *** [Makefile:70: doc] Error 2
</pre>

We have to install the [`sphinx_rtd_theme` extension][sphinx_rtd_theme] :
<pre style="font-size:80%;">
<b>&gt; <a href="">where</a> pip</b>
c:\opt\Python-3.10.10\Scripts\pip.exe
&nbsp;
<b>&gt; <a href="">pip.exe</a> install sphinx_rtd_theme</b>
Collecting sphinx_rtd_theme
  Downloading sphinx_rtd_theme-3.0.2-py2.py3-none-any.whl.metadata (4.4 kB)
Collecting sphinx<9,>=6 (from sphinx_rtd_theme)
  Downloading sphinx-8.1.3-py3-none-any.whl.metadata (6.4 kB)
Collecting docutils<0.22,>0.18 (from sphinx_rtd_theme)
  Downloading docutils-0.21.2-py3-none-any.whl.metadata (2.8 kB)
[...]
Successfully installed Pygments-2.19.1 alabaster-1.0.0 docutils-0.21.2 requests-2.32.3 sphinx-8.1.3 sphinx_rtd_theme-3.0.2 sphinxcontrib-applehelp-2.0.0 sphinxcontrib-devhelp-2.0.0 sphinxcontrib-htmlhelp-2.1.0 sphinxcontrib-jquery-4.1 sphinxcontrib-qthelp-2.0.0 sphinxcontrib-serializinghtml-2.0.0
</pre>
</dd></dl>

<span id="footnote_02">[2]</span> Missing command **`pdflatex`** [↩](#anchor_02)

<dl><dd>
We can install either <a href="https://tug.org/texlive/windows.html" rel="external">TeXLive</a> or <a href="https://miktex.org/download#setuputility" rel="external">MikTeX</a>.
<ul>
  <li><b>TeXLive</b> &ndash;
    <pre style="font-size:80%;">
    </pre>
  </li>
  <li><b>MikTeX</b> &ndash; Two points are to be considered :
    <ul>
      <li>3 installation procedures are available : system wide (with admin privileges), user wide and portable. We choose the portable installation procedure.</li>
      <li>3 installation size are available: essential, basic and complete; we choose the essential installation (886 MB installation size)</li>
    </ul>
    <pre style="font-size:80%;">
    <b>&gt; <a href="https://docs.miktex.org/manual/miktexsetup.html" rel="external">miktexsetup_standalone</a> --portable c:\opt\miktex download</b>
    &nbsp;
    <b>&gt; <a href="https://docs.miktex.org/manual/miktexsetup.html">miktexsetup_standalone</a> --package-set=essential --modify-path=no --use-re
gistry=no --portable c:\opt\miktex install</b>
    [...]
    &nbsp;
    <b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where" rel="external">where</a> /r c:\opt\miktex pdflatex</b>
    c:\opt\miktex\texmfs\install\miktex\bin\x64\pdflatex.exe<
    </pre>
  </li>
</ul>
</dd></dl>

<span id="footnote_03">[3]</span> **`doc/share/conf.py`** [↩](#anchor_03)

<dl><dd>
The source patch consists of replacing <code>AdaLexer()</code> by <code>AdaLexer</code> (idem for <code>GNATProjectLexer()</code>).
</dd>
<dd>
<pre style="font-size:80%;">
 98: <b>def</b> setup(app):
 99:     app.add_lexer('ada', ada_pygments.AdaLexer())
100:     app.add_lexer('gpr', ada_pygments.GNATProjectLexer())
</pre>
</dd></dl>

<!--
<pre style="font-size:80%;">
&gt; pacman -S make

&gt; pacman -S mingw-w64-x86_64-gcc-ada
resolving dependencies...
looking for conflicting packages...

Packages (16) [...] mingw-w64-x86_64-gcc-ada-13.2.0-1

Total Download Size:    69.62 MiB
Total Installed Size:  538.08 MiB

[...]
</pre>
-->

***

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[tool_gprbuild]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html
[tool_pdflatex]: https://manpages.debian.org/experimental/texlive-latex-base/pdflatex.1.en.html
[tool_sphinx-build]: https://www.sphinx-doc.org/en/master/man/sphinx-build.html

[sphinx_rtd_theme]: https://sphinx-rtd-theme.readthedocs.io/en/stable/installing.html
