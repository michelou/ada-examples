# <span id="top">Ada Quick Reference</span> <span style="size:25%;"><a href="README.md">↩</a></span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="./docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This document gathers <a href="https://www.adacore.com/" rel="external">Ada</a> hints and tips.
  </td>
  </tr>
</table>

## <span id="characteristics">Language Characteristics</span>

- Ada is a case-insensitive programming language.

## <span id="gnat_commands">GNAT Commands</span>

### <span id="gnatelim">**`gnatelim`**</span>

[`gnatelim`](https://www.cs.fsu.edu/~baker/ada/gnat/html/gnat_ugn_8.html#SEC98) tracks unused subprograms in an Ada program.

## <span id="subcommands">GPR Commands</span>

### <span id="gprbuild">**`gprbuild`**</span>

[`GPRbuild`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html) ...

### <span id="gprclean">**`GRPclean`**</span>

[`GPRclean`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean) removes the files created by [`GPRbuild`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html).

<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a></b>
using project file greetings.gpr
&lt;project_dir&gt;\target\obj\greetings.*
&lt;project_dir&gt;\target\obj\gmain.*
&lt;project_dir&gt;\target\<b>Greetings.exe</b>
&lt;project_dir&gt;\target\obj\b__gmain.*
</pre>

Command `GPRbuild -c` deletes only compiler-generated files (executables and libraries are untouched).
<pre style="font-size:80%;">
<b>&gt; <a href="https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#cleaning-up-with-gprclean" rel="external">gprclean</a> -c</b>
using project file greetings.gpr
&lt;project_dir&gt;\target\obj\greetings.*
&lt;project_dir&gt;\target\obj\gmain.*
&lt;project_dir&gt;\target\obj\b__gmain.*
</pre>

### <span id="grpinstall">GPRinstall</span>

[`GPRinstall`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#installing-with-gprinstall) ...

### <span id="gprls">GRPls</span>

[`GPRls`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#the-library-browser-gprls) ..

### <span id="gprname">GPRname</span>

[`GPRname`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#specifying-a-naming-scheme-with-gprname) ..

***

*[mics](https://lampwww.epfl.ch/~michelou/)/June 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->
