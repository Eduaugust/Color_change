import 'package:flutter/material.dart';

void main() {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ColorChange(),
    );
  }
}

class ColorChange extends StatefulWidget {
  const ColorChange({Key? key}) : super(key: key);

  @override
  State<ColorChange> createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChange> {
  double _red = 255;
  double _green = 255;
  double _blue = 255;

  void _chageColor(double value, String nameColor) {
    setState(() {
      switch (nameColor) {
        case 'red':
          _red = value;
          break;
        case 'green':
          _green = value;
          break;
        case 'blue':
          _blue = value;
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(_red.toInt(), _green.toInt(), _blue.toInt(), 1),
      body: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Vermelho'),
              Slider(
                min: 0,
                max: 255,
                value: _red,
                onChanged: (double value) {
                  _chageColor(value, 'red');
                },
                divisions: 250,
              ),
              const Text('Verde'),
              Slider(
                min: 0,
                max: 255,
                value: _green,
                onChanged: (double value) {
                  _chageColor(value, 'green');
                },
                divisions: 250,
              ),
              const Text('Azul'),
              Slider(
                min: 0,
                max: 255,
                value: _blue,
                onChanged: (double value) {
                  _chageColor(value, 'blue');
                },
                divisions: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
