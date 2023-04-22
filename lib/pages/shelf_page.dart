import 'package:book_library/bloc/show_shelf_bloc.dart';
import 'package:book_library/constant/color.dart';
import 'package:book_library/data/vos/shelf_vo/shelf_vo.dart';
import 'package:book_library/pages/book_shelf_page.dart';
import 'package:book_library/utils/extension.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/dimen.dart';
import '../constant/string.dart';
import '../data/vos/books_vo/book_vo.dart';
import '../view_item/shelf_page_view_item.dart';
import '../widgets/easy_image.dart';

class ShelfPage extends StatelessWidget {
  const ShelfPage({Key? key,this.isChecked = false, required this.text, required this.bookVO}) : super(key: key);

  final Books bookVO;
  final String text;

  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowShelfBloc>(
      create: (_)=> ShowShelfBloc(isChecked?bookVO:Books(order: 0)),
      child: Consumer<ShowShelfBloc>(
        builder: (context, bloc, child) => Scaffold(
          appBar: isChecked?null:AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading:  IconButton(onPressed:(){
              context.previousScreen(context);
            },icon:const Icon(Icons.chevron_left),color: cBlack,),
            title: const EasyText(text: 'Add to shelf',),
          ),
          body: Selector<ShowShelfBloc,List<ShelfVO>?>(
            selector: (_,selector)=> selector.getShelfList,
              builder: (context, value, child) {
              if(value== null){
                return const EmptyShelfView();
              }
              if(value.isEmpty){
                return const EmptyShelfView();
              }
              return ListView.separated(
                  itemBuilder: (context, index) => ShelfView(shelfVO: value[index], bookVO: bookVO,isChecked: isChecked),
                  separatorBuilder: (context, index) => const SizedBox(height: kMp10x,),
                  itemCount: value.length);
              },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:  FloatingActonView(text: text,),
        ),
      ),
    );
  }
}

class ShelfView extends StatelessWidget {
  const ShelfView({
    Key? key, required this.shelfVO, required this.bookVO, required this.isChecked,
  }) : super(key: key);
  final ShelfVO shelfVO;
  final Books bookVO;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return  Card(
        child: ListTile(
          onTap: isChecked?(){
          }:(){
            context.getShowShelfBlocInstance().addBookToShelf(shelfVO, bookVO);
            context.previousScreen(context);
          },
          leading: (shelfVO.bookList.isEmpty)?const EasyImage(imgUrl: kDefaultImage, height: kWh50x,width: kWh50x,):EasyImage(imgUrl: shelfVO.bookList.first.bookImage ??'', height: kWh50x,width: kWh50x,),
          title: EasyText(text: shelfVO.shelfName ?? '',),
          subtitle: EasyText(text: '${shelfVO.bookList.length} books'),
          trailing: IconButton(onPressed: (){
            context.nextScreen(context,BookShelfPage(shelfName: shelfVO.shelfName ?? '',));
          },icon: const Icon(Icons.chevron_right),),
        ));
  }
}





