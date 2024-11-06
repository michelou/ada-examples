# <span id="top">HAC Examples</span> <span style="font-size:90%;">[↩](../README.md#top)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://github.com/zertovitch/hac" rel="external"><img style="border:0;" src="../docs/images/hac.png" width="100" alt="HAC Project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>hac-examples\</code></strong> contains <a href="https://github.com/zertovitch/hac" rel="external">Ada</a> code examples coming from the <a href="https://github.com/zertovitch/hac" rel="external">HAC</a> project.
  </td>
  </tr>
</table> 

We support the following build tools :

| Build&nbsp;tool | Build&nbsp;file |
|:----------------|:----------------|
| [**`gnatmake.exe`**][gnatmake_cmd] <sup id="anchor_01">[1](#footnote_01)</sup> | &ndash; |
| [**`gprbuild.exe`**][gprbuild_cmd] | [`build.gpr`](./Ackermann/build.gpr) |

## <span id="ackermann">`Ackermann` Example</span>

This code example consists of source file [`ackermann.adb`](./Ackermann/src/main/ada/ackermann.adb).

<pre style="font-size:80%;">
<b>&gt; <a href="./Ackermann/build.bat">build</a> -verbose run</b>
Compile 5 Ada source files into directory "target\obj"
Execute Ada program "target\Ackermann.exe"
Ackermann function
     1     2     3     4     5     6     7
     2     3     4     5     6     7     8
     3     5     7     9    11    13    15
     5    13    29    61   125   253   509
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="./Ackermann/Makefile">make</a> -s run</b>
Ackermann function
     1     2     3     4     5     6     7
     2     3     4     5     6     7     8
     3     5     7     9    11    13    15
     5    13    29    61   125   253   509
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html">gprbuild</a> &amp; target\Ackermann.exe</b>
using project file build.gpr
Setup
   [mkdir]        object directory for project Build
Compile
   [Ada]          ackermann.adb
   [Ada]          hat.adb
Bind
   [gprbind]      ackermann.bexch
   [Ada]          ackermann.ali
Link
   [link]         ackermann.adb
Ackermann function
     1     2     3     4     5     6     7
     2     3     4     5     6     7     8
     3     5     7     9    11    13    15
     5    13    29    61   125   253   509
</pre>

## <span id="binomials">`Binomials` Example</span> [**&#x25B4;**](#top)

Example `Binomials`has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./Binomials/build.bat">build.bat</a>
|   <a href="./Binomials/build.gpr">build.gpr</a>
|   <a href="./Binomials/build.sh">build.sh</a>
|   <a href="./Binomials/Makefile">Makefile</a>
\---src
    \---main
        \---ada
                <a href="./Binomials/src/main/ada/binomials.adb">binomials.adb</a>
</pre>

Command [`build -verbose run`](./Binomials/build.bat) generates and executes the program `target\Binomials.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="./Binomials/build.bat">build</a> -verbose run</b>
Compile 5 Ada source files into directory "target\obj"
Execute Ada program "target\Binomials.exe"
n = 1
k= binomial (n,k)=
&nbsp;
n = 2
k= binomial (n,k)=
1: 2
&nbsp;
n = 3
k= binomial (n,k)=
1: 3
2: 3
&nbsp;
n = 4
k= binomial (n,k)=
1: 4
2: 6
3: 4
&nbsp;
[...]
</pre>

<!--=======================================================================-->

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
<b>&gt; C:\opt\msys64\mingw64\bin\<a href="https://gcc.gnu.org/onlinedocs/gnat_ugn/Switches-for-gnatmake.html">gnatmake.exe</a> --version</b>
GNATMAKE 13.2.0
Copyright (C) 1995-2023, Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
&nbsp;
<b>&gt; C:\opt\GNAT\2021\bin\<a href="https://gcc.gnu.org/onlinedocs/gnat_ugn/Switches-for-gnatmake.html">gnatmake.exe</a> --version</b>
GNATMAKE Community 2021 (20210519-103)
Copyright (C) 1995-2021, Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/November 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[alr_cli]: https://alire.ada.dev/docs/#first-steps
[github_alire]: https://github.com/alire-project/alire
[gnatmake_cmd]: https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake
[gprbuild_cmd]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html