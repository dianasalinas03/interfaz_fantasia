//
//  quinta_pantalla.swift
//  interfaz_fantasia
//
//  Created by Diana⭐ on 23/02/26.
//

import SwiftUI

struct quinta_pantalla: View {
    @Environment(\.dismiss) var dismiss
    
    
    let alternateLives = [
        ("WIFE", "#D68432", Color.cyan, "person.fill"),
        ("CAT", "#C76541", Color.red, "pawprint.fill"),
        ("TRAVELER", "#Z00012", Color.gray, "airplane"),
        ("SINGER", "#E42352", Color.cyan, "mic.fill"),
        ("SPINNER", "#D63372", Color.cyan, "arrow.triangle.2.circlepath")
    ]
    
    var body: some View {
        ZStack {
            // Fondo y cuadricula
            Color(red: 0.02, green: 0.1, blue: 0.15).ignoresSafeArea()
            GridBackground().stroke(Color.cyan.opacity(0.3), lineWidth: 0.5).ignoresSafeArea()
            
            VStack {
                // HEADER
                HStack {
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
                    
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
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
                        NavigationLink(destination: tercera_pantalla()) {
                            Text("TRAVEL")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                        }
                        Text("SKILLS")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    .background(Color.black.opacity(0.4))
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.white, lineWidth: 1))
                }
                .padding(.top, 15)
                .padding(.bottom, 10)
                
                // LISTA DE UNIVERSOS (ScrollView)
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(alternateLives.indices, id: \.self) { index in
                            SkillRowView(
                                profession: alternateLives[index].0,
                                earthId: alternateLives[index].1,
                                themeColor: alternateLives[index].2,
                                iconName: alternateLives[index].3
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Subvista para cada fila de la lista
struct SkillRowView: View {
    var profession: String
    var earthId: String
    var themeColor: Color
    var iconName: String
    
    var body: some View {
        HStack(spacing: 15) {
            // Placeholders
            ZStack {
                Rectangle()
                    .fill(themeColor.opacity(0.2))
                    .frame(width: 80, height: 80)
                
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(themeColor)
            }
            .border(themeColor, width: 1)
            
            // Textos centrales
            VStack(alignment: .leading, spacing: 5) {
                Text("NAME EVELYN QUAN")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(themeColor.opacity(0.8))
                
                Text("EARTH \(earthId)")
                    .font(.system(size: 14, design: .monospaced))
                    .foregroundColor(themeColor.opacity(0.8))
                
                Text("PROFESSION \(profession)")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(themeColor)
            }
            
            Spacer()
            
            // enter x fingerprint
            VStack(spacing: 5) {
                Text("ENTER")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(themeColor)
                
                Image(systemName: "touchid")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(themeColor.opacity(0.5))
            }
            .padding(10)
            // marco
            .overlay(
                Rectangle()
                    .stroke(themeColor.opacity(0.5), style: StrokeStyle(lineWidth: 1, dash: [10, 50, 10, 0]))
            )
        }
        .padding(8)
        .background(themeColor.opacity(0.05))
        .border(themeColor.opacity(0.5), width: 1)
    }
}

#Preview {
    quinta_pantalla()
}
