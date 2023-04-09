import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 667),
    );
    double widthContainer = ScreenUtil().screenWidth * 0.9;
    return Container(
      width: ScreenUtil().screenWidth * 0.9,
      height: ScreenUtil().screenHeight * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/image/banner.png',
                  width: widthContainer,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(0.10, -0.87),
            child: SvgPicture.asset(
              'assets/image/logo.svg',
              width: 70.w,
              height: 69.h,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -0.5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40.h, 0, 0),
                  child: Text(
                    'New Version',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -0.21),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30.h, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'v 2.1.0',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.4),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(29, 29, 29, 0),
              child: Text(
                'Harap melakukan update ke versi terbaru yang tersedia di appstore dan playstore',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Container(
              width: ScreenUtil().screenWidth,
              height: 40.h,
              decoration: const BoxDecoration(
                color: Color(0xFFD32C28),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
