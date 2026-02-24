import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/dimens.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryChanged,
  });

  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: .horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: AppDimens.paddingSmall),
            child: FilterChip(
              label: Text(
                category,
                style: textTheme.labelMedium!.copyWith(
                  color: isSelected ? Colors.black : Colors.white
                )
              ), 
              onSelected: (bool selected) {
                if (selected) {
                  onCategoryChanged(index);
                }
              },
              backgroundColor: isSelected ? Colors.white : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
                side: BorderSide(
                  width: 1,
                  color: Colors.grey.withValues(alpha: .15)
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
