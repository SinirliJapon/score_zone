import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:score_zone/model/competitions.dart';
import 'package:score_zone/model/standings.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.football-data.org/v4/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/competitions')
  Future<CompetitionBaseResponse> fetchCompetitions();

  @GET('/competitions/{leagueCode}/standings')
  Future<StandingsResponse> fetchStandings(@Path('leagueCode') String leagueCode);
}
