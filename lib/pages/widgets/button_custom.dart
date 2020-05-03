import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  const ButtonCustom({Key key, @required this.title, this.iconData, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff75dde8),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black12,
            offset: Offset(0, 5)
          ),
        ],
        border: Border.all(
          color: Colors.cyan[600],
          width: 1
        )
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 20),
              Expanded(
                child: Text(title, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                )),
              ),
              Container(
                height: double.maxFinite,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
                  border: Border.all(
                    color: Colors.cyan[600],
                    width: 1
                  )
                ),
                child: Icon(iconData, color: Colors.white)
              )
            ],
          ),
        ),
      ),
    );
  }
}
