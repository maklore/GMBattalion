/**
* A system to execute orders on "recruited units".
* @returns {struct.GMBattalion}
*/
function GMBattalion(){
	
	static __station = undefined;
	
	if __station != undefined { return __station; }

	static __chart = ds_map_create();
		
	/**
	* Add unit and callback function to an order ID list.
	* @param {any} _id Order ID.
	* @param {struct | Id.Instance} _struct_or_instance Struct or instance.
	* @param {Function} _callback Function.
	*/
	static report_add = function(_id, _struct_or_instance, _callback) {
		if !ds_map_exists(__chart, _id) { 
			ds_map_add(__chart, _id, {
				orders : [],
				troops : []
			});
		} else if array_contains(__chart[? _id].troops, _struct_or_instance) {
			return false;
		}
		array_push(__chart[? _id].orders, _callback);
		array_push(__chart[? _id].troops, _struct_or_instance);
		return true;
	}
		
	/**
	* Removes the order from the list.
	* @param {any} _id Order ID.
	*/
	static order_remove = function(_id) {
		if !ds_map_exists(__chart, _id) { return $"{_id} does not exist."; }
		ds_map_delete(__chart, _id);
		return true;
	}
	
	/**
	* Returns an array with order names.
	* @returns {array}
	*/
	static order_list = function() {
		return ds_map_keys_to_array(__chart);
	}
	
	/**
	* Execute order.
	* @param {any} _id Order ID.
	* @param {struct} _cargo Optional cargo.
	*/
	static order_execute = function(_id, _cargo = undefined) {
		if !ds_map_exists(__chart, _id) { return $"{_id} does not exist."; }
		var _map = ds_map_find_value(__chart, _id);
		var _array = _map.troops;
		var _array_len = array_length(_array) - 1;
		var _arguments = is_undefined(_cargo) ? [] : [_cargo];
		for (var i = _array_len; i >= 0; --i) {
			var _troop = _map.troops[i];
			with (_troop) {
				script_execute_ext(_map.orders[i], _arguments);
			}
		}
	}
			
	/**
	* Removes the unit from the order ID troop list.
	* @param {any} _id Order ID.
	* @param {struct | Id.Instance} _struct_or_instance Struct or instance.
	*/
	static unit_remove = function(_id, _struct_or_instance) {
		if !ds_map_exists(__chart, _id) { return $"{_id} does not exist."; }
		var _index = array_get_index(__chart[? _id].troops, _struct_or_instance);
		if _index == -1 { return false; }
		array_delete(__chart[? _id].troops, _index, 1);
		array_delete(__chart[? _id].orders, _index, 1);
		return true;
	}
	
	/**
	* Returns an array of each unit name in an order ID.
	* @param {any} _id Order ID.
	* @returns {array}
	*/
	static unit_list = function(_id) {
		var _array = __chart[? _id].troops;
		return _array;	
	}
	
	__station = static_get(GMBattalion);
}

GMBattalion();
