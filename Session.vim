let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/personal/Today
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/personal/Today
badd +1 ~/personal/Todo
badd +66 Today/DetailViewController/ReminderViewController.swift
badd +7 Today/ListViewController/ReminderDoneButton.swift
badd +1 Today/ListViewController/ReminderListViewController+Actions.swift
badd +16388 ~/.local/state/nvim/lsp.log
badd +54 Today/ListViewController/ReminderListViewController.swift
badd +168 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Headers/UINavigationItem.h
badd +9 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Modules/module.modulemap
badd +97 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/UIKit.tbd
badd +11 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Twitter.framework/Headers/TWTweetComposeViewController.h
badd +2 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Social.framework/Social.tbd
badd +14 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Social.framework/Headers/Social.h
badd +84 Today/ListViewController/ReminderListViewController+DataSource.swift
badd +6 Today/Models/Reminder.swift
badd +18 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Headers/UISwipeActionsConfiguration.h
badd +29 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UISwipeActionsConfiguration.h
badd +17 .compile
badd +1 Today/ListViewController
badd +10 Today/Models/ReminderListStyle.swift
badd +19 ~/Library/Developer/Xcode/DerivedData/Today-eyhnacyqmmvyjjfrjadjtdcyojex/Build/Intermediates.noindex/Today.build/Debug-iphonesimulator/Today.build/Objects-normal/arm64/Today.SwiftFileList
badd +15 Today/ListViewController/ProgressHeaderView.swift
badd +1 Today/Info.plist
argglobal
%argdel
$argadd ~/personal/Today
edit Today/ListViewController/ProgressHeaderView.swift
argglobal
balt Today/Info.plist
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 15 - ((14 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 038|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
