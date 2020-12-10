import 'package:flutter/material.dart';
import '../helper/dimensions.dart';

class DeveloperCard extends StatelessWidget {
  final name;

  const DeveloperCard({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vpH = getViewportHeight(context);
    var vpW = getViewportWidth(context);
    TextStyle _titlestyle =
        TextStyle(fontWeight: FontWeight.normal, fontSize: vpH * 0.028);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: vpH * 0.01, horizontal: vpW * 0.040),
      child: Container(
        height: vpH * 0.085,
        width: vpW * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: vpH * 0.008, horizontal: vpW * 0.01),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      radius: vpH * 0.032,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: vpH * 0.030,
                        backgroundImage:
                            AssetImage('assets/img/placeholder.jpg'),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: vpW * 0.040),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              name,
                              style: _titlestyle,
                            ),
                          ),
                          // Padding(padding: EdgeInsets.symmetric(vertical:vpH*0.006),
                          //   child:Text(
                          //   "Post",
                          //   overflow: TextOverflow.ellipsis,
                          //   style: TextStyle(fontSize:vpH*0.018),
                          // ),
                          // ),
                        ],
                      ),
                    ),
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
