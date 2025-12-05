" https://stackoverflow.com/a/79816940
" A similar thing happened to me when I upgraded to Vim 9.1 (on MacOS Sequoia 15.7.2). Vim 9.1 comes with an official Vim plugin called ColorResp that overrides the background setting for every colorscheme after all .vimrc and plugin files have been loaded. Basicly, it detects how light or dark your terminal window is and then sets background accordingly, which changes the colors of most built-in colorschemes.
" You can confirm your ~/.vimrc is being loaded by using: :scriptnames, which will show all the scripts loaded in the order they are loaded. If you see /usr/share/vim/vim91/plugin/colorresp.vim in there, there's a good chance it's stomping on any custom background settings, including those that may come with your desired colorscheme.
" How it stomps on your settings: ColorResp queries your terminal window and collects the current background color from the terminal response. It then compares the RGB values to a number hardcoded by The Vim Project and decides, based on the brightness of your background, what the background setting should be. Comments from the ColorResp plugin itself:

" Detect light or dark background by parsing OSC 11 RGB background reply
" from terminal. Sum the RGB values roughly; if bright enough, set
" 'background' to 'light', otherwise set it to 'dark'.
" The sneaky thing about ColorResp is that it uses an auto command (shorthand au) to set the background after all other scripts and plugins have loaded by attaching itself to the VimEnter event. Simply using Vim .vim/after/plugin to set your preferences after all plugins load won't work.
" The only way to override it and honor your desired .vimrc setting is to redeclate the auto command group after plugins have been loaded. To do that, create this file ~/.vim/after/plugin/fix-background.vim with these contents:
augroup ColorResp
  au!
  au VimEnter * set background=light
augroup END
