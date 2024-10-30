import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:score_zone/model/competition.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/model/player.dart';
import 'package:score_zone/model/scorer.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/model/team.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.football-data.org/v4/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/competitions')
  Future<CompetitionBaseResponse> fetchCompetitions();

  @GET('/competitions/{leagueCode}/standings')
  Future<Standings> fetchStandings(@Path('leagueCode') String leagueCode);

  @GET('/competitions/{leagueCode}/scorers?limit=20')
  Future<ScorerResponse> fetchScorers(@Path('leagueCode') String leagueCode);

  @GET('/competitions/{leagueCode}/matches')
  Future<MatchBaseResponse> fetchMatches(@Path('leagueCode') String leagueCode);

  @GET('/competitions/{leagueCode}/matches')
  Future<MatchBaseResponse> fetchDesiredMatches(
    @Path('leagueCode') String leagueCode,
    @Query('matchday') String matchday,
  );

  @GET('teams/{teamId}/matches')
  Future<MatchBaseResponse> fetchTeamMatches(
    @Path('teamId') String teamId,
    // @Query('status') String matchStatus,
    @Query('limit') int limit,
  );

  @GET('/teams/{teamId}')
  Future<Team> fetchTeam(@Path('teamId') String teamId);

  @GET('/persons/{playerId}')
  Future<Player> fetchPlayer(@Path('playerId') String playerId);

  @GET('persons/{playerId}/matches')
  Future<MatchBaseResponse> fetchPlayerMatches(
    @Path('playerId') String playerId,
    @Query('limit') int limit,
  );
}
