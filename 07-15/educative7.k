wo:{x@&~y~/:x}
in:{(y?x)<#y}
get:{*x@&y in/:x}
p:{*get[x;y]}
union:{(,,/?(get[x;y];get[x;z])),wo[wo[x;get[x;y]];get[x;z]]}
{ 
  v:?,/x ;
  g:,:'v ;
  x@*&~':g{union[x;p[x;y[0]];p[x;y[1]]]}\x
}
