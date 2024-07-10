import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/application/decisions/widgets/decision_widget_tablet.dart';
import 'package:tinders/main.dart';


class TabletNormalDecisionScreen extends StatelessWidget {
  const TabletNormalDecisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         SizedBox(height: 20.h,),
        Expanded(child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 45.0.w,vertical: 10.h),
              child: GestureDetector(
                  onTap: (){
                    ///TODO
                    ///navigate to decision details screen
                  },
                  child: DecisionWidgetTablet(title: 'مناقشة تعديل النظام الداخلي',type: language.secret,)),
            );
          }, ))

      ],
    );
  }
}
