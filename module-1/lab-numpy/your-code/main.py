#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.

np.version.version

#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?

a = np.random.random((2,3,5))

#4. Print a.

print(a)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"

b = np.ones((5,2,3))

#6. Print b.

print(b)

#7. Do a and b have the same size? How do you prove that in Python code?

a.shape == b.shape

#8. Are you able to add a and b? Why or why not?

No, because they have different dimensions.

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".

c = np.transpose(b, (1,2,0))

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?

d = np.add(a,c) 
# It works because they now have the same dimensions

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

print(a,d)
# d is just a with 1 instead of 0 in the units place.


#12. Multiply a and c. Assign the result to e.

e = np.multiply(a,c)

#13. Does e equal to a? Why or why not?

# Yes, because c is all ones.

#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"

d_max = d.max()
d_min = d.min()
d_mean = d.mean()


#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.

f = np.empty((2,3,5))


"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""

aux1 = 0
aux2 = 0
aux3 = 0

for first in d:        
    
    aux2 = 0
    
    for second in first:
        
        aux3 = 0
        
        for x in second:           
            
            if x == d_min:
                f[aux1][aux2][aux3] = 0
            elif x == d_max:
                f[aux1][aux2][aux3] = 100
            elif x == d_mean:
                f[aux1][aux2][aux3] = 50
            elif x >= d_mean:
                f[aux1][aux2][aux3] = 75
            else:
                f[aux1][aux2][aux3] = 25
            
            aux3 +=1  
            
        aux2 +=1  
        
    aux1 += 1  


"""
#17. Print d and f. Do you have your expected f?
For instance, if your d is:
array([[[1.85836099, 1.67064465, 1.62576044, 1.40243961, 1.88454931],
        [1.75354326, 1.69403643, 1.36729252, 1.61415071, 1.12104981],
        [1.72201435, 1.1862918 , 1.87078449, 1.7726778 , 1.88180042]],

       [[1.44747908, 1.31673383, 1.02000951, 1.52218947, 1.97066381],
        [1.79129243, 1.74983003, 1.96028037, 1.85166831, 1.65450881],
        [1.18068344, 1.9587381 , 1.00656599, 1.93402165, 1.73514584]]])

Your f should be:
array([[[ 75.,  75.,  75.,  25.,  75.],
        [ 75.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  75.,  75.,  75.]],

       [[ 25.,  25.,  25.,  25., 100.],
        [ 75.,  75.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  75.,  75.]]])
"""
[[[1.75010216 1.92831493 1.83173651 1.22210927 1.12107516]
  [1.86822744 1.68589396 1.22941082 1.66468302 1.34050242]
  [1.04817178 1.38245809 1.95910295 1.28867581 1.8139714 ]]

 [[1.31864327 1.00989033 1.18704768 1.82437382 1.63646677]
  [1.65621358 1.66810585 1.81810086 1.58559326 1.37026343]
  [1.79991724 1.8390663  1.47387651 1.08259352 1.6904948 ]]]

[[[ 75.  75.  75.  25.  25.]
  [ 75.  75.  25.  75.  25.]
  [ 25.  25. 100.  25.  75.]]

 [[ 25.   0.  25.  75.  75.]
  [ 75.  75.  75.  75.  25.]
  [ 75.  75.  25.  25.  75.]]]

"""
#18. Bonus question: instead of using numbers (i.e. 0, 25, 50, 75, and 100), how to use string values 
("A", "B", "C", "D", and "E") to label the array elements? You are expecting the result to be:
array([[[ 'D',  'D',  'D',  'B',  'D'],
        [ 'D',  'D',  'B',  'B',  'B'],
        [ 'D',  'B',  'D',  'D',  'D']],

       [[ 'B',  'B',  'B',  'B',  'E'],
        [ 'D',  'D',  'D',  'D',  'D'],
        [ 'B',  'D',   'A',  'D', 'D']]])
Again, you don't need Numpy in this question.
"""