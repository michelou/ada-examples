# <span id="top">GWindows Examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>gwindows-examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from various websites - mostly from the <a href="https://github.com/zertovitch/gwindows" rel="external">GWindows</a> project.
  </td>
  </tr>
</table>

We support the following build tools :

| Build tool | Configuration file |
|:-----------|:----|
| [**`gnatmake.exe`**][gnatmake_cmd] | &ndash; |
| [**`gprbuild.exe`**][gprbuild_cmd] | [**`build.gpr`**](./HelloWorld/build.gpr) |


## <span id="tutorial1">`tutorial1` Example</span>

Command [`build.bat`](./tutorial1/build.bat) <sup id="anchor_01">[1](#footnote_01)
</sup> takes the Ada source file [`tutorial1.adb`](./tutorial1/src/tutorial1.adb) as input and generates the executable `target\tutorial1.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="./tutorial1/build.bat">build</a> -verbose run</b>
Compile 1 Ada source file to directory "target\obj"
Execute program "target\tutorial1.exe"
</pre>

## <span id="tutorial2">`tutorial2` Example</span>

Command `make.exe` ([`Makefile`](./tutorial2/Makefile)) takes the Ada source file [`tutorial2.adb`](./tutorial2/src/tutorial2.adb) and generates the executable `target\tutorial2.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://www.gnu.org/software/make/manual/html_node/Options-Summary.html" rel="external">make</a> run</b>
"C:/opt/GNAT/2021/bin/gnatmake.exe" -q -gnat2022 -we -aI"C:\opt\GWindows-20221113\gnatcom\framework" -aI"C:\opt\GWindows-20221113\gwindows\framework" -D "target/obj" -o "target/tutorial2.exe" src/tutorial2.adb
target/tutorial2.exe
</pre>

<!--================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Output with `-debug` option*** [↩](#anchor_01)

<dl><dd>

<pre style="font-size:80%;">
<b>&gt; <a href="tutorial1/build.bat">build</a> -debug run</b>
[build] Properties : _PROJECT_NAME=tutorial1 _PROJECT_VERSION=0.1-SNAPSHOT
[build] Options    : _TIMER=0 _VERBOSE=0
[build] Subcommands: _CLEAN=1 _COMPILE=1 _DOC=0 _LINT=0 _RUN=1 _TEST=0
[build] Variables  : "ADACTL_HOME=C:\opt\adactl-1.22r16c"
[build] Variables  : "GIT_HOME=C:\opt\Git-2.39.1"
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

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[alr_cli]: https://alire.ada.dev/docs/#first-steps
[github_alire]: https://github.com/alire-project/alire
[gnatmake_cmd]: https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake
[gprbuild_cmd]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html
