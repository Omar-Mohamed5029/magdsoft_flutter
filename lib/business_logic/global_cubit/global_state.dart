part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}
class Verify_Loading_state extends GlobalState {}
class Verify_Success_state extends GlobalState {}
class Verify_Error_state extends GlobalState {}

class OTP_loading_state extends GlobalState {}
class OTP_Success_state extends GlobalState {}
class OTP_Error_state extends GlobalState {}

class getHelp_loading_state extends GlobalState {}
class getHelp_Success_state extends GlobalState {}
class getHelp_Error_state extends GlobalState {}

class getHelp_change_height extends GlobalState {}

class getProducts_loading_state extends GlobalState {}
class getProducts_Success_state extends GlobalState {}
class getProducts_Error_state extends GlobalState {}




