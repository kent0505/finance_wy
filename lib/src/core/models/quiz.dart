import 'package:flutter/material.dart';

class Quiz {
  Quiz({
    required this.question,
    required this.answers,
  });

  final String question;
  final List<Answer> answers;
}

class Answer {
  Answer({
    required this.title,
    required this.isCorrect,
    this.color = Colors.white,
  });

  final String title;
  final bool isCorrect;
  Color color;
}

List<Quiz> quizesList = [
  Quiz(
    question: 'A number that doesn\'t have its own number?',
    answers: [
      Answer(title: '0', isCorrect: true),
      Answer(title: '1', isCorrect: false),
      Answer(title: '2', isCorrect: false),
      Answer(title: '10', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The smallest prime number?',
    answers: [
      Answer(title: '0', isCorrect: false),
      Answer(title: '2', isCorrect: true),
      Answer(title: '1', isCorrect: false),
      Answer(title: '3', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'A three-digit number where the sum of the digits is 9?',
    answers: [
      Answer(title: '234', isCorrect: true),
      Answer(title: '129', isCorrect: false),
      Answer(title: '351', isCorrect: false),
      Answer(title: '150', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The square root of 64?',
    answers: [
      Answer(title: '7', isCorrect: false),
      Answer(title: '8', isCorrect: true),
      Answer(title: '6', isCorrect: false),
      Answer(title: '9', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'An even number that isn’t prime?',
    answers: [
      Answer(title: '2', isCorrect: false),
      Answer(title: '10', isCorrect: true),
      Answer(title: '7', isCorrect: false),
      Answer(title: '3', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The largest one-digit odd number?',
    answers: [
      Answer(title: '7', isCorrect: false),
      Answer(title: '8', isCorrect: false),
      Answer(title: '9', isCorrect: true),
      Answer(title: '10', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'A number that is divisible by 2, 3, and 5?',
    answers: [
      Answer(title: '20', isCorrect: false),
      Answer(title: '30', isCorrect: true),
      Answer(title: '10', isCorrect: false),
      Answer(title: '15', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the square of 5?',
    answers: [
      Answer(title: '15', isCorrect: false),
      Answer(title: '20', isCorrect: false),
      Answer(title: '25', isCorrect: true),
      Answer(title: '30', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The smallest multiple of 6?',
    answers: [
      Answer(title: '6', isCorrect: true),
      Answer(title: '12', isCorrect: false),
      Answer(title: '3', isCorrect: false),
      Answer(title: '0', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The only even prime number?',
    answers: [
      Answer(title: '1', isCorrect: false),
      Answer(title: '2', isCorrect: true),
      Answer(title: '3', isCorrect: false),
      Answer(title: '4', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The smallest number that is not a prime?',
    answers: [
      Answer(title: '4', isCorrect: true),
      Answer(title: '1', isCorrect: false),
      Answer(title: '2', isCorrect: false),
      Answer(title: '3', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'A number that is both a square and a cube?',
    answers: [
      Answer(title: '16', isCorrect: false),
      Answer(title: '25', isCorrect: false),
      Answer(title: '64', isCorrect: true),
      Answer(title: '81', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What number is halfway between 1 and 9?',
    answers: [
      Answer(title: '5', isCorrect: true),
      Answer(title: '4', isCorrect: false),
      Answer(title: '6', isCorrect: false),
      Answer(title: '3', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The first positive integer divisible by 7?',
    answers: [
      Answer(title: '14', isCorrect: false),
      Answer(title: '7', isCorrect: true),
      Answer(title: '21', isCorrect: false),
      Answer(title: '3', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which of these numbers is a power of 2?',
    answers: [
      Answer(title: '5', isCorrect: false),
      Answer(title: '8', isCorrect: true),
      Answer(title: '3', isCorrect: false),
      Answer(title: '10', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The first number in the Fibonacci sequence after 1?',
    answers: [
      Answer(title: '3', isCorrect: false),
      Answer(title: '2', isCorrect: true),
      Answer(title: '4', isCorrect: false),
      Answer(title: '5', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'A prime factor of 91?',
    answers: [
      Answer(title: '2', isCorrect: false),
      Answer(title: '7', isCorrect: true),
      Answer(title: '11', isCorrect: false),
      Answer(title: '9', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'The sum of the first three prime numbers?',
    answers: [
      Answer(title: '10', isCorrect: true),
      Answer(title: '12', isCorrect: false),
      Answer(title: '7', isCorrect: false),
      Answer(title: '8', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is 7 multiplied by 8?',
    answers: [
      Answer(title: '48', isCorrect: false),
      Answer(title: '56', isCorrect: true),
      Answer(title: '49', isCorrect: false),
      Answer(title: '58', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'A number with exactly two factors?',
    answers: [
      Answer(title: '1', isCorrect: false),
      Answer(title: '2', isCorrect: true),
      Answer(title: '4', isCorrect: false),
      Answer(title: '6', isCorrect: false),
    ],
  ),
];
