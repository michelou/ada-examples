
# <span id="top">Book <i>Beginning Ada Programming</i></span> <span style="size:25%;"><a href="../README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="../docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>shvets-examples\</code></strong> contains <a href="https://www.adacore.com/" rel="external">Ada</a> code examples coming from the book <a href="https://www.apress.com/9781484254271" rel="external"><i>Beginning Ada Programming</i></a> by Andrew Shvets (Apress, 2020).
  </td>
  </tr>
</table>

The code examples presented below can be built/run with the batch file [**`build.bat`**](./ch02/build.bat) (which calls [**`gnatmake.exe`**][gnatmake_cli]) or the build tool [**`gprbuild.exe`**][gprbuild_cli].

## <span id="ch02">Chapter 2: Basic Types</span>

This example consists of 7 source files [`basic_operations.adb`](./ch02/src/main/ada/basic_operations.adb), [`bool.adb`](./ch02/src/main/ada/bool.adb), [`floats_ranges.adb`](./ch02/src/main/ada/floats_ranges.adb), etc.

Batch file [**`build.bat`**](./ch02/build.bat) matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `bool.exe`.

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

Command [**`gprbuild.exe`**][gprbuild_cli] reads the build configuration from file [`build.gpr`](./ch02/build.gpr) and generates executable `bool.exe` :

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

This example consists of 5 source files [`for_loop.adb`](./ch03/src/main/ada/for_loop.adb), [`if_statement.adb`](./ch03/src/main/ada/if_statement.adb), [`infinite_loop.adb`](./ch03/src/main/ada/infinite_loop.adb), [`switch_statement.adb`](./ch03/src/main/ada/switch_statement.adb) and [`while_loop.adb`](./ch03/src/main/ada/while_loop.adb).

Batch file [**`build.bat`**](./ch03/build.bat) matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `if_statement.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="./ch03/build.bat">build</a> -verbose -main:if_statement clean run</b>
Delete directory "target"
Compile 5 Ada source files to directory "target\obj"
Execute program "target\.exe"
Int1 and Int2 are the same.
Int3 is between 4 and 200.
Int3 is not between 90 and 100.
</pre>

## <span id="ch04">Chapter 4: Procedures and Functions</span>

This example consists of 3 source files [`declare_block.adb`](./ch04/src/main/ada/declare_block.adb), [`functions_procedures.adb`](./ch04/src/main/ada/functions_procedures.adb) and [`max_recursion.adb`](./ch04/src/main/ada/max_recursion.adb).

Batch file [**`build.bat`**](./ch04/build.bat) matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `max_recursion.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="./ch04/build.bat">build</a> -verbose -main:max_recursion clean run</b>
Compile 3 Ada source files to directory "target\obj"
Execute program "target\max_recursion.exe"
 Maximum number of tries:  1
</pre>

## <span id="ch05">Chapter 5: Arrays, Records and Access Types</span>

This example consists of 8 source files [`access_type_example.adb`](./ch05/src/main/ada/access_type_example.adb), [`complex_array.adb`](./ch05/src/main/ada/complex_array.adb) and [`dynamic_alloc_array.adb`](./ch05/src/main/ada/dynamic_alloc_array.adb), etc.

Batch file [**`build.bat`**](./ch05/build.bat) matches what the user would run from the command prompt (use option `-debug` to see the execution details), i.e. it calls the [**`gnatmake.exe`**][gnatmake_cli] build tool to generate executable `records_array.exe`.

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

*[mics](https://lampwww.epfl.ch/~michelou/)/January 2024* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[gnatmake_cli]: https://docs.adacore.com/gnat_ugn-docs/html/gnat_ugn/gnat_ugn/building_executable_programs_with_gnat.html#the-gnat-make-program-gnatmake
[gprbuild_cli]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html#command-line
