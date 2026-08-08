import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/ui/bento.dart';
import '../widgets/ui/section_header.dart';
import '../widgets/ui/stagger.dart';
import '../widgets/ui/tool_tile.dart';
import 'compare_screen.dart';
import 'crop_screen.dart';
import 'edit_screen.dart';
import 'excel_to_pdf_screen.dart';
import 'html_to_pdf_screen.dart';
import 'images_to_pdf_screen.dart';
import 'merge_screen.dart';
import 'ocr_screen.dart';
import 'organize_screen.dart';
import 'page_numbers_screen.dart';
import 'pdf_to_excel_screen.dart';
import 'pdf_to_images_screen.dart';
import 'pdf_to_pptx_screen.dart';
import 'pdf_to_word_screen.dart';
import 'pdfa_screen.dart';
import 'pptx_to_pdf_screen.dart';
import 'protect_screen.dart';
import 'recto_verso_screen.dart';
import 'redact_screen.dart';
import 'repair_screen.dart';
import 'scan_screen.dart';
import 'sign_screen.dart';
import 'tool_search_screen.dart';
import 'unlock_screen.dart';
import 'watermark_screen.dart';

/// Nom affiché de l'application.
///
/// Trois champs distincts portaient jusqu'ici la même chaîne à mots-clés, et
/// aucun des trois n'en voulait :
///
/// * **ce libellé**, qui est une signature de marque et doit se lire d'un
///   coup d'œil en haut de l'écran d'accueil ;
/// * **`android:label`**, tronqué par le lanceur à une douzaine de
///   caractères — « Fusionner PDF, Word & Images » y arrivait en
///   « Fusionner… » ;
/// * **le titre de la fiche Play**, seul des trois à être indexé, seul à
///   disposer de 30 caractères, et seul à être localisable par langue.
///
/// Les mots-clés reviennent donc au troisième — « Trombone : PDF, Scan &
/// Word » — et la marque seule reste ici.
const String _wordmark = 'Trombone';

/// Un outil de l'application, tel qu'il apparaît dans la grille et dans la
/// recherche.
class ToolEntry {
  const ToolEntry({
    required this.icon,
    required this.label,
    required this.builder,
    this.family,
    this.keywords = '',
    this.section = '',
  });

  final IconData icon;
  final String label;
  final WidgetBuilder builder;

  /// Index dans l'encrier, ou `null` pour les outils phares qui n'appartiennent
  /// à aucune famille et gardent l'accent.
  final int? family;

  /// Mots que l'utilisateur peut taper sans employer le libellé exact —
  /// « cadenas » pour Protéger, « tableur » pour Excel. Sans eux, une recherche
  /// ne trouve que ce qu'on savait déjà nommer.
  final String keywords;

  /// Famille d'appartenance, affichée en sous-titre dans les résultats.
  final String section;

  bool matches(String query) {
    final String q = _fold(query);
    if (q.isEmpty) return true;
    return _fold('$label $keywords $section').contains(q);
  }

  /// Repli des accents et de la casse : on doit trouver « protéger » en tapant
  /// « proteger », qui est ce que produit un clavier pressé.
  static String _fold(String s) {
    const Map<String, String> map = {
      'à': 'a',
      'â': 'a',
      'ä': 'a',
      'é': 'e',
      'è': 'e',
      'ê': 'e',
      'ë': 'e',
      'î': 'i',
      'ï': 'i',
      'ô': 'o',
      'ö': 'o',
      'ù': 'u',
      'û': 'u',
      'ü': 'u',
      'ç': 'c',
      '’': "'",
    };
    final StringBuffer out = StringBuffer();
    for (final rune in s.toLowerCase().runes) {
      final String ch = String.fromCharCode(rune);
      out.write(map[ch] ?? ch);
    }
    return out.toString();
  }
}

class _ToolSection {
  const _ToolSection(this.title, this.tools);

  final String title;
  final List<ToolEntry> tools;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Les cinq outils de la bande bento. Ils sont déclarés ici plutôt qu'à
  /// l'intérieur du `build` pour que la recherche puisse les atteindre : un
  /// moteur de recherche qui ignore les cinq outils les plus utilisés ne sert
  /// à rien.
  static final ToolEntry _merge = ToolEntry(
    icon: Icons.merge_type,
    label: 'Fusionner',
    section: 'À la une',
    keywords: 'assembler combiner joindre regrouper reunir concatener',
    builder: (_) => const MergeScreen(),
  );

