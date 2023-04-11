import 'package:book_library/bloc/show_shelf_bloc.dart';
import 'package:book_library/constant/color.dart';
import 'package:book_library/data/vos/shelf_vo/shelf_vo.dart';
import 'package:book_library/utils/extension.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/dimen.dart';
import '../data/vos/books_vo/book_vo.dart';
import '../view_item/shelf_page_view_item.dart';

class ShelfPage extends StatelessWidget {
  const ShelfPage({Key? key,this.isChecked = false, required this.text}) : super(key: key);

  // final Books bookVO;
  final String text;

  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowShelfBloc>(
      create: (_)=> ShowShelfBloc(),
      child: Scaffold(
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
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: EasyText(text: value[index].bookName ?? '',),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: kMp10x,),
                itemCount: value.length);
            },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:  FloatingActonView(text: text,),
      ),
    );
  }
}





