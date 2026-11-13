// Notation of the book. Operators are `math.op`; a symbol that is an object,
// not an operator, is formula content.

// The complex space C^n, the reals, the integers: bold upright capitals,
// as printed (not double-struck).
#let CC = math.upright(math.bold("C"))
#let RR = math.upright(math.bold("R"))
#let ZZ = math.upright(math.bold("Z"))
#let NN = math.upright(math.bold("N"))
#let QQ = math.upright(math.bold("Q"))

// d-bar: the overlined ∂.
#let dbar = $overline(partial)$.body

// Relatively compact, "M ⋐ N".
#let relcomp = sym.subset.double

#let Re = math.op("Re")
#let Im = math.op("Im")
#let supp = math.op("supp")
#let interior = math.op("int")
#let dist = math.op("dist")
#let rank = math.op("rank")
#let grad = math.op("grad")
#let res = math.op("res")
#let Res = math.op("Res")
#let sign = math.op("sign")
#let const = math.op("const")
#let diam = math.op("diam")
#let Hom = math.op("Hom")
#let Ker = math.op("Ker")
#let mes = math.op("mes")

// A bold upright I, the multi-index (1, ..., 1).
#let II = math.upright(math.bold("I"))
#let meas = math.op("meas")

// The push-forward of chains, f with a tilde under it, as printed.
#let utilde(x) = math.accent(x, "\u{0330}")

// The determinant, an operator without limits: "det^(-2) X".
#let det = math.op("det")

// The sign function, "sgn".
#let sgn = math.op("sgn")
