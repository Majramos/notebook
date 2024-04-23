---
title: color test code blocks
description: sample code from different languages to use to check for color schemes
---
# Test colors schemes of IDEs using these code blocks


## Bash
``` bash
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
#
# aliases
alias grpe=grep
alias grep='grep --color --line-number'
alias vim="vim -p"
alias rebash="source ~/.bashrc"

alias install='sudo apt-get -y install'
alias search='apt-cache search'
alias purge='sudo apt-get purge'

export EDITOR=vim

# set up the prompt to the hostname
shopt -s checkwinsize
PS1="\e[1;35m[\w]   ---   \@ \d \n$>\[\e[0m\]"
PS2="\e[1;35m->\[\e[0m\]"

#--------------------------------------------------
#    grabs some definitions from google
#--------------------------------------------------
define () {
 lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}" | grep -m 25 -w "*"  | sed 's/;/ -/g' | cut -d- -f5 > /tmp/templookup.txt
             if [[ -s  /tmp/templookup.txt ]] ;then
                 until ! read response
                     do
                     echo "${response}"
                     done < /tmp/templookup.txt
                 else
                     echo "Sorry $USER, I can't find the term \"${1} \""
              fi
```

## C
``` c
#region Studio Style
class Program : IThemeable
{
    static int _I = 1;
    delegate void DoSomething();

    /// <summary>
    /// The quick brown fox jumps over the lazy dog
    /// THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
    /// </summary>
    static void Main(string[] args)
    {
        string normalStr = "The time now is approximately " + DateTime.Now;
        Uri Illegal1Uri = new Uri("http://packmyboxwith/jugs.html?q=five-dozen&t=liquor");
        Regex OperatorRegex = new Regex(@"\S#$", RegexOptions.IgnorePatternWhitespace);

        for (int O = 0; O < 123456789; O++)
        {
            _I += (O % 3) * ((O / 1) ^ 2) - 5;
            if (!OperatorRegex.IsMatch(Illegal1Uri.ToString()))
            {
                // no idea what this does!?
                Console.WriteLine(Illegal1Uri + normalStr);

            }
        }
    }
}
```


## C++
``` cpp
#pragma once
#include "Header.h" // Contains ISomeClass and includes <vector>, <list>
#define PREPROCESSOR_DEFINITION

namespace MyNamespace
{
void GlobalFunction() {}
bool GlobalVariable = true;
/// <summary>
/// The quick brown fox jumps over the lazy dog
/// THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
/// </summary>
class SomeClass    : public ISomeClass
{
public:
    enum SomeEnum
    {
        ENUM_0 = 0,
        ENUM_1 = 1
    };
    struct SomeData
    {
        int m_Integer;
        float m_Float;
    };

    SomeClass() { m_Data = new SomeData(); }
    ~SomeClass() { delete m_Data; m_Data = 0; }

    static int DoSomethingStatic( int _Arg0, float _Arg1 )
    {
        std::vector<float> Vec = std::vector<float>();

        float f = 0.0f;
        for (int i = 0; i < _Arg0; ++i)
        {
            if (i % 3 != 0)
            {
                f += _Arg1;
                Vec.push_back(f);
            }
        }
        return Vec.size();
    }

    template<class _T>
    int DoSomethingNonStatic() const;
private:
    SomeData* m_Data;
    static SomeData* m_StaticData;
};

}    // MyNamespace
```

## Java
``` java
import java.io.*;
import java.util.*;

class Test<T> {
    // An object of type T is declared
    T obj;
    Test(T obj) { this.obj = obj; } // constructor
    public T getObject() { return this.obj; }
}

public class KeyboardIntegerReader {

 public static void main (String[] args) throws java.io.IOException {
  String s1;
  String s2;
  int num = 0;

  // set up the buffered reader to read from the keyboard
  BufferedReader br = new BufferedReader (new InputStreamReader (
            System.in));

  boolean cont = true;

  while (cont)
     {
      System.out.print ("Enter an integer:");
      s1 = br.readLine();
      StringTokenizer st = new StringTokenizer (s1);
      s2 = "";

      while (cont && st.hasMoreTokens())
     {
          try
          {
           s2 = st.nextToken();
           num = Integer.parseInt(s2);
           cont = false;
          }
          catch (NumberFormatException n)
          {
           System.out.println("The value in \"" + s2 + "\" is not an integer");
          }
```

