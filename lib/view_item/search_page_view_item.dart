import 'package:book_library/bloc/search_bloc.dart';
import 'package:book_library/data/vos/volume_info/volume_info.dart';
import 'package:book_library/pages/detail_page.dart';
import 'package:book_library/utils/extension.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/vos/item_vo/item_vo.dart';
import '../widgets/default_search_item.dart';
import '../widgets/easy_image.dart';
import '../widgets/search_view_widget.dart';

class SearchItemView extends StatelessWidget {
  const SearchItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: kMp10x,),
        GestureDetector(
            onTap: () {
              context.previousScreen(context);
            },
            child: const Icon(Icons.chevron_left)),
        Expanded(
          child: Selector<SearchBloc, String>(
            selector: (_, selector) => selector.getHistory,
            builder: (_, history, __) => SearchMovieWidget(
              isAutoFocus: true,
              isEnable: true,
              onChange: (text) => context.getSearchBlocInstance().search(text),
              controller:
                  context.getSearchBlocInstance().getSearchEditingController,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key, required this.items}) : super(key: key);

  final List<ItemVO> items;
  @override
  Widget build(BuildContext context) {
    return (items.isEmpty)
        ? Selector<SearchBloc, List<String>?>(
            selector: (_, selector) => selector.getSearchHistory,
            builder: (_, searchHistory, __) {
              if (searchHistory == null) {
                return const DefaultSearchItem();
              }
              if (searchHistory.isEmpty) {
                return const DefaultSearchItem();
              }
              return ListView(
                children: [
                  Column(
                    children: searchHistory
                        .map((e) => GestureDetector(
                            onTap: () => context
                                .getSearchBlocInstance()
                                .searchByHistory(e),
                            child:
                                SearchFakeView(icon: Icons.history, label: e)))
                        .toList()
                        .reversed
                        .toList(),
                  ),
                  const DefaultSearchItem(),
                ],
              );
            })
        : Selector<SearchBloc, bool>(
            selector: (_, selector) => selector.getIsSearching,
            builder: (_, isSearching, __) => isSearching
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      return SearchListViewItem(
                        volumeInfoVO: items[index].volumeInfo!,
                      );
                    })),
          );
  }
}



class SearchFakeView extends StatelessWidget {
  const SearchFakeView({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMp10x),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: kWh50x,
          ),
          EasyText(text: label,fontColor: cGrey,)
        ],
      ),
    );
  }
}

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    Key? key,
    required this.volumeInfoVO,
  }) : super(key: key);

  final VolumeInfoVO volumeInfoVO;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kMp10x),
        child: GestureDetector(
          onTap: (){
            context.nextScreen(context, DetailPage(
                bookName: volumeInfoVO.title ?? '',
                imageLink: volumeInfoVO.imageLinks?.thumbnail ?? '',
                author: volumeInfoVO.authors?.first ?? '',
                description: volumeInfoVO.description ?? ''
            ));
          },
          child: ListTileFake(
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(kRi15x)),
              child: EasyImage(
                height: kWh160x,
                imgUrl: volumeInfoVO.imageLinks?.thumbnail ?? '',
              ),
            ),
            title: volumeInfoVO.title ?? '',
            subTitle: volumeInfoVO.printType ?? '',
          ),
        ));
  }
}

class ListTileFake extends StatelessWidget {
  const ListTileFake(
      {Key? key,
      required this.leading,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final Widget leading;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading,
        const SizedBox(
          width: kMp3x,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EasyText(text: title),
              const SizedBox(
                height: kMp10x,
              ),
              EasyText(
                text: subTitle,
                fontColor: cSecondaryTextColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
