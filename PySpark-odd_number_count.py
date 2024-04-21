#AIM: to implement a  PySpark application to find count of odd nos in a csv file

from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("Odd Numbers Count").getOrCreate()
df = spark.read.csv("odd.csv", header=True)
def is_odd(n):
    return n % 2 != 0
odd = df.rdd.flatMap(lambda line: line[0].split(" ")) \
                  .map(lambda num: int(num)) \
                  .filter(is_odd) \
                  .collect()
count = len(odd)
print(f"Odd numbers: {odd} \nCount of odd numbers = {count}")
#find the factorial of each odd number
def fact(n):
	if (n==0 or n==1):
		return 1
	return n*fact(n-1)
print("Odd  Factorial")
for n in odd:
	print(f"{n}\t{fact(n)}")

'''
_____________________________________________________
input: [odd.csv]
number
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
_____________________________________________________
output:
Odd numbers: [1, 3, 5, 7, 9, 11, 13, 15, 17, 19] 
Count of odd numbers = 10
Odd  Factorial
1	    1
3	    6
5	    120
7	    5040
9	    362880
11	  39916800
13	  6227020800
15	  1307674368000
17	  355687428096000
19	  121645100408832000
'''
