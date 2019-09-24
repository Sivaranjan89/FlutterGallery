import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/animations/animated_switcher.dart';
import 'package:flutter_gallery/button/drop_down_button.dart';
import 'package:flutter_gallery/button/flat_button.dart';
import 'package:flutter_gallery/button/icon_button.dart';
import 'package:flutter_gallery/button/raised_button.dart';
import 'package:flutter_gallery/button/toggle_button.dart';
import 'package:flutter_gallery/checkbox/checkbox.dart';
import 'package:flutter_gallery/dialog/alert_dialog.dart';
import 'package:flutter_gallery/image/image_asset.dart';
import 'package:flutter_gallery/image/image_url.dart';
import 'package:flutter_gallery/radiobutton/radiobutton.dart';
import 'package:flutter_gallery/switch/switch.dart';
import 'package:flutter_gallery/switch/switch_list_tile.dart';
import 'package:flutter_gallery/text/rich_text.dart';
import 'package:flutter_gallery/text/text.dart';
import 'package:flutter_gallery/textinput/text_field.dart';
import 'package:flutter_gallery/textinput/text_form_field.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  List<String> titles = List();
  List<String> sub_titles = List();

  @override
  void initState() {
    super.initState();

    //Load titles after animation completion
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        addTitles();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: titles.length, itemBuilder: (context, pos) {
      return Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text(titles.elementAt(pos)),
              subtitle: Text(sub_titles.elementAt(pos)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 30),
              onTap: () {
                renderPreview(pos);
              },
            ),
          ),
        )
      );
    });
  }

  void addTitles() {
    titles.add("Text");
    titles.add("Rich Text");
    titles.add("Raised Button");
    titles.add("Flat Button");
    titles.add("Icon Button");
    titles.add("Drop Down Button");
    titles.add("Toggle Button");
    titles.add("TextField");
    titles.add("TextFormField");
    titles.add("Image (Assets)");
    titles.add("Image (URL)");
    titles.add("Switch");
    titles.add("SwitchListTile");
    titles.add("AnimatedSwitcher");
    titles.add("Checkbox");
    titles.add("RadioButton");
    titles.add("AlertDialog");
    titles.add("Dialog");

    sub_titles.add("Lets you display text to the user");
    sub_titles.add("Lets you span the text in different ways");
    sub_titles.add("Gives a 3D look to a button");
    sub_titles.add("Buttons with zero elevation");
    sub_titles.add("Buttons with image only combined with a splash effect");
    sub_titles.add("Buttons that behave like combo boxes");
    sub_titles.add("Buttons that provide choices to select from");
    sub_titles.add("Allows the user to input data");
    sub_titles.add("Lets us validate every textfield eassily");
    sub_titles.add("Load Image from Assets");
    sub_titles.add("Load Image from URL");
    sub_titles.add("Allows user to choose between two states");
    sub_titles.add("Allows user to choose between two states along with an image and text");
    sub_titles.add("Switch between widgets with a nice animation");
    sub_titles.add("Give multiple choices for user to choose from");
    sub_titles.add("Give multiple choices for user to choose just one unlike checkbox");
    sub_titles.add("Shows a dialog that requires immediate attention to the user");
    sub_titles.add("Shows a customized dialog to the user");
  }

  void renderPreview(int pos) {
    if(titles.elementAt(pos) == 'Raised Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewRaisedButton()));
    }
    else if(titles.elementAt(pos) == 'Flat Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewFlatButton()));
    }
    else if(titles.elementAt(pos) == 'Icon Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewIconButton()));
    }
    else if(titles.elementAt(pos) == 'Drop Down Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewDropDownButton()));
    }
    else if(titles.elementAt(pos) == 'Toggle Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewToggleButton()));
    }
    else if(titles.elementAt(pos) == 'Text') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewText()));
    }
    else if(titles.elementAt(pos) == 'Rich Text') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewRichText()));
    }
    else if(titles.elementAt(pos) == 'TextField') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewTextField()));
    }
    else if(titles.elementAt(pos) == 'TextFormField') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewTextForm()));
    }
    else if(titles.elementAt(pos) == 'Image (Assets)') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewImageAsset()));
    }
    else if(titles.elementAt(pos) == 'Image (URL)') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewImageURL()));
    }
    else if(titles.elementAt(pos) == 'Switch') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewSwitch()));
    }
    else if(titles.elementAt(pos) == 'SwitchListTile') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewSwitchListTile()));
    }
    else if(titles.elementAt(pos) == 'AnimatedSwitcher') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewAnimatedSwitcher()));
    }
    else if(titles.elementAt(pos) == 'Checkbox') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewCheckbox()));
    }
    else if(titles.elementAt(pos) == 'RadioButton') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewRadioButton()));
    }
    else if(titles.elementAt(pos) == 'AlertDialog') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewAlertDialog()));
    }
    else if(titles.elementAt(pos) == 'Dialog') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewAlertDialog()));
    }
  }
}
