import 'package:flutter/material.dart';

void showDescriptionBottonSheet({
  required BuildContext context,
  required String title,
  required String explanation,
}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF3E4C5C).withOpacity(0.9),
      builder: (_) {
        return ListView(
          children: [Padding(padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(title,textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,), 
              SizedBox(height: 10,),
              Text(explanation,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2)
            ],
          ),
          )],
        );
      });
}
