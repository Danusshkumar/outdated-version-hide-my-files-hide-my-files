import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';// importing math expression (for evaluating expression)
import 'package:hide_my_files/uiForCalculator.dart';//uiForCalculator import

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:Scaffold(
        body:CalculatorPage(),
      ),
    );
  }
}


class CalculatorPage extends StatefulWidget {//basic calculator stateful widget
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorPage> {//state of calculator widget
  String eqn = "0";//variable for storing equation
  String result = "0";//variable for storing result
  String theme = "black";//variable for storing theme

  void equals(){//function when equal symbol is pressed
    if(eqn == "1234"){
      Navigator.pushReplacementNamed(context,'home');
    }
    eqn = (eqn.length <= 10 )? eqn: eqn.substring(0,10);
    eqn = eqn.replaceAll("×","*");// for correct operators (for evaluation purpose)
    eqn = eqn.replaceAll("÷","/");
    Parser p = Parser();//parser
    Expression exp = p.parse(eqn);//parsing the eqn
    ContextModel cm = ContextModel();//adding contextModel
    result = exp.evaluate(EvaluationType.REAL,cm).toString();//integrating and converting into string
    if(result.length > 14 && !result.contains(".0")){// It's double value
      result = result.substring(0,14);// limit the double value's accuracy to fill the page
    }
    else if(result.length > 9){//this is normal value but must not exclude 14 (including .0)
      result = "Limit Exceeded";
    }
    result = (result.contains(".0")) ? result.substring(0,result.length-2) : result;
    eqn = eqn.replaceAll("*","×");// for displaying purpose
    eqn = eqn.replaceAll("/","÷");
  }
  void setStateRow0(btnRow0Txt){//important conditions for column 1 buttons
    if(btnRow0Txt == "AC"){
      eqn = "0";
      result = "0";
    }//AC button
    else {
      if(eqn == "0"){
        eqn = btnRow0Txt;
      }// if initially the eqn is 0 then neglect zero
      else {
        eqn += btnRow0Txt;
      }
    }// 0 button
  }
  void setStateRow1(btnRow1Txt){//important condition for column two buttons
    if(eqn == "0"){
      if(btnRow1Txt == "00"){
        eqn = eqn;
      }
      else if(btnRow1Txt != "%"){// % is an exception which has special meaning
        eqn = btnRow1Txt;
      }
    }//if initially it is zero then neglect the zero from eqn
    else {
      if(btnRow1Txt == "%" && (eqn[eqn.length - 1]== "+"||eqn[eqn.length - 1]== "-"||eqn[eqn.length - 1]== "×"||eqn[eqn.length - 1]== "÷" || eqn[eqn.length - 1] == "%")){
        // if % is pressed after a operator that must be prohibited
        eqn = eqn;
      }
      else {
        eqn += btnRow1Txt;
      }
    }
  }
  void setStateRow2(btnRow2Txt){//important condition for column three buttons
    if(btnRow2Txt == "<"){
      if(eqn == "0"){
        eqn = eqn;
      }// when 0 is there no undo
      else {
        eqn = (eqn.length == 1)? "0" : eqn.substring(0, eqn.length - 1);// if the last number is undo' ed then display 0
      }// if not zero do undo
    }
    else {
      if(eqn == "0"){
        eqn = btnRow2Txt;
      }// if initially it is zero then eqn neglect zero
      else {//for not typing two points
        if(btnRow2Txt == "." && eqn[eqn.length - 1] == "."){
          eqn = eqn;
        }
        else {
          eqn += btnRow2Txt;
        }
      }
    }//this is for other buttons
  }
  void setStateRow3(btnRow3Txt){//important condition for column 4 button
    if(eqn[eqn.length - 1]== "+"||eqn[eqn.length - 1]== "-"||eqn[eqn.length - 1]== "×"||eqn[eqn.length - 1]== "÷"||eqn[eqn.length - 1] == "%"){
      eqn = eqn;
    }
    else if(btnRow3Txt == "="){
      equals();
    }
    else {
      eqn += btnRow3Txt;
    }//no two operators should be pressed
  }

  Widget buttonRow(List<String> text){//defining button row

    List txtBtn = text;//copying text to txtBtn

    return Row(
      children:
      txtBtn.map(//Successfully created the map function of row element to the containers
            (text)=> Container(//map function returns
          height:CalcUI.btnRowContHeight(context),
          width:CalcUI.btnRowContWidth(context),
          padding:CalcUI.btnRowContPadding(context),//to decrease the size of button
          child: Flex(//for error rectification purpose
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: TextButton(
                    style:CalcUI.numPadTxtBtnStyle(text,context,theme),
                    onPressed:(){
                      setState(
                              (){
                            if(text == "AC"||text == "7"||text == "4"||text == "1"||text == "0"){
                              setStateRow0(text);// calling setState corresponding functions
                            }
                            else if(text == "%"||text == "8"||text == "5"||text == "2"||text == "00"){
                              setStateRow1(text);//calling setState corresponding functions
                            }
                            else if(text == "<"||text == "9"||text == "6"||text == "3"||text == "."){
                              setStateRow2(text);//calling setState corresponding functions
                            }
                            else{
                              setStateRow3(text);//calling setState corresponding functions
                            }
                          }
                      );//setState Ending
                    },
                    child:(text == "<")? Icon(Icons.backspace_outlined,size:CalcUI.numPadTxtAndIconSize(context) ,color:CalcUI.iconAndOprColor(theme)):Text(text),// for backspace symbol
                  ),
                ),
              ]
          ),
        ),
      ).toList(),//children
    );
  }
  @override
  Widget build(BuildContext context) {//builder widget
    return Container(
      padding:EdgeInsets.symmetric(horizontal:CalcUI.calcContPadding(context)),
      color:CalcUI.calcContColor(theme),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.end,
        crossAxisAlignment:CrossAxisAlignment.end,
        children:[
          Container(
            alignment:Alignment.centerLeft,
            height:CalcUI.iconContHeight(context),
            child:IconButton(
              onPressed:(){
                setState(
                        (){
                      if(theme == "black") { theme = "white";}
                      else{theme = "black";}
                    }
                );
              },
              icon:Icon(
                Icons.brightness_6,
                color:CalcUI.iconColor(theme),
                size:CalcUI.iconContHeight(context),
              ),
            ),
          ),
          Container(
            padding:const EdgeInsets.symmetric(vertical:10),
            color:Colors.red.withOpacity(0),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.end,
              children:[
                Text(
                  (eqn.length <= 20 )?eqn: eqn.substring(0,20),
                  style:CalcUI.eqnStyle(context,theme),
                ),
                Text(
                  result,
                  style:CalcUI.resultStyle(result,context,theme),
                ),
              ],
            ),
          ),
          Divider(color:CalcUI.dividerColor(theme),height:20),
          Column(
            children:[
              buttonRow(["AC","%","<","÷"]),
              buttonRow(["7","8","9","×"]),
              buttonRow(["4","5","6","-"]),
              buttonRow(["1","2","3","+"]),
              buttonRow(["0","00",".","="]),
            ],
          ),
        ],
      ),
    );
  }
}