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

// Walls
var right = scene?.rootNode.childNode(withName: "Right", recursively: false)
var left = scene?.rootNode.childNode(withName: "Left", recursively: false)
var front = scene?.rootNode.childNode(withName: "Front", recursively: false)
var back = scene?.rootNode.childNode(withName: "Back", recursively: false)

// Floor
var roomFloor = scene?.rootNode.childNode(withName: "Floor", recursively: false)

//Screen
var pScreen = scene?.rootNode.childNode(withName: "Screen", recursively: false)

//Speakers
var fm = scene?.rootNode.childNode(withName: "FM", recursively: false)
var fr = scene?.rootNode.childNode(withName: "FR", recursively: false)
var fl = scene?.rootNode.childNode(withName: "FL", recursively: false)

var l1 = scene?.rootNode.childNode(withName: "L1", recursively: false)
var r1 = scene?.rootNode.childNode(withName: "R1", recursively: false)

var l2 = scene?.rootNode.childNode(withName: "L2", recursively: false)
var r2 = scene?.rootNode.childNode(withName: "R2", recursively: false)

struct ThreeDView: View {
    
    var design: FetchedResults<Design>.Element
    
    var body: some View {
        
        SceneView(scene: scene, pointOfView: cameraNode, options: [.allowsCameraControl])
    }
}

func SceneUpdater(design: FetchedResults<Design>.Element ) {
    
  //  var design: FetchedResults<Design>.Element
    
    
    roomFloor?.scale = SCNVector3(design.roomWidth, design.roomDepth, 0.01)
    
    
    right?.scale = SCNVector3(design.roomDepth, design.roomHeight, 0.01)
    right?.position = SCNVector3(-(design.roomWidth/2), (design.roomHeight/2), 0)
    
    left?.scale = SCNVector3(design.roomDepth, design.roomHeight, 0.01)
    left?.position = SCNVector3((design.roomWidth/2), (design.roomHeight/2), 0)
    
    front?.scale = SCNVector3(design.roomWidth, design.roomHeight, 0.01)
    front?.position = SCNVector3(0, (design.roomHeight/2), (design.roomDepth/2))
    
    back?.scale = SCNVector3(design.roomWidth, design.roomHeight, 0.01)
    back?.position = SCNVector3(0, (design.roomHeight/2), -(design.roomDepth/2))

    
    // Reposition the screen to the same z value as the front
    pScreen?.scale = SCNVector3((round(design.screenWidth)/100*2), (round(design.screenHeight)/100*2), 0.01)
    pScreen?.position = SCNVector3(0, (design.roomHeight/2), (front?.position.z)!)
    

    fr?.position = SCNVector3(design.roomWidth/3.6, 0.266, (front?.position.z)! - 0.5)
    fr?.eulerAngles = SCNVector3(0, -25, 0)
    fm?.position = SCNVector3(0, 0.081, (front?.position.z)! - 0.5)
    fl?.position = SCNVector3(design.roomWidth/(-3.6), 0.266, (front?.position.z)! - 0.5)
    fl?.eulerAngles = SCNVector3(0, 25, 0)

    l1?.position = SCNVector3(((design.roomWidth/2)-0.5), 0.266, (design.roomDepth/4))
    r1?.position = SCNVector3(-((design.roomWidth/2)-0.5), 0.266, (design.roomDepth/4))
    
    l2?.position = SCNVector3(((design.roomWidth/2)-0.5), 0.266, 0)
    r2?.position = SCNVector3(-((design.roomWidth/2)-0.5), 0.266, 0)
}

//func createRoom(roomWidth: CGFloat, roomDepth: CGFloat) {
//    // Create the floor node
//    let floorGeometry = SCNBox(width: roomWidth, height: roomDepth, length: 0.01, chamferRadius: 0.0)
//    let floorNode = SCNNode(geometry: floorGeometry)
//    floorNode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
//    floorNode.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
//    scene?.rootNode.addChildNode(floorNode)
//

//    let wallNode4 = SCNNode(geometry: wallGeometry)
//    wallNode4.position = SCNVector3(x: -roomWidth / 2.0, y: 0.0, z: roomDepth / 2.0)
//    wallNode4.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
//    wallNode4.eulerAngles = SCNVector3(x: 0.0, y: CGFloat(Float.pi) / 2.0, z: 0.0)
//    scene?.rootNode.addChildNode(wallNode4)
//}
