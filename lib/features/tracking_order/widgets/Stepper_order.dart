import 'package:easy_stepper/easy_stepper.dart';
import 'package:engaz/features/home/screens/main_export.dart';
import 'package:flutter/material.dart';

class StepperOrder extends StatefulWidget {
  final int activeStep;
  const StepperOrder({Key? key, required this.activeStep}) : super(key: key);

  @override
  State<StepperOrder> createState() => _StepperOrderState();
}

class _StepperOrderState extends State<StepperOrder> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: widget.activeStep,
      // lineLength: 70,
      // lineSpace: 0,
      padding: EdgeInsets.all(0.r),
      lineStyle: LineStyle(
          lineType:LineType.normal,
          lineLength : 65.w
      ),
      // defaultLineColor: Colors.white,
      // finishedLineColor: Colors.orange,
      // unreachedStepBackgroundColor:Colors.white,
      // activeStepTextColor:Colors.blue,
      activeStepIconColor:Colors.blue,
      activeStepBackgroundColor:Colors.blue,
      activeStepBorderColor:Colors.blue,
      // finishedStepTextColor:Colors.blue,
      finishedStepBackgroundColor:Colors.blue,
      finishedStepBorderColor:Colors.blue,
      finishedStepIconColor:Colors.blue,
      unreachedStepBorderColor:Colors.grey,

      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Colors.black87,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 9,
      // showStepBorder: false,
      // lineDotRadius: 1.5,
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor:
              widget.activeStep >= 0 ? Colors.blue : Colors.white,
            ),
          ),
          title: 'تم الطلب',
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor:
              widget.activeStep >= 1 ? Colors.blue : Colors.white,
            ),
          ),
          title: 'قيد التجهيز',
          // topTitle: true,
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor:
              widget.activeStep >= 2 ? Colors.blue : Colors.white,
            ),
          ),
          title: 'في الطريق',
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor:
              widget.activeStep >= 3 ? Colors.blue : Colors.white,
            ),
          ),
          title: 'تم التوصيل',
          // topTitle: true,
        ),
      ],
      // onStepReached: (index) =>
      //     setState(() => widget.activeStep = index),
    );
  }
}
