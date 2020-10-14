#include <QuartzCore/CAMetalLayer.h>
#include <Foundation/Foundation.h>

#include <GLFW/glfw3.h>
#define GLFW_EXPOSE_NATIVE_COCOA
#include <GLFW/glfw3native.h>
#include "../vendor/wgpu/wgpu.h"

WGPUSurfaceId platform_wgpu_surface(GLFWwindow* window) {
    id metal_layer = NULL;
    NSWindow *ns_window = glfwGetCocoaWindow(window);
    [ns_window.contentView setWantsLayer:YES];
    metal_layer = [CAMetalLayer layer];
    [ns_window.contentView setLayer:metal_layer];
    return wgpu_create_surface_from_metal_layer(metal_layer);
}
