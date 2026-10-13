import 'dart:io';

int getIntegerInput(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();

    try {
      if (input == null || input.trim().isEmpty) {
        throw FormatException("Input cannot be empty.");
      }
      int value = int.parse(input.trim());
      return value; 
    } on FormatException catch (e) {
     
      print("Error: ${e.message} Please enter a valid integer.");
    } catch (e) {

      print("Unexpected error: $e");
    }
  }
}

int factorial(int n) {
  if (n < 0) {
    throw ArgumentError("Factorial is not defined for negative numbers.");
  }
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

void main() {
  print("=== Factorial Calculator ===");

  while (true) {
    int number = getIntegerInput("Enter a non-negative integer: ");

    try {
      int fact = factorial(number);
      print("Factorial of $number is: $fact");
    } on ArgumentError catch (e) {
      print("Error: ${e.message}");
    }
    stdout.write("Do you want to calculate another factorial? (y/n): ");
    String? choice = stdin.readLineSync();
    if (choice == null || choice.toLowerCase() != 'y') {
      print("Goodbye!");
      break; // Exit loop
    }
  }
}
