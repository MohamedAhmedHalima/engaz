import 'package:bloc/bloc.dart';
import 'package:engaz/core/network/api.dart';
import 'package:engaz/features/auth/reset_password/model/code_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'code_state.dart';

class CodeCubit extends Cubit<CodeState> {
  CodeCubit() : super(CodeInitial());
  static CodeCubit get(context) => BlocProvider.of(context);
  CodeModel? codeModel;
  Future<void> code({
    required String? email,
    required String? otp,
  }) async {
    emit(CodeLoading());
    final response = await DioHelper.postData(
      url: 'auth/verify-otp',
      data: {
        'email': email,
        'otp': otp,
      },
    );
    if (response != null && response.data is Map<String, dynamic>) {
      codeModel = CodeModel.fromJson(response.data);
      emit(CodeSuccess(codeModel: codeModel!));
    } else {
      emit(CodeError(message: 'Invalid response format'));
    }
  }
}
