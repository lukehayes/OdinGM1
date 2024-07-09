package game

import rl "vendor:raylib"

Paddle :: struct {
    position : rl.Vector2,
    size     : rl.Vector2,
    color    : rl.Color,
} 

create_paddle :: proc(position: rl.Vector2) -> Paddle
{
    paddle := Paddle {}
    paddle.position = position
    paddle.size = {100,20}
    paddle.color = rl.WHITE

    return paddle
}

draw_paddle :: proc( paddle : Paddle ) {

    rl.DrawRectangle(
	i32(paddle.position.x),
	i32(paddle.position.y),
	i32(paddle.size.x),
	i32(paddle.size.y),
	paddle.color,
    )
}

