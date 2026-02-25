//
//  primera_pantalla.swift
//  interfaz_fantasia
//
//  Created by Diana⭐ on 23/02/26.
//
import SwiftUI

struct primera_pantalla: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo azul oscuro
                Color(red: 0.02, green: 0.1, blue: 0.15)
                    .ignoresSafeArea()
                
                // grid de fondo
                GridBackground()
                    .stroke(Color.cyan.opacity(0.3), lineWidth: 0.5)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    // title
                    Text("EVERYTHING\nEVERYWHERE\nALL AT ONCE")
                        .font(.system(size: 40, weight: .black, design: .monospaced))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .white.opacity(0.8), radius: 5, x: 0, y: 0)
                    
                    // barra de progreso
                    HStack(spacing: 2) {
                        ForEach(0..<6) { _ in
                            Rectangle()
                                .stroke(Color.cyan, lineWidth: 2)
                                .background(Color.cyan.opacity(0.2))
                                .frame(width: 45, height: 15)
                        }
                    }
                    
                    Spacer()
                    
                 
                    Text("A film by Daniel Kwan  ")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .foregroundColor(.cyan)
                    
                   
                    // Boton START 
                                 NavigationLink(destination: segunda_pantalla()) {
                                     Text("START")
                                         .font(.system(size: 20, weight: .bold, design: .monospaced))
                                         .foregroundColor(.white)
                                         .padding(.horizontal, 50)
                                         .padding(.vertical, 15)
                                         .background(Color.white.opacity(0.1))
                                         .overlay(
                                             Rectangle().stroke(Color.white, lineWidth: 2)
                                         )
                                 }
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

//  cuadricula de fondo
struct GridBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let step: CGFloat = 20 // Espaciado de la cuadricula
        
        // Lineas verticales
        for x in stride(from: 0, through: rect.maxX, by: step) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.maxY))
        }
        
        // Lineas horizontales
        for y in stride(from: 0, through: rect.maxY, by: step) {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: rect.maxX, y: y))
        }
        
        return path
    }
}

#Preview {
    primera_pantalla()
}
