import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  final Function(bool) toggletheme;
  final bool isDark;
  const Setting({super.key, required this.toggletheme, required this.isDark});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  late bool _darkMode;


  @override
  void initState() {
    super.initState();
    _darkMode = widget.isDark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: _darkMode ? Colors.black : Colors.white
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text('Dark Mode'),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _darkMode,
                    activeColor: Colors.blueAccent,
                    onChanged: (value) {
                      setState(() {
                        _darkMode = value;
                      });
                      widget.toggletheme(value);
                    },
                  ),
                ],
              ),
            ),         
          ],
        ),
      ),
    );
  }
}