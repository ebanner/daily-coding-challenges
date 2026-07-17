fours : 4 9 40 90 400 900
ones : 1 5 10 50 100 500 1000
fours : 4 9 40 90 400 900
keys : 1 4 5 9 10 40 50 90 100 400 500 900 1000
values : ("I";"IV";"V";"IX";"X";"XL";"L";"XC";"C";"CD";"D";"CM";"M")

digit : {0 $ * $ x}

{
  nums : _abs -': {:[x=0;0; (9=digit[x])|(4=digit[x]);x-fours@*|&~x<fours; x-ones@*|&~x<ones]}\x;
  values[keys ?/: nums]
}
