function Delegate() constructor{
	subscribers = ds_map_create();
	id = 0;
	
	static Subscribe = function(function_) {
		ds_map_add(subscribers, id, function_);
		return id++;
	}
	
	static Unsubscribe = function(id_) {
		ds_map_delete(subscribers, id_);
	}
	
	static UnsubscribeAll = function() {
		ds_map_clear(subscribers);
	}
	
	static Trigger = function() {
		var size_ = ds_map_size(subscribers);
		var item_ = ds_map_find_first(subscribers);
		
		for (var i = 0; i < size_; i++;)
		{
			subscribers[? item_]();
		    item_ = ds_map_find_next(subscribers, item_);
		}
	}
}