### Leen Madani | Assignment 2
### The version of R used: 4.0.3

# readline() function will prompt user to enter a value, which is stored as the varliable "answer".
answer <- readline(prompt = "Please enter a number: ")

# The following will elaborate on the if/else statement used.
# First, a "nested if" is used to make sure answer is numeric. If not, line 32 will be returned.
# If answer is numeric, then it will go through the second nested "if".
# The second "if" will make sure the number is three digits, positive, and narcissistic. If not, line 29 will be returned.
# To check for the number being positive & 3 digits, use answer >= 100 and answer < 1000.
# All three conditions are separated using the "&" operator which will be TRUE only if all conditions are TRUE.
# To extract individual digits from a number, divide by the power of 10 of the digits place then take the modulus (%%) 10.
# For instance, to get the hundreds place, divide by 10^2 and take modulus 10.
# However, this works only for ones place because it is not followed by any number
# For hundreds place, the answer returned will give hundred's place digit followed decimal point and ten's and one's digits.
# For example, (375 / 100) %% 10 = 3.75
# To solve this, i convert number to integer to have it as a whole number only.


if (!is.na(as.numeric(answer))) { # checks if input is a valid numeric value and not NA before proceeding.
  answer <- as.numeric(answer)    # this will convert "answer" into numeric to test it for out conditions (+ and 3 digits)
  
  if (answer >= 100 &
      answer < 1000 &
      answer == (as.integer(answer / 100) %% 10)^3 + (as.integer(answer / 10) %% 10)^3 + (as.integer(answer %% 10))^3) {
    print(paste(answer, "is a narcissistic Armstrong number"))
  } else {
    print(paste(answer, "is NOT a narcissistic Armstrong number"))
  }
} else {
  print("Entry is not valid. Terminating...")
}

#*Code Review: Soumya Shastri 

#*Line 5: Prompt runs well. I would suggest a more specific prompt that tells 
#*the user exactly what you want, in our case we want the user to specifically 
#*enter a three-digit positive number. By saying "enter a number", there is a 
#*greater chance for them to run into an error message and not knowing the reason 
#*behind it. 
#*Line 7-18: Great explanation! Another method to extract digits is using the 
#*strsplit function but what you have works just as well
#*Line 21-22: these functions ensure that the entry is numeric and positive 
#*however, an additional code is required in the outer if statement to ensure the
#*prompt is only three digits since it is also part of the validation task. This can be 
#*done by using the following (nchar(answer) == 3) for example. 
#*I see the range limits you created in lines 24-25 however since it's part of
#*the inner if statement, entering a 4-digit narcissistic number such as 1634
#*will result in a program output saying "is NOT a narcissistic Armstrong number" 
#*when it should actually say "Entry is not valid, Terminating..." 
#*The rest of the program functions as intended, and it is evident why you have 
#*taken particular actions, as indicated by your detailed comments. For upcoming 
#*assignments, I would suggest providing more precise prompts to enable users to 
#*effectively utilize your program. Additionally, exercise caution when dealing 
#*with nested if functions.  Well done, it was a pleasure to review your code :) 





