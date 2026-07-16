<h1 align="center">GMBattalion</h1>

<h4 align="center">A small system to execute orders on recruited units.</h4>

# Basic setup
- Create a script in GameMaker
	- Copy everything from [GMBattalion.gml](https://github.com/maklore/GMBattalion/blob/main/GMBattalion.gml)
  - Paste to script file

- Add a callback function to a list with an order ID.
  ```gml
  GMBattalion().order_add("hello", function(_value) { self.hello = _value; });
  ```
- Add units the order ID troops list.
  ```gml
  GMBattalion().unit_add("hello", my_struct);
  GMBattalion().unit_add("hello", instance_id);
  ```
- Execute the callback function on all units added to the order ID troops, can add optional arguments after order ID if the callback function requires it.
  ```gml
  GMBattalion().order_execute("hello", "world");
  ```
- Enjoy!


### Other functions
- Order list - Returns an array with order names.
  ```gml
  GMBattalion().order_list();
  ```
- Order remove - Removes the order from the list.
  ```gml
  GMBattalion().order_remove("hello");
  ```
- Unit remove - Removes the unit from the order ID troop list.
  ```gml
  GMBattalion().unit_remove("hello", my_struct_or_instance_id);
  ```
