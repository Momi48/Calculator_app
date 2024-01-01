import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController inputController = TextEditingController();
  var inputText = '0';
  var answer = '0';
  bool isDone = true;
  bool percentageApplied = false;
  List<String> values = ['C', 'Del', '%', '÷'];
  List<String> numbers = ['7', '8', '9', 'x'];
  List<String> numbers2 = ['4', '5', '6', '-'];
  List<String> numbers3 = ['1', '2', '3', '+'];
  List<String> assigns = ['', '0', '.', '='];
  void equalPressed() {
    String finaluserinput = inputController.text;

    finaluserinput = finaluserinput.replaceAll('x', '*');
    finaluserinput = finaluserinput.replaceAll('÷', '/');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 200,
        ),
        Center(child: Text(answer,style: const TextStyle(fontSize: 35,color: Colors.white),)),
        SizedBox(
          height: 100,
          child: Center(
            child: IntrinsicWidth(
              child: TextFormField(
                controller: inputController,
                showCursor: true,
                readOnly: true,
                onTap: () {
                  setState(() {
                    inputText = inputController.text;
                    
                    // if(isDone == equalPressed){
                    // isDone = isDone = bool.parse(inputController.text);
                    // inputController.text = '0';  
                    //    }
                  });
                },
                maxLines: null,
                decoration: InputDecoration(
                    hintText: answer,
                    hintStyle: const TextStyle(color: Colors.white)),
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // %/ Divisio// Del/C
        Row(
          children: [
            for (int i = 0; i < values.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                        if(i == 0){
                          //C or Reset Button
                          inputController.clear();
                           answer = '0';
                          inputText = '0';
                        }                 
                        if(inputController.text.isNotEmpty){
                        //Delete Button
                      inputController.text =  inputController.text.substring(0,inputController.text.length -1);
                      
                      
                        }
                        else if(i == 2 && !percentageApplied){
                      inputController.text  = (double.parse(inputController.text)/100).toString();
                      inputText = inputController.text;
                      percentageApplied = !percentageApplied;
                        }
                        else if (i == 3){
                          inputController.text += values[i];
                        inputText = inputController.text;
                        
                        } if(inputController.text.isEmpty){
                          inputController.text = '0';
                          print(inputController.text);
                        }
                                                                
                
                 });
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: i == 3 ? Colors.white : Colors.orange,
                    ),
                    child: Center(
                      child: Text(
                        values[i],
                        style: TextStyle(
                          fontSize: 30,
                          color: i == 3 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        // x/7/8/9
        Row(
          children: [
            for (int i = 0; i < numbers.length; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 13),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      inputController.text += numbers[i];
                      inputText = inputController.text;

                      //Multiplcation
                      if (i == 3) {
                        inputText += inputController.text;
                      }
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == 3 ? Colors.white : Colors.orange),
                    child: Center(
                        child: Text(
                      numbers[i],
                      style: TextStyle(
                          fontSize: 30,
                          color: i == 3 ? Colors.black : Colors.white),
                    )),
                  ),
                ),
              ),
          ],
        ),
        Row(
          children: [
            for (int i = 0; i < numbers2.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    inputController.text += numbers2[i];
                    inputText = inputController.text;
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == 3 ? Colors.white : Colors.orange),
                    child: Center(
                        child: Text(
                      numbers2[i],
                      style: TextStyle(
                          fontSize: 30,
                          color: i == 3 ? Colors.black : Colors.white),
                    )),
                  ),
                ),
              ),
          ],
        ),
        // 1,2,3 +
        Row(
          children: [
            for (int i = 0; i < numbers3.length; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    inputController.text += numbers3[i];
                    inputText = inputController.text;
                    if (i == 3) {
                      inputText += inputController.text;
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == 3 ? Colors.white : Colors.orange),
                    child: Center(
                        child: Text(
                      numbers3[i],
                      style: TextStyle(
                          fontSize: 30,
                          color: i == 3 ? Colors.black : Colors.white),
                    )),
                  ),
                ),
              ),
          ],
        ),
        // =/./0
        Row(
          children: [
            for (int i = 0; i < assigns.length; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (i == 1 || i == 2) {
                        // Handle '.' and '=' buttons
                        if (inputController.text.contains('.') || i == 2) {
                          inputController.text += assigns[i];
                          inputText = inputController.text.toString();
                          inputText += inputController.text.toString();
                        }
                      } else {
                        // Handle other buttons
                        equalPressed();
                      }
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == 3 ? Colors.white : Colors.orange),
                    child: Center(
                        child: Text(
                      assigns[i],
                      style: i == 3
                          ? const TextStyle(fontSize: 30, color: Colors.black)
                          : const TextStyle(fontSize: 30, color: Colors.white),
                    )),
                  ),
                ),
              ),
          ],
        ),
      ]),
    );
  }
}
