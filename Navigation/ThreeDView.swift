//
//  RoomView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 27.11.22.
//

import SwiftUI
import SceneKit

var scene = SCNScene(named: "RoomScene.scn")
var cameraNode: SCNNode? {
    scene?.rootNode.childNode(withName: "camera", recursively: false)
}
var screen = scene?.rootNode.childNode(withName: "camera", recursively: false)





struct ThreeDView: View {
    var body: some View {
        SceneView(scene: scene, pointOfView: cameraNode, options: [.allowsCameraControl])
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDView()
    }
}
