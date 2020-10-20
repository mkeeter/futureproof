const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
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

    exe.addLibPath("vendor/wgpu");
    exe.linkSystemLibrary("wgpu_native");
    exe.addIncludeDir("vendor"); // "wgpu/wgpu.h" is the wgpu header

    exe.addLibPath("vendor/shaderc/lib");
    exe.linkSystemLibrary("shaderc_combined");
    exe.addIncludeDir("vendor/shaderc/include/");

    // This must come before the install_name_tool call below
    exe.install();

    if (exe.target.isDarwin()) {
        exe.addFrameworkDir("/System/Library/Frameworks");
        exe.linkFramework("Foundation");

        const cmd = [_][]const u8{
            "install_name_tool",
            "-change",
            "/Users/runner/work/wgpu-native/wgpu-native/target/release/deps/libwgpu_native.dylib",
            "@executable_path/../../vendor/wgpu/libwgpu_native.dylib",
            "zig-cache/bin/futureproof",
        };
        const s = b.addSystemCommand(&cmd);
        b.getInstallStep().dependOn(&s.step);
    }

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
