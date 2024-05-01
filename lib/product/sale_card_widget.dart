import 'package:app_ui/core/project_padding.dart';
import 'package:app_ui/product/language/language_item.dart';
import 'package:flutter/material.dart';

class SaleCardWidget extends StatelessWidget {
  const SaleCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _WidgetSizes.cardSize.value(),
      width: MediaQuery.of(context).size.width,
      child: const _Card(),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: _Margin().marginCard,
      child: const _ContainerInCard(),
    );
  }
}

class _ContainerInCard extends StatelessWidget {
  const _ContainerInCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [_WidgetColor().blackColor, _WidgetColor().blueColor],
      )),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_Text(), _ElevatedButton()],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.onlyLeft16x,
      child: Text(
        LanguageItem().saleUp,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: _WidgetColor().whiteColor,
            ),
      ),
    );
  }
}

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.standartPadding,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(_WidgetColor().blueColor)),
        child: Text(
          LanguageItem().buttonShopNow,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _WidgetColor().whiteColor,
              ),
        ),
      ),
    );
  }
}

class _WidgetColor {
  final whiteColor = Colors.white;
  final blueColor = Colors.blue;
  final blackColor = Colors.black;
}

enum _WidgetSizes { cardSize }

extension _WidgetExtension on _WidgetSizes {
  double value() {
    switch (this) {
      case _WidgetSizes.cardSize:
        return 200;
    }
  }
}

class _Margin {
  final marginCard = const EdgeInsets.all(16.0);
}
