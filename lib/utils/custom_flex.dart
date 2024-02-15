/*you can set the space taken by each child, use only when the width is specified
 make sure the number of children (variable and actual length of the list)
  and number of flex values match */
import 'package:flutter/material.dart';

class CustomizableRow extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final int? numberOfChildren;
  final List<int>? flexValues;
  final List<Widget>? children;
  const CustomizableRow({
    super.key,
    this.padding,
    this.numberOfChildren,
    this.flexValues,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: List.generate(
          flexValues?.length ?? numberOfChildren ?? 1,
          (index) => Expanded(
            flex: flexValues?[index] ?? 1,
            child: children?[index] ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class CustomizableColumn extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final int? numberOfChildren;
  final List<int>? flexValues;
  final List<Widget>? children;
  const CustomizableColumn({
    super.key,
    this.padding,
    this.numberOfChildren,
    this.flexValues,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: List.generate(
          flexValues?.length ?? numberOfChildren ?? 1,
          (index) => Expanded(
            flex: flexValues?[index] ?? 1,
            child: children?[index] ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
