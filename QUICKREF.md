# <span id="top">Ada Quick Reference</span> <span style="font-size:90%;">[↩](README.md#top)</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;"><a href="https://www.adacore.com/" rel="external"><img style="border:0;" src="./docs/images/adamascot.png" width="100" alt="Ada project"/></a></td>
  <td style="border:0;padding:0;vertical-align:text-top;">This document gathers <a href="https://www.adacore.com/" rel="external">Ada</a> hints and tips.
  </td>
  </tr>
</table>

## <span id="features">Language Features</span>

- Ada is a case-insensitive programming language.
- Ada type system uses name equivalence between types.
- Ada 2012 and newer supports [contract-based programming][feature_cohen].

## <span id="gnat_commands">GNAT Commands</span>

### <span id="gnatdoc">**`gnatedoc`**</span>

[`gnatdoc`](https://docs.adacore.com/live/wave/gps/html/gnatdoc-doc/gnatdoc.html) generates an HTML report in the gnatdoc directory of the object directory of the main project.

### <span id="gnatelim">**`gnatelim`**</span>

[`gnatelim`](https://www.cs.fsu.edu/~baker/ada/gnat/html/gnat_ugn_8.html#SEC98) tracks unused subprograms in an Ada program.

## <span id="subcommands">GPR Commands</span> [**&#x25B4;**](#top)

### <span id="gprbuild">**`GPRbuild`**</span>

[`GPRbuild`][gprbuild] is a multi-language build tool that manages the compilation, binding and linking phases.

GPRbuild requires a project file to be specified through the `-P` switch or to be looked for in the current directory.

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

### <span id="grpinstall">**`GPRinstall`**</span>

[`GPRinstall`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#installing-with-gprinstall) ...

### <span id="gprls">**`GRPls`**</span>

[`GPRls`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#the-library-browser-gprls) ..

### <span id="gprname">**`GPRname`**</span>

[`GPRname`](https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/companion_tools.html#specifying-a-naming-scheme-with-gprname) ..

***

*[mics](https://lampwww.epfl.ch/~michelou/)/June 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[feature_cohen]: https://blog.adacore.com/the-case-for-contracts
[gprbuild]: https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/building_with_gprbuild.html
