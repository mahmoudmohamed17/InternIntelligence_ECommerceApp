import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  void changeTheme(bool value) {
    SharedPrefs.setBool(AppConstants.appTheme, value);
    emit(AppThemeSuccess());
  }
}
