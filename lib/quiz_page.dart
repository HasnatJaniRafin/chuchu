import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<QuizQuestion> _questions = [
    QuizQuestion(
      question: "1.What is the main ingredient in Peking Duck?",
      options: ["Chicken", "Duck", "Pork", "Beef"],
      answerIndex: 1,
    ),
    QuizQuestion(
      question: " 2.Which of these dishes is traditionally made with tofu?",
      options: ["Sweet and Sour Pork", "Kung Pao Chicken", "Mapo Tofu", "Szechuan Beef"],
      answerIndex: 2,
    ),
    QuizQuestion(
      question: "3.What type of dish is 'Char Siu'?",
      options: ["Steamed Buns", "Stir Fry", "Roast Pork", "Dumplings"],
      answerIndex: 2,
    ),
    QuizQuestion(
      question: "4.Dim sum originated from which Chinese region?",
      options: ["Cantonese", "Szechuan", "Hunan", "Shanghai"],
      answerIndex: 0,
    ),
    QuizQuestion(
      question: "5.Which ingredient is not commonly found in 'Chow Mein'?",
      options: ["Noodles", "Rice", "Bean Sprouts", "Onions"],
      answerIndex: 1,
    ),
    QuizQuestion(
      question: "6.Which festival is associated with eating mooncakes?",
      options: ["Chinese New Year", "Mid-Autumn Festival", "Dragon Boat Festival", "Qingming Festival"],
      answerIndex: 1,
    ),
    QuizQuestion(
      question: "7.What is the primary flavor profile of 'Hot and Sour Soup'?",
      options: ["Sweet and Salty", "Bitter and Umami", "Sour and Spicy", "Sweet and Sour"],
      answerIndex: 2,
    ),
    QuizQuestion(
      question: "8.What is 'Baijiu'?",
      options: ["A type of tea", "A type of beer", "A type of wine", "A type of spirit"],
      answerIndex: 3,
    ),
    QuizQuestion(
      question: "9.What is a common use for 'Five Spice Powder'?",
      options: ["Desserts", "Marinades", "Beverages", "Salads"],
      answerIndex: 1,
    ),
    QuizQuestion(
      question: "10.Which dish is typically served during the Chinese New Year for good luck?",
      options: ["Peking Duck", "Spring Rolls", "Egg Fried Rice", "Sweet and Sour Pork"],
      answerIndex: 1,
    ),
    QuizQuestion(
      question: "11.Which dish is known as a traditional breakfast in Shanghai?",
      options: ["Peking Duck", "Shrimp Dumplings", "Xiaolongbao", "Chow Mein"],
      answerIndex: 2,
    ),
    QuizQuestion(
      question: "12.What is the main ingredient in Congee?",
      options: ["Rice", "Noodles", "Bread", "Potatoes"],
      answerIndex: 0,
    ),
    QuizQuestion(
      question: "13.Which of these ingredients is not typically used in Chinese cooking?",
      options: ["Soy Sauce", "Curry Powder", "Sesame Oil", "Ginger"],
      answerIndex: 1,
    ),
    QuizQuestion(
      question: "14.Gong Bao Ji Ding is better known as what in English?",
      options: ["General Tso's Chicken", "Sweet and Sour Chicken", "Kung Pao Chicken", "Orange Chicken"],
      answerIndex: 2,
    ),
    QuizQuestion(
      question: "15.What does 'Dim Sum' literally mean?",
      options: ["Touch the Heart", "Sweet Treat", "Small Plate", "Morning Delight"],
      answerIndex: 0,
    ),
    QuizQuestion(
      question: "16.Which of these is a common Chinese dessert?",
      options: ["Fortune Cookies", "Egg Tarts", "Chocolate Cake", "Tiramisu"],
      answerIndex: 1,
    ),
    QuizQuestion(
      question: "17.Lanzhou is famous for what kind of noodle dish?",
      options: ["Rice Noodles", "Udon", "Ramen", "Beef Noodles"],
      answerIndex: 3,
    ),
    QuizQuestion(
      question: "18.What is traditionally the main flavor in Zongzi?",
      options: ["Sweet", "Sour", "Bitter", "Salty"],
      answerIndex: 0,
    ),
    QuizQuestion(
      question: "19.Sichuan cuisine is well-known for its:",
      options: ["Sweetness", "Mild Flavors", "Spiciness", "Sour Taste"],
      answerIndex: 2,
    ),
    QuizQuestion(
      question: "20.Which of these is not a traditional Chinese tea?",
      options: ["Oolong", "Pu'er", "Chai", "Jasmine"],
      answerIndex: 2,
    )

    // Add 10 more questions following the same pattern
  ];


  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showFinalResult();
    }
  }

  void _showFinalResult() {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap button to close dialog
      builder: (_) => AlertDialog(
        title: Text(
          "Quiz Completed",
          style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView( // Make the dialog scrollable
          child: ListBody( // Removed the Container for ListBody which is more flexible
            children: [
              Text(
                "Your score:",
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Text(
                "$_score / ${_questions.length}",
                style: TextStyle(fontSize: 36, color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  setState(() {
                    _currentQuestionIndex = 0; // Reset the quiz
                    _score = 0;
                  });
                },
                child: Text('Try Again'),
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _checkAnswer(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex].answerIndex) {
      _score++;
    }
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Food Quiz(20 Q/A) : ChuChu Lover"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.question,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: question.options.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(question.options[index]),
                onTap: () => _checkAnswer(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
