import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/error/failures.dart';
import '../../../../app/di/dependency_injection.dart';

// Providers
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return AuthRemoteDataSourceImpl(dioClient.instance);
});

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(remoteDataSource, storage);
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(repository);
});

// Auth State Provider
class AuthState {
  final User? user;
  final bool isLoading;
  final Failure? error;

  AuthState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    User? user,
    bool? isLoading,
    Failure? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final AuthRepositoryImpl _repository;

  AuthNotifier(
    this._loginUseCase,
    this._logoutUseCase,
    this._repository,
  ) : super(AuthState()) {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final result = await _repository.getCurrentUser();
    if (result.isSuccess && result.dataOrNull != null) {
      state = state.copyWith(user: result.dataOrNull);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _loginUseCase(email, password);

    if (result.isSuccess) {
      state = state.copyWith(
        user: result.dataOrNull,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: result.failureOrNull,
      );
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    await _logoutUseCase();

    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  final logoutUseCase = ref.watch(logoutUseCaseProvider);
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(loginUseCase, logoutUseCase, repository);
});

