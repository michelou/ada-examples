# <span id="top"><i>Introduction to Ada</i> Tutorial</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>intro-to-ada\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from <a href="https://www.adacore.com/" rel="external">AdaCore</a>'s online tutorial <a href="https://learn.adacore.com/courses/intro-to-ada" rel="external">Introduction to Ada</a>.
  </td>
  </tr>
</table>

Code examples presented in this document can be built in two ways :
- the batch file [`build.bat`](./Week/build.bat) calls the [`GNATmake`][gnu_gnatmake] build tool (try option `-help` to display other features)
- the [GPR tools][gpr_tools] &ndash; e.g. [**`gprclean`**][gprclean_cli] and [**`gprbuild`**][gprbuild_cli] &ndash; get their build information from the project file [`main.gpr`](./Week/main.gpr) <sup id="anchor_01">[1](#footnote_01)</sup>.

## <span id="forward_declaration">`forward_declaration` Example</span>

Code example [`forward_declaration`](./ch03/forward_declaration/) consists of
- the source file [`mutually_recursive_subprograms.adb`](./ch03/forward_declaration/src/main/ada/mutually_recursive_subprograms.adb)
- the project file [`build.gpr`](./ch03/forward_declaration/build.gpr) and
- the batch file [`build.bat`](./ch03/forward_declaration/build.bat).

We can build/execute this project as follows :

<pre style="font-size:80%;">
<b>&gt; <a href="./ch03/forward_declaration/build.bat">build</a> clean run</b>
</pre>

## <span id="book">`Book` Example</span> [**&#x25B4;**](#top)

Code example [`Book`](./ch04/Book/) consists of
- the five source files [`book.ads`](./ch04/Book/src/main/ada/book.ads), [`book.adb`](./ch04/Book/src/main/ada/book.adb), [`book-additional_operations.ads`](./ch04/Book/src/main/ada/book-additional_operations.ads), [`book-additional_operations.adb`](./ch04/Book/src/main/ada/book-additional_operations.adb) and [`main.adb`](./ch04/Book/src/main/ada/main.adb).
- the project file [`build.gpr`](./ch04/Book/build.gpr) and
- the batch file [`build.bat`](./ch04/Book/build.bat).

<pre style="font-size:80%;">
<b>&gt; <a href="./ch04/Book/build.bat">build</a> clean run</b>
Book Title: Visible for my children
Book Author: Author not visible for my children
&nbsp;
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean">gprclean</a> -q &amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line">gprbuild</a> -q &amp; target\Book.exe</b>
Book Title: Visible for my children
Book Author: Author not visible for my children
</pre>

## <span id="week">`Week` Example</span>

Code example [`Week`](./ch04/Week/) consists of
- the two source files [`Week.ads`](./ch04/Week/src/Week.ads) and [`Main.adb`](./ch04/Week/src/Main.adb),
- the project file [`build.gpr`](./ch04/Week/build.gpr) and
- the batch file [`build.bat`](./ch04/Week/build.bat).

We can build/execute this project as follows :

<pre style="font-size:80%;">
<b>&gt; <a href="./ch04/Week/build.bat">build</a> clean run</b>
First day of the week is Monday
&nbsp;
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean">gprclean</a> -q &amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line">gprbuild</a> -q &amp; target\Week.exe</b>
First day of the week is Monday
</pre>

> **:mag_right:** Use option `-verbose` to display progress information :
> <pre style="font-size:80%;">
> <b>&gt; <a href="./ch04/Week/build.bat">build</a> -verbose clean run</b>
> Delete directory "target"
> Compile 2 Ada source files to object directory "target\obj"
> Execute program "Week.exe"
> First day of the week is Monday
> </pre>
> and use option `-debug` to see further build details such as the arguments passed to the executed commands.

## <span id="enumeration">`Enumeration` Example</span> [**&#x25B4;**](#top)

Code example [`Enumeration`](./ch05/Enumeration/) consists of
- the source file [`enumeration_example.adb`](./ch05/Enumeration/src/main/ada/enumeration_example.adb),
- the project file [`build.gpr`](./ch05/Enumeration/build.gpr) and
- the batch file [`build.bat`](./ch05/Enumeration/build.bat).

## <span id="greet">`Greet` Example</span>

We can build/execute this code example as follows (source file [`Greet.adb`](./ch07/Greet/src/main/ada/Greet.adb), project file [`build.gpr`](./ch07/Greet/build.gpr)) :

<pre style="font-size:80%;">
<b>&gt; <a href="./ch07/Greet/build.bat">build</a> -verbose run</b>
Compile 1 Ada source files to object directory "target\obj"
Execute program "Greet.exe"
 2 3 5 7 11
&nbsp;
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug.html" rel="external">gprbuild</a> &amp; target\Greet.exe</b>
using project file main.gpr
Compile
   [Ada]          greet.adb
greet.adb:11:04: warning: "Arr" is not modified, could be declared constant [-gnatwk]
Bind
   [gprbind]      greet.bexch
   [Ada]          greet.ali
Link
   [link]         greet.adb
 2 3 5 7 11
</pre>

<!--========================================================================-->

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***GNAT Project Files*** [↩](#anchor_01)

<dl><dd>
TODO: <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/gnat_project_manager.html#executable-file-names">Executable file names</a>.
</dd>
<dd>
Some project file examples :
<ul><li><a href="https://github.com/AdaCore/gprbuild"><code>AdaCore/gprbuild</code></a> project: <a href="https://github.com/AdaCore/gprbuild/blob/master/gprbuild.gpr"><code>gprbuild.gpr</code></a></li>
</ul>
</dd></dl>

<span id="footnote_02">[2]</span> ***GNAT Warnings*** [↩](#anchor_02)

<dl><dd>
With all <a href="https://gcc.gnu.org/onlinedocs/gnat_ugn/Warning-Message-Control.html" rel="external">GNAT warnings</a> activated, it becomes even harder to ignore the result of a function, because unused variables will be flagged. We then have two solutions to silence this warning:
<ul>
<li>Either we annotate the variable with <a href="https://docs.adacore.com/gnat_rm-docs/html/gnat_rm/gnat_rm/implementation_defined_pragmas.html#pragma-unreferenced" rel="external"><code><b>pragma</b> Unreferenced</code></a>, e.g.:
<pre style="font-size:80%;">
B : Boolean := Read_Int (Stream, My_Int);
<b>pragma</b> Unreferenced (B);
</pre></li>
<li>Or we give the variable a name that contains any of the strings <code>discard</code>, <code>dummy</code>, <code>ignore</code>, <code>junk</code> or <code>unused</code> (case insensitive).</li>
</ul>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/October 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[gnu_gnatmake]: https://gcc.gnu.org/onlinedocs/gnat_ugn/Building-with-gnatmake.html
[gpr_tools]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug.html
[gprbuild_cli]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html
[gprclean_cli]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean
