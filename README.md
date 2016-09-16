
# Command Line 101

## Introduction

The Command Line is very helpful in manipulating and processing data. This guide aims to document what I have learnt in my year in Data Science, and hopes to give newbies a starting point to learn all about the glorious Command Line. However, this is not a step-to-step guide, nor telling you [how basic commands](http://cli.learncodethehardway.org/book/) work. If that's what you're looking for, Google is always your friend.


## Configurations 

### .bashrc

``.bashrc`` runs whenever you start a new command line prompt (located in your home directory). It acts as a config file to allow you define default actions and variables, so that you don't have to do that manually every time. You can find my ``.bashrc`` here: ``(this_repo)/configs/bashrc``. It's always worth making a copy just in case you've made some horrible mistakes. **Do not copy the entire .bashrc to yours - just extract the bits you need, else it might mess up your .bashrc.**

If your .bashrc don't load automatically when you start a new shell, add this to your ``.bash_profile``

```
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
```

Note that these files are all in your root directory (``/home/<your_user_name>`` or simply ``~/``).

Some notable bits of code/ variables in my ``.bashrc``:

| Variable/ Command                  | Description                                                                                                      |
| -----------------------------------|------------------------------------------------------------------------------------------------------------------|
| ``set -o vi``                      | use vim mode in the Command Line (it makes life so much easier!!)                                                |
| ``PATH``                           | add some other paths such as ``$HOME/bin`` to allow user-defined tools (See **_Useful DS Command Line Helpers_**)|
| ``VSQL_USER``, ``vsql``, ``vsqlf`` | allows you to use Vertica in the Command Line and gives you beautiful output                                     |
| ``smiley`` and ``gitbranch``       | some code written by Arjun to show you the status of a git repository in the command line                        | 
| ``tmux``                           | multiple panes controlled by keyboard commands                                                                   | 
| ``PS1`` (line 167)                 | to customise command line prompt message to show current runeday (look for variable ``crd``) and ``smiley``      |

### .inputrc

If you decided to use vim mode in your Command Line prompt (SO GOOOOOD!!), you should add the piece of code in ``(this_repo)/cofings/inputrc`` to your ``.inputrc``.

This makes "clear screen" (``Ctrl``+``l``) to perform expectedly.

### Command Line Tools

These are some useful command line tools that I often use:

| Tool     | Description                                                                                |
| ---------|--------------------------------------------------------------------------------------------|
| ``cat``  | print everything to the command line prompt                                                |
| ``>``    | direct output to a file                                                                    |
| ``less`` | format output, make it scrollable, and don't print directly to the prompt - avoid messiness|
| ``cut``  | get only the wanted columns                                                                |
| ``wc -l``| count the number of lines of a file                                                        |
| ``sort`` | sort how a file is displayed when printed                                                  |
| ``uniq`` | get only the unique values                                                                 |
| ``grep`` | only show results containing that string/ regex                                            |

Note: use ``man [some_tool]`` to see how to use a tool. Sometimes, tools might not have a man page, but they provide a similar page with the ``--help`` flag. Otherwise, Google.

#### Piping

Perhaps the best thing about the Command Line is that you can use multiple tools in one go by piping some result to another. For example, ``hive -f output.sql | grep 1234555 | less`` gives ``hive``'s results to ``grep``, then to ``less``. 

The output from the Hive query is first filtered to just 1234555, and is displayed in a scrollable "session" rather than directly onto the command-line prompt.

## Useful DS Command Line Helpers

### tcol

tcol is basically a formatted ``less`` command to align and display``.tsv`` output nicely. It makes it easy to inspect outputs, say, from a hive query, easily.

You can either pipe the output directly into tcol, or use it as a command-line tool, e.g.

- ``hive -e "select col1, col2, col3, col4 from some_table" | tcol``
- ``tcol output.tsv``

## tmux

Rather than having many Command Line windows, you can have them all in one. It works much like tabs in a web browser but you move between panes and tabs (windows) with a keyboard. Although it has its downsides, it is easier to navigate and find the required window/ pane more easily than going through all the windows you have opened system-wide.

To access tmux, type ``tmux`` into your Command Line prompt.

To perform a "tmux action", you'll most probably need to use the **<prefix>**. It is default to ``Ctrl``+``b``. 

One useful command is ``<prefix>``+``[``. It makes a pane scrollable. Use ``q`` to get out of that mode. You can find out more [here](https://gist.github.com/MohamedAlaa/2961058).

### .tmux.conf

``.tmux.conf`` enables customisation of your tmux sessions. You can bind keys together and have other settings. More can be found [here](https://wiki.archlinux.org/index.php/Tmux#Key_bindings).

For example, I mapped the vim "arrow keys" to the tmux-equivalent ones, so that I can move between panes with the vim keys. 

To enable these key bindings, add the bindings to the file and run the following command:
``tmux source-file ~/.tmux.conf``

## vim

vim is a very useful command line tool for writing scripts and editing files. The "vim way of doing things" is not that straight-forward at first, but once you've mastered them, you'll love it! The [official vim Wikia](http://vim.wikia.com) provides useful documentation and tips. You can find out more about the different operations and commands to operate vim that is not covered in this guide.

You can access vim just by typing ``vim`` or ``vi`` into your Command Line prompt. You create or open a file simply by using the command ``vim [filename]``.

There are two modes in vim: **vim** and **insert**.

* Vim Mode 
    * vim operations and commands can only be activated in vim mode. 
    * ``Esc`` gets you to vim mode if you're not already in it.
* Insert Mode
    * Wrtie text into a document.
    * To get into insert mode, press ``Insert`` or ``i``. 
    * To get out of insert mode (and into vim mode), press ``Esc``. 

Note that these vim commands and operations are **case sensitive**, meaning that ``g`` and ``G`` are different operations.

### vim-adventures

[vim-adventures](http://vim-adventures.com/) is a small game that helps you understand the vim way of doing things. There are a few free levels and should be enough to get yourself familiar with the basic navigation of vim. 

### Pathogen

- [Pathogen](https://github.com/tpope/vim-pathogen) allows you to install plugins to make vim even more useful and powerful. 
  - [VimAwesome](http://vimawesome.com/) seems to be a good website to explore vim plugins. Otherwise, Google should find you what you want.

Here are some plugins I use:

| Plugin                                                                 | Description                                                                                |
| -----------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| [markdown](https://github.com/plasticboy/vim-markdown)                 | provides markdown syntax highlighting                                                      |
| [rainbow_parentheses](https://github.com/kien/rainbow_parentheses.vim) | highlighting matching parentheses                                                          |
| [nerdcommenter](https://github.com/scrooloose/nerdcommenter)           | makes commenting much nicer ``\``+``c``+``[space]`` comments the selected (block of) lines |

### .vimrc

Like .bashrc, .vimrc lets you customise your vim sessions. You can ``set`` the default behaviour when it launches.

| Code                 | Description                                                                                        |
| ---------------------|----------------------------------------------------------------------------------------------------|
| ``set expandtab``    | convert tabs to spaces                                                                             |
| ``set tabstop=2``    | how many spaces are used to represent a tab (2 = perfect, 4 = acceptable, 8 = immediate death) *   |
| ``set shiftwidth=2`` | set this as the same value as ``tabstop`` *                                                        |

* = see [indentation without hard tabs](http://vim.wikia.com/wiki/Indenting_source_code) (i.e. only use spaces for indentation)

### vim Commands

Most of the vim commands requires you to use the prefix ``:``. You need to be in **vim mode** to use these commands.

| Command                                                    | Description                                                                                                         |
| -----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| ``:x`` or ``:w :q``                                        | Save and quit                                                                                                       |
| ``:set [no]paste``                                         | set paste or nopaste mode - should use ``nopaste`` when you're editing a file                                       |
| ``:%s/[find_this_text_or_regex]/[replace_with_this]/g[c]`` | find text and replace it globally (the ``c`` option requires confirmation before it does each replacement           |
| ``:q!``                                                    | quit without saving changes                                                                                         |
| ``:[number]``                                              | goes to that line number you specified                                                                              |


### vim Operations 

vim operations becomes powerful when you combine them together. A simple example is to navigate 8 lines down. Rather than having to press ``j`` 8 times, you can simply do ``8j``. You have to be in **vim mode** to use these operations, unless specified.

The following details some of the combined commands I use:

| Operations                                        | Description                                                                                                                  |
| --------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| ``A``                                             | insert at the _true_ end of the line                                                                                         |
| ``I``                                             | insert at the beginning of the line (where the first character is)                                                           |
| ``gj`` and ``gk``                                 | move within a long line of text that spans through multiple screen lines without having to go through it word by word        |
| ``di[symbol]``                                    | (delete in) delete everything between two symbols, e.g. two quotes, while you're in it                                       |
| ``da[symbol]``                                    | (delete around) delete everything, including the symbols,                                                                    |
| ``gu``                                            | make all selected text lowercase \*\*                                                                                        |
| ``gU``                                            | make all selected text uppercase \*\*                                                                                        |
| ``yyp``                                           | copies the current line and paste it beneath the current line                                                                |
| ``q[letter]``, some sequence, ``q``, ``@[letter]``| this saves a sequence of command and allows you to use it to other lines later [(marco)](http://vim.wikia.com/wiki/VimTip398)|
| ``/[some_text_or_regex]``                         | find that string; use ``n`` and ``N`` to navigate to the next and previous match                                             |
| ``Ctrl``+``w`` **_in insert mode_**               | delete the word immediately before the current                                                                               | 
| ``Ctrl``+``n`` **_in insert mode_**               | autocomplete - use ``Ctrl``+``n`` and ``Ctrl``+``p`` to navigate to the next and previous choice                             |
| ``Ctrl``+``v`` then ``tab`` **_in insert mode_**  | type in a literal tab                                                                                                        |
| ``0`` (or ``Home``)                               | get to the 0th position of the line                                                                                          |
| ``$`` (or ``End``)                                | get to the end of the line                                                                                                   |
| ``^``                                             | get to the first character of the line                                                                                       |
| ``Ctrl``+``v``, select rows and columns, ``I``, some operations,``Esc``,``Arrow-down``or ``j`` | edit multiple lines from the same column                                        |


\*\* = [case swithcing](http://vim.wikia.com/wiki/Switching_case_of_characters)

## htop

``htop`` helps monitor and kill processes in a Command-Line interface (for Linux and Mac).

The interface is rather straight-forward, but **USE IT WITH CARE** You wouldn't want to kill any essential system processes which may cause bad consequences.

## Terminal

### Selecting a Block

Things are automatically copied to your Terminal clipboard when you highlight them, so you can use ``Shift``+``Insert`` to paste it anywhere within your terminal sessions. However, what if you want to copy across multiple lines but not the entire screen line? (vim line numbers is a good example.)

Here are the keys you need to press _while selecting a block by dragging across lines and texts_ in your chosen Command Line software:

| Software        | Command          |
|-----------------|------------------|
| Terminator      | ``Ctrl``         |
| Ubuntu Terminal | ``Ctrl``+``Alt`` |

This is especially useful if you use ``tmux``.

## Linux OS Version

| Command          | Description                            |
| -----------------|----------------------------------------|
| uname -or        | kernel information                     |
| lab_release -irc | OS distributor and version information |

This is especially useful if you use ``tmux``.

## Git

This is aimed at projects that uses branches, such as Data Science pipeline projects where you're expect to work on a branch, then merge changes into ``staging``, and finall ycreate a pull request so that Arjun and Oscar (and their automated tests) can check if it is ready to be put into production (merge into ``master``).

| Branch            | Command                                | Description                                                                                                          |
| ------------------|----------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| /                 | ``git clone [address]``                | clone a repository to your local directory so that you can work on it                                                |
| ``master``        | ``git checkout staging``               | go into the ``staging branch`` - this is where changes are submitted to be reviewed before it can go into production |
| ``staging``       | ``git checkout -b [your_branch]``      | use the flag ``-b`` only if you are creating a new branch                                                            |
|                   |                                        | make changes as normal; you can still commit as normal like any other branch                                         |
|                   |                                        | when you're ready to have your files reviewed and added to the production system, do the following:                  |
| ``[your_branch]`` | ``git add [files_seperated_by_space]`` | add your files so then it can be commited                                                                            |
| ``[your_branch]`` | ``git commit -m "[message]"``          | add a message for you commit                                                                                         |
| ``[your_branch]`` | ``git checkout staging``               | go back to the ``staging`` so then you can get your changes from your own branch into ``staging``                    |
| ``staging``       | ``git pull``                           | make sure ``staging`` is up-to-date                                                                                  |
| ``staging``       | ``git merge [your_branch]``            | now you can merge your changes to ``staging``                                                                        |
| ``staging``       | ``git push origin staging``            | ``origin staging`` is needed so to ensure git knows where to push your changes                                       |
|                   |                                        | go to Stash and create a pull request, and pray and hope you didn't make any silly mistakes                          |

## SSH

| Command                       | Description                                                                    |
| ------------------------------|--------------------------------------------------------------------------------|
| ``ssh-keygen -b 4096 -t rsa`` | generate 4096-bit RSA-encrypted SSH key                                        |
| ``eval `ssh-agent` ``         | start SSH agent                                                                |
| ``ssh-add ~/.ssh/id_rsa``     | add SSH key so to avoid having to input password every time when using the key | 
