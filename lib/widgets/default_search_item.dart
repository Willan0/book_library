import 'package:flutter/material.dart';

import '../view_item/search_page_view_item.dart';

class DefaultSearchItem extends StatelessWidget {
  const DefaultSearchItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchFakeView(
          icon: Icons.add,
          label: 'Top Selling',
        ),
        SearchFakeView(
          icon: Icons.notification_add,
          label: 'New Release',
        ),
        SearchFakeView(
          icon: Icons.add_business,
          label: 'BookShop',
        ),
      ],
    );
  }
}