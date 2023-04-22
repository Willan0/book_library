import 'package:book_library/constant/dimen.dart';
import 'package:book_library/data/vos/shelf_vo/shelf_vo.dart';
import 'package:book_library/persistent/dao/shelf_dao/shelf_dao.dart';
import 'package:book_library/persistent/dao/shelf_dao/shelf_dao_impl.dart';
import 'package:book_library/utils/extension.dart';
import 'package:book_library/widgets/easy_image.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../data/vos/books_vo/book_vo.dart';

class BookShelfPage extends StatefulWidget {
  const BookShelfPage({Key? key, required this.shelfName}) : super(key: key);

  final String shelfName;

  @override
  State<BookShelfPage> createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  final ShelfDAO _shelfDAO = ShelfDAOImpl();
  ShelfVO? shelfVO;
  List<Books>? bookList;
  @override
  void initState() {
    shelfVO = _shelfDAO.getShelfByName(widget.shelfName);
    bookList = shelfVO?.bookList;
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            context.previousScreen(context);
          },
          icon: const Icon(Icons.chevron_left,color: cBlack,),
        ),
        actions: const [
          Icon(Icons.search,color: cBlack,),
          SizedBox(width: kMp10x,),
          Icon(Icons.more_vert,color: cBlack,),
          SizedBox(width: kMp10x,)
        ],
        title: const EasyText(text: 'Shelf Books',fontSize: kFs18x,),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kMp10x),
        child: bookList!.isNotEmpty?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kMp20x,),
            EasyText(text: shelfVO?.shelfName ?? '',fontSize: kFs18x,),
            EasyText(text: '${bookList?.length?? 0} books',fontSize: kFs18x,),
            const SizedBox(height: kMp20x,),
            Expanded(
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: kWh300x,
                ),
                    itemCount: bookList?.length ?? 0,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kRi15x),
                          ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(kRi15x),
                                child: EasyImage(imgUrl: bookList?[index].bookImage ?? '', height: kWh205x))),
                        const SizedBox(height: kMp10x,),
                        EasyText(text: bookList?[index].title ?? '',)
                      ],
                    ),
                )
            ),
          ],
        ):const EasyText(text: 'Currently There is no book',fontSize: kFs18x,),
      ),
    );
  }
}
