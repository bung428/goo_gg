import 'package:goo_gg_application/model/enum/api_state.dart';

class ApiRespModel<T> {
  final T? model;
  final String? errorMsg;
  final ApiState state;

  ApiRespModel({this.model, this.errorMsg, required this.state});

  factory ApiRespModel.fail(Exception e) => ApiRespModel(
    state: ApiState.fail,
    errorMsg: e.toString()
  );
}