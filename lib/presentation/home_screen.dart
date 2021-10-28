import 'package:flutter/material.dart';
import 'package:homework2/logic/metric_converter.dart';

class MetricConverterApp extends StatefulWidget {
  const MetricConverterApp({Key? key}) : super(key: key);

  @override
  _MetricConverterAppState createState() => _MetricConverterAppState();
}

class TextWithBlueStyling extends Text {
  const TextWithBlueStyling(String data) : super(data, style: const BlueText());

}
class BlueText extends TextStyle {
  const BlueText() : super(color: Colors.blue, fontWeight: FontWeight.bold);
}
final List<String> _meters = [
  'KM',
  'M',
  'CM',
];


class _MetricConverterAppState extends State<MetricConverterApp> {

  String? _fromMeter;
  String? _toMeter;
  double _enteredNumber = 0;
  double result = 0;
  FocusNode _focusNode = FocusNode();
  TextEditingController _tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextWithBlueStyling("Metrics Converter"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      body:
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  TextWithBlueStyling("Number:"),
                  SizedBox(
                    width:90,
                    height:25,
                    child:
                  TextField(
                    controller: _tec,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.blue,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color:
                        Colors.blue,
                        width: 30
                        )
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        var f = double.tryParse(val);
                        if (f != null)
                          {
                            _enteredNumber = f;
                          }
                      });
                    },
                  )
                  ),
                  //TextWithBlueStyling("50")
                ]
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top:500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const TextWithBlueStyling("Result:"),
                  SizedBox(
                    width:50,
                    child:
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)
    ),
                    child:Text(result.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                  )
                  )
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top:510, left: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Container(
                    decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)
                  ),
                    child:
                      TextButton(
                        child: const Text("CONVERSION", style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          setState(() {
                            double convertedValue = MetricConverter().calculate(_fromMeter ?? "", _toMeter ?? "", _enteredNumber);
                            result = convertedValue.toDouble();
                          });
                        },
                      )
                  ),
                  SizedBox(
                    height: 30,
                    width:90,
                    child:
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    child:
                      TextButton(
                        child: const Text("RESET", style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          setState(() {
                            result = 0;
                          });
                        }
                      )
                  )
                  )
                ]
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top:250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                const Text("From:",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height:30,
                  child:
                      Container(
                        decoration:
                        BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,borderRadius: BorderRadius.circular(50),
                        ),
                        child:
                        DropdownButton(
                  value: _fromMeter ?? _meters[0],
                  style: const TextStyle(color : Colors.blue, fontWeight: FontWeight.bold),
                  items:
                  _meters
                      .map<DropdownMenuItem<String>>( (String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _fromMeter = newValue;
                    });
                  },
                )
                      )
                )
              ]
            )
            ),
            Padding(
                padding: EdgeInsets.only(top:320),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("To:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: 25,
                        child:
                        Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:
                        DropdownButton(
                        style: TextStyle(color : Colors.blue, fontWeight: FontWeight.bold),
                        value: _toMeter ?? _meters[1],
                        items:
                        _meters
                            .map<DropdownMenuItem<String>>( (String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value)
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _toMeter = newValue;
                          });
                        },
                      )
                      )
                      ),

                    ],
                )
            )
          ],
        )
    );
  }
}
