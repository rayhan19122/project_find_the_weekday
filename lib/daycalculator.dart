import 'package:flutter/material.dart';

class DayCalc extends StatefulWidget{
  const DayCalc({super.key});

  @override
  State<DayCalc> createState() => _DayCalcState();
}

class _DayCalcState extends State<DayCalc>{
  final dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void calcDay(){
    DateTime date = DateTime.parse(dateController.text);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Day Calculator',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child:Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Enter Date',
                      hintText: 'DD/MM/YYYY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Date';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 24),

                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          calcDay();
                        }
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize:18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}