''' AIM: Write a menu driven R program to 
        a) use merge function to combine 2 datasets
        b) write palindrome in a dataframe and write the palindrome sequences in that to separate files 
        c) use apply function to find max of each row and column
        d) find factorial of all Fibonacci nos in a dataframe
'''

combine <- function() {
  df1 <- data.frame(ID = c(1, 2, 3), Name = c("Alice", "Bob", "Charlie"))
  df2 <- data.frame(ID = c(2, 3, 4), Age = c(25, 30, 35))
  df_merged <- merge(df1, df2, by = "ID")
  print(df1)
  print(df2)
  print(df_merged)
}
palindromes <- function() {
  strings_list <- list(c("h", "e", "l", "l", "o"), c("m", "a", "d", "a", "m"), c("r","a", "c", "e", "c", "a","r"),c("d", "a", "d"), c("h","i"))
  df <- data.frame(strings = I(strings_list))
  print(df)
  is_palindrome <- function(s) {
          return(tolower(s) == tolower(rev(s)))
  }
  df$palindrome <- sapply(df$strings, is_palindrome)
  df_palindromes <- df[df$palindrome, ]
  df_palindromes$strings <- sapply(df_palindromes$strings, paste, collapse = "")
  cat("Palindromes: ", paste(df_palindromes$strings, collapse = ", "))
  write.table(sapply(df_palindromes$strings, paste, collapse = ""), file = "palindromes.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)
}
row_col_max <- function() {
  df <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3)
  max_each_row <- apply(df, 1, max)
  max_each_col <- apply(df, 2, max)
  print(df)
  cat("Max of each row =", max_each_row, "\nMax of each column =", max_each_col)
}
fibofact <- function() {
  df <- data.frame(a = c(1, 2, 3, 5, 8), b = c(6, 7, 9, 10, 13))
  is_fibonacci <- function(n) {
    x <- 5 * n^2
    as.integer(sqrt(x + 4)) == sqrt(x + 4) || as.integer(sqrt(x - 4)) == sqrt(x - 4)
  }
  df_fib <- apply(df, 2, function(col) sapply(col, is_fibonacci))
  fib_numbers <- df[df_fib]
  fib_factorial <- factorial(fib_numbers)
  result <- data.frame(Fibonacci = fib_numbers, Factorial = fib_factorial)
  print(result)
}
cat("1.Combine 2 datasets  2.Palindrome  3.Max of row & column  4. Factorial of fibonacci number  5.Exit")
while(TRUE) {
  cat("\nEnter your choice: ")
  choice <- as.integer(readLines(n = 1))
  switch(choice, "1" = combine(), "2" = palindromes(), "3" = row_col_max(), "4" = fibofact(), "5" = break, cat("Invalid choice !\n"))
}

'''
_____________________________________________________
output:
1.Combine 2 datasets  2.Palindrome  3.Max of row & column  4. Factorial of fibonacci number  5.Exit
Enter your choice: 1
  ID    Name
1  1   Alice
2  2     Bob
3  3 Charlie
  ID Age
1  2  25
2  3  30
3  4  35
  ID    Name Age
1  2     Bob  25
2  3 Charlie  30

Enter your choice: 2
       strings
1 h, e, l,....
2 m, a, d,....
3 r, a, c,....
4      d, a, d
5         h, i
Palindromes:  madam, racecar, dad
                                  [palindromes.txt file contains these palindrome words]

Enter your choice: 3
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
Max of each row = 7 8 9 
Max of each column = 3 6 9

Enter your choice: 4
  Fibonacci  Factorial
1         1          1
2         2          2
3         3          6
4         5        120
5         8      40320
6        13 6227020800

Enter your choice: 5
'''
