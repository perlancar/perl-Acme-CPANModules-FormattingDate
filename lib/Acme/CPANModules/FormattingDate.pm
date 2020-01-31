package Acme::CPANModules::FormattingDate;

# AUTHORITY
# DATE
# DIST
# VERSION

my $text = <<'_';
**Overview**

Date formatting modules can be categorized by their expected input format and
the formatting styles.

Input format: Some modules accept date in the form of Unix epoch (an integer),
or a list of integer produced by running the epoch through the builtin gmtime()
or localtime() function. Some others might expect the date as <pm:DateTime>
object. For formatting style: there's strftime in the <pm:POSIX> core module,
and then there's the others.

This list is organized using the latter criteria (formatting style).

**strftime (and variants)**

The <pm:POSIX> module provides the `strftime()` routine which lets you format
using a template string containing sprintf-style conversions like `%Y` (for
4-digit year), `%m` (2-digit month number from 1-12), and so on. There's also
<pm:Date::strftimeq> which provides an extension to this.

You can actually add some modifiers for the conversions to set
width/zero-padding/alignment, like you can do with sprintf (e.g. `%03d`
supposing you want 3-digit day of month numbers). But this feature is
platform-dependent.

**yyyy-mm-dd template**

This "yyyy-mm-dd" (for lack of a better term) format is much more commonly used
in the general computing world, from spreadsheets to desktop environment clocks.
And this format is probably older than strftime. The template is more intuitive
to use for people as it gives a clear picture of how wide each component (and
the whole string) will be.

There are some modules you can use to format dates using this style. First of
all there's <pm:Date::Formatter>. I find its API a little bit annoying, from the
verbose date component key names and inconsistent usage of plurals, to having to
use a separate method to "create the formatter" first.

**PHP**

PHP decided to invent its own date template format. Its `date()` function
accepts template string in which you specify single letter conversions like `Y'
(for 4-digit year), `y` (2-digit year), and so on. Some of the letters mean the
same like their counterpart in strftime, but some are different (examples: `i`,
`a`, `M`, and so on). The use of single letter means it's more concise, but the
format becomes unsuitable if you want to put other stuffs (like some string
alphabetical literals) in addition to date components.

In Perl, you can use the <pm:PHP::DateTime> to format dates using PHP `date()`
format.

_

our $LIST = {
    summary => 'Various methods to format dates',
    description => $text,
    tags => ['task'],
    entries => [
        map { +{module=>$_} }
            do { my %seen; grep { !$seen{$_}++ }
                 ($text =~ /<pm:(\w+(?:::\w+)+)>/g)
             }
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO

L<Bencher::Scenario::FormattingDate>
