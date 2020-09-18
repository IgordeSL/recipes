import 'package:recipes/pages/filters_page.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(36),
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(16),
              color: Theme.of(context).accentColor,
              child: Text(
                'Cooking up!',
                style: (Theme.of(context).textTheme.headline6).copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            buildListTile(
              context: context,
              title: 'Meals',
              icon: Icons.restaurant,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).popUntil(
                  (route) => route.isFirst,
                );
              },
              selected: ModalRoute.of(context).settings.name.endsWith('/'),
            ),
            buildListTile(
              context: context,
              title: 'Filters',
              icon: Icons.filter_list,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FiltersPage.routeName);
              },
              selected: ModalRoute.of(context)
                  .settings
                  .name
                  .endsWith(FiltersPage.routeName),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile({
    @required BuildContext context,
    @required String title,
    @required IconData icon,
    @required Function onTap,
    bool selected = false,
  }) {
    var _theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color:
            selected ? _theme.primaryColor : _theme.textTheme.headline6.color,
        size: 32,
      ),
      title: Text(
        title,
        style: _theme.textTheme.headline6.copyWith(
          fontFamily: 'RobotoCondensed',
          color:
              selected ? _theme.primaryColor : _theme.textTheme.headline6.color,
        ),
      ),
      onTap: !selected ? onTap : null,
    );
  }
}
