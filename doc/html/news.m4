m4_include(gbetastd.m4)m4_dnl
begin_page(News)

<dl>

<dt>December 2003</dt>
<dd>Released _gbeta version 0.9.5.</dd>

<dt>November 2003</dt>
<dd>Various debugging and other preparations for new release.</dd>

<dt>October 2003</dt>
<dd>Still more work on nested temporaries (debugging, filling in
    missing pieces in the implementation).  Changed the syntax of
    <code>when</code> statements, such that the target is more
    flexible (a <code>when</code> statement is a thread-safe version
    of <code>if&nbsp;(x&nbsp;instanceof&nbsp;C)&nbsp;{..}</code>) in
    Java.  Added option on the <code>print</code> debugging command to
    avoid showing pattern attributes (so only instance variables are
    shown) when printing objects.</dd>

<dt>September 2003</dt>
<dd>Continued work on the nested temporaries&mdash;several designs
    considered, implemented, investigated, rejected.  Finally an
    approach that worked: Every entity in the static analysis which
    has an <code>originPath</code> (i.e., a description of how to find
    its enclosing part object), is now also able to have an
    <code>effectiveOriginPath</code> (which is another way to reach
    the enclosing part object).  The effective origin path is present
    only if the normal origin path starts in a temporary object.  Many
    changes were needed to create and maintain the effective origin
    paths where needed.  Improved the readability of debugging command
    printout when printing objects (now shows declared names
    associated with each mixin where possible).</dd>

<dt>August 2003</dt>
<dd>Started working on the treatment of temporaries (having discovered
    that there are ways to create so many temporary objects nested in
    each other that the static analysis looses track of the
    non-temporary enclosing objects, hence it complains about type
    safe constructs thinking that the involved patterns are nested in
    different temporaries, when they are actually, e.g., global).
    This problem was probably the most complex static analysis problem
    since 1997, and it required a lot of thinking, redesign of
    entities used in static analysis, and some code reorganization.
    Note, however, that it only caused incorrect rejection of some
    programs using complex networks of temporary objects, and in
    particular it did not cause soundness problems.  Other things:
    Renamed the debugging commands <code>goinhere</code> and
    <code>ungoinhere</code> to <code>skip</code> and
    <code>unskip</code>, and simplified their semantics.  Improved
    readability output from debugging commands used to print the value
    or the type of an expression.</dd>

<dt>June-July 2003</dt>
<dd>Reorganized the connection between entities used in static
    analysis and their analysis context, thus making it more unlikely
    that inconsistencies are introduced.  This required changing a
    large number of files, because the argument lists of many methods
    were changed.  Introduced the notion of constrained virtuals (the
    ability to specify upper/lower/equality bounds for virtuals in
    patterns used as types, in a structural manner).  This affected
    the syntax and semantics of a large number of constructs, hence
    cause widespread changes in the implementation.  Especially deep
    changes were needed in the comparison of patterns (i.e., methods
    like <code>less</code> and <code>greater</code> on objects
    representing patterns in static analysis).  Changed several
    printout routines such that debugging printouts and error messages
    have become more compact and readable.  Fixed several bugs in the
    static analysis (causing overly pessimistic typing results, such
    that some correct programs were considered unsafe).  Cleaned up
    various <code>print</code> methods, removing some redundancy.
    Fixed bug in the <code>print</code> debugging command (couldn't
    print NONE).</dd>

<dt>Spring 2003</dt>
<dd>Added debugging command <code>goinhere</code> (meaning: do not
    single-step here, just run), as well as commands to remove such
    annotations, and to show the currently active ones.  </dd>

<dt>November-December 2002</dt>
<dd>Corrected and improved on the coercion mechanism which was added
    recently (and now it actually works! :-).</dd>

