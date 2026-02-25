//
//  cuarta_pantalla.swift
//  interfaz_fantasia
//
//  Created by Diana⭐ on 23/02/26.
//

import SwiftUI

struct cuarta_pantalla: View {
    @Environment(\.dismiss) var dismiss //go back
    
    // Estados slider
    @State private var dragOffset: CGFloat = 0
    @State private var jumpConfirmed = false
    
    //
    let universes = [
        ("EARTH #12463", "24.8 / 16:21", "rocks"), //
        ("EARTH #C76541", "12.4 / 08:30", "fingers"),
        ("EARTH #E42352", "09.1 / 22:15", "bagel")
    ]
    
    var body: some View {
        ZStack {
            // bckg y grid
            Color(red: 0.02, green: 0.1, blue: 0.15).ignoresSafeArea()
            GridBackground().stroke(Color.cyan.opacity(0.3), lineWidth: 0.5).ignoresSafeArea()
            
            VStack {
                // X
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
                Spacer()
                
                // SLIDER DE IMÁGENES (Carrusel)
                TabView {
                    ForEach(universes.indices, id: \.self) { index in
                        // 2. CAMBIO AQUÍ: Pasamos el nombre de la imagen a la tarjeta
                        UniverseCard(
                            earthId: universes[index].0,
                            dateTime: universes[index].1,
                            imageName: universes[index].2
                        )
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 450)
                
                Spacer()
                
                // SLIDE TO CONFIRM (Botón deslizable)
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.cyan.opacity(0.2))
                        .frame(width: 260, height: 70)
                    
                    Text("Slide to confirm")
                        .font(.system(size: 16, design: .monospaced))
                        .foregroundColor(.cyan)
                        .frame(width: 260, alignment: .center)
                        .padding(.leading, 30)
                    
                    ZStack {
                        Circle().fill(Color(red: 0.02, green: 0.1, blue: 0.15)).frame(width: 70, height: 70)
                        Circle().stroke(Color.cyan, lineWidth: 3).frame(width: 70, height: 70)
                        
                        Circle()
                            .fill(Color.cyan.opacity(0.3))
                            .frame(width: 90, height: 90)
                            .blur(radius: 10)
                        
                        Image(systemName: "touchid")
                            .font(.system(size: 30))
                            .foregroundColor(.cyan)
                    }
                    .offset(x: dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.translation.width > 0 && value.translation.width <= 190 {
                                    dragOffset = value.translation.width
                                }
                            }
                            .onEnded { value in
                                if dragOffset > 150 {
                                    jumpConfirmed = true
                                } else {
                                    withAnimation(.spring()) {
                                        dragOffset = 0
                                    }
                                }
                            }
                    )
                }
                .padding(.bottom, 50)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $jumpConfirmed) {
            quinta_pantalla()
        }
    }
}

// Componente visual para cada tarjeta del universo
struct UniverseCard: View {
    var earthId: String
    var dateTime: String
    var imageName: String // 3. CAMBIO AQUÍ: Nueva variable para recibir el nombre de la imagen
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 4. CAMBIO AQUÍ: Usamos la imagen con un frame fijo para que no rompa el texto
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 280, height: 400) // Aseguramos el tamaño exacto
                .clipped() // Corta lo que sobre para que no invada la pantalla
            
            // Marco brillante
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.cyan.opacity(0.5), lineWidth: 1)
            
            // Información en la parte inferior
            HStack {
                VStack(alignment: .leading) {
                    Text("EARTH")
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(.white.opacity(0.7))
                    Text(earthId.replacingOccurrences(of: "EARTH ", with: ""))
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("DATE & TIME")
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(.white.opacity(0.7))
                    Text(dateTime)
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }
            }
            .padding()
            // Gradiente oscuro detrás del texto
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.clear]), startPoint: .bottom, endPoint: .top)
            )
        }
        .frame(width: 280, height: 400)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .cyan.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    cuarta_pantalla()
}
