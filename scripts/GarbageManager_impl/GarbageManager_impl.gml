function GarbageManager() constructor{
	queue_destroy = ds_queue_create();
	
	static QueueDestroy = function(struct_) {
		ds_queue_enqueue(queue_destroy, struct_);
	}
	
	static Update = function() {
		var count = ds_queue_size(queue_destroy);
		for(var i = 0; i < count; i++) {
			var struct = ds_queue_dequeue(queue_destroy);
			delete struct;
		}
	}
}