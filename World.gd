extends Node

export (PackedScene) var Obstacle

func _ready():
	$ObstacleTimer.stop()
	$Player/Area2D.connect("area_entered",self,"game_over")
	$Player.hide()
	pass

func _on_ObstacleTimer_timeout():
	$ObstaclePath/ObstacleFollow.offset = randi()
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position = $ObstaclePath/ObstacleFollow.position

func _on_Area2D_area_entered(area):
	area.queue_free()

func game_over(var test):
	if test.is_in_group("obstacle"):
		$Player.game_over()
		$ObstacleTimer.stop()
		get_tree().call_group("obstacle","stop")
		$Control/Button.show()

func reset_level():
	get_tree().call_group("obstacle","queue_free")
	$Player.position = $Spawn.position
	$Player.reset()
	$ObstacleTimer.start()


func _on_Button_pressed():
	reset_level()
	$Control/Button.hide()
