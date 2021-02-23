import 'package:flutter/material.dart';

class LuasPage extends StatefulWidget {
  @override
  _LuasPageState createState() => _LuasPageState();
}

class _LuasPageState extends State<LuasPage> {
  final panjangController = TextEditingController();
  final lebarController = TextEditingController();
  String hasil = "";
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    panjangController.dispose();
    lebarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Menghitung Luas Persegi Panjang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorColor: Colors.green,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Panjang';
                    }
                    return null;
                  },
                  controller: panjangController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Panjang',
                    suffixText: 'm',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.green,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Masukkan Lebar';
                    }
                    return null;
                  },
                  controller: lebarController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Lebar',
                    suffixText: 'm',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() => hasil = "Luasnya adalah : " +
                          (int.parse(panjangController.text) *
                                  int.parse(lebarController.text))
                              .toString() +
                          " m2");
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  child: Text(
                    'Hitung',
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
                  "$hasil",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
