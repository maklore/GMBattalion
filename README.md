<h1 align="center">GMBattalion</h1>

<h4 align="center">A small system to execute callback functions in the scope of added units.</h4>

# Basic setup
- Create a script in GameMaker
	- Copy everything from [GMBattalion.gml](https://github.com/maklore/GMBattalion/blob/main/GMBattalion.gml)
  - Paste to script file

- Add unit and callback function to an order ID list.
  ```gml
  GMBattalion().report_add(0, instance_id, function(_value) { self.hello = _value.hello; });
  ```
- Execute the callback function on all units added to order ID list , can add optional arguments after order ID if the callback function requires it.
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
