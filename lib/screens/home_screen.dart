import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
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

/// Un outil de l'application, tel qu'il apparaît dans la grille et dans la
/// recherche. Ses libellés sont déjà résolus dans la langue courante — voir
/// [ToolCatalog].
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
  ///
  /// Ils sont traduits comme le reste : une liste de synonymes français ne sert
  /// à rien à qui cherche « contraseña » ou « hasło ».
  final String keywords;

  /// Famille d'appartenance, affichée en sous-titre dans les résultats.
  final String section;

  bool matches(String query) {
    final String q = foldDiacritics(query);
    if (q.isEmpty) return true;
    return foldDiacritics('$label $keywords $section').contains(q);
  }
}

/// Repli des diacritiques et de la casse : on doit trouver « protéger » en
/// tapant « proteger », qui est ce que produit un clavier pressé.
///
/// La table couvrait le seul français — quinze voyelles accentuées et la
/// cédille. Elle couvre maintenant le latin étendu-A entier, c'est-à-dire
/// exactement ce que les fontes embarquées savent composer et donc exactement
/// les vingt-cinq langues servies. Sans cela, un Polonais tapant « zloz »
/// ne trouverait pas « Złóż », et un Tchèque « prevest » ne trouverait pas
/// « Převést » — la recherche ne servirait que dans les langues sans signes.
///
/// Dart n'expose pas la normalisation Unicode ; la table est donc écrite à la
/// main. Elle est volontairement large : replier un caractère qu'aucune langue
/// servie n'emploie ne coûte rien, l'oublier casse une recherche en silence.
String foldDiacritics(String s) {
  const Map<String, String> map = {
    'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a', 'å': 'a', 'ā': 'a',
    'ă': 'a', 'ą': 'a',
    'ç': 'c', 'ć': 'c', 'č': 'c', 'ĉ': 'c', 'ċ': 'c',
    'ď': 'd', 'đ': 'd', 'ð': 'd',
    'è': 'e', 'é': 'e', 'ê': 'e', 'ë': 'e', 'ē': 'e', 'ĕ': 'e', 'ė': 'e',
    'ę': 'e', 'ě': 'e',
    'ĝ': 'g', 'ğ': 'g', 'ġ': 'g', 'ģ': 'g',
    'ĥ': 'h', 'ħ': 'h',
    'ì': 'i', 'í': 'i', 'î': 'i', 'ï': 'i', 'ĩ': 'i', 'ī': 'i', 'ĭ': 'i',
    'į': 'i', 'ı': 'i',
    'ĵ': 'j',
    'ķ': 'k',
    'ĺ': 'l', 'ļ': 'l', 'ľ': 'l', 'ł': 'l', 'ŀ': 'l',
    'ñ': 'n', 'ń': 'n', 'ņ': 'n', 'ň': 'n',
    'ò': 'o', 'ó': 'o', 'ô': 'o', 'õ': 'o', 'ö': 'o', 'ø': 'o', 'ō': 'o',
    'ŏ': 'o', 'ő': 'o',
    'ŕ': 'r', 'ŗ': 'r', 'ř': 'r',
    'ś': 's', 'ŝ': 's', 'ş': 's', 'š': 's', 'ș': 's',
    'ţ': 't', 'ť': 't', 'ŧ': 't', 'ț': 't',
    'ù': 'u', 'ú': 'u', 'û': 'u', 'ü': 'u', 'ũ': 'u', 'ū': 'u', 'ŭ': 'u',
    'ů': 'u', 'ű': 'u', 'ų': 'u',
    'ŵ': 'w',
    'ý': 'y', 'ÿ': 'y', 'ŷ': 'y',
    'ź': 'z', 'ż': 'z', 'ž': 'z',
    // Ligatures et lettres propres, dépliées vers ce qu'un clavier produit.
    'æ': 'ae', 'œ': 'oe', 'ß': 'ss', 'þ': 'th',
    // L'apostrophe typographique de « l’ordre » face à celle du clavier.
    '’': "'",
  };
  final StringBuffer out = StringBuffer();
  for (final rune in s.toLowerCase().runes) {
    final String ch = String.fromCharCode(rune);
    out.write(map[ch] ?? ch);
  }
  return out.toString();
}

