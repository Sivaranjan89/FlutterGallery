import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/animations/animated_switcher.dart';
import 'package:flutter_gallery/appbar/app_bar.dart';
import 'package:flutter_gallery/appbar/silver_app_bar.dart';
import 'package:flutter_gallery/appbar/silver_app_bar_fab.dart';
import 'package:flutter_gallery/button/drop_down_button.dart';
import 'package:flutter_gallery/button/flat_button.dart';
import 'package:flutter_gallery/button/icon_button.dart';
import 'package:flutter_gallery/button/raised_button.dart';
import 'package:flutter_gallery/button/toggle_button.dart';
import 'package:flutter_gallery/checkbox/checkbox.dart';
import 'package:flutter_gallery/chips/chips.dart';
import 'package:flutter_gallery/datatable/data_table.dart';
import 'package:flutter_gallery/datatable/paginated_data_table.dart';
import 'package:flutter_gallery/datatable/table.dart';
import 'package:flutter_gallery/dialog/alert_dialog.dart';
import 'package:flutter_gallery/dialog/custom_dialog.dart';
import 'package:flutter_gallery/dialog/time_date_dialog.dart';
import 'package:flutter_gallery/drawer/drawer.dart';
import 'package:flutter_gallery/home/home_screen.dart';
import 'package:flutter_gallery/image/image_asset.dart';
import 'package:flutter_gallery/image/image_url.dart';
import 'package:flutter_gallery/list/expansion_panel.dart';
import 'package:flutter_gallery/list/expansion_tile.dart';
import 'package:flutter_gallery/list/grid_view.dart';
import 'package:flutter_gallery/list/list_view.dart';
import 'package:flutter_gallery/list/list_view_builder.dart';
import 'package:flutter_gallery/menu/bottom_sheet.dart';
import 'package:flutter_gallery/menu/pop_menu.dart';
import 'package:flutter_gallery/pager/pager.dart';
import 'package:flutter_gallery/pager/pager_indicator.dart';
import 'package:flutter_gallery/radiobutton/radiobutton.dart';
import 'package:flutter_gallery/switch/switch.dart';
import 'package:flutter_gallery/switch/switch_list_tile.dart';
import 'package:flutter_gallery/tabs/bottom_bar.dart';
import 'package:flutter_gallery/tabs/bottom_bar_fab.dart';
import 'package:flutter_gallery/tabs/tab_bar.dart';
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
  List<String> sorted_titles = List();
  List<String> sorted_subtitles = List();

  @override
  void initState() {
    super.initState();

    //Load titles after animation completion
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        addTitles();
        for(int i=0; i<titles.length; i++) {
          sorted_titles.add(titles[i]);
          sorted_subtitles.add(sub_titles[i]);
        }
      });
    });
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);

    titles.clear();
    sub_titles.clear();
    sorted_titles.clear();
    sorted_subtitles.clear();
    addTitles();
    if(!HomeScreen.searchedKeyword.isEmpty) {
      for(int i=0; i<titles.length; i++) {
        if(titles.elementAt(i).toLowerCase().contains(HomeScreen.searchedKeyword.toLowerCase())) {
          sorted_titles.add(titles.elementAt(i));
          sorted_subtitles.add(sub_titles.elementAt(i));
        }
      }
    } else {
      for(int i=0; i<titles.length; i++) {
        sorted_titles.add(titles[i]);
        sorted_subtitles.add(sub_titles[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(cacheExtent: 100, itemCount: sorted_titles.length, itemBuilder: (context, pos) {
      return Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text(sorted_titles.elementAt(pos)),
              subtitle: Text(sorted_subtitles.elementAt(pos)),
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
    titles.add("Chips");
    titles.add("Date / Time Picker");
    titles.add("Drawer");
    titles.add("Tab Bar");
    titles.add("Bottom Bar");
    titles.add("Bottom Bar (FAB)");
    titles.add("ViewPager");
    titles.add("ViewPager with Indicator");
    titles.add("ListView");
    titles.add("ListView Builder");
    titles.add("GridView");
    titles.add("AppBar");
    titles.add("SliverAppBar");
    titles.add("Sliver FAB");
    titles.add("Table");
    titles.add("Data Table");
    titles.add("Paginated Data Table");
    titles.add('ExpansionTile');
    titles.add('ExpansionPanelList');
    titles.add('PopMenu');
    titles.add('BottomSheet');
    titles.add('Progress Bar');
    titles.add('Slider');
    titles.add('SnackBar');
    titles.add('Reorder List');
    titles.add('Swipe to Dismiss List');

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
    sub_titles.add("Shows a chip view to the user");
    sub_titles.add("Shows a date / time picker dialog for user to graphically choose");
    sub_titles.add("Renders a navigation drawer on the left / right which can slided inside the screen");
    sub_titles.add("Renders tabs where each tab will display its allocated child view. Much like viewing multiple screens in one screen");
    sub_titles.add("Similar to the Tab bar but placed in the bottom");
    sub_titles.add("Bottom Bar with Floating Action Button notched to it");
    sub_titles.add("Pager allows you to create and navigate multiple pages with a horizontal / vertical scrolling funcionality");
    sub_titles.add("Design a pager with an indicator to indicate page number");
    sub_titles.add("Design a list of items");
    sub_titles.add("Design a list of items using builder");
    sub_titles.add("Display items in a Grid format. Commonly used to display images");
    sub_titles.add("Create a Fixed Appbar to display a group of widgets with actions");
    sub_titles.add("Display a Collapsing AppBar");
    sub_titles.add("Display a Collapsing AppBar with a Floating Action button attached");
    sub_titles.add("Display a grid of data which appears like a table but has no scrolling");
    sub_titles.add("Display a table of hude data");
    sub_titles.add("Display a table of hude data with Pagination");
    sub_titles.add('Display two or multi level lists');
    sub_titles.add('Display multi level lists in the form of Panels');
    sub_titles.add('Display a menu button which will show a list of options as popup');
    sub_titles.add('Slide a page from below to perform some action or display some information for the user');
    sub_titles.add('Progress Bar');
    sub_titles.add('Slider');
    sub_titles.add('SnackBar');
    sub_titles.add('Reorder List');
    sub_titles.add('Swipe to Dismiss List');
  }

  void renderPreview(int pos) {
    if(sorted_titles.elementAt(pos) == 'Raised Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewRaisedButton()));
    }
    else if(sorted_titles.elementAt(pos) == 'Flat Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewFlatButton()));
    }
    else if(sorted_titles.elementAt(pos) == 'Icon Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewIconButton()));
    }
    else if(sorted_titles.elementAt(pos) == 'Drop Down Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewDropDownButton()));
    }
    else if(sorted_titles.elementAt(pos) == 'Toggle Button') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewToggleButton()));
    }
    else if(sorted_titles.elementAt(pos) == 'Text') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewText()));
    }
    else if(sorted_titles.elementAt(pos) == 'Rich Text') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewRichText()));
    }
    else if(sorted_titles.elementAt(pos) == 'TextField') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewTextField()));
    }
    else if(sorted_titles.elementAt(pos) == 'TextFormField') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewTextForm()));
    }
    else if(sorted_titles.elementAt(pos) == 'Image (Assets)') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewImageAsset()));
    }
    else if(sorted_titles.elementAt(pos) == 'Image (URL)') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewImageURL()));
    }
    else if(sorted_titles.elementAt(pos) == 'Switch') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewSwitch()));
    }
    else if(sorted_titles.elementAt(pos) == 'SwitchListTile') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewSwitchListTile()));
    }
    else if(sorted_titles.elementAt(pos) == 'AnimatedSwitcher') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewAnimatedSwitcher()));
    }
    else if(sorted_titles.elementAt(pos) == 'Checkbox') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewCheckbox()));
    }
    else if(sorted_titles.elementAt(pos) == 'RadioButton') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewRadioButton()));
    }
    else if(sorted_titles.elementAt(pos) == 'AlertDialog') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewAlertDialog()));
    }
    else if(sorted_titles.elementAt(pos) == 'Dialog') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewDialog()));
    }
    else if(sorted_titles.elementAt(pos) == 'Chips') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewChips()));
    }
    else if(sorted_titles.elementAt(pos) == 'Date / Time Picker') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewTimeDateDialog()));
    }
    else if(sorted_titles.elementAt(pos) == 'Drawer') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewDrawer()));
    }
    else if(sorted_titles.elementAt(pos) == 'Tab Bar') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewTabBar()));
    }
    else if(sorted_titles.elementAt(pos) == 'Bottom Bar') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewBottomBar()));
    }
    else if(sorted_titles.elementAt(pos) == 'Bottom Bar (FAB)') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewBottomBarFAB()));
    }
    else if(sorted_titles.elementAt(pos) == 'ViewPager') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewViewpager()));
    }
    else if(sorted_titles.elementAt(pos) == 'ViewPager with Indicator') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewViewpagerIndicator()));
    }
    else if(sorted_titles.elementAt(pos) == 'ListView') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewListview()));
    }
    else if(sorted_titles.elementAt(pos) == 'ListView Builder') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewListViewBuilder()));
    }
    else if(sorted_titles.elementAt(pos) == 'GridView') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewGridView()));
    }
    else if(sorted_titles.elementAt(pos) == 'AppBar') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewAppbar()));
    }
    else if(sorted_titles.elementAt(pos) == 'SliverAppBar') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewSilverAppbar()));
    }
    else if(sorted_titles.elementAt(pos) == 'Sliver FAB') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewSilverAppbarFAB()));
    }
    else if(sorted_titles.elementAt(pos) == 'Table') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewTable()));
    }
    else if(sorted_titles.elementAt(pos) == 'Data Table') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewDataTable()));
    }
    else if(sorted_titles.elementAt(pos) == 'Paginated Data Table') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewPaginatedDataTable()));
    }
    else if(sorted_titles.elementAt(pos) == 'ExpansionTile') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewExpansionTile()));
    }
    else if(sorted_titles.elementAt(pos) == 'ExpansionPanelList') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewExpansionPanelList()));
    }
    else if(sorted_titles.elementAt(pos) == 'PopMenu') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewPopMenu()));
    }
    else if(sorted_titles.elementAt(pos) == 'BottomSheet') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewBottomSheet()));
    }
  }
}
