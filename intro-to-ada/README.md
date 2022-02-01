# <span id="top"><i>Introduction to Ada</i> Tutorial</span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;font-size:14px;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>intro-to-ada\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from <a href="https://www.adacore.com/">AdaCore</a>'s online tutorial <a href="https://learn.adacore.com/courses/intro-to-ada">Introduction to Ada</a>.
  </td>
  </tr>
</table>

## <span id="greet">`Greet`</span>

## <span id="week">`Week`</span>

This example consists of the 2 Ada source files [`Week.ads`](./Week/src/Week.ads) and [`Main.ads`](./Week/src/Main.adb).

We provide 2 ways to generate the `Week.exe` executable :
- run batch file [`build.bat`](./Week/build.bat) which calls the [`GNATmake`](gnu_gnatmake) tool.
- run the [GPR tools](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug.html) with the project file [`main.gpr`](./Week/main.gpr) <sup id="anchor_01">[1](#footnote_01)</sup>.

<pre style="font-size:80%;">
<b>&gt; <a href="./Week/build.bat">build</a> clean run</b>
First day of the week is Monday
&nbsp;
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean">gprclean</a> -q &amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line">gprbuild</a> -q &amp; target\Week.exe</b>
First day of the week is Monday
</pre>

> **:mag_right:** Option `-verbose` displays progress information :
> <pre style="font-size:80%;">
> <b>&gt; <a href="./Week/build.bat">build</a> -verbose clean run</b>
> Delete directory "target"
> Compile 2 Ada source files to object directory "target\obj"
> Execute program "Week.exe"
> First day of the week is Monday
> </pre>

## <span id="footnotes">Footnotes</span>

<span id="footnote_01">[1]</span> ***GNAT Project Files*** [↩](#anchor_01)

<dl><dd>
TODO: <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/gnat_project_manager.html#executable-file-names">Executable file names</a>.
</dd>
<dd>
Some project file examples :
<ul><li><a href="https://github.com/AdaCore/gprbuild"><code>AdaCore/gprbuild</code></a> project: <a href="https://github.com/AdaCore/gprbuild/blob/master/gprbuild.gpr"><code>gprbuild.gpr</code></a></li>
</ul>
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/February 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[gnu_gnatmake]: https://gcc.gnu.org/onlinedocs/gnat_ugn/Building-with-gnatmake.html
