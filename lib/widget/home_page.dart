import 'package:app_ui/core/project_padding.dart';
import 'package:app_ui/product/sale_card_widget.dart';
import 'package:app_ui/product/language/language_item.dart';
import 'package:app_ui/product/small_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUrl(Uri.parse('https://pub.dev/packages/url_launcher'));
        },
        child: const Icon(Icons.flutter_dash_outlined),
      ),
      body: Column(
        children: [
          const _SearchBarAndNotification(),
          const SaleCardWidget(),
          _PopularText(
            text: LanguageItem().popular,
          ),
          const Expanded(child: SmallCards()),
          _PopularText(
            text: LanguageItem().newProduct,
          ),
          const Expanded(child: SmallCards()),
        ],
      ),
    );
  }
}

class _PopularText extends StatelessWidget {
  const _PopularText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: ProjectPadding.standartPadding,
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}

class _SearchBarAndNotification extends StatelessWidget {
  const _SearchBarAndNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _Padding().cardPaddingOnlyTop,
      child: Container(
        color: Colors.transparent,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_SearchBar(), _Notification()],
        ),
      ),
    );
  }
}

class _Notification extends StatelessWidget {
  const _Notification();

  @override
  Widget build(BuildContext context) {
    return Card(child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)));
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSizes.serachBarSizesWidth.value(),
      child: SearchBar(
        hintText: LanguageItem().searchBarHintText,
        keyboardType: TextInputType.text,
        leading: Padding(
          padding: _Padding().searchBarLeadingPadding,
          child: const Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}

class _Padding {
  final cardPaddingOnlyTop = const EdgeInsets.only(top: 60.0);
  final searchBarLeadingPadding = const EdgeInsets.only(right: 16.0);
}

enum WidgetSizes { serachBarSizesWidth }

extension WidgetExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.serachBarSizesWidth:
        return 300;
    }
  }
}
