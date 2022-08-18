//
//  Shapes.swift
//  Bullseye
//
//  Created by Carl Duncan on 8/15/22.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                //.fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .strokeBorder(.blue, lineWidth: 20)
                .frame(width: 200.00, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(.blue)
                .frame(width: 200, height: 100)
            Capsule()
                .fill(.blue)
                .frame(width: 200, height: 100)
            Ellipse()
                .fill(.blue)
                .frame(width: 200, height: 100)
        }
        .background(.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
