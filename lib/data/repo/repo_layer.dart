import 'package:valorant_prototype_app/data/web_service/web_service.dart';

class RepositoryLayer {
  final WebService apiProvider;

  RepositoryLayer({required this.apiProvider});

  Future<dynamic> getData() async {
    return apiProvider.getData();
  }
}
