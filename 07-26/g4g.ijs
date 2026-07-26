nodes =: 7 6 5 4 3 2 1 0
children =: (6 5);(4 3);(2 1);0;0;0;0;0

< ; /:~ children {~ nodes i. ; frontier

frontier =: < 6 5

step =: {{< ; /:~ children {~ nodes i. ; y}}

step ^: a: < 7

step ^: 4 ] 7

<7
