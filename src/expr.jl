# This file contains default definitions for TermInterface methods on Julia
# Builtin Expr type.

isexpr(x::Expr) = true
iscall(x::Expr) = x.head == :call

head(e::Expr) = e.head
children(e::Expr) = e.args

operation(e::Expr) = iscall(e) ? first(children(e)) : error("operation called on a non-function call expression")
arguments(e::Expr) = iscall(e) ? @view(e.args[2:end]) : error("arguments called on a non-function call expression")

maketerm(::Type{Expr}, head, args, metadata) = Expr(Symbol(head), args...)
