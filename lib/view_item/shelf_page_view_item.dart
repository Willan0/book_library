import 'package:book_library/bloc/create_shelf_bloc.dart';
import 'package:book_library/utils/extension.dart';
import 'package:book_library/widgets/easy_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../widgets/create_shelf_view.dart';
import '../widgets/easy_text.dart';

class EmptyShelfView extends StatelessWidget {
  const EmptyShelfView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: kWh205x,),
          Icon(Icons.library_add,size: kIs100x,color: cGrey,),
          SizedBox(height: kMp10x,),
          EasyText(text: 'There is no shelf right now.Create one',fontColor: cGrey,)
        ],
      ),
    );
  }
}

class FloatingActonView extends StatelessWidget {
  const FloatingActonView({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton.extended(onPressed: (){
      showDialog(context: context, builder: (context) =>
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                height: kWh260x,
                width: kWh360x,
                decoration: const BoxDecoration(
                    color: cWhiteShadow,
                    borderRadius: BorderRadius.all(Radius.circular(kRi10x))
                ),
                margin: const EdgeInsets.all(kMp10x),
                padding: const EdgeInsets.all(kMp20x),
                child: ChangeNotifierProvider<CreateShelfBloc>(
                  create: (_)=> CreateShelfBloc(),
                    child: const CreateShelfView()),
              ),
            ),
          ),);
    }, label: Row(
      children:  [
        const Icon(Icons.edit),
        EasyText(text: text,fontColor: cWhite,fontWeight: FontWeight.bold,),
      ],
    ));
  }
}

class CreateShelfView extends StatelessWidget {
  const CreateShelfView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreateShelfViewItem(globalKey:  context.getShelfBlocInstance().getGlobalKey,);
  }
}

class CreateShelfViewItem extends StatelessWidget {
  const CreateShelfViewItem({
    Key? key, required this.globalKey,
  }) : super(key: key);
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: kWh30x,),
          const EasyText(text: 'Enter shelf name',fontColor: cGrey,fontSize: kFs18x,),
          const SizedBox(height: kMp10x,),
          CreateShelfTextFieldView(
            validator: (value){
              if(value?.isEmpty ?? false){
                return 'Shelf name is Empty';
              }
              return null;
            },
            controller: context.getShelfBlocInstance().getShelfController,

          ),
          const SizedBox(height: kWh30x,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              EasyButton(color: cCyan, text: 'Cancel', height: kWh40x, textColor: cWhite,onPressed: (){
                context.previousScreen(context);
              },),
              EasyButton(color: cCyan, text: 'Ok', height: kWh40x, textColor: cWhite,onPressed: (){
                if(context.getShelfBlocInstance().getGlobalKey.currentState?.validate() ?? false){
                  context.getShelfBlocInstance().createShelf();
                  context.previousScreen(context);
                }
              },),
            ],
          )
        ],
      ),
    );
  }
}