/// Une famille d'outils : son titre et ses tuiles.
class ToolSection {
  const ToolSection(this.title, this.tools);

  final String title;
  final List<ToolEntry> tools;
}

/// Le catalogue des vingt-quatre outils, résolu dans une langue.
///
/// Il était jusqu'ici deux listes `static final`, ce qui n'est plus tenable :
/// une liste constante fige les libellés de la première langue rencontrée, et
/// un changement de langue système ne les rattraperait jamais. Le catalogue se
/// reconstruit donc à chaque `build`. Vingt-quatre entrées de chaînes déjà en
/// mémoire — le coût est nul devant celui d'un rendu, et c'est le prix de la
/// justesse.
class ToolCatalog {
  ToolCatalog._(this.featured, this.sections);

  /// Les cinq outils de la bande bento. Ils appartiennent au catalogue et non
  /// au `build` pour que la recherche puisse les atteindre : un moteur de
  /// recherche qui ignore les cinq outils les plus utilisés ne sert à rien.
  final List<ToolEntry> featured;

  final List<ToolSection> sections;

  /// Tous les outils, à plat — pour la recherche et pour le décompte.
  List<ToolEntry> get all => [
    ...featured,
    for (final s in sections) ...s.tools,
  ];

  factory ToolCatalog.of(L l10n) {
    final String featuredSection = l10n.sectionFeatured;
    final String toPdf = l10n.sectionToPdf;
    final String fromPdf = l10n.sectionFromPdf;
    final String security = l10n.sectionSecurity;
    final String edit = l10n.sectionEdit;

    return ToolCatalog._(
      [
        ToolEntry(
          icon: Icons.merge_type,
          label: l10n.toolMerge,
          section: featuredSection,
          keywords: l10n.toolMergeKeywords,
          builder: (_) => const MergeScreen(),
        ),
        ToolEntry(
          icon: Icons.flip_to_back_outlined,
          label: l10n.toolRectoVerso,
          section: featuredSection,
          family: 0,
          keywords: l10n.toolRectoVersoKeywords,
          builder: (_) => const RectoVersoScreen(),
        ),
        ToolEntry(
          icon: Icons.image_outlined,
          label: l10n.toolImagesToPdf,
          section: featuredSection,
          family: 3,
          keywords: l10n.toolImagesToPdfKeywords,
          builder: (_) => const ImagesToPdfScreen(),
        ),
        ToolEntry(
          icon: Icons.description_outlined,
          label: l10n.toolPdfToWord,
          section: featuredSection,
          family: 1,
          keywords: l10n.toolPdfToWordKeywords,
          builder: (_) => const PdfToWordScreen(),
        ),
        ToolEntry(
          icon: Icons.dashboard_customize_outlined,
          label: l10n.toolOrganize,
          section: featuredSection,
          family: 2,
          keywords: l10n.toolOrganizeKeywords,
          builder: (_) => const OrganizeScreen(),
        ),
      ],
      [
        ToolSection(toPdf, [
          ToolEntry(
            icon: Icons.table_view_outlined,
            label: l10n.toolExcelToPdf,
            section: toPdf,
            family: 0,
            keywords: l10n.toolExcelToPdfKeywords,
            builder: (_) => const ExcelToPdfScreen(),
          ),
          ToolEntry(
            icon: Icons.slideshow_outlined,
            label: l10n.toolPptxToPdf,
            section: toPdf,
            family: 0,
            keywords: l10n.toolPptxToPdfKeywords,
            builder: (_) => const PptxToPdfScreen(),
          ),
          ToolEntry(
            icon: Icons.language_outlined,
            label: l10n.toolHtmlToPdf,
            section: toPdf,
            family: 0,
            keywords: l10n.toolHtmlToPdfKeywords,
            builder: (_) => const HtmlToPdfScreen(),
          ),
          ToolEntry(
            icon: Icons.document_scanner_outlined,
            label: l10n.toolScan,
            section: toPdf,
            family: 0,
            keywords: l10n.toolScanKeywords,
            builder: (_) => const ScanScreen(),
          ),
        ]),
        ToolSection(fromPdf, [
          ToolEntry(
            icon: Icons.table_chart_outlined,
            label: l10n.toolPdfToExcel,
            section: fromPdf,
            family: 1,
            keywords: l10n.toolPdfToExcelKeywords,
            builder: (_) => const PdfToExcelScreen(),
          ),
          ToolEntry(
            icon: Icons.co_present_outlined,
            label: l10n.toolPdfToPptx,
            section: fromPdf,
            family: 1,
            keywords: l10n.toolPdfToPptxKeywords,
            builder: (_) => const PdfToPptxScreen(),
          ),
          ToolEntry(
            icon: Icons.collections_outlined,
            label: l10n.toolPdfToImages,
            section: fromPdf,
            family: 1,
            keywords: l10n.toolPdfToImagesKeywords,
            builder: (_) => const PdfToImagesScreen(),
          ),
          ToolEntry(
            icon: Icons.manage_search_outlined,
            label: l10n.toolOcr,
            section: fromPdf,
            family: 1,
            keywords: l10n.toolOcrKeywords,
            builder: (_) => const OcrScreen(),
          ),
          ToolEntry(
            icon: Icons.inventory_2_outlined,
            label: l10n.toolPdfA,
            section: fromPdf,
            family: 1,
            keywords: l10n.toolPdfAKeywords,
            builder: (_) => const PdfAScreen(),
          ),
        ]),
        ToolSection(security, [
          ToolEntry(
            icon: Icons.lock_outline,
            label: l10n.toolProtect,
            section: security,
            family: 2,
            keywords: l10n.toolProtectKeywords,
            builder: (_) => const ProtectScreen(),
          ),
          ToolEntry(
            // Deux cadenas voisins — fermé et ouvert — dans la même famille
            // verte et la même grille : à l'échelle où l'icône est rendue, la
            // seule différence tenait à l'anse. La clé a une silhouette qui ne
            // se confond avec rien.
            icon: Icons.key_outlined,
            label: l10n.toolUnlock,
            section: security,
            family: 2,
            keywords: l10n.toolUnlockKeywords,
            builder: (_) => const UnlockScreen(),
          ),
          ToolEntry(
            icon: Icons.healing_outlined,
            label: l10n.toolRepair,
            section: security,
            family: 2,
            keywords: l10n.toolRepairKeywords,
            builder: (_) => const RepairScreen(),
          ),
          ToolEntry(
            icon: Icons.visibility_off_outlined,
            label: l10n.toolRedact,
            section: security,
            family: 2,
            keywords: l10n.toolRedactKeywords,
            builder: (_) => const RedactScreen(),
          ),
        ]),
        ToolSection(edit, [
          ToolEntry(
            icon: Icons.edit_note_outlined,
            label: l10n.toolEdit,
            section: edit,
            family: 3,
            keywords: l10n.toolEditKeywords,
            builder: (_) => const EditScreen(),
          ),
          ToolEntry(
            icon: Icons.draw_outlined,
            label: l10n.toolSign,
            section: edit,
            family: 3,
            keywords: l10n.toolSignKeywords,
            builder: (_) => const SignScreen(),
          ),
          ToolEntry(
            icon: Icons.water_drop_outlined,
            label: l10n.toolWatermark,
            section: edit,
            family: 3,
            keywords: l10n.toolWatermarkKeywords,
            builder: (_) => const WatermarkScreen(),
          ),
          ToolEntry(
            icon: Icons.format_list_numbered,
            label: l10n.toolPageNumbers,
            section: edit,
            family: 3,
            keywords: l10n.toolPageNumbersKeywords,
            builder: (_) => const PageNumbersScreen(),
          ),
          ToolEntry(
            icon: Icons.crop_outlined,
            label: l10n.toolCrop,
            section: edit,
            family: 3,
            keywords: l10n.toolCropKeywords,
            builder: (_) => const CropScreen(),
          ),
          ToolEntry(
            icon: Icons.compare_arrows_outlined,
            label: l10n.toolCompare,
            section: edit,
            family: 3,
            keywords: l10n.toolCompareKeywords,
            builder: (_) => const CompareScreen(),
          ),
        ]),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
    final l10n = context.l10n;
    final catalog = ToolCatalog.of(l10n);
    final featured = catalog.featured;

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
                    icon: featured[0].icon,
                    title: featured[0].label,
                    subtitle: l10n.toolMergeSubtitle,
                    emphasis: BentoEmphasis.primary,
                    large: true,
                    minHeight: tall,
                    onTap: () => open(context, featured[0]),
                  ),
                ),
                const SizedBox(height: Bento.gap),
                StaggerRise(
                  index: 1,
                  child: BentoRow(
                    left: BentoBlock(
                      icon: featured[1].icon,
                      title: featured[1].label,
                      subtitle: l10n.toolRectoVersoSubtitle,
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[0],
                      minHeight: medium,
                      onTap: () => open(context, featured[1]),
                    ),
                    right: BentoBlock(
                      icon: featured[2].icon,
                      title: featured[2].label,
                      subtitle: l10n.toolImagesToPdfSubtitle,
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[3],
                      minHeight: medium,
                      onTap: () => open(context, featured[2]),
                    ),
                  ),
                ),
                const SizedBox(height: Bento.gap),
                StaggerRise(
                  index: 2,
                  child: BentoRow(
                    left: BentoBlock(
                      icon: featured[3].icon,
                      title: featured[3].label,
                      subtitle: l10n.toolPdfToWordSubtitle,
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[1],
                      minHeight: medium,
                      onTap: () => open(context, featured[3]),
                    ),
                    right: BentoBlock(
                      icon: featured[4].icon,
                      title: featured[4].label,
                      subtitle: l10n.toolOrganizeSubtitle,
                      // Un bloc neutre à côté d'un bloc teinté, dans la même
                      // rangée et à la même taille, se lit comme un bloc dont
                      // on aurait oublié la couleur. Les quatre blocs
                      // secondaires portent donc les quatre encres de
                      // l'encrier, une chacune.
                      emphasis: BentoEmphasis.tinted,
                      ink: colors.inks[2],
                      minHeight: medium,
                      onTap: () => open(context, featured[4]),
                    ),
                  ),
                ),

                // ── Familles d'outils ────────────────────────────────────
                for (var i = 0; i < catalog.sections.length; i++)
                  StaggerRise(
                    index: 3 + i,
                    child: _Section(
                      section: catalog.sections[i],
                      ink: colors.inks[i % colors.inks.length],
                    ),
                  ),
                const SizedBox(height: Space.xxl),
                _Colophon(toolCount: catalog.all.length),
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
          tooltip: context.l10n.homeSearchTooltip,
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
                        context.l10n.appWordmark,
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
            context.l10n.appWordmark,
            style: AppTypography.masthead.copyWith(color: colors.ink),
            maxLines: 1,
          ),
        ),
        const SizedBox(height: Space.xs),
        Text(
          context.l10n.homePromise,
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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final List<String> claims = [
      l10n.homeChipNoAccount,
      l10n.homeChipNoWatermark,
      l10n.homeChipUnlimited,
    ];
    return Wrap(
      spacing: Space.xs,
      runSpacing: Space.xs,
      children: [
        for (final claim in claims)
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

  final ToolSection section;
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
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: Rule.hair, color: colors.rule),
        const SizedBox(height: Space.md),
        Text(
          l10n.toolCount(toolCount),
          style: AppTypography.microNumeric.copyWith(color: colors.ink),
        ),
        const SizedBox(height: Space.xxs),
        Text(
          l10n.homeColophon,
          style: AppTypography.small.copyWith(color: colors.inkFaint),
        ),
      ],
    );
  }
}
