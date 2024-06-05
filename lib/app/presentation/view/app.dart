import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/app/theme/theme_cubit.dart';
import 'package:recall/home/home.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

class ScreenUtilInitClass extends StatelessWidget {
  const ScreenUtilInitClass({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, _) => const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (BuildContext context) => LocalizationCubit(),
        ),
      ],
      child: const AppBuilder(),
    );
  }
}

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, theme) {
        return LocalizationBuilder(theme: theme);
      },
    );
  }
}

class LocalizationBuilder extends StatelessWidget {
  const LocalizationBuilder({required this.theme, super.key});
  final ThemeMode theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, Locale>(
      builder: (BuildContext context, Locale state) {
        ScreenUtil.init(context);
        return MaterialApp(
          themeMode: theme,
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepPurple),
          theme: FlexThemeData.light(scheme: FlexScheme.deepPurple),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales:
              context.read<LocalizationCubit>().supportedLocales(),
          locale: state,
          home: const HomeView(),
        );
      },
    );
  }
}
