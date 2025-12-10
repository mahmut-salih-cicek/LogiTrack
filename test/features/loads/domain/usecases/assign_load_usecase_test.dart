import 'package:flutter_test/flutter_test.dart';
import 'package:lojistik_application/features/loads/domain/usecases/assign_load_to_driver_usecase.dart';
import 'package:lojistik_application/features/loads/domain/repositories/loads_repository.dart';
import 'package:lojistik_application/core/utils/result.dart';
import 'package:lojistik_application/features/loads/domain/entities/load.dart';

class MockLoadsRepository implements LoadsRepository {
  @override
  Future<Result<void>> assignLoadToDriver(String loadId, String driverId) async {
    return const Success(null);
  }

  @override
  Future<Result<List<Load>>> getLoads({String? date, String? status}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<Load>> getLoadDetail(String loadId) {
    throw UnimplementedError();
  }
}

void main() {
  test('Assign load usecase calls repository', () async {
    final repository = MockLoadsRepository();
    final useCase = AssignLoadToDriverUseCase(repository);

    final result = await useCase('load_001', 'driver_001');

    expect(result.isSuccess, true);
  });
}