  static final List<ToolEntry> _featured = [
    _merge,
    ToolEntry(
      icon: Icons.flip_to_back_outlined,
      label: 'Recto-verso',
      section: 'À la une',
      family: 0,
      keywords: 'double face intercaler scan pair impair',
      builder: (_) => const RectoVersoScreen(),
    ),
    ToolEntry(
      icon: Icons.image_outlined,
      label: 'Images vers PDF',
      section: 'À la une',
      family: 3,
      keywords: 'photo jpg jpeg png photos album appareil',
      builder: (_) => const ImagesToPdfScreen(),
    ),
    ToolEntry(
      icon: Icons.description_outlined,
      label: 'PDF vers Word',
      section: 'À la une',
      family: 1,
      keywords: 'docx traitement de texte editable convertir',
      builder: (_) => const PdfToWordScreen(),
    ),
    ToolEntry(
      icon: Icons.dashboard_customize_outlined,
      label: 'Organiser un PDF',
      section: 'À la une',
      family: 2,
      keywords: 'diviser separer extraire reordonner ordre pages supprimer',
      builder: (_) => const OrganizeScreen(),
    ),
  ];

  static final List<_ToolSection> _sections = [
    _ToolSection('Vers le PDF', [
      ToolEntry(
        icon: Icons.table_view_outlined,
        label: 'Excel vers PDF',
        section: 'Vers le PDF',
        family: 0,
        keywords: 'tableur xlsx classeur feuille calcul',
        builder: (_) => const ExcelToPdfScreen(),
      ),
      ToolEntry(
        icon: Icons.slideshow_outlined,
        label: 'PowerPoint vers PDF',
        section: 'Vers le PDF',
        family: 0,
        keywords: 'pptx diapositive presentation slides',
        builder: (_) => const PptxToPdfScreen(),
      ),
      ToolEntry(
        icon: Icons.language_outlined,
        label: 'Page web vers PDF',
        section: 'Vers le PDF',
        family: 0,
        keywords: 'html site internet url lien article',
        builder: (_) => const HtmlToPdfScreen(),
      ),
      ToolEntry(
        icon: Icons.document_scanner_outlined,
        label: 'Scanner un document',
        section: 'Vers le PDF',
        family: 0,
        keywords: 'camera photo numeriser scan appareil papier',
        builder: (_) => const ScanScreen(),
      ),
    ]),
    _ToolSection('Depuis le PDF', [
      ToolEntry(
        icon: Icons.table_chart_outlined,
        label: 'PDF vers Excel',
        section: 'Depuis le PDF',
        family: 1,
        keywords: 'tableur xlsx tableau extraire donnees',
        builder: (_) => const PdfToExcelScreen(),
      ),
      ToolEntry(
        icon: Icons.co_present_outlined,
        label: 'PDF vers PowerPoint',
        section: 'Depuis le PDF',
        family: 1,
        keywords: 'pptx diapositive presentation slides',
        builder: (_) => const PdfToPptxScreen(),
      ),
      ToolEntry(
        icon: Icons.collections_outlined,
        label: 'PDF vers Images',
        section: 'Depuis le PDF',
        family: 1,
        keywords: 'jpg png photo exporter capture',
        builder: (_) => const PdfToImagesScreen(),
      ),
      ToolEntry(
        icon: Icons.manage_search_outlined,
        label: 'Texte cherchable (OCR)',
        section: 'Depuis le PDF',
        family: 1,
        keywords: 'reconnaissance caracteres scanne copier selectionner',
        builder: (_) => const OcrScreen(),
      ),
      ToolEntry(
        icon: Icons.inventory_2_outlined,
        label: 'Convertir en PDF/A',
        section: 'Depuis le PDF',
        family: 1,
        keywords: 'archivage norme long terme conservation',
        builder: (_) => const PdfAScreen(),
      ),
    ]),
    _ToolSection('Sécurité', [
      ToolEntry(
        icon: Icons.lock_outline,
        label: 'Protéger PDF',
        section: 'Sécurité',
        family: 2,
        keywords: 'mot de passe cadenas chiffrer verrouiller securiser',
        builder: (_) => const ProtectScreen(),
      ),
      ToolEntry(
        // Deux cadenas voisins — fermé et ouvert — dans la même famille verte
        // et la même grille : à l'échelle où l'icône est rendue, la seule
        // différence tenait à l'anse. La clé a une silhouette qui ne se
        // confond avec rien.
        icon: Icons.key_outlined,
        label: 'Déverrouiller PDF',
        section: 'Sécurité',
        family: 2,
        keywords: 'retirer mot de passe ouvrir dechiffrer debloquer cadenas',
        builder: (_) => const UnlockScreen(),
      ),
      ToolEntry(
        icon: Icons.healing_outlined,
        label: 'Réparer PDF',
        section: 'Sécurité',
        family: 2,
        keywords: 'corrompu illisible endommage recuperer erreur',
        builder: (_) => const RepairScreen(),
      ),
      ToolEntry(
        icon: Icons.visibility_off_outlined,
        label: 'Caviarder un PDF',
        section: 'Sécurité',
        family: 2,
        keywords: 'masquer noircir anonymiser confidentiel effacer',
        builder: (_) => const RedactScreen(),
      ),
    ]),
    _ToolSection('Éditer', [
      ToolEntry(
        icon: Icons.edit_note_outlined,
        label: 'Éditer PDF',
        section: 'Éditer',
        family: 3,
        keywords: 'texte modifier corriger annoter ecrire',
        builder: (_) => const EditScreen(),
      ),
      ToolEntry(
        icon: Icons.draw_outlined,
        label: 'Signer',
        section: 'Éditer',
        family: 3,
        keywords: 'signature paraphe contrat main',
        builder: (_) => const SignScreen(),
      ),
      ToolEntry(
        icon: Icons.water_drop_outlined,
        label: 'Filigrane',
        section: 'Éditer',
        family: 3,
        keywords: 'watermark tampon confidentiel brouillon marque',
        builder: (_) => const WatermarkScreen(),
      ),
      ToolEntry(
        icon: Icons.format_list_numbered,
        label: 'Numéros de page',
        section: 'Éditer',
        family: 3,
        keywords: 'pagination folio numeroter chiffres',
        builder: (_) => const PageNumbersScreen(),
      ),
      ToolEntry(
        icon: Icons.crop_outlined,
        label: 'Rogner un PDF',
        section: 'Éditer',
        family: 3,
        keywords: 'couper marges recadrer bords taille',
        builder: (_) => const CropScreen(),
      ),
      ToolEntry(
        icon: Icons.compare_arrows_outlined,
        label: 'Comparer PDF',
        section: 'Éditer',
        family: 3,
        keywords: 'difference versions diff changements',
        builder: (_) => const CompareScreen(),
      ),
    ]),
  ];

