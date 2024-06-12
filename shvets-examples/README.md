
# <span id="top">Book <i>Beginning Ada Programming</i></span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>shvets-examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from the book <a href="https://www.apress.com/9781484254271" rel="external"><i>Beginning Ada Programming</i></a> by Andrew Shvets (Apress, 2020).</td>
  </tr>
</table>

The code examples presented below can be built/run with the batch file [**`build.bat`**](./ch02/build.bat) (which calls [**`gnatmake.exe`**][gnatmake_cli]) or the build tool [**`gprbuild.exe`**][gprbuild_cli].

## <span id="ch02">Chapter 2: Basic Types</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./ch02/build.bat">build.bat</a>
|   <a href="./ch02/build.gpr">build.gpr</a>
|   <a href="./ch02/build.sh">build.sh</a>
\---src
    \---main
        \---ada
                <a href="./ch02/src/main/ada/basic_operations.adb">basic_operations.adb</a>
                <a href="./ch02/src/main/ada/basic_types_ranges.adb">basic_types_ranges.adb</a>
                <a href="./ch02/src/main/ada/bool.adb">bool.adb</a>
                <a href="./ch02/src/main/ada/floats_ranges.adb">floats_ranges.adb</a>
                <a href="./ch02/src/main/ada/longer_ranges.adb">longer_integers.adb</a>
                <a href="./ch02/src/main/ada/strings_example.adb">strings_example.adb</a>
                <a href="./ch02/src/main/ada/unbounded_strings.adb">unbounded_strings.adb</a>
</pre>

Command [**`build.bat`**](./ch02/build.bat)`clean run` matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `target\bool.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="ch02/build.bat">build</a> -verbose clean run</b>
Delete directory "target"
Compile 7 Ada source files to directory "target\obj"
Execute program "target\bool.exe"
 Bool1: TRUE
 Bool2: FALSE
 Bool3: TRUE
 Bool4: TRUE
 Bool5: FALSE
 Bool6: TRUE
 Bool7: FALSE
 Bool8: TRUE
</pre>

> **:mag_right:** We can specify another main name with option `-main:<name>`, e.g.
> <pre style="font-size:80%;">
> <b>&gt; <a href="ch02/build.bat">build</a> -verbose -main:floats_ranges clean run</b>
> Delete directory "target"
> Compile 7 Ada source files to directory "target\obj"
> Execute program "target\floats_ranges.exe"
> The min range of a float [-3.40282E+38] and the max range of a float [ 3.40282E+38].
> The total of the two sums:  1.48200E+02
> 148.20000
> </pre>

Command [**`gprbuild.exe`**][gprbuild_cli] reads the build configuration from file [`build.gpr`](./ch02/build.gpr) and generates executable `target\bool.exe` :

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a>&amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line" rel="external">gprbuild</a>&amp; target\bool.exe</b>
using project file build.gpr
using project file build.gpr
Compile
   [Ada]          bool.adb
Bind
   [gprbind]      bool.bexch
   [Ada]          bool.ali
Link
   [link]         bool.adb
 Bool1: TRUE
 Bool2: FALSE
 Bool3: TRUE
 Bool4: TRUE
 Bool5: FALSE
 Bool6: TRUE
 Bool7: FALSE
 Bool8: TRUE
</pre>

> **:mag_right:** We can specify another main name with the `MAIN` environment variable, e.g.`set MAIN=floats_ranges`:
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/set_1" rel="external">set</a> MAIN=floats_ranges&amp; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a>&amp; gprbuild&amp; target\floats_ranges.exe&amp; set MAIN=</b>
> using project file build.gpr
> using project file build.gpr
> Compile
>    [Ada]          floats_ranges.adb
> Bind
>    [gprbind]      floats_ranges.bexch
>    [Ada]          floats_ranges.ali
> Link
>    [link]         floats_ranges.adb
> The min range of a float [-3.40282E+38] and the max range of a float [ 3.40282E+38].
> The total of the two sums:  1.48200E+02
> 148.20000
> </pre>

## <span id="ch03">Chapter 3: Basic Control Structures</span>[**&#x25B4;**](#top)

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./ch03/build.bat">build.bat</a>
|   <a href="./ch03/build.gpr">build.gpr</a>
|   <a href="./ch03/build.sh">build.sh</a>
\---src
    \---main
        \---ada
                <a href="./ch03/src/main/ada/for_loop.adb">for_loop.adb</a>
                <a href="./ch03/src/main/ada/if_statement.adb">if_statement.adb</a>
                <a href="./ch03/src/main/ada/infinite_loop.adb">infinite_loop.adb</a>
                <a href="./ch03/src/main/ada/switch_statement.adb">switch_statement.adb</a>
                <a href="./ch03/src/main/ada/while_loop.adb">while_loop.adb</a>
</pre>

Command [**`build.bat`**](./ch03/build.bat)`clean run` matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `target\if_statement.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="./ch03/build.bat">build</a> -verbose -main:if_statement clean run</b>
Delete directory "target"
Compile 5 Ada source files to directory "target\obj"
Execute program "target\if_statement.exe"
Int1 and Int2 are the same.
Int3 is between 4 and 200.
Int3 is not between 90 and 100.
</pre>

