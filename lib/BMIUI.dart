import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  var WtController = TextEditingController();
  var ftController = TextEditingController();
  var InController = TextEditingController();

  var result;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "BMI ( Body Mass Index )",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                controller: WtController,
                decoration: const InputDecoration(
                  label: Text("Enter Weight"),

                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                 controller: ftController,
                decoration: const InputDecoration(
                  label: Text("Enter Height In Feet"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                 controller: InController,
                decoration: const InputDecoration(
                  label: Text("Enter Height In Inch"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      var TotalWeight = WtController.text.toString();
                      var TotalFeet = ftController.text.toString();
                      var TotalInch = InController.text.toString();

                      if(TotalWeight!="" && TotalFeet!="" && TotalInch!=""){

                        var IntWeight= int.parse(TotalWeight);
                        var IntFeet = int.parse(TotalFeet);
                        var IntInch = int.parse(TotalInch);

                        var TInch = (IntFeet*12) + IntInch;
                        var TotalCm = TInch * 2.54;
                        var TotalMeter = TotalCm/100;

                        var BMI = IntWeight/(TotalMeter*TotalMeter);



                        var message;
                        if (BMI < 18.5) {
                          message = "You are UnderWeighted";
                        } else if (BMI >= 18.5 && BMI < 25) {
                          message = "You Wight Is Normal ";
                        } else {
                          message = "You are Over Weighted";
                        }

                        setState(() {
                           result = "$message \n Your BMI is: ${BMI.toStringAsFixed(2)}";
                        });

                      }else{
                        setState(() {
                          result = "Please Fill All The Required Fields ";
                        });
                      }

                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    child: const Text(
                      "Calculate BMI ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(result??"" , style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      ),
    );
  }
}





