import 'package:flutter/material.dart';
import 'package:flut_job/ui/widgets/label_below_icon.dart';

class DashboardMenuRow extends StatelessWidget {
  final firstLabel;
  final IconData firstIcon;
  final firstIconCircleColor;
  final secondLabel;
  final IconData secondIcon;
  final secondIconCircleColor;
  final thirdLabel;
  final IconData thirdIcon;
  final thirdIconCircleColor;
  final actionone;
  final actiontwo;
  final actionthree;

  const DashboardMenuRow({
    Key key,
    this.firstLabel,
    this.firstIcon,
    this.firstIconCircleColor,
    this.actionone,
    this.secondLabel,
    this.secondIcon,
    this.secondIconCircleColor,
    this.actiontwo,
    this.thirdLabel,
    this.thirdIcon,
    this.thirdIconCircleColor,
    this.actionthree,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          InkWell(
            child: LabelBelowIcon(
              icon: firstIcon,
              label: firstLabel,
              circleColor: firstIconCircleColor,
              onPressed: actionone,
            ),
            onTap: actionone,
          ),
          LabelBelowIcon(
            icon: secondIcon,
            label: secondLabel,
            circleColor: secondIconCircleColor,
            onPressed: actiontwo,
          ),
          LabelBelowIcon(
            icon: thirdIcon,
            label: thirdLabel,
            circleColor: thirdIconCircleColor,
            onPressed: actionthree,
          ),
        ],
      ),
    );
  }
}
