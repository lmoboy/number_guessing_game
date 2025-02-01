const std = @import("std");
const sio = @import("sio.zig");
const heap = std.heap;
const print = std.debug.print;

pub fn main() !void {
    const curTime = std.time.microTimestamp();
    var rnd = std.rand.DefaultPrng.init(@intCast(curTime));
    const allocator = heap.page_allocator;
    print("Enter min number: ", .{});
    const min = try sio.iCin(allocator);
    print("Enter max number: ", .{});
    const max = try sio.iCin(allocator);
    print("\n\nTime to guess :D\n Your guess:", .{});
    const random = rnd.random().intRangeAtMostBiased(i32, min, max);

    while (true) {
        const guess = try sio.iCin(allocator);
        if (guess < min or guess > max) {
            print("Your guess is not in range, try again :D\n Your guess:", .{});
        } else if (guess < random) {
            print("Your guess is too low, try again :D\n Your guess:", .{});
        } else if (guess > random) {
            print("Your guess is too high, try again :D\n Your guess:", .{});
        } else {
            print("You guessed it!!!!", .{});
            break;
        }
    }
}
