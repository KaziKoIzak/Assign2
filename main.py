import math

# Global Array
my_list = [3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121]

def multiple():
    for number in my_list:
        if number % 1001 == 0:
            print(f"The number {number} is a multiple of 7, 11, 13")
        elif number % 77 == 0:
            print(f"The number {number} is a multiple of 7, 11")
        elif number % 91 == 0:
            print(f"The number {number} is a multiple of 7, 13")
        elif number % 143 == 0:
            print(f"The number {number} is a multiple of 11, 13")
        elif number % 11 == 0:
            print(f"The number {number} is a multiple of 11")
        elif number % 7 == 0:
            print(f"The number {number} is a multiple of 7")
        elif number % 13 == 0:
            print(f"The number {number} is a multiple of 13")
        else:
            print(f"The number {number} is not a multiple of 7, 11, 13")

def sum_digits():
    for number in my_list:
        original_number = number
        digit_sum = sum(int(digit) for digit in str(number))
        is_even = digit_sum % 2 == 0
        print(f"The sum of the digits for {original_number} is {digit_sum} which is {'Even' if is_even else 'Odd'}")

def is_prime():
    for number in my_list:
        is_prime_number = all(number % i != 0 for i in range(2, int(math.sqrt(number)) + 1))
        print(f"The number {number} is{' ' if is_prime_number else ' not '}a prime")

def is_palindrome():
    for number in my_list:
        original_number = number
        reversed_number = int(str(number)[::-1])
        is_palindrome_number = original_number == reversed_number
        print(f"The number {reversed_number} is{' ' if is_palindrome_number else ' not '}a Palindrome of itself")

def part_a():
    print("Part A of Assignment")
    print("Multiple check of 7, 11, and 13")
    multiple()
    print("\nSum Check if Odd or Even Digits")
    sum_digits()
    print("\nCheck if the number is a prime")
    is_prime()
    print("\nCheck if the number is a palindrome")
    is_palindrome()

def array_sorter(arr):
    # Bubble sort algorithm
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - i - 1):
            # Swap if the element found is greater than the next element
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

def part_b():
    print("\n\nPart B of the Assignment")

    # Declare float arrays
    system = [1.23,2341.2134,12432, .5675, .5745, .584568]
    programming = [1.23, 2341.3452,.0001293, .83927841, .297348]

    # Print the arrays before they were sorted
    print("Arrays Before Sorted")
    print(system)
    print(programming)

    # Sort the arrays
    array_sorter(system)
    array_sorter(programming)

    print("\nArrays After Sorted")

    # Print the arrays after sorting
    print(system)
    print(programming)

    # Combine and remove duplicates
    merged_array = list(dict.fromkeys(system + programming))

    print("\nMerged Array")
    print(merged_array)

def main():
    # Run part a then b
    part_a()

    print("-------------------------------------------------------------------")

    part_b()

if __name__ == "__main__":
    main()

