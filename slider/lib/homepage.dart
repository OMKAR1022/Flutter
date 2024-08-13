import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CreateChallengeScreen()));

class CreateChallengeScreen extends StatefulWidget {
  const CreateChallengeScreen({Key? key}) : super(key: key);

  @override
  State<CreateChallengeScreen> createState() => _CreateChallengeState();
}

class _CreateChallengeState extends State<CreateChallengeScreen> {
  double _challengeFees = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Challenge'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormFieldWidget(
              formLabel: 'Challenge Name',
              isRequiredField: true,
            ),
            // Add other TextFormFieldWidget widgets here for other form fields

            // Slider for Challenge Fees
            SliderWidget(
              challengeFees: _challengeFees,
              onChanged: (value) {
                setState(() {
                  _challengeFees = value;
                });
              },
            ),

            ElevatedButton(
              onPressed: () {
                // Handle button press, use _challengeFees for the selected fees.
              },
              child: Text('Create Challenge'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final String formLabel;
  final bool isRequiredField;

  TextFormFieldWidget({
    required this.formLabel,
    required this.isRequiredField,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: formLabel,
              suffix: isRequiredField ? Text(' *') : null,
            ),
          ),
        ],
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  final double challengeFees;
  final ValueChanged<double> onChanged;

  SliderWidget({
    required this.challengeFees,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          value: challengeFees,
          onChanged: onChanged,
          min: 5.0,
          max: 1000.0,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Min: 5'),
              Text('Max: 1000'),
            ],
          ),
        ),
        TextFormField(
          controller: TextEditingController(text: challengeFees.toStringAsFixed(2)),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Challenge Fees',
          ),
        ),
      ],
    );
  }
}
