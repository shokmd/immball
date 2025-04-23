import SwiftUI
import RealityKit
import simd    // 4×4 行列を作るために必要

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // ── 1m 前方に平行移動した 4×4 行列を作成 ──
            var transform = matrix_identity_float4x4
            transform.columns.3 = SIMD4<Float>(0, 0, -1, 1)

            // ── AnchorEntity(world:) でイニシャライズ ──
            let anchor = AnchorEntity(world: transform)

            // ── 球モデルを生成 ──
            let mat    = SimpleMaterial(color: .systemPink, isMetallic: true)
            let sphere = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [mat]
            )

            // ── シーンに追加 ──
            anchor.addChild(sphere)
            content.add(anchor)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ImmersiveView()
}
