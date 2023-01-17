import SwiftUI
import SceneKit
/**
    The scene object that will be rendered in the view
*/
var scene = SCNScene(named: "RoomScene.scn")
/**
    The camera node in the scene
*/
var cameraNode: SCNNode? {
    scene?.rootNode.childNode(withName: "camera", recursively: false)
}
/**
    The screen node in the scene
*/
var screen = scene?.rootNode.childNode(withName: "camera", recursively: false)
/**
    Wall nodes in the scene
*/
var right = scene?.rootNode.childNode(withName: "Right", recursively: false)
var left = scene?.rootNode.childNode(withName: "Left", recursively: false)
var front = scene?.rootNode.childNode(withName: "Front", recursively: false)
var back = scene?.rootNode.childNode(withName: "Back", recursively: false)
/**
    Floor node in the scene
*/
var roomFloor = scene?.rootNode.childNode(withName: "Floor", recursively: false)
/**
    Screen node in the scene
*/
var pScreen = scene?.rootNode.childNode(withName: "Screen", recursively: false)
/**
    Speaker nodes in the scene
*/
var fm = scene?.rootNode.childNode(withName: "FM", recursively: false)
var fr = scene?.rootNode.childNode(withName: "FR", recursively: false)
var fl = scene?.rootNode.childNode(withName: "FL", recursively: false)
var l1 = scene?.rootNode.childNode(withName: "L1", recursively: false)
var r1 = scene?.rootNode.childNode(withName: "R1", recursively: false)
var l2 = scene?.rootNode.childNode(withName: "L2", recursively: false)
var r2 = scene?.rootNode.childNode(withName: "R2", recursively: false)
var bl = scene?.rootNode.childNode(withName: "BL", recursively: false)
var br = scene?.rootNode.childNode(withName: "BR", recursively: false)
var bm = scene?.rootNode.childNode(withName: "BM", recursively: false)
var lfe = scene?.rootNode.childNode(withName: "Subwoofer", recursively: false)
//Light
var lightL = scene?.rootNode.childNode(withName: "Light", recursively: false)
var lightR = scene?.rootNode.childNode(withName: "LightR", recursively: false)
var lightB = scene?.rootNode.childNode(withName: "LightR", recursively: false)

/**
    ThreeDView struct that conforms to the SwiftUI View protocol.
    - Parameter design: An element of the FetchedResults<Design> object
*/
struct ThreeDView: View {
    var design: FetchedResults<Design>.Element
    /**
        body of the view
    */
    var body: some View {
        // SceneView that renders the scene, camera and options
        SceneView(scene: scene, pointOfView: cameraNode, options: [.allowsCameraControl])
    }
}

func SceneUpdater(design: FetchedResults<Design>.Element) {
    
    let moveCamera = SCNAction.move(to: SCNVector3(0, design.roomHeight/2, (design.roomDepth/2)+0.5), duration: 2)
    cameraNode?.runAction(moveCamera)
    Room3D(design: design)
    
    pScreen?.scale = SCNVector3((round(design.screenWidth)/100*2), (round(design.screenHeight)/100*2), 0.01)
    pScreen?.position = SCNVector3(0, (design.roomHeight/2), (front?.position.z)!)

    SoundSystem3D(design: design)
    Light3D(design: design)
}
/**
* Room3D
*
* @param design: FetchedResults<Design>.Element, design element instance
*
* This function is responsible for updating the 3D room scene according to the design element instance passed in
* the design parameter. It updates the floor, left, right, front, and back walls of the room.
*
*/

