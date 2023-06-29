import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class TelaCheckup extends StatefulWidget {
  @override
  _TelaCheckupState createState() => _TelaCheckupState();
}

class _TelaCheckupState extends State<TelaCheckup> {
  final _dateController = MaskedTextController(mask: '00/00/0000');
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkup Médico'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  'assets/images/check.png',
                  height: 140,
                ),
              ),
              const SizedBox(height: 180.0),
              TextField(
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Data último chechup médico',
                  hintText: '(dd/mm/aaaa)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String inputDateText = _dateController.text;
                  DateTime inputDate = DateFormat('dd/MM/yyyy').parse(inputDateText, true);
                  DateTime currentDate = DateTime.now();
                  if (currentDate.difference(inputDate).inDays > 365) {
                    setState(() {
                      _message = 'Está na hora de fazer um novo checkup!';
                    });
                  } else {
                    setState(() {
                      _message = 'Parabéns! Seu checkup está em dia.';
                    });
                  }
                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  _message,
                  style: const TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
