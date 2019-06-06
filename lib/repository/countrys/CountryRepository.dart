import 'package:meu_primeiro_app/repository/countrys/model/Country.dart';
import 'package:meu_primeiro_app/repository/countrys/model/CountryCategory.dart';
import 'package:meu_primeiro_app/support/conection/api.dart';

abstract class NoticeRepository {
  Future<List<Country>> loadCountrys();
}

class NoticeRepositoryImpl implements NoticeRepository {
  final Api _api = Api("dvp4.dartdigital.com.br");


  Future<List<Country>> loadCountrys() async {
    final result = await _api.get("/api/Country");
    return result
        .map<Country>((country) => new Country.fromMap(country))
        .toList();
  }

  Future<CountryCategory> loadCategory() async {
    final result = await _api.get("api/country/1");
    return new CountryCategory.fromJson(result);
  }
}
