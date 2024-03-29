" https://github.com/freitass/todo.txt-vim/blob/master/syntax/todo.vim

if exists("b:current_syntax")
    finish
endif

syntax  match  TodoDone       '^[xX]\s.\+$'
syntax  match  TodoPriorityA  '^([aA])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityB  '^([bB])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityC  '^([cC])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityD  '^([dD])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityE  '^([eE])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityF  '^([fF])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityG  '^([gG])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityH  '^([hH])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityI  '^([iI])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityJ  '^([jJ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityK  '^([kK])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityL  '^([lL])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityM  '^([mM])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityN  '^([nN])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityO  '^([oO])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityP  '^([pP])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityQ  '^([qQ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityR  '^([rR])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityS  '^([sS])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityT  '^([tT])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityU  '^([uU])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityV  '^([vV])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityW  '^([wW])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityX  '^([xX])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityY  '^([yY])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate
syntax  match  TodoPriorityZ  '^([zZ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,OverDueDate

syntax  match  TodoDate       '\d\{2,4\}-\d\{2\}-\d\{2\}'               contains=NONE
syntax  match  TodoProject    '\(^\|\W\)+[^[:blank:]]\+'                contains=NONE
syntax  match  TodoContext    '\(^\|\W\)@[^[:blank:]]\+'                contains=NONE
syntax  match  TodoUrl        '\(^\|\W\)[[:lower:]]\+://[^[:blank:]]\+' contains=NONE
syntax  match  TodoTag        '\(^\|\W\)[[:lower:]]\+:[:alnum:]\+'   contains=NONE

" Other priority colours might be defined by the user
highlight  default  link  TodoDone       Comment
highlight  default  link  TodoPriorityA  ErrorMsg
highlight  default  link  TodoPriorityB  Red
highlight  default  link  TodoPriorityC  Orange
highlight  default  link  TodoDate       Grey
highlight  default  link  TodoContext    Purple
highlight  default  link  TodoTag        Yellow
highlight  TodoProject    ctermfg=110 guifg=#6dcae8 cterm=bold gui=bold
highlight  TodoUrl        ctermfg=110 guifg=#6dcae8 cterm=underline gui=underline

let b:current_syntax = "todotxt"
