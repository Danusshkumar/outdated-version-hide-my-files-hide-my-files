import 'package:flutter/material.dart';
import 'package:hide_my_files/ui_for_home.dart';

//these packages are included for icons
import 'package:hide_my_files/app_icons.dart';
import 'package:hide_my_files/images_icons.dart';
import 'package:hide_my_files/contact_icons.dart';


class Home extends StatelessWidget {// main stateless widget
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {//build function
    return SafeArea(
      child: Scaffold(
        body: Container(//main body
          decoration:UiForHome.homeContainerDecoration(),//main body ui
          child: Column(
            children:[
              Flexible(
                flex:8,
                child: SizedBox(// this children is for top design
                  width:UiForHome.infoBoxContWidth(context),//width of top design
                  child:CustomPaint(//top design
                    painter:Bezier(context),//painter
                    child:Container(
                      padding:const EdgeInsets.all(5),//padding for inner item
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(//container for heading and settings button
                            margin:UiForHome.headingTxtMargin(),
                            child: Row(//row for heading and settings icon
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Welcome to Hide My Files",
                                  style:UiForHome.headingTxtStyle(context),
                                ),
                                IconButton(
                                  onPressed:(){},
                                  icon:Icon(
                                    Icons.settings,
                                    size:MediaQuery.of(context).size.height * 0.04,
                                  ),
                                  color:Colors.white70,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height:UiForHome.headingInfoSizedBoxHeight(context)),//gap between heading and info
                          Row(//first info row
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UiForHome.infoDetailTxt(context,"Photos & videos"),//info
                              UiForHome.infoDetailTxt(context,"Audio"),//info
                            ],
                          ),
                          SizedBox(height:UiForHome.infoInfoSizedBoxHeight(context)),//gap between info
                          Row(//second info row
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              UiForHome.infoDetailTxt(context, "Documents\t     "),//info
                              UiForHome.infoDetailTxt(context, "Other files"),//info
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
              Flexible(
                flex:1,
                child:Container(),
              ),
              Flexible(
                flex:16,
                child: Container(//this children is for grid view //the children is scrollView
                  height:UiForHome.scrollViewContHeight(context),//scrollView height
                  width:UiForHome.scrollViewContWidth(context),//scrollView width
                  padding:EdgeInsets.symmetric(horizontal:UiForHome.scrollViewHorPadding),
                  child: ScrollConfiguration(//scrollView (for hiding scroll)
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: SingleChildScrollView(//scrollView main
                      child:Column(//column
                        children:[
                          Row(//1st row
                            children: [
                              UiForHome.cardDesign(context,icon:Images.picture,text:"images",onTap:"images"),//image
                              SizedBox(width:UiForHome.rowGapSizedBoxWidth(context)),//gap
                              UiForHome.cardDesign(context,icon:Icons.video_collection_sharp,text:"videos",onTap:"videos"),//video
                            ],
                          ),
                          SizedBox(height:UiForHome.columnGapSizedBoxHeight),
                          Row(
                            children:[
                              UiForHome.cardDesign(context,icon:Icons.library_music_rounded,text:"audio",onTap:"audio"),//music
                              SizedBox(width:UiForHome.rowGapSizedBoxWidth(context)),//gap
                              UiForHome.cardDesign(context,icon:Icons.file_copy_rounded,text:"all files",onTap:"all files"),//all files
                            ],
                          ),
                          SizedBox(height:UiForHome.columnGapSizedBoxHeight),
                          Row(
                            children: [
                              UiForHome.cardDesign(context,icon:Icons.picture_as_pdf_sharp,text:"pdf",onTap:"pdf"),//pdf
                              SizedBox(width:UiForHome.rowGapSizedBoxWidth(context)),//gap
                              UiForHome.cardDesign(context,icon:Excel.file_excel,text:"excel",onTap:"excel")//excel
                            ],
                          ),
                          SizedBox(height:UiForHome.columnGapSizedBoxHeight),
                          Row(
                            children: [
                              UiForHome.cardDesign(context,icon:Contact.perm_contact_calendar,text:"contacts",onTap:"contacts"),//contact
                              SizedBox(width:UiForHome.rowGapSizedBoxWidth(context)),//gap
                              UiForHome.cardDesign(context,icon:Icons.sticky_note_2_sharp,text:"notes",onTap:"notes"),//notes
                            ],
                          ),
                          SizedBox(height:UiForHome.columnGapSizedBoxHeight),
                          Row(
                            children: [
                              UiForHome.cardDesign(context,icon:Icons.event_note_sharp,text:"secret diary",onTap:"secret diary"),//diary
                              SizedBox(width:UiForHome.rowGapSizedBoxWidth(context)),//gap
                              UiForHome.cardDesign(context,icon:Icons.camera_alt_rounded,text:"camera",onTap:"camera"),//camera
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
