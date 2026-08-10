import Foundation
import GameController

class GamepadsListener {
    var gamepads: [GCExtendedGamepad] = []
    var listener: ((Int, GCExtendedGamepad, GCControllerElement) -> Void)?

    init() {
        // フロントモストでなくてもコントローラー入力を受け取る。
        //
        // macOS Big Sur 11.3 以降、既定は NO で、アプリが最前面でない間は
        // ゲームパッドの入力が一切配送されない (GCController.h の
        // shouldMonitorBackgroundEvents 参照)。別アプリの画面を見ながら
        // ゲームパッドで操作する用途では受け取れないと成立しないため YES にする。
        // iOS / tvOS では無視されるプロパティ。
        if #available(macOS 11.3, *) {
            GCController.shouldMonitorBackgroundEvents = true
        }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(joystickDidConnect),
            name: .GCControllerDidConnect,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(joystickDidDisconnect),
            name: .GCControllerDidDisconnect,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
 
    @objc private func joystickDidConnect(notification: NSNotification) {
        if let controller = notification.object as? GCController {
            if let gamepad = controller.extendedGamepad {
                gamepads.append(gamepad)
                let gamepadId = getAndSetPlayerId(of: gamepad)

                gamepad.valueChangedHandler = { gamepad, element in
                    if let listener = self.listener {
                        listener(gamepadId, gamepad, element);
                    }
                }
            }
        }
    }
 
    @objc private func joystickDidDisconnect(notification: NSNotification) {
        if let controller = notification.object as? GCController {
            gamepads.removeAll(where: { $0 == controller.extendedGamepad })
        }
    }

    private func getAndSetPlayerId(of gamepad: GCExtendedGamepad) -> Int {
        let gamepadId = gamepads.firstIndex(of: gamepad) ?? -1
        gamepad.controller?.playerIndex = toPlayerIndex(index: gamepadId)
        return gamepadId
    }

    private func toPlayerIndex(index: Int) -> GCControllerPlayerIndex {
        switch index {
        case 0:
            return GCControllerPlayerIndex.index1
        case 1:
            return GCControllerPlayerIndex.index2
        case 2:
            return GCControllerPlayerIndex.index3
        case 3:
            return GCControllerPlayerIndex.index4
        default:
            return GCControllerPlayerIndex.indexUnset
        }
    }
}