  /// Tous les outils, à plat — pour la recherche et pour le décompte.
  static List<ToolEntry> get allTools => [
    ..._featured,
    for (final s in _sections) ...s.tools,
  ];

  /// Nombre total d'outils. Calculé, jamais saisi.
  static int get _toolCount => allTools.length;

  /// Ouvre un outil en lui transmettant l'encre de sa famille.
  ///
  /// C'est le point de passage unique de toute la navigation vers un outil,
  /// et c'est pour cela que l'enveloppe [ToolFamily] s'installe ici : les
  /// vingt-quatre écrans reçoivent leur encre sans qu'aucun ait à la déclarer,
  /// et un écran ajouté plus tard ne peut pas oublier de le faire.
  static void open(BuildContext context, ToolEntry tool) {
    final List<InkTone> inks = context.colors.inks;
    final int? family = tool.family;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (routeContext) {
          final Widget screen = tool.builder(routeContext);
          if (family == null) return screen;
          return ToolFamily(ink: inks[family % inks.length], child: screen);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // Les hauteurs de bloc suivent l'échelle typographique du système : à
    // 200 % de police, des blocs figés déborderaient.
    final scaler = MediaQuery.textScalerOf(context);
    final factor = (scaler.scale(13) / 13).clamp(1.0, 1.7);
    final tall = Bento.blockTall * factor;
    final medium = Bento.blockMedium * factor;

    return Scaffold(
      backgroundColor: colors.paper,
      body: CustomScrollView(
        slivers: [
          const _Masthead(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              Space.md,
              Space.md,
              Space.md,
              Space.xxxl,
            ),
            sliver: SliverList.list(
              children: [
                // ── Bande bento ──────────────────────────────────────────
                // Un bloc phare, puis quatre blocs égaux sur deux rangées.
                //
                // La version précédente faisait courir « Recto-verso » sur
                // deux rangées, à la hauteur de deux blocs empilés. Sur
                // appareil, ce bloc portait un titre et deux lignes de
                // sous-titre pour 280 dp de haut : cinq cents pixels de vide
                // au milieu de la grille, et une colonne de droite dont les
                // deux blocs n'avaient, eux, pas de sous-titre du tout. Le
                // rythme bento naît du contraste entre le bloc phare et les
                // autres, pas d'un empilement qu'on étire pour faire coïncider
                // deux colonnes.
                StaggerRise(
                  index: 0,
                  child: BentoBlock(
                    icon: _featured[0].icon,
                    title: _featured[0].label,
                    subtitle: 'PDF, Word, images et texte en un seul document',
                    emphasis: BentoEmphasis.primary,
                    large: true,
                    minHeight: tall,
                    onTap: () => open(context, _featured[0]),
                  ),
                ),
                const SizedBox(height: Bento.gap),
                StaggerRise(
                  index: 1,
                  child: BentoRow(
                    left: BentoBlock(
                      icon: _featured[1].icon,
                      title: _featured[1].label,
                      subtitle: 'Deux scans, remis dans l’ordre',
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[0],
                      minHeight: medium,
                      onTap: () => open(context, _featured[1]),
                    ),
                    right: BentoBlock(
                      icon: _featured[2].icon,
                      title: _featured[2].label,
                      subtitle: 'Photos et captures en un document',
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[3],
                      minHeight: medium,
                      onTap: () => open(context, _featured[2]),
                    ),
                  ),
                ),
                const SizedBox(height: Bento.gap),
                StaggerRise(
                  index: 2,
                  child: BentoRow(
                    left: BentoBlock(
                      icon: _featured[3].icon,
                      title: _featured[3].label,
                      subtitle: 'Texte et tableaux, modifiables',
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[1],
                      minHeight: medium,
                      onTap: () => open(context, _featured[3]),
                    ),
                    right: BentoBlock(
                      icon: _featured[4].icon,
                      title: _featured[4].label,
                      subtitle: 'Diviser, extraire, réordonner',
                      // Un bloc neutre à côté d'un bloc teinté, dans la même
                      // rangée et à la même taille, se lit comme un bloc dont
                      // on aurait oublié la couleur. Les quatre blocs
                      // secondaires portent donc les quatre encres de
                      // l'encrier, une chacune.
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[2],
                      minHeight: medium,
                      onTap: () => open(context, _featured[4]),
                    ),
                  ),
                ),

                // ── Familles d'outils ────────────────────────────────────
                for (var i = 0; i < _sections.length; i++)
                  StaggerRise(
                    index: 3 + i,
                    child: _Section(
                      section: _sections[i],
                      ink: colors.inks[i % colors.inks.length],
                    ),
                  ),
                const SizedBox(height: Space.xxl),
                _Colophon(toolCount: _toolCount),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Masthead d'accueil.
///
/// La promesse a changé après lecture de 1 678 avis du marché. La version
/// précédente annonçait « Rien ne part ailleurs » — un argument de
/// confidentialité que **0,5 %** des avis mentionnent. Ce qui revient, lui,
/// c'est la peur de découvrir un mur au moment d'enregistrer : « après avoir
/// passé 30 minutes à modifier un PDF, on nous apprend qu'il faut payer ».
/// C'est cette peur-là qu'un accueil rassurant doit désamorcer, dès la
/// première ligne.
class _Masthead extends StatelessWidget {
  const _Masthead();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final scaler = MediaQuery.textScalerOf(context);
    final topInset = MediaQuery.paddingOf(context).top;

    final expanded =
        Space.xs +
        scaler.scale(40) +
        Space.xs +
        scaler.scale(44) +
        Space.md +
        30 +
        Space.md;
    const collapsed = 56.0;

    return SliverAppBar(
      pinned: true,
      expandedHeight: expanded,
      collapsedHeight: collapsed,
      toolbarHeight: collapsed,
      backgroundColor: colors.paper,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      // Vingt-quatre outils et aucun moyen de filtrer : il fallait connaître
      // la grille pour s'y retrouver. La loupe est épinglée avec la barre,
      // donc atteignable depuis n'importe quel point du défilement.
      actions: [
        IconButton(
          tooltip: 'Rechercher un outil',
          icon: const Icon(Icons.search),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const ToolSearchScreen()),
          ),
        ),
        const SizedBox(width: Space.xxs),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final maxH = expanded + topInset;
          final minH = collapsed + topInset;
          final t = maxH - minH <= 0
              ? 0.0
              : ((constraints.maxHeight - minH) / (maxH - minH)).clamp(
                  0.0,
                  1.0,
                );

          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 1 - t,
                  child: Container(height: Rule.hair, color: colors.rule),
                ),
              ),
              Positioned(
                left: Space.md,
                right: Space.md,
                bottom: 0,
                child: Opacity(
                  opacity: 1 - t,
                  child: SizedBox(
                    height: collapsed,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _wordmark,
                        style: AppTypography.title.copyWith(color: colors.ink),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Space.md,
                right: Space.md,
                top: topInset + Space.xs,
                child: IgnorePointer(
                  ignoring: t < 0.5,
                  child: Opacity(opacity: t, child: const _MastheadContent()),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MastheadContent extends StatelessWidget {
  const _MastheadContent();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // La loupe occupe le coin haut droit : le titre lui cède la place
        // plutôt que de passer dessous.
        Padding(
          padding: const EdgeInsets.only(right: 48),
          child: Text(
            _wordmark,
            style: AppTypography.masthead.copyWith(color: colors.ink),
            maxLines: 1,
          ),
        ),
        const SizedBox(height: Space.xs),
        Text(
          'Faites votre document, exportez-le.\nAucun mur à la fin.',
          style: AppTypography.body.copyWith(color: colors.inkMuted),
          maxLines: 2,
        ),
        const SizedBox(height: Space.md),
        const _PromiseChips(),
      ],
    );
  }
}

/// Les trois garanties. Ce sont des faits vérifiables dans le code — aucun
/// écran de compte, aucun filigrane apposé à l'export, aucun quota — et non
/// des arguments marketing. Elles répondent une par une aux trois motifs
/// d'abandon relevés dans les avis 1-3★ du marché.
class _PromiseChips extends StatelessWidget {
  const _PromiseChips();

  static const List<String> _claims = [
    'Sans compte',
    'Sans filigrane',
    'Export illimité',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Wrap(
      spacing: Space.xs,
      runSpacing: Space.xs,
      children: [
        for (final claim in _claims)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Space.sm,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: colors.sageWash,
              borderRadius: Radii.allPill,
              border: Border.all(
                color: colors.sage.withValues(alpha: 0.22),
                width: Rule.hair,
              ),
            ),
            child: Text(
              claim,
              style: AppTypography.micro.copyWith(color: colors.sageDeep),
            ),
          ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.section, required this.ink});

  final _ToolSection section;
  final InkTone ink;

  @override
  Widget build(BuildContext context) {
    final tileHeight = ToolTile.heightFor(context);

    return Padding(
      padding: const EdgeInsets.only(top: Space.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: section.title,
            count: section.tools.length,
            ink: ink,
          ),
          const SizedBox(height: Space.sm),
          LayoutBuilder(
            builder: (context, constraints) => GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: section.tools.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Breakpoints.toolColumns(constraints.maxWidth),
                mainAxisSpacing: Bento.gap,
                crossAxisSpacing: Bento.gap,
                mainAxisExtent: tileHeight,
              ),
              itemBuilder: (context, i) {
                final tool = section.tools[i];
                return ToolTile(
                  icon: tool.icon,
                  label: tool.label,
                  ink: ink,
                  onTap: () => HomeScreen.open(context, tool),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Colophon.
///
/// Il clôt l'écran et répète, en toutes lettres, la promesse que le marché
/// attend. Le compte d'outils est calculé depuis les listes, jamais saisi.
class _Colophon extends StatelessWidget {
  const _Colophon({required this.toolCount});

  final int toolCount;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: Rule.hair, color: colors.rule),
        const SizedBox(height: Space.md),
        Text(
          '$toolCount outils',
          style: AppTypography.microNumeric.copyWith(color: colors.ink),
        ),
        const SizedBox(height: Space.xxs),
        Text(
          'Rien ne se débloque contre paiement au moment d’enregistrer. '
          'L’export est gratuit, sans filigrane et sans limite de nombre.',
          style: AppTypography.small.copyWith(color: colors.inkFaint),
        ),
      ],
    );
  }
}
