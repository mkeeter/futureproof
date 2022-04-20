const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("futureproof", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);

    // Libraries!
    exe.linkSystemLibrary("glfw3");
    exe.linkSystemLibrary("freetype2");
    exe.linkSystemLibrary("stdc++"); // needed for shaderc
    exe.linkSystemLibrary("png");
    exe.linkSystemLibrary("z");
    exe.linkSystemLibrary("bz2");

    exe.addLibPath("vendor/wgpu");
    exe.linkSystemLibrary("wgpu_native");
    exe.addIncludeDir("vendor"); // "wgpu/wgpu.h" is the wgpu header

    exe.addLibPath("vendor/shaderc/lib");
    exe.linkSystemLibrary("shaderc_combined");
    exe.addIncludeDir("vendor/shaderc/include/");

    exe.addIncludeDir("."); // for "extern/futureproof.h"

    // This must come before the install_name_tool call below
    exe.install();

    if (exe.target.isDarwin()) {
        exe.addFrameworkDir(try getMacFrameworksDir(b));
        //exe.addFrameworkDir("/System/Library/Frameworks");
        exe.linkFramework("Foundation");
        exe.linkFramework("AppKit");
    }

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

// https://github.com/ziglang/zig/issues/2208
fn getMacFrameworksDir(b: *Builder) ![]u8 {
    const sdk = try b.exec(&[_][]const u8{ "xcrun", "-show-sdk-path" });
    const parts = &[_][]const u8{
        std.mem.trimRight(u8, sdk, "\n"),
        "/System/Library/Frameworks",
    };
    return std.mem.concat(b.allocator, u8, parts);
}