## <span id="ch04">Chapter 4: Procedures and Functions</span>[**&#x25B4;**](#top)

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./ch04/build.bat">build.bat</a>
|   <a href="./ch04/build.gpr">build.gpr</a>
|   <a href="./ch04/build.sh">build.sh</a>
\---src
    \---main
        \---ada
                <a href="./ch04/src/main/ada/declare_block.adb">declare_block.adb</a>
                <a href="./ch04/src/main/ada/functions_procedures.adb">functions_procedures.adb</a>
                <a href="./ch04/src/main/ada/max_recursion.adb">max_recursion.adb</a>
</pre>

Command [**`build.bat`**](./ch04/build.bat)`clean run` matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `target\max_recursion.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="./ch04/build.bat">build</a> -verbose -main:max_recursion clean run</b>
Compile 3 Ada source files to directory "target\obj"
Execute program "target\max_recursion.exe"
 Maximum number of tries:  1
</pre>

## <span id="ch05">Chapter 5: Arrays, Records and Access Types</span>

This example has the following directory structure :

<pre style="font-size:80%;">
|   <a href="./ch05/build.bat">build.bat</a>
|   <a href="./ch05/build.gpr">build.gpr</a>
|   <a href="./ch05/build.sh">build.sh</a>
\---src
    \---main
        \---ada
                <a href="./ch05/src/main/ada/access_type_example.adb">access_type_example.adb</a>
                <a href="./ch05/src/main/ada/complex_array.adb">complex_array.adb</a>
                <a href="./ch05/src/main/ada/dynamic_alloc_array.adb">dynamic_alloc_array.adb</a>
                <a href="./ch05/src/main/ada/records_array.adb">records_array.adb</a>
                <a href="./ch05/src/main/ada/records_example.adb">records_example.adb</a>
                <a href="./ch05/src/main/ada/simple_array.adb">simple_array.adb</a>
                <a href="./ch05/src/main/ada/simple_records.adb">simple_records.adb</a>
                <a href="./ch05/src/main/ada/string_array.adb">string_array.adb</a>
</pre>

Command [**`build.bat`**](./ch05/build.bat)`clean run` matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `target\records_array.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="./ch05/build.bat">build</a> -verbose -main:records_array clean run</b>
Delete directory "target"
Compile 8 Ada source files to directory "target\obj"
Execute program "target\records_array.exe"
 Bird name: Canadian Goose
  Average weight:    7.500
  Average wingspan: 160.00
  Migrating bird:    TRUE

 Bird name: Sparrow
  Average weight:    0.030
  Average wingspan:  0.15
  Migrating bird:    FALSE

 Bird name: Finch
  Average weight:    0.047
  Average wingspan:  0.17
  Migrating bird:    FALSE
</pre>

<!--
## <span id="footnotes">Footnotes</span>

<span id="footnote_01">[1]</span> ***GNAT Project Files*** [↩](#anchor_01)

<dl><dd>
</dd></dl>
-->

***

*[mics](https://lampwww.epfl.ch/~michelou/)/June 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[gnatmake_cli]: https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake
[gprbuild_cli]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line
