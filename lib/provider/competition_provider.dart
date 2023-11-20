import 'package:flutter/foundation.dart';
import 'package:score_zone/model/competitions.dart';
import 'package:score_zone/services/api_service.dart';

class CompetitionProvider extends ChangeNotifier {
  final ApiService _apiService;

  CompetitionProvider(this._apiService);

  List<Competitions> _competitions = [];
  List<Competitions> get competitions => _competitions;

  late bool isLoading = false;

  Future<void> getCompetitions() async {
    isLoading = true;
    notifyListeners();

    try {
      final competitionResponse = await _apiService.fetchCompetitions();
      _competitions = competitionResponse.competitions;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
