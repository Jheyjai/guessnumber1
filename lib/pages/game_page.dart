import 'package:flutter/material.dart';

import '../game.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();
  var _feedbackText = '';

  // override
  void handleClickGuess() {
    print('Button clicked!');
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if(guess==null){
      //แจ้งerror
      print('input error');
      setState(() {
        _feedbackText = ('Input Error ,Please try again');
      });

    }else{
      var result = _game.doGuess(guess);
      if(result==Result.tooHigh){
        print('Too High');
        setState(() {
          _feedbackText = ('Too High,Please try again');
        });
      }else if(result == Result.tooLow){
        print('Too Low');
        setState(() {
          _feedbackText = ('Too Low ,Please try again');
        });
      }else{
        print('Good Job!');
        setState(() {
          _feedbackText = ('Good Job!');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess the Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please enter number between 1 and 100'),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            // Callback function
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('GUESS'),
            ),Text(_feedbackText)

          ],
        ),
      ),
    );
  }
}