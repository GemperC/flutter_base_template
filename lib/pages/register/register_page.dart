import 'package:flutter/material.dart';
import 'package:supermegataxi/utils/theme.dart';
import 'package:supermegataxi/widgets/custom/model.dart';
import 'package:supermegataxi/pages/login/login_model.dart';

import '../../utils/screen_sizes.dart';
import '../../utils/utils.dart';
import '../../widgets/custom/button.dart';
import '../../widgets/custom/quarter_circle.dart';
import '../../widgets/custom/ring.dart';
import '../../widgets/custom/textfield.dart';
import 'register_logic.dart';
import 'register_model.dart';

class RegisterWidget extends StatefulWidget {
  RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late RegisterModel _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = createModel(context, () => RegisterModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenInfo(context).screenHeight,
          width: ScreenInfo(context).screenWidth,
          child: Stack(children: [

            Padding(
              padding: EdgeInsets.only(
                  top: ScreenInfo(context).screenHeight * 0.15,
                  right: 20,
                  left: 20),
              child: Container(
                alignment: Alignment.center,
                child: registerForm(),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget registerForm() {
    double padding = 35;
    return Form(
      key: _model.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Container()),
          CustomTextField(
            textField: TextField(
              controller: _model.nameTextController,
              textCapitalization: TextCapitalization.none,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: AppTypography.textfieldHintText(context),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).cardColor,
              ),
              style: AppTypography.textfieldText(context),
              keyboardType: TextInputType.emailAddress,
            ),
            validator: _model.nameTextControllerValidator,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: padding),
            child: CustomTextField(
              textField: TextField(
                controller: _model.emailTextController,
                textCapitalization: TextCapitalization.none,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: AppTypography.textfieldHintText(context),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Theme.of(context).cardColor,
                ),
                style: AppTypography.textfieldText(context),
                keyboardType: TextInputType.emailAddress,
              ),
              validator: _model.emailTextControllerValidator,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: padding),
            child: CustomTextField(
              textField: TextField(
                controller: _model.passwordTextController,
                textCapitalization: TextCapitalization.none,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: AppTypography.textfieldHintText(context),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Theme.of(context).cardColor,
                ),
                style: AppTypography.textfieldText(context),
                keyboardType: TextInputType.emailAddress,
              ),
              validator: _model.passwordTextControllerValidator,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: padding),
            child: CustomTextField(
              textField: TextField(
                controller: _model.confirmPasswordController,
                textCapitalization: TextCapitalization.none,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: AppTypography.textfieldHintText(context),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Theme.of(context).cardColor,
                ),
                style: AppTypography.textfieldText(context),
                keyboardType: TextInputType.emailAddress,
              ),
              validator: _model.confirmPasswordControllerValidator,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: CustomMainButton(
              buttonText: "Sign Up",
              height: 48,
              onPressed: () async {
                await signUp(context, _model);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Already have an account? click here to sign in",
                  style: AppTypography.textfieldText(context),
                )),
          ),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
