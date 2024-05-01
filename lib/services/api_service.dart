import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:score_zone/model/competitions.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/model/standings.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.football-data.org/v4/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/competitions')
  Future<CompetitionBaseResponse> fetchCompetitions();

  @GET('/competitions/{leagueCode}/standings')
  Future<Standings> fetchStandings(@Path('leagueCode') String leagueCode);

  @GET('/competitions/{leagueCode}/scorers')
  Future<ScorerResponse> fetchScorers(@Path('leagueCode') String leagueCode);

  @GET('/competitions/{leagueCode}/matches')
  Future<MatchBaseResponse> fetchMatches(@Path('leagueCode') String leagueCode);
}