<dt>September-October 2002</dt>
<dd>Added <code>entering</code> and <code>exiting</code> primitives, thus
    making it possible for a method to detect whether or not arguments
    were given, and whether or not results are returned.  Added
    support for user-specified coercion modes (namely, that a
    mutable/immutable declaration of an object/pattern specifies
    whether it should be evaluated/assigned by-value, by-reference, or
    by-pattern; the effect is that expressions like <code>x[]</code>
    which are very common in BETA may now be expressed as
    <code>x</code> almost everywhere).  Added simplified
    <code>this</code> expressions to the grammar
    (<code>this(P)[]</code> may now be written as <code>this[]</code>
    when <code>P</code> selects the nearest enclosing object).</dd>

<dt>August 2002</dt>
<dd>Changed the treatment of some static analysis entities used to
    describe objects and patterns such that they are strictly changed
    in a copy-on-modify manner (changes in about 40 files were needed
    for this, especially because many methods had their argument list
    changed).  Removed the special syntax for multiple inheritance,
    and changed the pattern merging scope rules such that this syntax
    is not needed (the new scope rules are similar to the rules about
    the old multiple inheritance construct, and the old scope rules
    for simple pattern merging were probably never the desired choice,
    and there are still various ways to adjust scope resolution when
    needed).  Added "artificial" syntax nodes to represent lists and
    similar constructs, such that all pieces of syntax may be treated
    as syntax nodes (so we can print them, etc).  Introduced fresh
    construction rather than reuse of objects describing pre-defined
    entities (e.g., the pattern <code>object</code>), thus removing
    some bugs where these entities did not describe their context
    correctly (these bugs have been around for a long time, but they
    have only emerged recently because of the intensified checking).
    Improved formatting of error messages from static analysis and
    from the virtual machine at run-time.  Fixed a bug in the analysis
    of virtual static items (caused usage of a wrong context when
    checking a final static item).  Fixed a bug in abstract syntax
    traversal routines (which would sometimes ignore pre/post actions
    for the prefix of an object descriptor), and another one related
    to finding the virtual declaration (if any) of an object
    descriptor.  Fixed several bugs in static analysis where the
    context was not computed correctly.  Improved checking of
    qualified attribute denotations (e.g., <code>x(:p:)</code>, which
    is an up-cast of the expression <code>x</code> to the pattern
    <code>p</code>).</dd>

<dt>July 2002</dt>
<dd>Finally decided that allowing sibling mixins would make the notion
    of virtual patterns ill-defined, and there does not seem to be a
    good way to save them.  Hence, the hideously complex sibling
    adventure is hereby dropped in the trash can of history, and a lot
    of changes are made to revert the source code to a state from
    before siblings were introduced, without deleting all the other
    improvements and bug fixes made in the mean time.  Also fixed some
    newly discovered bugs where the context used to describe the
    enclosing object during static analysis was wrong (this
    immediately leads to an exception so it is not hard to discover,
    but the test programs causing the error to occur are new).</dd>

<dt>June 2002</dt>
<dd>Still fighting with sibling mixins.</dd>

<dt>May 2002</dt>
<dd>Changed the '<code>option</code>' debugging command to match the
    format used on the command line more closely, and to support
    giving long options (such as <code>--interactive</code>).  Fixed a
    bug in the traversal of run-time paths (a normal part object was
    assumed where in some cases it would actually be a for-statement
    object, causing a dynamic cast to fail).  Fixed a bug related to a
    <code>chk_none</code> instruction (i.e., a bytecode instruction
    used to check that an object reference is not null): the check was
    made on the object reference stack, but the object was actually on
    the temporary stack.  Improved final Emacs oriented comments in
    all source files, such that compilation will work for
    installations anywhere (it used to work in
    <code>$HOME/gbeta-0.9</code> only).</dd>

<dt>April 2002</dt>
<dd>Changed many things, including the treatment of the statically
    known number of steps in a run-time UP/DOWN step, because of
    assumptions that do not hold when siblings mixins may be
    present.</dd>

