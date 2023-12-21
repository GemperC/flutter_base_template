import 'package:flutter/material.dart';
import 'package:supermegataxi/pages/login/login_page.dart';

import '../../widgets/route/route_widget.dart';

void navigateToLoginWidget(context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginWidget(),
      ),
      (route) => false);
}
