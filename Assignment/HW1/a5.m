delete HW5.txt; diary HW5.txt
echo on
%Problem5
%
%5a
mymatrix.name = 'My favorite matrix';
mymatrix.value = [1 1 1 1;1 2 3 4;1 4 9 16;1 8 27 64];
mymatrix.eigenvalue = eig(mymatrix.value);

%5b
mymatr{1} = 'My favorite matrix';
mymatr{2} = [1 1 1 1;1 2 3 4;1 4 9 16;1 8 27 64];
mymatr{3} = eig(mymatr{2});

echo off; diary off