//
//  ContentView.swift
//  Shared
//
//  Created by Alaina Thompson on 1/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var sphereModel = Sphere()
    @State var radiusString = "1.0"
    
    var body: some View {
        
        VStack{
            Text("Radius")
                .padding(.top)
                .padding(.bottom, 0)
            TextField("Enter Radius", text: $radiusString, onCommit: {Task.init {await self.calculateSphere()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            HStack {
                VStack{
            Text("Volume")
                .padding(.bottom, 0)
            TextField("", text: $sphereModel.volumeText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
        }
        VStack{
            Text("Volume")
                .padding(.bottom, 0)
            Text("\(sphereModel.volume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            }
            }
            HStack{
                VStack{
            Text("Surface Area")
                .padding(.bottom, 0)
            TextField("", text: ( $sphereModel.surfaceAreaText))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                }
                VStack{
                    Text("Surface Area")
                        .padding(.bottom, 0)
                    Text("\(sphereModel.surfaceArea, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                        
                    }

                
                
            }
            
            Button("Calculate", action: {Task.init { await self.calculateSphere()}})
                .padding(.bottom)
                .padding()
                .disabled(sphereModel.enableButton == false)
            
            
        }
        
    }
    
    func calculateSphere() async {
        
        sphereModel.setButtonEnable(state: false)
        
        let _ : Bool = await sphereModel.initWithRadius(r: Double(radiusString)!)
        
        
    

}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
