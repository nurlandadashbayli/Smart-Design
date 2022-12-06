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

// Edit the size of the node named "Left" 
var left = scene?.rootNode.childNode(withName: "Left", recursively: false)






struct ThreeDView: View {
    var body: some View {

//         // Button to scale the scene
//        Button(action: {
//                left?.scale = SCNVector3(2, 0.5, 0.01)
//            }, label: {
//             Text("Scale")
//         })
//
//         // Buttont to revert the scale
//         Button(action: {
//             left?.scale = SCNVector3(1, 0.5, 0.01)
//         }, label: {
//             Text("Revert")
//         })

        SceneView(scene: scene, pointOfView: cameraNode, options: [.allowsCameraControl])
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDView()
    }
}
