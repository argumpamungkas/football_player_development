import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog {
  static Future<void> showLoadingDialog(BuildContext context, {String message = "Loading..."}) {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            // backgroundColor: Colors.white,
            // surfaceTintColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: 10.sp),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
