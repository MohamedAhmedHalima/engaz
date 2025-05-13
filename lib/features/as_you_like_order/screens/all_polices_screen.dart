import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/drawer_screen.dart';
import '../../home/widgets/app_bar.dart';
import '../../home/widgets/custome_search_bar.dart';
import '../widgets/polices_card_item.dart';

class AllPolicesScreen extends StatelessWidget {
  static const String routeName = "AllPolicesScreen";
  const AllPolicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            CustomeAppBar(),
            CustomeSearchBar(),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "اوردرك على كيفك",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const PolicesCardItem(
              imagePath: "assets/images/police_1.png",
              title: "سياسة 1 (الطلب الأساسي)",
              description:
                  "هذه السياسة تناسب المستخدمين الذين يحتاجون إلى إتمام الطلب بأبسط شكل ممكن،",
              featuresTitle: "المميزات",
              features: [
                "اختيار المنتجات الأساسية فقط.",
                "توصيل عادي في مدة تتراوح من 3 إلى 5 أيام عمل.",
                "خدمة عملاء عادية عبر البريد الإلكتروني.",
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const PolicesCardItem(
              imagePath: "assets/images/police_2.png",
              title: "سياسة 2 (طلب سريع)",
              description:
                  " تمنح المستخدمين مرونة في تحديد الطلبات مع بعض الميزات الإضافية كالتوصيل الأسرع",
              featuresTitle: "المميزات",
              features: [
                "خيار إضافة منتجات مشابهة أو ملحقات مع الطلب.",
                "توصيل أسرع في 2-3 أيام عمل.",
                "إشعارات بحالة الطلب وتحديثات تلقائية"
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const PolicesCardItem(
              imagePath: "assets/images/police_3.png",
              title: "سياسة 3 (الطلب الأساسي)",
              description:
                  " مخصصة للمستخدمين الذين يفضلون تخصيص الطلبات وفقًا لرغباتهم، حيث يمكنهم اختيار تفاصيل إضافية.",
              featuresTitle: "المميزات",
              features: [
                "توصيل سريع في غضون يوم إلى يومين.",
                "تحديثات شاملة في كل مرحلة، من الإعداد للتوصيل.",
                "دعم عملاء مميز عبر الشات والهاتف."
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const PolicesCardItem(
              imagePath: "assets/images/police_4.png",
              title: "سياسة 4 (طلب سريع)",
              featuresTitle: "المميزات",
              description:
                  "على مستوى من الخدمة والمرونة، تتيح للمستخدم تخصيص كل تفاصيل الطلب، مع توصيل فوري ودعم عملاء ممتاز.",
              features: [
                "تتبع مباشر للطلب عبر الخريطة.",
                "دعم عملاء حصري على مدار الساعة.",
                "تخصيص كامل للطلب، مع توصيات ذكية من التطبيق."
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: 343, // Match the width of the TextField
              height: 50, // Standard button height
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF13A9CA), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "اختيار السياسة",
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
