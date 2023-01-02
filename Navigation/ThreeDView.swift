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
var roomFloor = scene?.rootNode.childNode(withName: "roomFloor", recursively: false)




struct ThreeDView: View {
    
    var design: FetchedResults<Design>.Element
    
    
    func createRoom(roomWidth: CGFloat, roomDepth: CGFloat) {
        // Create the floor node
        let floorGeometry = SCNBox(width: roomWidth, height: roomDepth, length: 0.01, chamferRadius: 0.0)
        let floorNode = SCNNode(geometry: floorGeometry)
        floorNode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
        floorNode.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        scene?.rootNode.addChildNode(floorNode)
        
        // Create the wall nodes
        let wallGeometry = SCNBox(width: roomWidth, height: 0.01, length: roomDepth, chamferRadius: 0.0)
        
        let wallNode1 = SCNNode(geometry: wallGeometry)
        wallNode1.position = SCNVector3(x: 0.0, y: roomDepth / 2.0, z: roomWidth / 2.0)
        wallNode1.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        wallNode1.eulerAngles = SCNVector3(x: 0.0, y: 0.0, z: CGFloat(Float.pi) / 2.0)
        scene?.rootNode.addChildNode(wallNode1)
        
        let wallNode2 = SCNNode(geometry: wallGeometry)
        wallNode2.position = SCNVector3(x: 0.0, y: -roomDepth / 2.0, z: roomWidth / 2.0)
        wallNode2.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        wallNode2.eulerAngles = SCNVector3(x: 0.0, y: 0.0, z: CGFloat(Float.pi) / 2.0)
        scene?.rootNode.addChildNode(wallNode2)
        
        let wallNode3 = SCNNode(geometry: wallGeometry)
        wallNode3.position = SCNVector3(x: roomWidth / 2.0, y: 0.0, z: roomDepth / 2.0)
        wallNode3.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        wallNode3.eulerAngles = SCNVector3(x: 0.0, y: CGFloat(Float.pi) / 2.0, z: 0.0)
        scene?.rootNode.addChildNode(wallNode3)
        
        let wallNode4 = SCNNode(geometry: wallGeometry)
        wallNode4.position = SCNVector3(x: -roomWidth / 2.0, y: 0.0, z: roomDepth / 2.0)
        wallNode4.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        wallNode4.eulerAngles = SCNVector3(x: 0.0, y: CGFloat(Float.pi) / 2.0, z: 0.0)
        scene?.rootNode.addChildNode(wallNode4)
    }

    
    var body: some View {
        
        SceneView(scene: scene, pointOfView: cameraNode, options: [.allowsCameraControl])
        Button (action:{
            createRoom(roomWidth: design.roomWidth, roomDepth: design.roomDepth)
        }, label: {
                                Text("Scale")
                            })
        
        
        
        
        // Old Code
        Group {
            
            //        Group {
            //            VStack {
            //                // Button to scale the scene
            //                Button(action: {
            //                    roomFloor?.scale = SCNVector3(design.roomWidth, design.roomDepth, 0.01)
            //                    left?.scale = SCNVector3(design.roomDepth, 2, 0.01)
            //                }, label: {
            //                    Text("Scale")
            //                })
            //            }
            //        }
            //    }
            //    func Scaling() {
            //        roomFloor?.scale = SCNVector3(design.roomWidth, design.roomDepth, 0.01)
            //        left?.scale = SCNVector3(design.roomDepth, 2, 0.01)
            //    }
        }
    }
}
