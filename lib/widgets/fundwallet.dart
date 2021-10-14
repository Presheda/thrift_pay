import 'package:flutter/material.dart';

class BankAccountSheetWidget extends StatelessWidget {
  final String bankType;
  final String virtualAcc;
  final Function function;

  BankAccountSheetWidget({this.bankType, this.function, this.virtualAcc});

  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: function,
      child: Container(
        height: 92,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(20)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                 "Account Information",
                    maxLines: 1,

                    style:  TextStyle(
                      fontSize: 14,

                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                      "${virtualAcc}/",
                       style: TextStyle(
                         fontSize: 16,
                         color: Theme.of(context).textTheme.headline6.color,
                         fontWeight: FontWeight.bold,
                       ),
                      ),
                      Text(
               bankType,
                        maxLines: 1,
                      style: TextStyle(
                          fontSize: 14,

                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Icon(
              Icons.copy,
              size: 24,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}