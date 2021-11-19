import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/homework4/image_details.dart';
import 'package:home_works/homework4/image_store.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';


class Hw4 extends StatefulWidget {
  Hw4({Key? key}) : super(key: key);

  final String title = "Homework 4";

  @override
  _Hw4State createState() => _Hw4State();
}

class _Hw4State extends State<Hw4> {
  ImageStore _imageStore = Modular.get<ImageStore>();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  double scale = 1;

  _renderImage(ImageDetails img) {
    Widget? image = Container();
    image = Image.file(
      File(img.file!.path),
      fit: BoxFit.fill,
    );
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _imageStore.fetchImageFromCamera(onAdd: () {
                  listKey.currentState!
                      .insertItem(_imageStore.images.length - 1);
                });
              },
              icon: Icon(Icons.add_a_photo)),
          IconButton(
              onPressed: () {
                _imageStore.fetchImageFromGallery(onAdd: () {
                  listKey.currentState!
                      .insertItem(_imageStore.images.length - 1);
                });
              },
              icon: Icon(Icons.add_photo_alternate_sharp))
        ],
        title: new Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: Observer(builder: (context) {
                return Observer(builder: (context) {
                  return AnimatedList(
                    key: listKey,
                    initialItemCount: _imageStore.images.length,
                    itemBuilder: (BuildContext context, int index,
                        Animation<double> animation) {
                      ImageDetails item = _imageStore.images[index];
                      return ScaleTransition(
                        scale: animation,
                        child:
                          // key: Key(item.title),
                          // leading: _renderImage(item),
                          // title: Text(
                          //   item.title,
                          // )
                          //     .textColor(Colors.black54)
                          //     .fontSize(16)
                          //     .fontWeight(FontWeight.bold)
                          //     .scale(all: scale, animate: true)
                          //     .animate(Duration(milliseconds: 1000), Curves.bounceInOut),
                          // onTap: () {
                          //   Modular.to.pushNamed('/Hw4/Detail', arguments: item);
                          // },

                            _buildPinchModelList(item,index)
                        ,
                      );
                    },
                  );
                });
              })),
            ],
          ),
        )),
      ),
      // body: Container(
      //   margin: EdgeInsets.only(left: 0, right: 10),
      //   child: ListView.builder(
      //       itemCount: _imageStore.images.length,
      //       scrollDirection: Axis.vertical,
      //       //shrinkWrap: true,
      //       itemBuilder: (BuildContext context, int index) {
      //         return _buildPinchModelList(_imageStore.images[index], index);
      //       }),
      // ),
    );
  }

  Widget _buildPinchModelList(ImageDetails img, int index) {
    return Container(
      padding: EdgeInsets.only(top: 15.0, left: 15, right: 15),
      child: PinchZoomImage(
        image: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: _renderImage(img),
        ),
        zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
        hideStatusBarWhileZooming: true,
        onZoomStart: () {
          print('Zoom started');
        },
        onZoomEnd: () {
          print('Zoom finished');
        },
      ),
    );
  }
}
