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

<pre>
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean">gprclean</a> -q &amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line">gprbuild</a> -q &amp; target\Greetings.exe</b>
Hello WORLD!
Goodbye WORLD!
</pre>

<!--
## <span id="footnotes">Footnotes</span>

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

***

*[mics](https://lampwww.epfl.ch/~michelou/)/April 2022* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->
