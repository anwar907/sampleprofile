import 'package:api_repository/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:users_repository/users_repository.dart';

class MockUsersRespository extends Mock implements ApiRepository {}

class FakeLogin extends Fake implements UsersModel {}

void main() {
  final apiClient = MockUsersRespository();

  final UsersRespository usersRepository =
      UsersRespository(apiRespository: apiClient);
  group('Unit Test Login Repository', () {
    test('UsersRepository exception', () async {
      when(() => apiClient.login(
          username: any(named: 'username'),
          password: any(named: 'password'))).thenThrow(Exception("Error"));

      expect(
          () => usersRepository.login(username: 'simpel', password: 'password'),
          throwsA(isA<UsersRespositoryException>()));
    });

    test('UsersRepository success', () async {
      when(() =>
              apiClient.login(
                  username: any(named: 'username'),
                  password: any(named: 'password')))
          .thenAnswer((_) async => UsersModel(
                email: 'email',
                firstName: 'firstName',
                gender: 'gender',
                id: 1,
                image: 'image',
                lastName: 'lastName',
                token: 'token',
                username: 'username',
              ));

      expect(
          await usersRepository.login(
              username: 'username', password: 'password'),
          isA<UsersModel>());
    });
  });

  group('Unit Test Profile Repository', () {
    test('should return exception', () async {
      when(() => apiClient.userProfile(id: any(named: 'id')))
          .thenThrow(Exception('Error'));
      expect(() => usersRepository.profile(id: 0),
          throwsA(isA<ProfileRepositoryException>()));
    });

    test('should return data from api repository', () async {
      when(() => apiClient.userProfile(id: any(named: 'id')))
          .thenAnswer((_) async => UsersModel(
                email: 'email',
                firstName: 'firstName',
                gender: 'gender',
                id: 1,
                image: 'image',
                lastName: 'lastName',
                token: 'token',
                username: 'username',
              ));

      expect(await usersRepository.profile(id: 0), isA<UsersModel>());
    });
  });
}
