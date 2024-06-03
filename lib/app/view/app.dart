import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/app/theme/cubit.dart';
import 'package:recall/counter/counter.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(
              create: (BuildContext context) => ThemeCubit(),
            ),
            BlocProvider<LocalizationCubit>(
              create: (BuildContext context) => LocalizationCubit(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, theme) {
              return BlocBuilder<LocalizationCubit, int>(
                builder: (BuildContext context, int state) {
                  return MaterialApp(
                    themeMode: theme,
                    darkTheme: ThemeData.dark(),
                    theme: ThemeData(
                      appBarTheme: AppBarTheme(
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                      useMaterial3: true,
                    ),
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: AppLocalizations.supportedLocales[state],
                    home: const CounterPage(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
