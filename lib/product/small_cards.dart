import 'package:app_ui/model/photo_model.dart';
import 'package:app_ui/package/loading_bar.dart';
import 'package:app_ui/services/photo_services.dart';
import 'package:flutter/material.dart';

class SmallCards extends StatefulWidget {
  const SmallCards({super.key});

  @override
  State<SmallCards> createState() => SmallCardsState();
}

class SmallCardsState extends State<SmallCards> {
  List<PhotoModel>? _items;
  late final IPhotoService _photoServices;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _photoServices = PhotoService();
    fetchPhotoItemAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPhotoItemAdvance() async {
    _changeLoading();
    _items = await _photoServices.fetchPhotoItemAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? const Center(child: LoadingBar()) : _GridView(items: _items),
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView({
    super.key,
    required List<PhotoModel>? items,
  }) : _items = items;

  final List<PhotoModel>? _items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _WidgetSizes.gridViewHeight.value(),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: _WidgetSizes.gridViewWidth.value(),
        ),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _Card(model: _items?[index]);
        },
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required PhotoModel? model,
  }) : _model = model;

  final PhotoModel? _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Image.network(_model?.thumbnailUrl ?? ''),
      ),
    );
  }
}

enum _WidgetSizes { gridViewHeight, gridViewWidth, crossAxisCount }

extension _WidgetExtension on _WidgetSizes {
  double value() {
    switch (this) {
      case _WidgetSizes.gridViewHeight:
        return 150;
      case _WidgetSizes.gridViewWidth:
        return 150;
      case _WidgetSizes.crossAxisCount:
        return 1;
    }
  }
}
