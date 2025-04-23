import SwiftUI

@main
struct ImBallApp: App {
    var body: some SwiftUI.Scene {
        ImmersiveSpace(id: "Main") {
            ImmersiveView()
        }
        // ← selection: と in: のラベルを両方付ける
        .immersionStyle(
            selection: .constant(.mixed),
            in: .mixed
        )
    }
}
