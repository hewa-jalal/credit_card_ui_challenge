import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple[900],
            Colors.pink[400],
          ],
        ),
      ),
      child: Center(
        child: FlareActor('assets/flare/success_check.flr'),
      ),
    );
  }
}
