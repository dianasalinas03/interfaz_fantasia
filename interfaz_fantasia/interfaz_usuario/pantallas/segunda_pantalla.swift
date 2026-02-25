//
//  segunda_pantalla.swift
//  interfaz_fantasia
//
//  Created by Diana⭐ on 23/02/26.
//

import SwiftUI

struct segunda_pantalla: View {
    // X
    @Environment(\.dismiss) var dismiss
    
    // Estados para controlar la animacion
    @State private var isScanning = false
    @State private var scanComplete = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            //grid de fondo
            Color(red: 0.02, green: 0.1, blue: 0.15).ignoresSafeArea()
            GridBackground().stroke(Color.cyan.opacity(0.3), lineWidth: 0.5).ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Boton X (Cerrar / Regresar)
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
                Spacer()
                
                // Nombre & ID
                Text("EVELYN #D47362")
                    .font(.system(size: 22, weight: .light, design: .monospaced))
                    .foregroundColor(Color.cyan.opacity(0.8))
                
                // Contenedor profile pic
                ZStack {
                   
                    Rectangle()
                        .fill(Color(red: 0.05, green: 0.2, blue: 0.25))
                        .frame(width: 250, height: 250)
                        .border(Color.cyan.opacity(0.5), width: 2)
                        .overlay(
                            Image("evelyn_quan")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 250, height: 250)
                                    .clipped()
                        )
                    
                    // Efecto Escaneo:
                    if isScanning && !scanComplete {
                        HStack {
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 20, height: 250)
                            Spacer()
                        }
                        .frame(width: 250)
                    }
                    
                    // Filtro verde y palmolita
                    if scanComplete {
                        Rectangle()
                            .fill(Color.green.opacity(0.6))
                            .frame(width: 250, height: 250)
                        
                        Image(systemName: "checkmark")
                            .font(.system(size: 120, weight: .bold))
                            .foregroundColor(.green)
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                // Controles Inferiores dependiendo del estado
                if !isScanning && !scanComplete {
                    // Estado 1: boton ENTER
                    Button(action: startScan) {
                        Text("ENTER")
                            .font(.system(size: 24, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            .frame(width: 250, height: 60)
                            .background(Color.white.opacity(0.2))
                    }
                    .padding(.top, 10)
                    
                } else {
                    // Estado 2 y 3: Textos y Barra de progreso
                    VStack(spacing: 15) {
                        Text(scanComplete ? "LIFE - PATH SCAN\nREADY!" : "ALTERNATE\nLIFE - PATH\nSCANNING")
                            .font(.system(size: scanComplete ? 28 : 20, weight: .regular, design: .monospaced))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        // Animacion de los rectangulos de la barra
                        HStack(spacing: 2) {
                            ForEach(0..<6) { index in
                                Rectangle()
                                    // Se llena de blanco mientras carga, verde cuando termina
                                    .fill(progress > CGFloat(index) / 6.0 ? (scanComplete ? Color.green : Color.white) : Color.clear)
                                    .border(Color.cyan, width: 1)
                                    .frame(width: 40, height: 15)
                            }
                        }
                        //tercera pantalla
                        if scanComplete {
                        // Navegacion a la tercera pantalla cuando el escaneo termina
                        NavigationLink(destination: tercera_pantalla()) {
                                        Text("CONTINUAR")
                                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 30)
                                            .padding(.vertical, 10)
                                            .background(Color.green)
                                            .cornerRadius(5)
                                            .padding(.top, 15)
                                                   }
                                               }

                        
                        
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true) // Ocultamos el boton "Back" por defecto de iOS
    }
    
    // Funcion que simula el tiempo de carga del escaner
    func startScan() {
        isScanning = true
        
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
            withAnimation {
                progress += 0.17 // Incrementa la barra
            }
            
            if progress >= 1.0 {
                timer.invalidate()
                withAnimation(.spring()) {
                    scanComplete = true
                }
            }
        }
    }
}

#Preview {
    segunda_pantalla()
}
