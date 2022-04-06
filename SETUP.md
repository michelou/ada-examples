# <span id="top">Ada Setup</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="./docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This document gathers some notes about setting up our <a href="https://www.adacore.com/" rel="external">Ada</a> development environment.
  </td>
  </tr>
</table>


## <span id="aunit">`aunit` Library</span>

We download the archive [`aunit-22.0.0.zip`](https://github.com/AdaCore/aunit/releases/tag/v22.0.0) and extract the source directory `aunit-22.0.0` (which contains the project file `Makefile`).

Path :

| `PATH` variable updates                          | Command line tool  |
|:-------------------------------------------------|:-------------------|
| `export PATH=$PATH:/c/opt/Python-3.10.2/Scripts` | `sphinx-build.exe` |
| `export PATH=$PATH:/c/opt/GNAT/2021/bin`         | `gprbuild.exe`     |
| `export PATH=$PATH:/c/opt/texlive/bin/win32`     | `pdflatex.exe`     |

### <span id="aunit_windows">Windows environment</span>

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> all</b>
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> doc all</b>
&nbsp;
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/dir">dir</a> /b doc\build\aunit_cb\pdf\*.pdf</b>
aunit_cb.pdf
&nbsp;
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> install INSTALL=dist</b>
</pre>

### <span id="aunit_msys2">MSYS2 environment</span>

<pre style="font-size:80%;">
<b>$ <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> all</b>
<b>$ <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> doc all</b>
&nbsp;
<b>$ <a href="https://man7.org/linux/man-pages/man1/find.1.html">find</a> doc/build -name *.pdf</b>
doc/build/aunit_cb/pdf/aunit_cb.pdf
&nbsp;
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Running.html">make</a> install INSTALL=dist</b>
</pre>

## <span id="footnotes">Footnotes</span>

<span id="footnote_01">[1]</span> **`doc/share/conf.py`** [↩](#anchor_01)

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

***

*[mics](https://lampwww.epfl.ch/~michelou/)/April 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->
