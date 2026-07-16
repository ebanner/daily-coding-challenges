wo : {x @ & ~ y ~/: x}
in : {(y ? x) < #y}
get : {* x @ & y in/: x}
parent : { * get[x;y] }

union : {(, ,/ ? (get[x;y];get[x;z])) , wo[wo[x;get[x;y]];get[x;z]]}

{
  vertices : ? ,/ x
  groups : ,:' vertices
  edges @ * & ~': groups {union[x;parent[x;y[0]];parent[x;y[1]]]}\ edges
}
