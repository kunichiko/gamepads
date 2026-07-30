## 0.1.4+2 (MimicX fork — kunichiko)

 - **PERF**: Throttle the winmm polling loop with `Sleep(8)` (~125Hz). The upstream 0.1.4 `read_gamepad` loop had no sleep, so it spun as fast as the CPU allowed and pinned one logical core (~8% CPU on a 12-thread machine) for the whole app lifetime, regardless of the visible screen. Upstream fixed the same problem in the 0.3.0 WinRT rewrite, which we deliberately do not adopt because it link-loads `gameinput.dll` and breaks app launch on Windows 10.

## 0.1.4+1

 - **FIX**: Use `std::optional` for return from `GamepadListenerProc` ([#58](https://github.com/flame-engine/gamepads/issues/58)). ([fbf52fd2](https://github.com/flame-engine/gamepads/commit/fbf52fd281cec345b110c8a5c63053cafd4571cd))
 - **FIX**: Window resizing bug ([#56](https://github.com/flame-engine/gamepads/issues/56)). ([ae7c8f3d](https://github.com/flame-engine/gamepads/commit/ae7c8f3d7f670c7cbb3d9c55119736cbf4a8f54a))
 - **FIX**: Update gamepad.cpp includes to fix windows compilation error ([#51](https://github.com/flame-engine/gamepads/issues/51)). ([d6b8ab43](https://github.com/flame-engine/gamepads/commit/d6b8ab4346b9e5f617dde5fcb54457721a54cb73))

## 0.1.4

 - **FIX**: Use `std::optional` for return from `GamepadListenerProc` ([#58](https://github.com/flame-engine/gamepads/issues/58)). ([fbf52fd2](https://github.com/flame-engine/gamepads/commit/fbf52fd281cec345b110c8a5c63053cafd4571cd))

## 0.1.3

 - **FIX**: Window resizing bug ([#56](https://github.com/flame-engine/gamepads/issues/56)). ([ae7c8f3d](https://github.com/flame-engine/gamepads/commit/ae7c8f3d7f670c7cbb3d9c55119736cbf4a8f54a))

## 0.1.2

 - **FIX**: Update gamepad.cpp includes to fix windows compilation error ([#51](https://github.com/flame-engine/gamepads/issues/51)). ([d6b8ab43](https://github.com/flame-engine/gamepads/commit/d6b8ab4346b9e5f617dde5fcb54457721a54cb73))

## 0.1.1+3

 - Update a dependency to the latest release.

## 0.1.1+2

 - Update a dependency to the latest release.

## 0.1.1+1

 - **REFACTOR**: Lint Kotlin, C and C++ code ([#6](https://github.com/flame-engine/gamepads/issues/6)). ([6d3e9334](https://github.com/flame-engine/gamepads/commit/6d3e9334072d24525ed7ccf9f8c7fa481c8373fc))

## 0.1.1

 - Bump "gamepads_windows" to `0.1.1`.

## 0.1.0

 - Bump "gamepads_windows" to `0.1.0`.

