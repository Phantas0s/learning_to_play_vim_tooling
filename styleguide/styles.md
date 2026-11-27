# An h1 header

## An h2 header

### An h3 header

#### An h4 header

----

Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**

We can create hypnens --- like this ---.

**A random paragraph**:

We are a startup. There are more projects lined up charge extra the next time. Could you move it a tad to the left I got your invoice...it seems really high, why did you charge so much theres all this spanish text on my site make it sexy. Was i smoking crack when i sent this? hahaha!. Can the black be darker can you rework to make the pizza look more delicious, nor can't you just take a picture from the internet?

----

Superscript: H~2~O is a liquid.  2^10^ is 1024.

----

Inline code: What is the difference between `>>=` and `>>`?
I love to do `rm -rf / && echo "lala"`{.bash}

---

Here is a literal backtick `` ` ``.

---

Smallcaps:

### this is [normal]{.smallcaps} mode

This is the [normal]{.smallcaps} mode

This is the NORMAL MODE in caps

---

Itemized lists:

* this one
* that one
* the other one

---

> Block quotes are
> written like so.
>
> They can span multiple paragraphs,
> if you like.

---

Use 3 dashes for an em-dash. Use 2 dashes for ranges (ex., "it's all
in chapters 12--14"). Three dots ... will be converted to an ellipsis.

---

**Numbered list**:

1. Use a keyboard shortcut (like `CTRL-f` for example) to search the word you want to edit.
2. Delete the word with the `DELETE` (`<del>`) key.
3. Write whatever you want with your keyboard.

---

**Code block**:

```bash
cd lala && rm -rf lolo
echo "lala" | grep "a" | less
echo "lolo"
```

```lua
ж\cur{#}ж!/usr/bin/env lua

local function restorePosition()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd([[normal! g`"]])
    end
end
```

---

**Lineblocks**:

| The limerick packs laughs anatomical
| In space that is quite economical.
|           But the good ones I've seen
|   So seldom are clean
| And the clean ones so seldom are comical

**Without lineblocks**:

The limerick packs laughs anatomical
In space that is quite economical.
   But the good ones I've seen
   So seldom are clean
And the clean ones so seldom are comical

---

**A compact list**:

* youpi
* youpla
* boom

---

**A loose list**:

  * First paragraph.

    Continued.

  * Second paragraph. With a code block, which must be indented
    eight spaces:

        { code }

---

**Now a nested list**:

 1. First, get these ingredients:
      * carrots
      * celery
      * lentils

 2. Boil some water.

 3. Dump everything in the pot and follow
    this algorithm:
    1. find wooden spoon
    2. uncover pot
    3. stir
    4. cover pot
    5. balance wooden spoon precariously on pot handle
    6. wait 10 minutes
    7. goto first step (or shut off burner when done)

    8. Do not bump wooden spoon or it will fall.

---

**Another way to nest lists**:

#. one
#. two

---

**Cut off line items**:

-   item one
-   item two

<!-- end of list -->

**Not cutting off**:

-   item one
-   item two

{ my code block }

---

**Numbered examples**:


(@)  My first example will be numbered (1).
(@)  My second example will be numbered (2).

**Explanation of examples**:

(@)  My third example will be numbered (3).

(@good)  This is a good example.

As (@good) illustrates...

---

Here's a link to [a website](http://foo.bar), to a [local
doc](local-doc.html), and to a [section heading in the current
doc](#an-h2-header).
[Write me!](mailto:sam@green.eggs.ham)

See the [internal-link](#introduction).

---

**Labels**:

[my label 1]: /foo/bar.html  "My title, optional"
[my label 2]: /foo
[my label 3]: https://fsf.org (The free software foundation)
[my label 4]: /bar#special  'A title in single quotes'

---

Here's a footnote [^1].

[^1]: Some footnote text.

Here's another footnote [^2].

[^2]: Another.

Why not a third one? [^3].

[^3]: Third one.

---

**Tables** can look like this:

Name           Size  Material      Color
------------- -----  ------------  ------------
All Business      9  leather       brown
Roundabout       10  hemp canvas   natural
Cinderella       11  glass         transparent
Cinderella       11  glass         transparent

Table: Shoes sizes, materials, and colors.

(The above is the caption for the table.) Pandoc also supports
multi-line tables:

--------  -----------------------
Keyword   Text
--------  -----------------------
red       Sunsets, apples, and
          other red or reddish
          things.

green     Leaves, grass, frogs
          and other things it's
          not easy being.
--------  -----------------------

-------     ------ ----------   -------
     12     12        12             12
    123     123       123           123
      1     1          1              1
-------     ------ ----------   -------

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

| One | Two   |
|-----+-------|
| my  | table |
| is  | nice  |

Added with the filter `list-table.lua`

:::list-table
* - row 1, column 1
  - row 1, column 2
  - row 1, column 3

* - row 2, column 1
  -
  - row 2, column 3

* - row 3, column 1
  - row 3, column 2
:::

:::{.list-table aligns=l,l,l}
* - Question
  - Keystroke
  - Result

* - start
  -
  - `ж\cur{l}жocal function restorePosition()`

* - 1.
  - `+`
  - `    ж\cur{i}жf vim.fn.line("'\"") > 1`

* - 2.
  - `-`
  - `ж\cur{l}жocal function restorePosition()`
:::

:::list-table
* - Question
  - Keystroke
  - Result

* - start
  -
  - local function

* - `1.`
  - `+`
  - `    ж\cur{i}жf vim.fn.line("'\"") > 1`

* - `2.`
  - `-`
  - `local function`
:::

::: list-table
- - Motion
  - Description

- - `{line_number}G`
  - Move at the be[g]{.mne}inning of the `{line_number}`.

- - `G`
  - Move to the last line.

- - `1G` or `GG`
  - Move to the first line.

- - `CTRL-u`
  - Move [u]{.mne}pward half a screen.

- - `CTRL-d`
  - Move [d]{.mne}ownward half a screen.

- - `CTRL-b`
  - Move [b]{.mne}ackward (upward) an entire screen.

- - `CTRL-f`
  - Move [f]{.mne}orward (downward) an entire screen.
:::

::: list-table
- - Keystroke
  - Description

- - `i`
  - Switch from [normal]{.smallcaps} mode to [[i]{.mne}nsert]{.smallcaps} mode.

- - `a`
  - Switch from [normal]{.smallcaps} mode to [insert]{.smallcaps} mode \
    [a]{.mne}fter the character under the cursor.

- - `esc`
  - Switch from [insert]{.smallcaps} mode to [normal]{.smallcaps} mode.
:::

::: list-table
- - Question
  - Keystroke
  - Result

- - start
  -
  - `local function ж\cur{r}жestorePosition()`{.lua}

- - 1
  - `b`
  - `local ж\cur{f}жunction restorePosition()`{.lua}

- - 2
  - `w`
  - `local function ж\cur{r}жestorePosition()`{.lua}

- - 3
  - `$`
  - `local function restorePosition(ж\cur{)}ж`{.lua}
:::

::: list-table
- - Question
  - Keystroke
  - Result

- - start
  -
  - `local function ж\cur{r}жestorePosition()`{.lua bgcolor=""}

- - 1
  - `5G`
  - ``ж\cur{ }ж       vim.cmd([[normal! g`"]])``{.lua bgcolor=""}

- - 2
  - `1G` or `GG`
  - `ж\cur{#}ж!/usr/bin/env lua`{.text bgcolor=""}

- - 3
  - `G`
  - `ж\cur{\}}ж`{.lua bgcolor=""}

- - 4
  - `CTRL-u`
  - ``        vim.cmd([[normal! g`"]])``{.lua bgcolor=""}
:::

---------------------------------

Comparison multiline table and list-table

Option                         Description                                                                      Type         Recommendation
------------------------       ------------------------                                                         ----------  --------------------
`ignorecase`                   Search is not case sensitive                                                     Boolean     True
`smartcase`                    Search case sensitive if the request has one or more uppercase.                  Boolean     True
                               Need `ignorecase` to be true.                                                    Boolean     True
`showcmd`                      Show partial NORMAL mode keystrokes on the
                               right of the command-line window.                                                Boolean     True
------------------------       ------------------------                                                         ----------  --------------------

Question      Keystroke           Result
---------     --------------      ----------------------------------------------
start                             `locж\cur{a}жl function restorePosition()`{.lua bgcolor=""}
1.            `diw`               `ж\cur{ }жfunction restorePosition()`{.lua bgcolor=""}
2.            `u`                 `locж\cur{a}жl function restorePosition()`{.lua bgcolor=""}
3.            `daw`               `ж\cur{f}жunction restorePosition()`{.lua bgcolor=""}
4.            `ciw`               `│  ┃▐  function restorePosition()`{.lua bgcolor=""}
5.            `dw`                `locж\cur{f}жunction restorePosition()`{.lua bgcolor=""}
---------     --------------      ----------------------------------------------

::: list-table

- - Option
  - Description
  - Type
  - Recommendation

- - `ignorecase`
  - Search is not case sensitive
  - Boolean
  - True

- - `smartcase`
  - Search case sensitive if the request has one or more uppercase.\
    Need `ignorecase` to be true.
  - Boolean
  - True

- - `showcmd`
  - Show partial NORMAL mode keystrokes on the \
    right of the command-line window
  - Boolean
  - True

:::

Keystroke                        Description
-------------------------------  ------------------------------------------------------------------------------
`i`                              Switch from [normal]{.smallcaps} mode to [[i]{.mne}nsert]{.smallcaps} mode.
`a`                              Switch from [normal]{.smallcaps} mode to [insert]{.smallcaps} mode
                                 [a]{.mne}fter the character under the cursor.
`<esc>`                          Switch from [insert]{.smallcaps} mode to [normal]{.smallcaps} mode.
-------------------------------  ------------------------------------------------------------------------------

::: list-table
- - Keystroke
  - Description

- - w
  - Move forward to the beginning of the next [w]{.mne}ord.

- - W
  - Move forward to the beginning of the next [W]{.mne}ORD.

- - e
  - Move forward to the [e]{.mne}nd of the next word.

- - E
  - Move forward to the [e]{.mne}nd of the next WORD.

- - b
  - Move [b]{.mne}ackward to the beginning of the word.

- - B
  - Move [b]{.mne}ackward to the beginning of the WORD.

- - ge
  - Move backward to the end of the previous word.
:::

---

**Definition list**:

apples
  : Good for making applesauce.

oranges
  : Citrus!

tomatoes
  : There's no "e" in tomatoe.

---

**Inline math equation**: $\omega = d\phi / dt$. Display
math should get its own line like so:

$$I = \int \rho R^{2} dV$$

---

**Images**:

![example image](images/hand_keyboard_points.png "An exemplary image")

![example image but smaller](images/hand_keyboard_points.png "An exemplary image but smaller"){width=80%}

---

And note that you can backslash-escape any punctuation characters
which you wish to be displayed literally, ex.: \`foo\`, \*bar\*, etc.

# This should be on another page

## Experiments

### Examples and Cursor

For example, try to put your cursor on the 3rd line in the file "rank_01/functions.lua" from the book companion:

```
ж\cur{l}жocal function restorePosition()
```

---

**box**:

::: tip
Beef up you gotta smoke test your hypothesis due diligence, tribal knowledge, value-added, so make sure to include in your wheelhouse yet move the needle. We need this overall to be busier and more active those options are already baked in with this model this is a no-brainer what's our go to market strategy?
:::

::: note
Beef up you gotta smoke test your hypothesis due diligence, tribal knowledge, value-added, so make sure to include in your wheelhouse yet move the needle. We need this overall to be busier and more active those options are already baked in with this model this is a no-brainer what's our go to market strategy?
:::

::: warning
I need a website. How much will it cost, or that's going to be a chunk of change. Theres all this spanish text on my site can you turn it around in photoshop so we can see more of the front, nor can it be more retro, yet could you do an actual logo instead of a font concept is bang on, but can we look at a better execution.
:::


::: important
Overcome key issues to meet key milestones nobody's fault it could have been managed better form without content style without meaning. Get six alpha pups in here for a focus group powerpoint Bunny, nor push back yet accountable talk for open door policy, yet future-proof build on a culture of contribution and inclusion.
:::

---

::: wrong
Overcome key issues to meet key milestones nobody's fault it could have been managed better form without content style without meaning. Get six alpha pups in here for a focus group powerpoint Bunny, nor push back yet accountable talk for open door policy, yet future-proof build on a culture of contribution and inclusion.
:::

::: good
Overcome key issues to meet key milestones nobody's fault it could have been managed better form without content style without meaning. Get six alpha pups in here for a focus group powerpoint Bunny, nor push back yet accountable talk for open door policy, yet future-proof build on a culture of contribution and inclusion.

[Exercise 1 - Horizontal Motions](#exercise-1-horizontal-motions)

:::

---

::: help

* `:help cursor-motions`
* `:help left-right-motions`

:::

::: help
`:help cursor-motions`

`:help left-right-motions`
:::

---

::: playtime

* [Exercise 1 - Horizontal Motions](#exercise-1---horizontal-motions)

* [Exercise 2 - Horizontal Motions, the Return](#exercise-2---horizontal-motions-the-return)

:::

---

::: help

`:help normal`

`:help insert`

:::

---

::: twocols :::

Initial state:

::: wrong
[h]{.cursor}ello

bonjour

ola
:::

Goal:

::: good
hello

salut

ola
:::

::::::::::::::


##### Exercise 1

Using the `hjkl` keys in NORMAL mode, move your cursor at the beginning of `restorePosition`:

```lua
local function ж\cur{r}жestorePosition()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd([[normal! g`"]])
    end
end
```

How would you:

1. Move to this position: `ж\cur{f}жunction`{.lua}?
2. Move back to this position: `ж\cur{r}жestorePosition()`{.lua}?
3. Move to the end of the line?

::: playtime

**Exercise 1**

Using the `hjkl` keys in NORMAL mode, move your cursor at the beginning of `restorePosition`:

```lua
local function ж\cur{r}жestorePosition()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd([[normal! g`"]])
    end
end
```

How would you:

1. Move to the position first `f` of `function`?
2. Move back to the first `r` of `restorePosition()`?
3. Move to the end of the line?

:::

### Solutions

#### Exercise 1

-----------------------      -------------------------------------------------------------------------------
[b]{.cursor}onjour           Hit `j` in normal mode to go to second line
|                            Hit `ciw` (`c`hange `i`nside `w`ord) to delete the word and go to INSERT mode
salut|                       Write "salut"
-----------------------      -------------------------------------------------------------------------------

Total hits: 9

##### Exercise 2

Question      Keystroke           Result
---------     --------------      ----------------------------------------------
start                             `ж\cur{ }ж   if vim.fn.line("'\"") > 1`{.lua}
1.            `^` or `w`          `    ж\cur{i}жf vim.fn.line("'\"") > 1`{.lua}
2.            `w`                 `    if ж\cur{v}жim.fn.line("'\"") > 1`{.lua}
3.            `W`                 `    if vim.fn.line("'\"") ж\cur{>}ж 1`{.lua}
4.            `0`                 `ж\cur{ }ж   if vim.fn.line("'\"")    `{.lua}
---------     --------------      ----------------------------------------------
