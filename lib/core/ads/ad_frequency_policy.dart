/// Quand une publicité a le droit de se lever — et quand elle ne l'a pas.
///
/// Cette classe ne connaît ni AdMob, ni Flutter, ni le stockage : elle décide,
/// et c'est tout. Le reste du monde vit dans [AdService]. C'est ce qui rend la
/// règle vérifiable — une politique de fréquence qu'on ne peut pas éprouver
/// sans un téléphone et vingt minutes de patience n'est pas une politique, c'est
/// une intention.
///
/// **Ce que dit le marché.** Sur 1 888 avis des huit concurrents français, la
/// publicité est le 3ᵉ grief des notes 1-3★ (7 %), derrière les bugs (12 %) et
/// le paywall (11 %) — et 74 % de ceux qui la mentionnent mettent quand même 4
/// ou 5 étoiles. Les gens l'acceptent. Ce qu'ils sanctionnent, c'est le rythme :
/// parmi les avis négatifs qui la citent, 53 % disent « sans arrêt / à chaque
/// action », 27 % « impossible à fermer », et **aucun** ne reproche une
/// publicité *après* avoir obtenu son fichier.
///
/// D'où les trois freins ci-dessous. Ils ne servent pas à être poli : ils
/// servent à ne jamais produire le motif que le marché punit.
class AdFrequencyPolicy {
  AdFrequencyPolicy({
    this.minInterval = const Duration(minutes: 3),
    this.maxPerSession = 2,
    this.skipFirstEverExport = true,
  });

  /// Délai minimal entre deux publicités. Deux exports rapprochés — enregistrer
  /// puis partager le même document — n'en valent qu'une.
  final Duration minInterval;

  /// Plafond par session. C'est le frein qui manquait : avec le seul délai de
  /// trois minutes, quelqu'un qui traite huit documents en une demi-heure
  /// prenait huit publicités. C'est mécaniquement « pub à chaque action », le
  /// motif exact des avis à une étoile. La majorité des sessions ne font qu'un
  /// ou deux exports, donc ce plafond ne coûte presque rien et supprime le pire
  /// cas.
  final int maxPerSession;

  /// Épargne le tout premier export de la vie de l'application.
  ///
  /// C'est le moment qui décide si l'utilisateur garde l'application ou la
  /// désinstalle. On perd une impression sur toute la vie du client, on protège
  /// la seule première impression qu'on aura. Le revenu vient du retour, pas de
  /// la première visite.
  final bool skipFirstEverExport;

  int _shownThisSession = 0;
  DateTime? _lastShown;

  /// Vrai dès qu'un export a réussi au moins une fois, toutes sessions
  /// confondues. Alimenté par [AdService] depuis le stockage local.
  bool hasExportedBefore = false;

  int get shownThisSession => _shownThisSession;

  /// Pourquoi la publicité est refusée, ou `null` si elle est permise.
  /// Renvoyer la raison plutôt qu'un simple booléen rend les tests lisibles et
  /// le journal de débogage utile.
  AdRefusal? refusalFor(DateTime now) {
    if (skipFirstEverExport && !hasExportedBefore) {
      return AdRefusal.firstEverExport;
    }
    if (_shownThisSession >= maxPerSession) {
      return AdRefusal.sessionCapReached;
    }
    final DateTime? last = _lastShown;
    if (last != null && now.difference(last) < minInterval) {
      return AdRefusal.tooSoon;
    }
    return null;
  }

  bool allows(DateTime now) => refusalFor(now) == null;

  /// À appeler **uniquement** quand une publicité a réellement été montrée.
  void recordShown(DateTime now) {
    _shownThisSession++;
    _lastShown = now;
  }

  /// À appeler à chaque export réussi, publicité ou non : c'est l'export qui
  /// consomme l'exemption du premier succès, pas la publicité.
  void recordExport() => hasExportedBefore = true;
}

/// La raison pour laquelle une publicité n'a pas été présentée.
enum AdRefusal {
  /// Premier export de la vie de l'application : on le laisse tranquille.
  firstEverExport,

  /// Plafond de la session atteint.
  sessionCapReached,

  /// Trop tôt après la précédente.
  tooSoon,
}
