
/**
* A system to execute orders on "units".
* @returns {struct.GMBattalion}
*/
function GMBattalion(){
	
	static __station = undefined;
	
	if __station != undefined { return __station; }

	static __command = {};
		
	/**
	* @param {string} _id Order ID.
	* @param {Function} _callback Function.
	*/
	static order_add = function(_id, _callback) {
		if struct_exists(__command, _id) { return $"{_id} exists."; }
		__command[$ _id] = {
			order : _callback,
			troops : []
		}
		return true;
	}
		
	/**
	* @param {string} _id Order ID.
	*/
	static order_remove = function(_id) {
		if !struct_exists(__command, _id) { return $"{_id} does not exist."; }
		struct_remove(__command, _id);
		return true;
	}
	
	/**
	* Returns an array of each order name.
	* @returns {array}
	*/
	static order_list = function() {
		return struct_get_names(__command);	
	}
	
	/**
	* @param {string} _id Order ID.
	* @param {any} ... Optional arguments.
	*/
	static order_execute = function(_id) {
		if !struct_exists(__command, _id) { return $"{_id} does not exist."; }
		var _array = __command[$ _id].troops;
		var _array_len = array_length(_array);
		var _arguments = [];
		if argument_count > 1 {
			for (var i = 1; i < argument_count; ++i) {
				array_push(_arguments, argument[i]);
			}	
		}
		for (var i = 0; i < _array_len; ++i) {
			var _troop = __command[$ _id].troops[i];
			with (_troop) {
				script_execute_ext(other.__command[$ _id].order, _arguments);
			}

		}
	}
		
	/**
	* @param {string} _id Order ID.
	* @param {struct | Id.Instance} _struct_or_instance Struct or instance.
	*/
	static unit_add = function(_id, _struct_or_instance) {
		if !struct_exists(__command, _id) { return $"{_id} does not exist."; }
		array_push(__command[$ _id].troops, _struct_or_instance);
		return true;
	}
		
	/**
	* @param {string} _id Order ID.
	* @param {struct | Id.Instance} _struct_or_instance Struct or instance.
	*/
	static unit_remove = function(_id, _struct_or_instance) {
		if !struct_exists(__command, _id) { return $"{_id} does not exist."; }
		var _array = __command[$ _id].troops;
		var _index = array_get_index(_array, _struct_or_instance);
		array_delete(_array, _index, 1);
		return true;
	}
	
	__station = static_get(GMBattalion);
}

GMBattalion();
