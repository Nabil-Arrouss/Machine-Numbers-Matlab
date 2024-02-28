# Machine Numbers

## Overview
The Machine Numbers project consists of a set of MATLAB functions for working with machine numbers. The provided MATLAB files perform various operations related to machine numbers,
including computation of the real value represented by a machine number, displaying elements of a machine number set on the real axis, finding the machine number that represents
a given real number, and performing addition between machine numbers.
- Tests are available within the source codes 

## Functions

1). fl1.m - Compute Real Value of a Machine Number. Computes the real value represented by a machine number.
    
- Input: Vector with the last coordinate representing the characteristic in the ternary numeral system, and the rest storing the signed mantissa.

- Output: The real number represented by the machine number.

2). fl2.m - Display Elements of a Machine Number Set. Displays the elements of a given machine number set on the real axis. Computes the number of elements and parameters like M ∞, ε 0, ε 1.
   
- Input: Three integer parameters - t, k1, k2 (characteristics of the machine number set).

- Output: Number of elements, M ∞, ε 0, ε 1.

3). fl3.m - Find Machine Number for a Given Real Number. Finds the machine number that represents the given real number.

- Input: Real number and parameters of the set of machine numbers (t, k1, k2).

- Output: Vector with t + 1 coordinates, where the last coordinate is the characteristic and the first t store the signed mantissa.

4). fl4.m - Addition Between Machine Numbers. Performs addition between machine numbers.

- Input: Two vectors representing machine numbers.

- Output: Vector with the machine number representing the sum.
