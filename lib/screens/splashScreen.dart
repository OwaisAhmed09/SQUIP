import 'package:ambulance/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SplashProvider>(
          builder: (context, splashProvider, _) {
            if (splashProvider.isLoading) {
              return CircularProgressIndicator();
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/ServicesPage');
              });
              return Container();
            }
          },
        ),
      ),
    );
  }
}
