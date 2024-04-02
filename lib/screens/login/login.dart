import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/utils/custom_appbar.dart';
import 'package:hn_market/utils/custom_scaffold.dart';
import 'package:hn_market/utils/extensions/string_extension.dart';
import 'package:hn_market/utils/extensions/widget_extension.dart';

import 'bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key, required this.onResult});
  final void Function(bool isLoggedIn)? onResult;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();
        return CustomScaffold(
          appBar: CustomAppBar(
            context,
            title: 'Đăng nhập',
          ),
          body: Column(
            children: [
              80.sized,
              SvgPicture.asset(
                'login_icon'.svg,
                width: 200.sp,
              ),
              50.sized,
              Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 25.sp,
                      ),
                      10.sized,
                      'Đăng nhập với Google'.size16
                    ],
                  ),
                ),
              ).onTap(() {
                bloc.add(const LoginWithGoogle());
              })
            ],
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(onResult),
      child: this,
    );
  }
}