func Room3D(design: FetchedResults<Design>.Element) {
    /**
        Scale and position of the roomFloor node in the scene
    */
    roomFloor?.scale = SCNVector3(design.roomWidth, design.roomDepth, 0.01)
    /**
        Scale and position of the right node in the scene
    */
    right?.scale = SCNVector3(design.roomDepth, design.roomHeight, 0.01)
    right?.position = SCNVector3(-(design.roomWidth/2), (design.roomHeight/2), 0)
    /**
        Scale and position of the left node in the scene
    */
    left?.scale = SCNVector3(design.roomDepth, design.roomHeight, 0.01)
    left?.position = SCNVector3((design.roomWidth/2), (design.roomHeight/2), 0)
    /**
        Scale and position of the front node in the scene
    */
    front?.scale = SCNVector3(design.roomWidth, design.roomHeight, 0.01)
    front?.position = SCNVector3(0, (design.roomHeight/2), (design.roomDepth/2))
    /**
        Scale and position of the back node in the scene
    */
    back?.scale = SCNVector3(design.roomWidth, design.roomHeight, 0.01)
    back?.position = SCNVector3(0, (design.roomHeight/2), -(design.roomDepth/2))
}
/**
* SoundSystem3D
*
* @param design: FetchedResults<Design>.Element, design element instance
*
* This function is responsible for updating the 3D Sound System scene according to the design element instance passed in
* the design parameter. It updates the position of the LFE, FRONT, SIDE and BACK speakers. It also updates the visibility
* of the speakers based on the design element instance passed in the design parameter.
*
*/
func SoundSystem3D(design: FetchedResults<Design>.Element) {
    
    // Positions
    fl?.position = SCNVector3(((design.screenWidth/2)/100+0.3), (design.roomHeight/2), (design.roomDepth/2))
    fr?.position = SCNVector3(-((design.screenWidth/2)/100+0.3), (design.roomHeight/2), (design.roomDepth/2))
    fm?.position = SCNVector3(0, (design.roomHeight/5), (design.roomDepth/2))
    l2?.position = SCNVector3((-design.roomWidth/2+0.4), 1, (-design.roomDepth/6))
    r2?.position = SCNVector3((design.roomWidth/2-0.4), 1, (-design.roomDepth/6))
    l1?.position = SCNVector3((-design.roomWidth/2+0.4), 1, (design.roomDepth/7))
    r1?.position = SCNVector3((design.roomWidth/2-0.4), 1, (design.roomDepth/7))
    bl?.position = SCNVector3((-design.roomWidth/3.6), 1, -(design.roomDepth/2-0.4))
    br?.position = SCNVector3((design.roomWidth/3.6), 1, -(design.roomDepth/2-0.4))
    bm?.position = SCNVector3(0, 1, -(design.roomDepth/2-0.4))
    lfe?.position = SCNVector3(((design.screenWidth/2)/100+0.3), (0.26), (design.roomDepth/2-0.29))
    
    // To display the LFE in 3D
    if design.lfe == false {
        lfe?.isHidden = true
    } else {
        lfe?.isHidden = false
        
    }
    // To display the FRONT speakers in 3D
    if design.speakerFront == "3" {
        fm?.isHidden = false
        fl?.isHidden = false
        fr?.isHidden = false
    }
    else if design.speakerFront == "2"{
        fm?.isHidden = true
        fl?.isHidden = false
        fr?.isHidden = false
    }
    else if design.speakerFront == "1"{
        fm?.isHidden = false
        fl?.isHidden = true
        fr?.isHidden = true
    }
    else {
        fm?.isHidden = true
        fl?.isHidden = true
        fr?.isHidden = true
    }
    
    // To display the BACK speakers in 3D
    if design.speakerBack == "3" {
        bm?.isHidden = false
        bl?.isHidden = false
        br?.isHidden = false
    }
    else if design.speakerBack == "2"{
        bm?.isHidden = true
        bl?.isHidden = false
        br?.isHidden = false
    }
    else if design.speakerBack == "1"{
        bm?.isHidden = false
        bl?.isHidden = true
        br?.isHidden = true
    }
    else {
        bm?.isHidden = true
        bl?.isHidden = true
        br?.isHidden = true
    }
    
    // To display the SIDE speakers in 3D
    if design.speakerSides == "4" {
        l1?.isHidden = false
        r1?.isHidden = false
        l2?.isHidden = false
        r2?.isHidden = false
    }
    else if design.speakerSides == "2"{
        l1?.isHidden = true
        r1?.isHidden = true
        l2?.isHidden = false
        r2?.isHidden = false
    }
    else {
        l1?.isHidden = true
        r1?.isHidden = true
        l2?.isHidden = true
        r2?.isHidden = true
    }
}

/**
*  func Light3D
*
*  This function is used to create and place 3D lights in a scene based on the design passed as an argument.
*
*  @param design: FetchedResults<Design>.Element - A design object that contains the necessary information to create the lights.
*
*  @return Void
*/
func Light3D(design: FetchedResults<Design>.Element) {
    // Guard statement to check if design.lampsDepth is a valid number, if not it prints an error message and exits the function
    guard let lampsDepth = Double(design.lampsDepth!) else {
        print("Error: design.lampsDepth is not a valid number")
        return
    }
    // Iterate through the child nodes of the scene's root node
    for node in (scene?.rootNode.childNodes)! {
        // Check if the node's name is "newLight"
        if node.name == "newLight" {
            // If it is, remove the node from the parent node
            node.removeFromParentNode()
        }
    }
    // Calculate the distance between each light on the left wall
    let distance = (left?.scale.x)! / CGFloat(lampsDepth + 1)
    // Calculate the starting z-coordinate for the lights on the left wall
    let firstZ = -((left?.scale.x)!/2) + (distance/2)
    // Iterate through the number of lights specified by the lampsDepth variable
    for i in 0..<Int(lampsDepth) {
        // Clone the lightL node
        let newLight = lightL?.clone()
        // Set the name of the new light node to "newLight"
        newLight?.name = "newLight"
        // Set the position of the new light node
        newLight?.position = SCNVector3(x: left!.position.x, y: (left!.position.y+(left!.position.y/2)), z: firstZ + (distance * CGFloat(i)))
        // Add the new light node to the scene's root node
        scene?.rootNode.addChildNode(newLight!)
    }
    // Place newLights on right wall
    let distance2 = (right?.scale.x)! / CGFloat(lampsDepth + 1)
    let firstZ2 = -((right?.scale.x)!/2) + (distance2/2)
    for i in 0..<Int(lampsDepth) {
        let newLight = lightR?.clone()
        newLight?.name = "newLight"
        newLight?.position = SCNVector3(x: right!.position.x, y: (right!.position.y+(right!.position.y/2)), z: firstZ2 + (distance2 * CGFloat(i)))
        scene?.rootNode.addChildNode(newLight!)
    }
}


//    // Add this block to place newLights on back wall
//    let distance3 = (back?.scale.x)! / CGFloat(lampsWidth + 1)
//    let firstX3 = -((back?.scale.x)!/2) + (distance3)
//    for i in 0..<Int(lampsWidth) {
//        let newLight = lightB?.clone()
//        newLight?.name = "newLight"
//        newLight?.position = SCNVector3(x: firstX3 + (distance3 * CGFloat(i)), y: (back!.position.y+(back!.position.y/2)), z: back!.position.z )
//        scene?.rootNode.addChildNode(newLight!)
//    }
