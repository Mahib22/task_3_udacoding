import 'package:flutter/material.dart';

class KonversiPage extends StatefulWidget {
  @override
  _KonversiPageState createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  String _startMeasure;
  String _convertedMeasure;
  double _numberForm;
  String _resultMessage;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    _numberForm = 0;
    super.initState();
  }

  final List<String> _measures = [
    'kilometer',
    'hektometer',
    'dekameter',
    'meter',
    'desimeter',
    'centimeter',
    'milimeter',
  ];

  final Map<String, int> _measuresMap = {
    'kilometer': 0,
    'hektometer': 1,
    'dekameter': 2,
    'meter': 3,
    'desimeter': 4,
    'centimeter': 5,
    'milimeter': 6,
  };

  dynamic _formulas = {
    '0': [1, 10, 100, 1000, 10000, 100000, 1000000],
    '1': [0.1, 1, 10, 100, 1000, 10000, 100000],
    '2': [0.01, 0.1, 1, 10, 100, 1000, 10000],
    '3': [0.001, 0.01, 0.1, 1, 10, 100, 1000],
    '4': [0.0001, 0.001, 0.01, 0.1, 1, 10, 100],
    '5': [0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10],
    '6': [0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1],
  };

  void convert(double value, String from, String to) {
    int nFrom = _measuresMap[from];
    int nTo = _measuresMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0) {
      _resultMessage = 'Konversi Tidak Dapat Dilakukan';
    } else {
      _resultMessage =
          '${_numberForm.toString()} $_startMeasure = ${result.toString()} $_convertedMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Konversi Nilai Satuan Panjang',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Masukkan Nilai';
                  }
                  return null;
                },
                cursorColor: Colors.green,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nilai',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberForm = rv;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  DropdownButton(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    hint: Text(
                      "Satuan",
                      style: TextStyle(fontSize: 18),
                    ),
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _startMeasure = value;
                      });
                    },
                    value: _startMeasure,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.green,
                    size: 24.0,
                  ),
                  Spacer(),
                  DropdownButton(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    hint: Text(
                      "Satuan",
                      style: TextStyle(fontSize: 18),
                    ),
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value;
                      });
                    },
                    value: _convertedMeasure,
                  ),
                ],
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (_startMeasure.isEmpty ||
                        _convertedMeasure.isEmpty ||
                        _numberForm == 0) {
                      return;
                    } else {
                      convert(_numberForm, _startMeasure, _convertedMeasure);
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                child: Text(
                  'Konversi',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                color: Colors.green,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                (_resultMessage == null) ? '' : _resultMessage,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
