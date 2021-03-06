# <span id="top">Ada Examples</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from various websites - mostly from the <a href="https://www.adacore.com/" rel="external">AdaCore</a> project.
  </td>
  </tr>
</table>

## <span id="hello">`HelloWorld`</span>

This example contains the source file [`main.adb`](./HelloWorld/src/main/ada/main.adb), the project file [`build.gpr`](./HelloWorld/build.gpr) and the batch file [`build.bat`](./HelloWorld/build.bat).

<pre style="font-size:80%;">
<b>&gt; <a href="./HelloWorld/build.bat">build</a> -verbose clean run</b>
Compile 1 Ada source file to directory "target\obj"
Hello WORLD!
</pre>

<pre style="font-size:80%;">
<b>&gt; <a href="">gprclean</a>&amp; <a href="">gprbuild</a>&amp; target\HelloWorld.exe</b>
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

## <span id="greetings">`Greetings`</span>

*WIP*

<pre>
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean">gprclean</a> -q &amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line">gprbuild</a> -q &amp; target\Greetings.exe</b>
Hello WORLD!
Goodbye WORLD!
</pre>

## <span id="hangman">`Hangman`</span>[**&#x25B4;**](#top)

Subdirectory `hangman_1.0.0_be628ad5\` is created by command `alr get hangman` <sup id="anchor_01">[1](#footnote_01)</sup>; that command is run *only once* to obtain the `Hangman` executable project from the Alire repository.

<pre>
<b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/dir" rel="external">dir</a> /b &amp; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cd">cd</a> hang*</b>
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


## <span id="footnotes">Footnotes</span>

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
<span id="footnote_01">[1]</span> ***Alire*** [↩](#anchor_01)

<dl><dd>
We obtain the <code>Hangman</code> executable example with command <code><b>alr get</b></code>:
</dd>
<dd>
<pre>
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
We have to answer two questions when running command <code><b>alr run</b></code> for the first time, namely:
</dd>
<dd>
<pre>
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

*[mics](https://lampwww.epfl.ch/~michelou/)/July 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->
