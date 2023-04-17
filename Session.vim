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
badd +2 .compile
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
badd +74 Today/ReminderViewController.swift
badd +18 Today/DetailViewController/ReminderViewController+Row.swift
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
argglobal
%argdel
$argadd ~/personal/Todo
edit Today/ReminderViewController.swift
argglobal
balt ~/personal/Todo
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
let s:l = 71 - ((18 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 71
normal! 024|
lcd ~/personal/Todo
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
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
