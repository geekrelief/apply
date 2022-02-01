import std / macros

macro apply*(fun, args: typed): untyped =
  result = newCall(fun)
  var funArgLen = getType(fun).len - 2
  case args.kind:
    of nnkBracket:
      for a in args:
        result.add a
    of nnkPrefix:
      if args[0].repr == "@":
        for a in args[1]:
          result.add a
    of nnkTupleConstr:
      for a in args:
        result.add a
    of nnkSym:
      for i in 0..<funArgLen:
        var b = newTree(nnkBracketExpr)
        b.add args
        b.add newLit(i)
        result.add b
    else: 
      error("unsupported kind: " & $args.kind & ", " & args.repr)
      discard