<dt>January-March 2002</dt>
<dd>Started working seriously on an old and hideously complex problem:
    sibling mixins (the ability to have multiple mixins associated
    with the same syntax but with different enclosing part objects, in
    the same pattern).  Changed the representation of virtual chains,
    to be able to allow siblings in the enclosing object.</dd>

<dt>November-December 2001</dt>
<dd>(Not much coding, too busy writing papers and switching jobs).</dd>

<dt>October 2001</dt>
<dd>Simplified and corrected handling of run-time steps.  Also made
    run-time checking of run-time paths stricter, such that an error
    in static analysis is even more unlikely to remain undetected at
    run time (the purpose of this is to discover errors in static
    analysis, these checks will <em>only</em> fail if there is a bug
    in the static analysis&mdash;but we want to know about such bugs!).
    A rather complex but externally invisible change:  The method
    <code>setFocus</code> is now never called, because the focus is now
    maintained in every step of the static analysis (the focus is a
    specification of the current point of view inside an object, used
    pervasively in static analysis).</dd>

<dt>September 2001</dt>
<dd>Reimplemented the '<code>print</code>' debugging command (which had
    been incapacitated by the removal of the closure based execution
    model).  Improved type analysis by introducing one new case where
    a pattern is known exactly (it used to be considered
    known-by-upper-bound only, and the improvement allows some
    programs using a final binding which were formely considered
    unsafe to type check correctly).  Removed the syntactic construct
    NamedRepetitionDecl (like R:&nbsp[i:5]&nbsp;@integer) which
    provided the index of each array entry in the scope of the array
    declaration&mdash;it was included in the BETA syntax, but was
    never implemented (in BETA, nor in gbeta) and it was not very
    useful.  Finally, a lot of code was reorganized and a number of
    files which were emptied in that process were removed.</dd>

<dt>August 2001</dt>
<dd>The closure based execution system had finally been entirely
    separated from the bytecode execution system, and was then removed
    entirely (this was about 10.000 lines of code).  Introduced some
    optimizations related to performance of run-time paths.  Added
    support for long options (like <code>--interactive</code>), and
    improved option help messages.  Made printouts from debugging
    sessions more main-stream (some BETA/gbeta terminology was
    replaced by terminology from more widely known languages).
    Removed a couple of bugs in the type analysis (caused by not
    copying objects representing patterns early enough, thus breaking
    their copy-on-modify discipline).</dd>

<dt>July 2001</dt>
<dd>Released _gbeta 0.9</dd>

<dt>June 2001</dt>
<dd>Switched to version 0.9, preparing new release.</dd>

<dt>May 2001</dt>
<dd>Added a lot of static pattern stuff (instructions, code generation
    with these instructions, options to control it, support in static 
    analysis).</dd>

<dt>April 2001</dt>
<dd>Started introducing static patterns in the analysis.  A static
    pattern describes a complete pattern which is known already at
    compile time.  Working with static patterns at run-time is the
    first step that must be taken in order to avoid performing
    (expensive!) pattern merge operations at run-time.</dd>

<dt>April 2001</dt>
<dd>Totally reorganized the treatment of options, to make it easier to
    keep options and documentation/help/usage synchronized.  In the
    new approach, each option is one object, and that object handles
    everything related to that particular option, including printing
    usage info and detecting whether a given command line argument is
    a usage of that option.</dd>

<dt>March 2001</dt>
<dd>Segregated run-time steps into "internal" and "final" ones, thereby
    making the construction and execution of run-time paths much
    clearer (and removing a couple of un-discovered bugs).</dd>

<dt>February 2001</dt>
<dd>Switched over to using the new meta-programming system from
    Mjolner.  This new version of MPS supports mapping from abstract
    syntax tree node to from/to-char-pos in the source code.  This
    means that there is no need to use the special, patched, version
    of MPS that adds this functionality, thus getting rid of an old
    inconvenience.</dd>

<dt>January 2001</dt>
<dd>Adding support for saving static info to disk
    (option <code>-s</code>).</dd>

