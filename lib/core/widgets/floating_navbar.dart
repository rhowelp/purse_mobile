import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/floating_navbar_item.dart';

typedef ItemBuilder = Widget Function(
    BuildContext context, int index, FloatingNavbarItem items);

class FloatingNavbar extends StatefulWidget {
  final List<FloatingNavbarItem> items;
  final int currentIndex;
  final void Function(int val)? onTap;
  final Color selectedBackgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color backgroundColor;
  final double fontSize;
  final double iconSize;
  final double itemBorderRadius;
  final double borderRadius;
  final ItemBuilder itemBuilder;
  final double width;
  final double elevation;

  FloatingNavbar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    ItemBuilder? itemBuilder,
    this.backgroundColor = Colors.white,
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = ColorPalette.primary,
    this.iconSize = 28.0,
    this.fontSize = 11.0,
    this.borderRadius = 8,
    this.itemBorderRadius = 8,
    this.unselectedItemColor = ColorPalette.grey,
    this.width = double.infinity,
    this.elevation = 0.0,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        assert(width > 50),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              borderRadius: borderRadius,
              fontSize: fontSize,
              width: width,
              backgroundColor: backgroundColor,
              currentIndex: currentIndex,
              iconSize: iconSize,
              itemBorderRadius: itemBorderRadius,
              items: items,
              onTap: onTap,
              selectedBackgroundColor: selectedBackgroundColor,
            );

  @override
  State<FloatingNavbar> createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar> {
  List<FloatingNavbarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: widget.elevation,
      height: 110,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(0.0, 0.0),
              ),
            ]),
        width: widget.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: items
                .asMap()
                .map((i, f) {
                  return MapEntry(i, widget.itemBuilder(context, i, f));
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val)? onTap,
  required List<FloatingNavbarItem> items,
  int? currentIndex,
  Color? selectedBackgroundColor,
  Color? selectedItemColor,
  Color? unselectedItemColor,
  Color? backgroundColor,
  double width = double.infinity,
  double? fontSize,
  double? iconSize,
  double? itemBorderRadius,
  double? borderRadius,
}) {
  return (BuildContext context, int index, FloatingNavbarItem item) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(itemBorderRadius!),
              ),
              child: InkWell(
                onTap: () {
                  onTap!(index);
                },
                hoverColor: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: width.isFinite
                      ? (width / items.length - 8)
                      : MediaQuery.of(context).size.width / items.length - 24,
                  padding: EdgeInsets.symmetric(
                      horizontal: 2, vertical: item.title != null ? 4 : 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      item.customWidget == null
                          ? Icon(
                              item.icon,
                              color: currentIndex == index
                                  ? selectedItemColor
                                  : unselectedItemColor!.withOpacity(0.7),
                              size: iconSize,
                            )
                          : item.customWidget!,
                      const Gap(5),
                      if (item.title != null)
                        Text(
                          '${item.title}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: currentIndex == index
                                ? selectedItemColor
                                : unselectedItemColor!.withOpacity(0.7),
                            fontSize: fontSize,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
