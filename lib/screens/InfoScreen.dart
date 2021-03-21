import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);
  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: widget.looping,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'FAQ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'How do I report dengue in Singapore?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'To report potential mosquito breeding sites to NEA, '
          '\n'
          'please call 1800-2255-632 or Contact_NEA@nea.gov.sg.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'How effective is the survey?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'The survey helps to determine the dengue '
          '\n'
          'risk level of your home.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'How do I share this application?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Do help spread to your loved ones'
          '\n'
          'to help them stay safe!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        Flexible(
          child: ChewieListItem(
            videoPlayerController:
                VideoPlayerController.asset('videos/dengue.mp4'),
          ),
        ),
      ],
    );
  }
}
