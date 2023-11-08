# <span id="top">GWindows examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>gwindows-examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from various websites - mostly from the <a href="https://github.com/zertovitch/gwindows" rel="external">GWindows</a> project.
  </td>
  </tr>
</table>

We support the following build tools :

| Build tool | Build file |
|:-----------|:-----------|
| [**`gnatmake.exe`**][gnatmake_cmd] <sup id="anchor_01">[1](#footnote_01)</sup> | &ndash; |
| [**`gprbuild.exe`**][gprbuild_cmd] | [**`build.gpr`**](./HelloWorld/build.gpr) |


## <span id="tutorial1">`tutorial1` Example</span>

Command [**`build.bat`**](./tutorial1/build.bat) <sup id="anchor_02">[2](#footnote_02)</sup> relies on [**`gnatmake.exe`**][gnatmake_cmd] to generate the executable `target\tutorial1.exe` from the Ada source file [`tutorial1.adb`](./tutorial1/src/tutorial1.adb) :

<pre style="font-size:80%;">
<b>&gt; <a href="./tutorial1/build.bat">build</a> -verbose run</b>
Compile 1 Ada source file to directory "target\obj"
Execute program "target\tutorial1.exe"
</pre>

Command [**`gprbuild.exe`**][gprbuild_cmd] reads its configuration from file [`tutorial1.gpr`](./tutorial1/tutorial1.gpr) and generate the executable `target\tutorial1.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a>& <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html" rel="external">gprbuild</a>& target\tutorial1.exe</b>
using project file tutorial1.gpr
using project file tutorial1.gpr
Compile
   [Ada]          tutorial1.adb
Bind
   [gprbind]      tutorial1.bexch
   [Ada]          tutorial1.ali
Link
   [link]         tutorial1.adb
</pre>

## <span id="tutorial2">`tutorial2` Example</span>

Command [**`make.exe`**][gnumake_cmd] reads its configuration from file [`Makefile`](./tutorial2/Makefile) and relies on [`gnatmake`][gnatmake_cmd] to generate the executable `target\tutorial2.exe` from the Ada source file [`tutorial2.adb`](./tutorial2/src/tutorial2.adb) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Options-Summary.html" rel="external">make</a> run</b>
"C:/opt/GNAT/2021/bin/gnatmake.exe" -q -gnat2022 -we -aI"C:\opt\GWindows-20221113\gnatcom\framework" -aI"C:\opt\GWindows-20221113\gwindows\framework" -D "target/obj" -o "target/tutorial2.exe" src/tutorial2.adb
target/tutorial2.exe
</pre>

Command [**`gprbuild.exe`**][gprbuild_cmd] reads its configuration from file [`tutorial2.gpr`](./tutorial2/tutorial2.gpr) and generate the executable `target\tutorial2.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a>& <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html" rel="external">gprbuild</a>& target\tutorial2.exe</b>
using project file tutorial2.gpr
using project file tutorial2.gpr
Compile
   [Ada]          tutorial2.adb
   [Ada]          gwindows-windows-main.adb
Bind
   [gprbind]      tutorial2.bexch
   [Ada]          tutorial2.ali
Link
   [link]         tutorial2.adb
</pre>

<!--================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)


<span id="footnote_01">[1]</span> ***Gnatmake*** [↩](#anchor_01)

<dl><dd>
GNU tools such as <a href="https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html" reé?"extermal"><code><b>gcc</b></code></a>, <a href="https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake" rel="external"><code><b>gnatmake</b></code></a>, <a href="https://sourceware.org/binutils/docs/binutils/objdump.html" rel="external"><code><b>objdump</b></code></a> and <a href="https://sourceware.org/binutils/docs/binutils/windres.html" rel="external"><code><b>windres</b></code></a> are available both in the MSYS installation and in the GNAT 2021 installation; we use the tools from the MSYS installation which have <i>newer versions</i>.
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where">where</a> gcc gnatmake windres</b>
C:\opt\msys64\usr\bin\gcc.exe
C:\opt\msys64\mingw64\bin\gcc.exe
C:\opt\GNAT\2021\bin\gcc.exe
C:\opt\msys64\mingw64\bin\gnatmake.exe
C:\opt\GNAT\2021\bin\gnatmake.exe
C:\opt\msys64\usr\bin\windres.exe
C:\opt\msys64\mingw64\bin\windres.exe
C:\opt\GNAT\2021\bin\windres.exe
&nbsp;
<b>&gt; C:\opt\msys64\mingw64\bin\gnatmake.exe --version</b>
GNATMAKE 13.2.0
Copyright (C) 1995-2023, Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
&nbsp;
<b>&gt; C:\opt\GNAT\2021\bin\gnatmake.exe --version</b>
GNATMAKE Community 2021 (20210519-103)
Copyright (C) 1995-2021, Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</pre>
</dd></dl>

<span id="footnote_02">[2]</span> **`Tutorial1` *output with* `-debug` *option*** [↩](#anchor_02)

<dl><dd>

<pre style="font-size:80%;">
<b>&gt; <a href="tutorial1/build.bat">build</a> -debug run</b>
[build] Properties : _PROJECT_NAME=tutorial1 _PROJECT_VERSION=0.1-SNAPSHOT
[build] Options    : _TIMER=0 _VERBOSE=0
[build] Subcommands: _CLEAN=1 _COMPILE=1 _DOC=0 _LINT=0 _RUN=1 _TEST=0
[build] Variables  : "ADACTL_HOME=C:\opt\adactl"
[build] Variables  : "GIT_HOME=C:\opt\Git"
[build] Variables  : "GNAT_HOME=C:\opt\GNAT\2021"
[build] Variables  : "GNAT2019_HOME=C:\opt\GNAT\2019"
[build] Variables  : _MAIN_NAME=Tutorial1 _MAIN_ARGS=
[build] 00000000000000 Target : 'W:\gwindows-examples\tutorial1\target\tutorial1.exe'
[build] 20090315071046 Sources: 'W:\gwindows-examples\tutorial1\src\*.ada','W:\gwindows-examples\tutorial1\src\*.adb','W:\gwindows-examples\tutorial1\src\*.ads'
[build] _ACTION_REQUIRED=1
[build] "C:\opt\GNAT\2021\bin\gnatmake.exe" -gnat2022 -we -aI"C:\opt\GWindows-20221113\gnatcom\framework" -aI"C:\opt\GWindows-20221113\gwindows\framework" -D "W:\gwindows-examples\tutorial1\target\obj" -o "W:\gwindows-examples\tutorial1\target\tutorial1.exe"  "W:\gwindows-examples\tutorial1\src\tutorial1.adb"
gcc -c -IW:\gwindows-examples\tutorial1\src\ -gnat2022 -IC:\opt\GWindows-20221113\gnatcom\framework -IC:\opt\GWindows-20221113\gwindows\framework -I- -o W:\gwindows-examples\tutorial1\target\obj\tutorial1.o W:\gwindows-examples\tutorial1\src\tutorial1.adb
[...]
gcc -c -IW:\gwindows-examples\tutorial1\src\ -gnat2022 -IC:\opt\GWindows-20221113\gnatcom\framework -IC:\opt\GWindows-20221113\gwindows\framework -I- -o W:\gwindows-examples\tutorial1\target\obj\gwindows-drawing-capabilities.o C:\opt\GWindows-20221113\gwindows\framework\gwindows-drawing-capabilities.adb
gnatbind -aIC:\opt\GWindows-20221113\gnatcom\framework -aIC:\opt\GWindows-20221113\gwindows\framework -aOW:\gwindows-examples\tutorial1\target\obj -x W:\gwindows-examples\tutorial1\target\obj\tutorial1.ali
gnatlink W:\gwindows-examples\tutorial1\target\obj\tutorial1.ali -o W:\gwindows-examples\tutorial1\target\tutorial1.exe
[build] _EXITCODE=0
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/November 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[alr_cli]: https://alire.ada.dev/docs/#first-steps
[github_alire]: https://github.com/alire-project/alire
[gnatmake_cmd]: https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake
[gnumake_cmd]: https://www.gnu.org/software/make/manual/html_node/Running.html
[gprbuild_cmd]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html
