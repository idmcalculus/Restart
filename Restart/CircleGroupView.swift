//
//  CircleGroupView.swift
//  Restart
//
//  Created by IGE DAMILOLA MICHAEL on 25/01/2022.
//

import SwiftUI

extension Circle {
    func circle(color: Color, opacity: Double, lineWidth: CGFloat) -> some View {
        self
            .stroke(color.opacity(opacity), lineWidth: lineWidth)
            .frame(width: 260, height: 260, alignment: .center)
    }
}


struct CircleGroupView: View {
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Circle().circle(color: shapeColor, opacity: shapeOpacity, lineWidth: 40)
            Circle().circle(color: shapeColor, opacity: shapeOpacity, lineWidth: 80)
        }//: ZStack
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating =  true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
