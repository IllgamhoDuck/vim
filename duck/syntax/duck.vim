if exists("b:current_syntax")
    finish
endif

syntax keyword duckKeyword for in while
syntax keyword duckKeyword if else elif
syntax keyword duckKeyword class return

syntax keyword duckFunction print join string

syntax match duckComment "\v#.*$"

syntax match duckOperator "\v\+"
syntax match duckOperator "\v-"
syntax match duckOperator "\v\*"
syntax match duckOperator "\v/"
syntax match duckOperator "\v\?"
syntax match duckOperator "\v\+\="
syntax match duckOperator "\v-\="
syntax match duckOperator "\v\*\="
syntax match duckOperator "\v/\="
syntax match duckOperator "\v\="

syntax match duckNumber "\v[0-9]+"
syntax match duckNumber "\v[0-9]+\.[0-9]+"
syntax match duckNumber "\v[0-9]+e[+-][0-9]+"
syntax match duckNumber "\v[0-9]+\.[0-9]+e[+-][0-9]+"
syntax match duckNumber "\v0x[0-9a-fA-F]+"

syntax region duckString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link duckKeyword Keyword
highlight link duckFunction Function
highlight link duckComment Comment
highlight link duckOperator Operator
highlight link duckNumber Number
highlight link duckString String

let b:current_syntax = "duck"
