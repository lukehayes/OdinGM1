package game

import rl "vendor:raylib"
import "../engine"

Game :: struct {
    engine: engine.Engine,
    delta: f32,
}

GameState :: enum {
    Playing,
    Paused,
}

any_key_pressed :: proc() -> bool
{
	any_key_down := 
		rl.IsKeyDown(rl.KeyboardKey.W) ||
		rl.IsKeyDown(rl.KeyboardKey.S) ||
		rl.IsKeyDown(rl.KeyboardKey.A) ||
		rl.IsKeyDown(rl.KeyboardKey.D)

	return any_key_down
}
