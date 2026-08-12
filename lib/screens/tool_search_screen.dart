import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../theme/theme.dart';
import 'home_screen.dart';

/// Recherche d'outil.
///
/// **Pourquoi elle existe.** L'accueil présente vingt-quatre outils répartis en
/// une bande bento et quatre familles. C'est une bonne carte pour qui découvre
/// l'application ; c'en est une mauvaise pour qui sait déjà ce qu'il veut et
/// doit faire défiler trois écrans pour retrouver « Filigrane ». Il n'existait
/// aucun moyen de filtrer, et aucune porte vers autre chose que la grille.
///
/// La recherche cherche dans le libellé, dans la famille, et dans une liste de
/// mots-clés tenue à la main sur chaque outil : on doit pouvoir trouver
/// « Protéger PDF » en tapant « mot de passe » ou « cadenas », qui sont les
/// mots que l'on a en tête avant de connaître le nôtre.
class ToolSearchScreen extends StatefulWidget {
  const ToolSearchScreen({super.key});

  @override
  State<ToolSearchScreen> createState() => _ToolSearchScreenState();
}

class _ToolSearchScreenState extends State<ToolSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  String _query = '';

  @override
  void initState() {
    super.initState();
    // Le clavier s'ouvre seul : on n'arrive sur cet écran que pour taper.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focus.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final List<ToolEntry> results = ToolCatalog.of(
      l10n,
    ).all.where((t) => t.matches(_query)).toList();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: _controller,
          focusNode: _focus,
          autocorrect: false,
          textInputAction: TextInputAction.search,
          onChanged: (v) => setState(() => _query = v),
          style: AppTypography.body.copyWith(color: colors.ink),
          decoration: InputDecoration(
            hintText: l10n.searchHint,
            filled: false,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: Space.sm),
            suffixIcon: _query.isEmpty
                ? null
                : IconButton(
                    tooltip: l10n.searchClear,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _controller.clear();
                      setState(() => _query = '');
                    },
                  ),
          ),
        ),
      ),
      body: results.isEmpty
          ? _NoResult(query: _query)
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                Space.md,
                Space.sm,
                Space.md,
                Space.xxl,
              ),
              itemCount: results.length,
              separatorBuilder: (_, _) => const SizedBox(height: Space.xs),
              itemBuilder: (context, i) {
                final ToolEntry tool = results[i];
                final InkTone ink = tool.family == null
                    ? InkTone(stroke: colors.accent, wash: colors.accentWash)
                    : colors.inks[tool.family! % colors.inks.length];
                return Card(
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ink.wash,
                        borderRadius: Radii.allXs,
                      ),
                      child: Icon(tool.icon, size: 20, color: ink.stroke),
                    ),
                    title: Text(
                      tool.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      tool.section,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: colors.inkFaint,
                    ),
                    onTap: () {
                      // On referme la recherche avant d'ouvrir l'outil : au
                      // retour, l'utilisateur retrouve l'accueil, pas sa
                      // requête.
                      Navigator.of(context).pop();
                      HomeScreen.open(context, tool);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class _NoResult extends StatelessWidget {
  const _NoResult({required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.all(Space.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Space.xl),
          Text(
            l10n.searchNoResultTitle(query),
            style: AppTypography.headline.copyWith(color: colors.ink),
          ),
          const SizedBox(height: Space.xs),
          Text(
            l10n.searchNoResultBody,
            style: AppTypography.body.copyWith(color: colors.inkMuted),
          ),
        ],
      ),
    );
  }
}
