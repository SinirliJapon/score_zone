import 'package:flutter/material.dart';

const laLigaPrimary = Color(0xFFEE8707);
const laLigaSecondary = Color(0xFF000000);
const laLigaPoint = Color(0xFF1B8DCC);

const premierPrimary = Color(0xFF38003C);
const premierSecondary = Color(0xFFFFFFFF);
const premierBackground = Color(0xFFD0D3D4);
const premierPoint = Color(0xFFFDB927);

const bundesligaPrimary = Color(0xFFD20515);
const bundesligaSecondary = Color(0xFFFFFFFF);
const bundesligaPoint = Color(0xFF000000);

const ligue1Primary = Color(0xFFDAE025);
const ligue1Secondary = Color(0xFF12233f);
const ligue1Point = Color(0xFFEC1C24);

const serieAPrimary = Color(0xFF008FD7);
const serieASecondary = Color(0xFFFFFFFF);
const serieAPoint = Color(0xFFFF1F11);

const leagueScreenColor = Color(0xFF00D06C);
const standingsScreenColor = Color(0xFF38003C);
const playerStatsScreenColor = Color(0xFFE90052);
const cupScreenColor = Color(0xFF89CFF0);
const cupScreenText = Color(0xFF000000);

Map<String, Color> leagueColors = {
  'PL': premierPrimary,
  'BL1': bundesligaPrimary,
  'FL1': ligue1Primary,
  'SA': serieAPrimary,
  'PD': laLigaPrimary,
  'CL': cupScreenColor,
};

Map<String, Color> leagueTextColors = {
  'PL': premierSecondary,
  'BL1': bundesligaSecondary,
  'FL1': ligue1Secondary,
  'SA': serieASecondary,
  'PD': laLigaSecondary,
  'CL': cupScreenText,
};

Map<String, Color> leaguePointColors = {
  'PL': premierPoint,
  'BL1': bundesligaPoint,
  'FL1': ligue1Point,
  'SA': serieAPoint,
  'PD': laLigaPoint,
};
