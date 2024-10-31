//
//  ContentView.swift
//  Clase27UserProfile
//
//  Created by Escurra Colquis on 26/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Inicio")
                .bold()
                .font(.system(size: 50))
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
                .tag(0)
            
            Text("Pagar")
                .bold()
                .font(.system(size: 50))
                .tabItem {
                    Label("Pagar", systemImage: "dollarsign")
                }
                .tag(1)
            
            Text("Calendario")
                .bold()
                .font(.system(size: 50))
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }
                .tag(2)
            
            UserProfile(imageName: "deapool", name: "Deapool 🍎", email: "deapool@gmail.com 💻", phone: "987654321 📱", gender: "Masculino 👨🏻🍎")
                .tabItem {
                  Label("Perfil", systemImage: "person")
               }
                .tag(3)
        }
        .tint(.cyan)
    }
}

struct UserProfile: View {
    var imageName: String
    var name: String
    var email: String
    var phone: String
    var gender: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding()
                
                VStack {
                    TextGray(text: "Nombre")
                    InformationUserProfile(information: name)
                    RectangleCustom()
                }
                .padding(.bottom, 20)
                
                VStack {
                    TextGray(text: "Email")
                    InformationUserProfile(information: email)
                    RectangleCustom()
                }
                .padding(.bottom, 20)
                
                VStack {
                    TextGray(text: "Teléfono")
                    InformationUserProfile(information: phone)
                    RectangleCustom()
                }
                .padding(.bottom, 20)
                
                VStack {
                    TextGray(text: "Género")
                    InformationUserProfile(information: gender)
                    RectangleCustom()
                }
                .padding(.bottom, 20)
                Spacer()
            }
            .padding()
            .navigationTitle("Mi Perfil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "blinds.horizontal.open")
                }
            }
        }
    }
}

struct TextGray: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundStyle(.secondary.opacity(0.7))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
            .padding([.trailing, .leading], 15)
    }
}

struct InformationUserProfile: View {
    var information: String
    
    var body: some View {
        Text(information)
            .font(.system(size: 17))
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.trailing, .leading], 15)
    }
}

struct RectangleCustom: View {
    var body: some View {
        Rectangle()
            .frame(width: .infinity, height: 1)
            .foregroundStyle(.gray.opacity(0.3))
            .padding([.trailing, .leading], 15)
    }
}

#Preview {
    ContentView()
}
