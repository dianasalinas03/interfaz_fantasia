//
//  tercera_pantalla.swift
//  interfaz_fantasia
//
//  Created by Diana⭐ on 23/02/26.
//

import SwiftUI

struct tercera_pantalla: View {
    var body: some View {
        ZStack {
            // Fondo oscuro
            Color(red: 0.02, green: 0.1, blue: 0.15).ignoresSafeArea()
            
            // Grid
            GridBackground().stroke(Color.cyan.opacity(0.3), lineWidth: 0.5).ignoresSafeArea()
            
            // Red de Nodos de fondo
            UniverseNetworkMap()
            
            VStack {
                // HEADER
                HStack {
                    // Profile pic
                    Image(systemName: "person.crop.square.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.cyan.opacity(0.7))
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.cyan, lineWidth: 1))
                    
                    Text("Hi Evelyn,")
                        .font(.system(size: 20, weight: .regular, design: .monospaced))
                        .foregroundColor(.white)
                    
                    Spacer()
                    // nota: THEY DONT WORK DONT PRESS THEM <3
                    Image(systemName: "gearshape")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "bell")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        
                        // Bolita roja de notificación
                        Circle()
                            .fill(Color.red)
                            .frame(width: 10, height: 10)
                            .offset(x: 2, y: -2)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                // TABS: TRAVEL / SKILLS
                HStack {
                    Image(systemName: "slider.vertical.3")
                        .foregroundColor(.white)
                        .padding(.trailing, 5)
                    
                    HStack(spacing: 0) {
                        Text("TRAVEL")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .clipShape(Capsule())
                        
                        //
                        NavigationLink(destination: quinta_pantalla()) {
                            Text("SKILLS")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                        }
                    }
                    .background(Color.black.opacity(0.4))
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.white, lineWidth: 1))
                }
                .padding(.top, 15)
                
                Spacer()
                
                // NODO CENTRAL: EVELYN
                ZStack {
                    // Resplandor
                    Circle()
                        .fill(Color.teal.opacity(0.4))
                        .frame(width: 150, height: 150)
                        .blur(radius: 20)
                    
                    Circle()
                        .stroke(Color.teal, lineWidth: 2)
                        .frame(width: 50, height: 50)
                    
                    Circle()
                        .fill(Color.teal)
                        .frame(width: 20, height: 20)
                    
                    Text("EVELYN")
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(-10))
                        .offset(x: 50, y: 15)
                        .shadow(color: .teal, radius: 5)
                }
                
                Spacer()
                
                // BOTÓN HUELLA QUE LLEVA A LA CUARTA PANTALLA
                NavigationLink(destination: cuarta_pantalla()) {
                    ZStack {
                        // Resplandor
                        Circle()
                            .fill(Color.teal.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .blur(radius: 15)
                        
                        Circle()
                            .stroke(Color.teal, lineWidth: 3)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "touchid")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.cyan)
                    }
                }
                .padding(.bottom, 10)
                
                Text("press to choose")
                    .font(.system(size: 14, design: .monospaced))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Mapa de fondo
struct UniverseNetworkMap: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                // random lines 4 constalations
                path.move(to: CGPoint(x: width * 0.2, y: height * 0.3))
                path.addLine(to: CGPoint(x: width * 0.8, y: height * 0.4))
                path.addLine(to: CGPoint(x: width * 0.6, y: height * 0.7))
                path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.8))
                path.addLine(to: CGPoint(x: width * 0.2, y: height * 0.3))
                
                path.move(to: CGPoint(x: width * 0.5, y: height * 0.5))
                path.addLine(to: CGPoint(x: width * 0.8, y: height * 0.2))
                
                path.move(to: CGPoint(x: width * 0.5, y: height * 0.5))
                path.addLine(to: CGPoint(x: width * 0.1, y: height * 0.6))
            }
            .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
            
            // Nodos
            ForEach(0..<15) { i in
                Circle()
                    .stroke(Color.white, lineWidth: 2)
                    .background(Circle().fill(Color(red: 0.02, green: 0.1, blue: 0.15)))
                    .frame(width: 15, height: 15)
                    .position(
                        x: CGFloat.random(in: 20...geometry.size.width-20),
                        y: CGFloat.random(in: 150...geometry.size.height-150)
                    )
            }
        }
    }
}

#Preview {
    tercera_pantalla()
}
