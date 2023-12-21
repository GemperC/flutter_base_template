import 'package:supermegataxi/pages/nickname/nickname_model.dart';
import 'package:flutter/material.dart';
import 'package:supermegataxi/backend/auth/auth_util.dart';
import 'package:supermegataxi/utils/utils.dart';
import 'package:supermegataxi/pages/home/home_view.dart';

void updateNickname(String nickname, String nicknameColor) {
  currentUserReference!.update({
    "nickname": nickname,
    "nickname_color": nicknameColor,
  });
}

void navigateToHomeWidget(context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => HomeWidget(),
    ),
    (r) => false,
  );
}

bool isValidated(String? text1, String? text2) {
  if (text1 != null && text1 != "" && text2 != null || text2 != "") return true;
  Utils.showSnackBar(
      "Please make sure you have selected a Nickname and a Color");
  return false;
}

onConfirm(context, NicknameModel _model) {
  updateNickname(_model.nicknameTextController.text, _model.currentColorText!);
  navigateToHomeWidget(context);
}
