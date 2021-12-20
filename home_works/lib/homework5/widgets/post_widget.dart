import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_works/homework5/model/models.dart';
import 'package:home_works/homework5/utils/text_style_types.dart';
import 'package:home_works/homework5/utils/utils.dart';
import 'package:home_works/homework5/widgets/avatar_widget.dart';

import 'comment_widget.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget(this.post);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int _currentImageIndex = 0;

  void _updateImageIndex(int index, CarouselPageChangedReason reason) {
    setState(() => _currentImageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // User Details
        Row(
          children: <Widget>[
            AvatarWidget(username: widget.post.user.name, userImage: widget.post.user.image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.post.user.name, style: bold),
                Text(widget.post.location)
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const ImageIcon(AssetImage("assets/instagram/icons/more.png"), size: 24),
              onPressed: () {  },
            )
          ],
        ),
        // Photo Carosuel
        GestureDetector(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              getCarouselSliderWidget(widget.post)
            ],
          ),
        ),
        // Action Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ImageIcon(AssetImage("assets/instagram/icons/heart.png"), size: 24),
              // child: Icon(Icons.),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon:
              // Icon(Icons.mode_comment_outlined),
              const ImageIcon(AssetImage("assets/instagram/icons/comment.png")),
              onPressed: () { },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon:
              // Icon(Icons.send),
              const ImageIcon(AssetImage("assets/instagram/icons/share.png")),
              onPressed: () {  },
            ),
            Spacer(),
            if (widget.post.images.length > 1)
              PhotoCarouselIndicator(
                photoCount: widget.post.images.length,
                activePhotoIndex: _currentImageIndex,
              ),
            if (widget.post.assetImages.length > 1)
              PhotoCarouselIndicator(
                photoCount: widget.post.assetImages.length,
                activePhotoIndex: _currentImageIndex,
              ),
            Spacer(),
            Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 24.0,
              icon: Icon(Icons.bookmark),
              onPressed: () { },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Liked by
              if (widget.post.likes.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      const Text('Likes '),
                      Text(widget.post.likes[0].name, style: bold),
                      if (widget.post.likes.length > 1) ...[
                        const Text(' and'),
                        Text(' and ${widget.post.likes.length - 1}',
                            style: bold),
                      ]
                    ],
                  ),
                ),
              // Comments
              if (widget.post.comments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Column(
                    children: widget.post.comments
                        .mapIndexed((c, index) => CommentWidget(c.text, c.user.name, index != 0))
                        .toList(),
                  ),
                ),
              // Posted Timestamp
              Text(
                widget.post.dateCreated,
                style: const TextStyle(color: Colors.grey, fontSize: 11.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getCarouselSliderWidget(Post post) {
    if (widget.post.assetImages.isEmpty) {
      return CarouselSlider(
        items:
        widget.post.images.map((filePath) {
          return Image.file(
            File(filePath),
            fit: BoxFit.fitWidth,
            width: MediaQuery
                .of(context)
                .size
                .width,
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          onPageChanged: _updateImageIndex,
        ),
      );
    } else {
      return CarouselSlider(
        items:
        widget.post.assetImages.map((url) {
          return Image.asset(
            url,
            fit: BoxFit.fitWidth,
            width: MediaQuery
                .of(context)
                .size
                .width,
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          onPageChanged: _updateImageIndex,
        ),
      );
    }
  }
}

class PhotoCarouselIndicator extends StatelessWidget {
  final int photoCount;
  final int activePhotoIndex;

  const PhotoCarouselIndicator({
    required this.photoCount,
    required this.activePhotoIndex,
  });

  Widget _buildDot({required bool isActive}) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: isActive ? 7.5 : 6.0,
        width: isActive ? 7.5 : 6.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.red : Colors.grey,
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(photoCount, (i) => i)
          .map((i) => _buildDot(isActive: i == activePhotoIndex))
          .toList(),
    );
  }
}