## Javascript
``` javascript
var ralpha = /alpha\([^)]*\)/i,
    ropacity = /opacity=([^)]*)/,
    // fixed for IE9, see #8346
    rupper = /([A-Z]|^ms)/g,
    rnumpx = /^-?\d+(?:px)?$/i,
    rnum = /^-?\d/,
    rrelNum = /^([\-+])=([\-+.\de]+)/,

    cssShow = { position: "absolute", visibility: "hidden", display: "block" },
    cssWidth = [ "Left", "Right" ],
    cssHeight = [ "Top", "Bottom" ],
    curCSS,

    getComputedStyle,
    currentStyle;

jQuery.fn.css = function( name, value ) {
    // Setting 'undefined' is a no-op
    if ( arguments.length === 2 && value === undefined ) {
        return this;
    }

    return jQuery.access( this, name, value, true, function( elem, name, value ) {
        return value !== undefined ?
            jQuery.style( elem, name, value ) :
            jQuery.css( elem, name );
    });
};
```

## Python
``` python
import json

def dump_args(func):
    "This decorator dumps out the arguments passed to a function before calling it"
    argnames = func.func_code.co_varnames[:func.func_code.co_argcount]
    fname = func.func_name
    def echo_func(*args,**kwargs):
        print fname, ":", ', '.join(
            '%s=%r' % entry
            for entry in zip(argnames,args) + kwargs.items())
        return func(*args, **kwargs)
    return echo_func

@dump_args
def f1(a,b,c):
    print a + b + c

f1(1, 2, 3)

def precondition(precondition, use_conditions=DEFAULT_ON):
    return conditions(precondition, None, use_conditions)

def postcondition(postcondition, use_conditions=DEFAULT_ON):
    return conditions(None, postcondition, use_conditions)

class conditions(object):
    __slots__ = ('__precondition', '__postcondition')

    def __init__(self, pre, post, use_conditions=DEFAULT_ON):
        if not use_conditions:
            pre, post = None, None

        self.__precondition  = pre
        self.__postcondition = post
```

## Perl
``` perl
package Dancer::Handler::Standalone;

use strict;
use warnings;

use HTTP::Server::Simple::PSGI;
use base 'Dancer::Handler', 'HTTP::Server::Simple::PSGI';

use Dancer::HTTP;
        $dancer->run();
    }
}

sub print_startup_info {
    my $pid    = shift;
    my $ipaddr = setting('server');
    my $port   = setting('port');

    # we only print the info if we need to
    setting('startup_info') or return;

    # bare minimum
    print STDERR ">> Dancer $Dancer::VERSION server $pid listening " .
                 "on http://$ipaddr:$port\n";

    # all loaded plugins
    foreach my $module ( grep { $_ =~ m{^Dancer/Plugin/} } keys %INC ) {
        $module =~ s{/}{::}g;  # change / to ::
```

## SQL
``` sql
CREATE TABLE My_table(
    my_field1   INT,
    my_field2   VARCHAR(50),
    my_field3   DATE         NOT NULL,
    PRIMARY KEY (my_field1, my_field2)
);

ALTER TABLE My_table ADD my_field4 NUMBER(3) NOT NULL;

GRANT SELECT, UPDATE
    ON My_table
    TO some_user, another_user;

REVOKE SELECT, UPDATE
    ON My_table
    FROM some_user, another_user;

SELECT Book.title,
        COUNT(*) AS Authors
    FROM  Book JOIN Book_author
       ON Book.isbn = Book_author.isbn
    GROUP BY Book.title;
```

## XML
``` xml
<?xml version="1.0" encoding="utf-8" ?>
<!-- this is an example XML file -->
<people xmlns:x="http://studiostyles.info">
  <person name="Jim Jones" ID="27">
    <email html="yes">jim@example.invalid</email>
    <address>
      <post>123 Example St, &#160;South Brisbane</post>
      <city>Brisbane</city>
    </address>
    <x:comments>
    <![CDATA[ See? Data. Don't worry about this <tag>. ]]>
    </x:comments>
  </person>
</people>
```
