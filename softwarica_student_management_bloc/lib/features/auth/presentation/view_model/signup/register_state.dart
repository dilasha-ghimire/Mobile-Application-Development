part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  RegisterState({
    required this.isLoading,
    required this.isSuccess,
    this.error
  });

  factory RegisterState.initial() {
    return RegisterState(
      isLoading: false, 
      isSuccess: false
    );
  }
    
  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error
    );
  }
  
  @override
  List<Object?> get props => [isLoading, isSuccess, error];
}