<dt>September 2000</dt>
<dd>Started working through the entire static analysis, expressing
    types in a different way.  The difference is that the
    <code>fixed</code> attribute and the <code>exactType</code>
    attribute of types are removed and a new
    <code>staticallyKnown</code> attribute added.  The most important
    difference is that the types in the new approach will
    <em>never</em> describe anything but patterns, and they will
    <em>never</em> describe another number of patterns than exactly
    one.  With the old approach, a type could describe an object, and
    it could sometimes describe two entities - and that simply got too
    messy over time.</dd>

<dt>September 2000</dt>
<dd>Introduced programs into <code>when</code> statements, thereby
    compiling them all the way down to byte code, such that they can
    be expressed in disk file byte code format.</dd>

<dt>September 2000</dt>
<dd>Added level indications to <code>tmp</code> stack instructions, thus
    taking a first step towards a register based virtual machine (as
    opposed to the current model which is stack oriented).</dd>

<dt>July 2000</dt>
<dd>Started working on the disk file format for byte code.  The file
    based byte codes will be a printed version of the byte codes which
    are stored in the abstract syntax trees today.  To be able to do
    this we must compile a few constructs down to a lower level than
    they are in the abstract syntax trees, because the disk file byte
    codes must contain <em>complete</em> information about the program
    being executed:  It is no longer possible to take a quick look at
    the abstract syntax and/or the static info in order to execute a
    byte code.</dd>

<dt>Spring 2000</dt>
<dd>Worked on compiled object creation (it used to be based on
    closures but it will now use byte code).  This is the last part 
    of the language that still needs to be translated into byte code,
    all other parts are already being translated.</dd>

<dt>February 2000</dt>
<dd>Released _gbeta 0.81.  It should have been "0.8.1", but 
    it's hardly worth the trouble to change that after the
    announcement has been made.</dd>

<dt>January 2000</dt>
<dd>Ported _gbeta to the new release of the Mjolner BETA System.
    Implemented an <code>eval</code> primitive; this is an experiment,
    and there is no commitment that the language gbeta must support
    <code>eval</code>.</dd>

<dt>Autumn 1999</dt>
<dd>Defended PhD thesis, started as an assistant prof. at the Univ. of
    Aalborg, Denmark (not much time for implementation..)</dd>

<dt>July 25, 1999</dt>
<dd>Released _gbeta version 0.8</dd>

<dt>June 15, 1999</dt>
<dd>Delivered final version of my PhD thesis which is basically
    about _gbeta; the thesis will be made available on this 
    site.  It is the most comprehensive source of information
    about _gbeta so far.</dd>

<dt>Spring 1999</dt>
<dd>Implemented various parts of _gbeta which had been conceived
    and designed during 1998 and 1999; e.g., lower bounds on 
    virtuals, disownment markers, enhancements in the fragment
    system, and a better semantics for final bindings.</dd>

<dt>Summer and autumn 1998</dt>
<dd>Finally found a plausible design for a byte-code based model
    of execution, and implemented it.</dd>

<dt>Spring 1998</dt>
<dd>Implemented more and more of the language,
    changing the semantics in a few cases where the 
    earlier choices turned out to be ill-defined; also
    wrote some papers which were revised lots of times 
    and were accepted at conferences and/or became parts 
    of the PhD thesis at a later stage.</dd>

<dt>December 20, 1997</dt>
<dd>Improved navigation on this web-site, added 
    "not-yet-ready" markers a few places, fixed some typos.</dd>

<dt>December 18, 1997</dt>
<dd>The _gbeta web-site is fairly complete.  Announced on some 
    news groups, with the release of _gbeta version 0.5.</dd>

<dt>November 28, 1997</dt>
<dd>Started this list.</dd>

</dl>

end_page

m4_dnl local variables:
m4_dnl mode: html
m4_dnl eval: (local-set-key "\C-cc" 'gbeta-html-compile)
m4_dnl end:
