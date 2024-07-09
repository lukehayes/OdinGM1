package game

import rl "vendor:raylib"
import "core:math/rand"


Ball :: struct {
    position : rl.Vector2,
    size     : rl.Vector2,
    color    : rl.Color,
    speed    : i32,
    dx       : i32,
    dy       : i32,

} 

create_ball:: proc(position: rl.Vector2) -> Ball
{
    ball := Ball {}
    ball.position = position
    ball.size = {10,10}
    ball.color = rl.WHITE

    directions : [2]i32 = {-1,1}

    ball.dx = rand.choice(directions[:])
    ball.dy = rand.choice(directions[:])






        //fmt.println(rand.float64_range(1,11))

    return ball
}

draw_ball :: proc( ball : Ball ) {

    rl.DrawRectangle(
	i32(ball.position.x),
	i32(ball.position.y),
	i32(ball.size.x),
	i32(ball.size.y),
	ball.color,
    )
}
