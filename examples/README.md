# <span id="top">Ada Examples</span> <span style="font-size:90%;">[↩](../README.md#top)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from various websites - mostly from the <a href="https://www.adacore.com/" rel="external">AdaCore</a> project.
  </td>
  </tr>
</table>

We support the following build tools :

| Build&nbsp;tool | Build&nbsp;file |
|:----------------|:----------------|
| [**`gnatmake.exe`**][gnatmake_cmd] <sup id="anchor_01">[1](#footnote_01)</sup> | &ndash; |
| [**`gprbuild.exe`**][gprbuild_cmd] | [`build.gpr`](./HelloWorld/build.gpr) |

## <span id="browser">`Browser` Example</span>

This example comes from the blog post ["Opening a web page using default browser with Ada on Windows"](https://ada.tips/opening-a-web-page-using-default-browser-with-ada-on-windows.html) ([Ada Tips](https://ada.tips/)); it has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./Browser/00download.txt">00download.txt</a>
|   <a href="./Browser/build.bat">build.bat</a>
|   <a href="./Browser/build.gpr">build.gpr</a>
|   <a href="./Browser/build.sh">build.sh</a>
|   <a href="./Browser/Makefile">Makefile</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>ada</b>
                <a href="./Browser/src/main/ada/Browser.adb">Browser.adb</a>
</pre>

<!--=======================================================================-->

## <span id="dining_philosophers">`DiningPhilosophers` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./DiningPhilosophers/00download.txt">00download.txt</a>
|   <a href="./DiningPhilosophers/build.bat">build.bat</a>
|   <a href="./DiningPhilosophers/build.gpr">build.gpr</a>
|   <a href="./DiningPhilosophers/build.sh">build.sh</a>
|   <a href="./DiningPhilosophers/Makefile">Makefile</a>
\---<b>src</b>
    \---main
        \---<b>ada</b>
                <a href="./DiningPhilosophers/src/main/ada/test_dining_philosophers.adb">test_dining_philosophers.adb</a>
</pre>

Command [**`build`**](./DiningPhilosophers/build.bat)`-verbose run` generates and runs executable `target\DiningPhilosophers.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="./DiningPhilosophers/build.bat">build</a> -verbose run</b>
Compile 1 Ada source file to directory "target\obj"
Execute program "target\DiningPhilosophers.exe"
SPINOZA is thinking
KANT is thinking
ARISTOTLE is thinking
[...]
ARISTOTLE is hungry
ARISTOTLE is eating
ARISTOTLE is leaving
</pre>

We get the same output with command [`grpbuild`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a>& <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html" rel="external">gprbuild</a>& target\DiningPhilosophers.exe</b>
using project file build.gpr
using project file build.gpr
Compile
   [Ada]          test_dining_philosophers.adb
Bind
   [gprbind]      test_dining_philosophers.bexch
   [Ada]          test_dining_philosophers.ali
Link
   [link]         test_dining_philosophers.adb
SPINOZA is thinking
ARISTOTLE is thinking
KANT is thinking
[...]
ARISTOTLE is hungry
ARISTOTLE is eating
ARISTOTLE is leaving
</pre>

## <span id="hello">`HelloWorld` Example</span> [**&#x25B4;**](#top)

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./HelloWorld/build.bat">build.bat</a>
|   <a href="./HelloWorld/build.gpr">build.gpr</a>
|   <a href="./HelloWorld/build.sh">build.sh</a>
|   <a href="./HelloWorld/Makefile">Makefile</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>ada</b>
                <a href="./HelloWorld/src/main/ada/main.adb">main.adb</a>
</pre>

Command [`build.bat`](./HelloWorld/build.bat) generates and runs the executable `target\HelloWorld.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="./HelloWorld/build.bat">build</a> -verbose clean run</b>
Compile 1 Ada source file to directory "target\obj"
Hello WORLD!
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a>&amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html" rel="external">gprbuild</a>&amp; target\HelloWorld.exe</b>
using project file build.gpr
using project file build.gpr
Compile
   [Ada]          main.adb
Bind
   [gprbind]      main.bexch
   [Ada]          main.ali
Link
   [link]         main.adb
Hello WORLD!
</pre>

## <span id="greetings">`Greetings` Example</span> [**&#x25B4;**](#top)

This example has the following directory structure : 

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./Greetings/build.bat">build.bat</a>
|   <a href="./Greetings/build.gpr">build.gpr</a>
|   <a href="./Greetings/build.sh">build.sh</a>
|   <a href="./Greetings/Makefile">Makefile</a>
\---src
        <a href="./Greetings/src/gmain.adb">gmain.adb</a>
        <a href="./Greetings/src/greetings.adb">greetings.adb</a>
        <a href="./Greetings/src/greetings.ads">greetings.ads</a>
</pre>

Command [`build.bat`](./Greetings/build.bat) generates and runs the executable `target\Greetings.exe`. 

<pre style="font-size:80%;">
<b>&gt; <a href="./Greetings/build.bat">build</a> -verbose run</b>
Compile 3 Ada source files to directory "target\obj"
Hello WORLD!
Goodbye WORLD!
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean">gprclean</a> -q &amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line">gprbuild</a> -q &amp; target\Greetings.exe</b>
Hello WORLD!
Goodbye WORLD!
</pre>

## <span id="hangman">`Hangman` Example</span> [**&#x25B4;**](#top)

Subdirectory `hangman_1.0.0_be628ad5\` is created by command [`alr`](https://alire.ada.dev/docs/#first-steps)` get hangman` <sup id="anchor_02">[2](#footnote_02)</sup>; that command is run *only once* to obtain the `Hangman` executable project from the [Alire][github_alire] repository.

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/dir" rel="external">dir</a> /b &amp; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cd" rel="external">cd</a> hang*</b>
hangman_1.0.0_be628ad5
00download.txt
&nbsp;
<b>&gt; <a href="https://alire.ada.dev/docs/#first-steps">alr</a> run</b>
Compile
   [Ada]          hangmain.adb
hangmain.adb:24:09: warning: variable "totalcount" is assigned but never read
   [Ada]          hangman.adb
hangman.adb:4:06: warning: redundant with clause in body
hangman.adb:4:29: warning: "Unbounded" is already use-visible through previous use_clause at hangman.ads:2
hangman.adb:5:06: warning: redundant with clause
hangman.adb:5:34: warning: "Integer_Text_IO" is already use-visible through previous use_clause at line 2
hangman.adb:6:06: warning: redundant with clause
hangman.adb:7:08: warning: "Integer_Text_IO" is already use-visible through previous use_clause at line 5
Bind
   [gprbind]      hangmain.bexch
   [Ada]          hangmain.ali
Link
   [link]         hangmain.adb
***** W E L C O M E  T O  H A N G M A N  *****
 By: Jon Hollan, Mark Hoffman, & Brandon Ball

******************
     _ _ _ _     *
    |      |     *
    |            *
    |            *
    |            *
    |            *
    |            *
    |            *
 --------        *
******************

-------------
Guesses:
Enter Guess: a
Good Guess!

[...]

******************
     _ _ _ _     *
    |      |     *
    |    \ O /   *
    |     \|/    *
    |      |     *
    |            *
    |            *
    |            *
 --------        *
******************

-randchildren
Guesses: a  c  h  i  e  r  t  s  p  n  o  l  d
Enter Guess: g
Good Guess!

Congratulations! YOU WON!
The correct word was grandchildren
Would you like to play again? y/n: n
</pre>

<!--=======================================================================-->

## <span id="separate_procedure">`SeparateProcedure` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./SeparateProcedure/00download.txt">00download.txt</a>
|   <a href="./SeparateProcedure/build.bat">build.bat</a>
\---src
    \---main
        \---<b>ada</b>
                <a href="./SeparateProcedure/src/main/ada/main.adb">main.adb</a>
                <a href="./SeparateProcedure/src/main/ada/package_x-sep.adb">package_x-sep.adb</a>
                <a href="./SeparateProcedure/src/main/ada/package_x.adb">package_x.adb</a>
                <a href="./SeparateProcedure/src/main/ada/package_x.ads">package_x.ads</a>
</pre>

Command [`build.bat`](./SeparateProcedure/build.bat)`-verbose clean run` generates and executes the Ada program `target\SeparateProcedure.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="./SeparateProcedure/build.bat">build</a> -verbose clean run</b>
Delete directory "target"
Compile 4 Ada source files to directory "target\obj"
Execute Ada program "target\SeparateProcedure.exe"
Foo
Sep
</pre>

<!--=======================================================================-->

## <span id="timing_fibonacci">`TimingFibonacci` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree">tree</a> /a /f . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr">findstr</a> /v /b [A-Z]</b>
|   <a href="./TimingFibonacci/00download.txt">00download.txt</a>
|   <a href="./TimingFibonacci/build.bat">build.bat</a>
|   <a href="./TimingFibonacci/build.gpr">build.gpr</a>
|   <a href="./TimingFibonacci/build.sh">build.sh</a>
|   <a href="./TimingFibonacci/Makefile">Makefile</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>ada</b>
                <a href="./TimingFibonacci/src/main/ada/main.adb">main.adb</a>
</pre>

Command [**`build.bat`**](./TimingFibonacci/build.bat) generates and runs executable `target\TimingFibonacci.exe` : 

<pre style="font-size:80%;">
<b>&gt; <a href="./TimingFibonacci/build.baT">build</a> -verbose clean run</b>
Compile 1 Ada source file to directory "target\obj"
Execute program "target\TimingFibonacci.exe"
Fibonacci number:
23
Result:  28657
Execution time =  0.552800000 milliseconds.
</pre>

<!--=======================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<!--
<span id="footnote_01">[1]</span> ***GNAT Project Files*** [↩](#anchor_01)

<dl><dd>
TODO: <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/gnat_project_manager.html#executable-file-names">Executable file names</a>.
</dd>
<dd>
Some project file examples :
<ul><li><a href="https://github.com/AdaCore/gprbuild"><code>AdaCore/gprbuild</code></a> project: <a href="https://github.com/AdaCore/gprbuild/blob/master/gprbuild.gpr"><code>gprbuild.grp</code></a></li>
</ul>
</dd></dl>
-->
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

<span id="footnote_02">[2]</span> ***Alire*** [↩](#anchor_02)

<dl><dd>
We obtain the <code>Hangman</code> executable example with command <code><b><a href="https://alire.ada.dev/docs/#first-steps" rel="external">alr</a> get</b></code>:
</dd>
<dd>
<pre style="font-size:80%;">
<b>&gt; <a href="https://alire.ada.dev/docs/#first-steps">alr</a> get hangman</b>
Cloning into '%USERPROFILE%\.config\alire\indexes\community\repo'...
remote: Enumerating objects: 6559, done.
remote: Counting objects: 100% (1033/1033), done.
remote: Compressing objects: 100% (367/367), done.
remote: Total 6559 (delta 871), reused 693 (delta 657), pack-reused 5526
Receiving objects: 100% (6559/6559), 1.05 MiB | 1.32 MiB/s, done.
Resolving deltas: 100% (3746/3746), done.
Note: Deploying release hangman=1.0.0...
-#O=#   #     #
&nbsp;
hangman=1.0.0 successfully retrieved.
There are no dependencies.
</pre>
</dd>
<dd>
We have to answer two questions when running command <code><b><a href="https://alire.ada.dev/docs/#first-steps" rel="external">alr</a> run</b></code> for the first time, namely:
</dd>
<dd>
<pre style="font-size:80%;">
<b>&gt; <a href="https://alire.ada.dev/docs/#first-steps">alr</a> run</b>
Welcome to the toolchain selection assistant
&nbsp;
In this assistant you can set up the default toolchain to be used with any crate
that does not specify its own top-level dependency on a version of gnat or
gprbuild.
&nbsp;
If you choose "None", Alire will use whatever version is found in the
environment.
&nbsp;
Note: gnat is currently not configured. (alr will use the version found in the environment.)
&nbsp;
Please select the gnat version for use with this configuration
  1. gnat_native=11.2.4
  2. None
  3. gnat_external=11.3.0 [Detected at C:\opt\msys64\mingw64\bin\gnat.exe]
  4. gnat_arm_elf=11.2.4
  5. gnat_avr_elf=11.2.4
  6. gnat_riscv64_elf=11.2.4
  7. gnat_arm_elf=11.2.3
  8. gnat_native=11.2.3
  9. gnat_riscv64_elf=11.2.3
  0. gnat_arm_elf=11.2.2
  a. (See more choices...)
Enter your choice index (first is default):
> 3
Note: Selected tool version gnat_external=11.3.0
&nbsp;
Note: Choices for the following tool are narrowed down to releases compatible with just selected gnat_external=11.3.0
&nbsp;
Note: gprbuild is currently not configured. (alr will use the version found in the environment.)
&nbsp;
Please select the gprbuild version for use with this configuration
  1. gprbuild=2021.0.0 [Detected at C:\opt\GNAT\2021\bin\gprbuild.exe]
  2. None
Enter your choice index (first is default):
> 1
Note: Selected tool version gprbuild=2021.0.0
Setup
   [mkdir]        object directory for project Hangman
   [mkdir]        exec directory for project Hangman
</pre>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/December 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[alr_cli]: https://alire.ada.dev/docs/#first-steps
[github_alire]: https://github.com/alire-project/alire
<!--
[gnatmake_cmd]: https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gnat_ugn/Running-gnatmake.html
-->
[gnatmake_cmd]: https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake
[gprbuild_cmd]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html
[windres_cmd]: https://man7.org/linux/man-pages/man1/windres.1.html
