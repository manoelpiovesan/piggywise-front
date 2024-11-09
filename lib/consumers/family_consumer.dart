import 'package:agattp/agattp.dart';
import 'package:piggywise_child_front/models/family.dart';
import 'package:piggywise_child_front/models/session.dart';
import 'package:piggywise_child_front/utils/config.dart';

///
///
///
class FamilyConsumer {
  ///
  ///
  ///
  Future<Family?> get getFamily async {
    final AgattpResponseJson<Map<String, dynamic>> response =
        await Agattp.authBasic(
      username: Session().user!.username,
      password: Session().user!.password,
    ).getJson(
      Uri.parse(<String>[Config().backUrl, 'family'].join('/')),
    );

    if (response.statusCode > 299 || response.statusCode < 200) {
      throw Exception('Falha ao resgatar a família');
    }

    if (response.body.isEmpty) {
      return null;
    }

    Session().user!.family = Family.fromJson(response.json);

    return Family.fromJson(response.json);
  }

  ///
  ///
  ///
  Future<Family?> joinFamily(final String code) async {
    final AgattpResponseJson<Map<String, dynamic>> response =
        await Agattp.authBasic(
      username: Session().user!.username,
      password: Session().user!.password,
    ).postJson(
      Uri.parse(<String>[Config().backUrl, 'family', 'join', code.toUpperCase()]
          .join('/'),
      ),
          body: <String, dynamic>{},
    );

    if (response.statusCode > 299 || response.statusCode < 200) {
      return null;
    }

    Session().user!.family = Family.fromJson(response.json);

    return Family.fromJson(response.json);
  }
}