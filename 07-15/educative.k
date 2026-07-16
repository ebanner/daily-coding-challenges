wo : {x @ & ~ y ~/: x}
in : {(y ? x) < #y}

edges : (1 2 ; 1 3 ; 2 3)

edges

vertices : ? ,/ edges

vertices

groups : ,:' vertices

groups

get : {* x @ & y in/: x}

get[groups;2]

parent : { * get[x;y] }

parent[groups;2]

union : {(,(get[x;y],get[x;z])) , wo[wo[x;get[x;y]];get[x;z]]}

union : {(, ,/ ? (get[x;y];get[x;z])) , wo[wo[x;get[x;y]];get[x;z]]}

union[groups;parent[groups;1];parent[groups;2]]

* & ~': groups {union[x;parent[x;y[0]];parent[x;y[1]]]}\ edges
