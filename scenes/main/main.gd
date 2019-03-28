extends Node2D

export (PackedScene) var Mob
var score

# Called when the node enters the scene tree for the first time.
func _ready():
  randomize()


func gameOver():
  $ScoreTimer.stop()
  $MobTimer.stop()
  $HUD.showGameOver()
  $BackgroundMusic.stop()
  $DeathSound.play()

func newGame():
  score = 0
  $Player.start($StartPosition.position)
  $StartTimer.start()
  $HUD.displayScore(score)
  $HUD.showMessage("Get Ready!")
  $BackgroundMusic.play()


func _on_MobTimer_timeout():
  $MobPath/MobSpawnLocation.set_offset(randi())
  var mob = Mob.instance()
  add_child(mob)
  var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
  mob.position = $MobPath/MobSpawnLocation.position
  direction += rand_range(-PI / 4, PI / 4)
  mob.rotation = direction
  mob.linear_velocity = Vector2(rand_range(mob.minSpeed, mob.maxSpeed), 0)
  mob.linear_velocity = mob.linear_velocity.rotated(direction)

func _on_ScoreTimer_timeout():
  score += 1
  $HUD.displayScore(score)


func _on_StartTimer_timeout():
  $MobTimer.start()
  $ScoreTimer.start()
