package main

import rl "vendor:raylib"
import "engine"
import "core:fmt"
import "core:mem"


main :: proc()
{
    // --------- Report memory leaks here with the tracking allocator.

    tracking_allocator : mem.Tracking_Allocator
    mem.tracking_allocator_init(&tracking_allocator, context.allocator)
    context.allocator = mem.tracking_allocator(&tracking_allocator)

    report_memory_leaks :: proc(alctr: ^mem.Tracking_Allocator) -> bool
    {
        memory_leak := false

        fmt.println("---------------")
        for key, val in alctr.allocation_map
        {
            fmt.println("")
            fmt.printf("*x*x*x*x* ==> %v: Memory Leak: %v bytes \n", val.location, val.size)
            fmt.println("")
            memory_leak = true
        }

        if !memory_leak {
            fmt.println(" ")
            fmt.println("No memory leaks found.")
            fmt.println(" ")
        }

        fmt.println("---------------")

        mem.tracking_allocator_clear(alctr)

        return memory_leak
    }

    // --------- End memory reporting.

    engine := engine.init(320 * 8, 180 * 8, "Game")

    for (!rl.WindowShouldClose())
    {
        rl.BeginDrawing()
            rl.ClearBackground(rl.GRAY)
        rl.EndDrawing()
    }

    rl.CloseWindow()

    if(ODIN_DEBUG)
    {
        report_memory_leaks(&tracking_allocator)
    }
}

