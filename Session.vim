let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/personal/Todo
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/personal/Todo
badd +29 Today/ReminderListViewController.swift
badd +363 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UICollectionView.h
badd +1158 ~/nvim-nightly/share/nvim/runtime/lua/vim/lsp/util.lua
badd +59 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UICollectionViewCompositionalLayout.h
badd +23 Today/Models/Date+Today.swift
badd +12 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/swift/UIKit.swiftmodule/x86_64-apple-ios-simulator.swiftinterface
badd +12 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/Foundation.framework/Modules/Foundation.swiftmodule/x86_64-apple-ios-simulator.swiftinterface
badd +29 Today/ListViewController/ReminderListViewController+DataSource.swift
badd +20 .compile
badd +26 Today/Models/Reminder.swift
badd +1 buildServer.json
badd +19 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Headers/UICollectionViewListCell.h
badd +17 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UICollectionViewListCell.h
badd +1 Today/ListViewController
badd +48 Today/Models/UIColor+Today.swift
badd +1 Today/Assets.xcassets/TodayListCellBackground.colorset/Contents.json
badd +2 Configuration/SampleCode.xcconfig
badd +127 term://~/personal/Todo//15095:/bin/zsh
badd +2 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/swift/UIKit.swiftmodule/arm64-apple-ios-simulator.swiftinterface
badd +47 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UIImageSymbolConfiguration.h
badd +90 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UIImage.h
badd +60 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UIControl.h
badd +44 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Headers/UIButton.h
badd +353 Today.xcodeproj/project.pbxproj
badd +11 Today/ListViewController/ReminderListController+Actions.swift
badd +38 Today/ReminderViewController.swift
badd +5 Today/DetailViewController/ReminderViewController+Row.swift
badd +22 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UICollectionViewController.h
badd +181 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UIFontDescriptor.h
badd +1 Today/DetailViewController
badd +10 Today/SceneDelegate.swift
badd +8 makefile
badd +1 Today
badd +16 Today/AppDelegate.swift
badd +27 Today/DetailViewController/ReminderViewController+Section.swift
badd +1 ~/Library/Developer/Xcode/DerivedData/Today-etvqmfyxdcoqnmelnkprhievgwqw/Build/Intermediates.noindex/Today.build/Debug-iphonesimulator/Today.build/Objects-normal/arm64/Today.SwiftFileList
badd +356 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/UIKit.framework/Headers/UIViewController.h
badd +15352 ~/.local/state/nvim/lsp.log
badd +26 Today/DetailViewController/ReminderViewController+CellConfiguration.swift
badd +16 Today/ContentViews/UIView+PinnedSubview.swift
argglobal
%argdel
$argadd ~/personal/Todo
edit Today/ContentViews/UIView+PinnedSubview.swift
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 160 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 159 + 160) / 320)
argglobal
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
let s:l = 8 - ((7 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 013|
lcd ~/personal/Todo
wincmd w
argglobal
if bufexists(fnamemodify("~/personal/Todo/Today/DetailViewController/ReminderViewController+CellConfiguration.swift", ":p")) | buffer ~/personal/Todo/Today/DetailViewController/ReminderViewController+CellConfiguration.swift | else | edit ~/personal/Todo/Today/DetailViewController/ReminderViewController+CellConfiguration.swift | endif
if &buftype ==# 'terminal'
  silent file ~/personal/Todo/Today/DetailViewController/ReminderViewController+CellConfiguration.swift
endif
balt ~/personal/Todo/Today/ReminderViewController.swift
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
let s:l = 26 - ((25 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 26
normal! 040|
lcd ~/personal/Todo
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 160 + 160) / 320)
exe 'vert 2resize ' . ((&columns * 159 + 160) / 320)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
