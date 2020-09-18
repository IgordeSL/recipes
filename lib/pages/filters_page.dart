import 'package:recipes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  final Function _saveFilters;
  final Map<String, bool> currentFilters;

  FiltersPage({
    @required this.currentFilters,
    onSave: Function,
  }) : this._saveFilters = onSave;

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    this._glutenFree = widget.currentFilters['glutenFree'];
    this._vegetarian = widget.currentFilters['vegetarian'];
    this._vegan = widget.currentFilters['vegan'];
    this._lactoseFree = widget.currentFilters['lactoseFree'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget._saveFilters({
                  'glutenFree': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactoseFree': _lactoseFree,
                });
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SwitchListTile.adaptive(
                title: Text('Gluten free'),
                subtitle: Text('Only include gluten free meals'),
                value: _glutenFree,
                onChanged: (value) {
                  setState(
                    () {
                      _glutenFree = value;
                    },
                  );
                },
              ),
              SwitchListTile.adaptive(
                title: Text('Lactose free'),
                subtitle: Text('Only include lactose free meals'),
                value: _lactoseFree,
                onChanged: (value) {
                  setState(
                    () {
                      _lactoseFree = value;
                    },
                  );
                },
              ),
              SwitchListTile.adaptive(
                title: Text('Vegetarian'),
                subtitle: Text('Only include vegetarian meals'),
                value: _vegetarian,
                onChanged: (value) {
                  setState(
                    () {
                      _vegetarian = value;
                    },
                  );
                },
              ),
              SwitchListTile.adaptive(
                title: Text('Vegan'),
                subtitle: Text('Only include vegan meals'),
                value: _vegan,
                onChanged: (value) {
                  setState(
                    () {
                      _vegan = value;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
