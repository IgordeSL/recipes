import 'package:recipes/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final Function onSelectItem;

  const CategoryItem({@required this.category, @required this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.75),
            category.color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        onTap: onSelectItem,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: this.category.color.computeLuminance() > 0.5
                      ? Colors.grey.shade900
                      : Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
