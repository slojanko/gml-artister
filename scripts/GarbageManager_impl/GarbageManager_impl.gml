function GarbageManager() constructor{
	queue_destroy = ds_queue_create();
	
	function QueueDestroy(struct_) {
		ds_queue_enqueue(queue_destroy, struct_);
	}
	
	function Update() {
		var count = ds_queue_size(queue_destroy);
		for(var i = 0; i < count; i++) {
			var struct = ds_queue_dequeue(queue_destroy);
			delete struct;
		}
	}
}