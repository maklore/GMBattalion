<h1 align="center">GMBattalion</h1>

<h4 align="center">A small system to execute callback functions in the scope of added units.</h4>

# Basic setup
- Create a script in GameMaker
	- Copy everything from [GMBattalion.gml](https://github.com/maklore/GMBattalion/blob/main/GMBattalion.gml)
  - Paste to script file

- Add unit `(instance_id or struct)` and order `(callback function)` to a list with an order ID.
  ```gml
  GMBattalion().report_add(0, instance_id_or_struct, function(_value) { self.hello = _value.hello; });
  ```
- Execute the order for each unit added to list, with optional cargo `(struct)`.
  ```gml
  GMBattalion().order_execute(0, { hello : "world" });
  ```
- Enjoy!


### Other functions
- Order list - Returns an array with order names.
  ```gml
  GMBattalion().order_list();
  ```
- Order remove - Removes the order from the list.
  ```gml
  GMBattalion().order_remove(0);
  ```
- Unit remove - Removes the unit from the order ID troop list.
  ```gml
  GMBattalion().unit_remove(0, my_struct_or_instance_id);
  ```
- Unit list - Returns an array of each unit name in an order ID.
  ```gml
  GMBattalion().unit_list(0);
  ```
