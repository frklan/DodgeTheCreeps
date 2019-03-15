extends CanvasLayer

signal startGame

func showMessage(text):
  $MessageLabel.text = text
  $MessageLabel.show()
  $MessageTimer.start()
  
func showGameOver():
  showMessage("Game over")
  yield($MessageTimer, "timeout")
  $MessageLabel.text = "Dodge the\nCreeps"
  $MessageLabel.show()
  yield(get_tree().create_timer(1), "timeout")
  $StartButton.show()
  
func displayScore(score):
  $ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
  $MessageLabel.hide()
  


func _on_StartButton_pressed():
  $StartButton.hide()
  emit_signal("startGame")
