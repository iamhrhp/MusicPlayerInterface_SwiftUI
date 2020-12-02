//
//  ContentView.swift
//  MusicPlayerInterface_SwiftUI
//
//  Created by HRHP Parvej on 01/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
VStack(spacing: 20) {
            ZStack {
                //Create the Background
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    topRow()
                    Spacer()
                    circleImage()
                    Spacer()
                    Player()
                    Spacer()
                    Spacer()
                    circleBtn()
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Use a group container to look at your previews in Light and Dark Mode.
        Group {
            ContentView() // Light Mode
            ContentView().preferredColorScheme(.dark)
        }
    }
}

struct topRow: View {
    
    @State var circleTapped = false
    @State var circlePressed = false
    
    var body: some View {
        HStack(spacing: 30) {
        
            ZStack {
            //We are going to give our buttton an icon from the SF Symbols app.
            Image(systemName: "arrow.left")
                .font(.system(size: 25, weight: .bold))
                .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
                .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0), axis: (x: 10, y: -10, z: 0))
        }
        .frame(width: 60, height: 60) //This is the frame of the Image.
        .background(
            ZStack {
                Circle()
                    .fill(Color("Background"))
                    .frame(width: 60, height: 60)//Button Size.
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                }
            )
            Text("Now Playing")
                .font(.system(size: 25, weight: .heavy, design: .rounded))
                .padding()
        ZStack {
            //We are going to give our buttton an icon from the SF Symbols app.
            Button(action: {
               
                
            }) {
                Image(systemName: "ellipsis")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color("ButtonText"))
                    .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
                    .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0), axis: (x: 10, y: -10, z: 0))
                }
                .frame(width: 60, height: 60) //This is the frame of the Image.
                .background(
                    ZStack {
                        Circle()
                            .fill(Color("Background"))
                            .frame(width: 60, height: 60)//Button Size.
                            .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                            .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                    }
                )
                .scaleEffect(circleTapped ? 1.2 : 1)
                .onTapGesture(count: 1) {
                    self.circleTapped.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.circleTapped = false
                    }
                }
            }
        }.padding()
    }
}

struct circleImage: View {
    
    @State var circleTapped = false
    @State var circlePressed = false
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
               Image("cover")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 300, height: 300)
                    .blur(radius: 2)
                    .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
                    .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0), axis: (x: 10, y: -10, z: 0))
                    .clipShape(Circle())
                    .shadow(color: Color("LightShadow"), radius: 10, x: -10, y: -10)
                    .shadow(color: Color("DarkShadow"), radius: 10, x: 10, y: 10)
            }
            Spacer()
        }
    }
}


struct Player: View {
    var body: some View {
        VStack {
            //ZStack {
                Text("Aa Gya Swad")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color("card1"))
                    .padding()
                Text("HRHP PARVEJ")
                    .font(.system(size: 15, weight: .light , design: .rounded))
                    .foregroundColor(Color("card1"))
                    .padding()
           // }
            Spacer()
            ZStack {
                HStack(spacing: 50) {
                    Text("6:52")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        //.foregroundColor(Color("card1"))
                        .padding(20)
                    Spacer()
                    Text("-22:30")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        //.foregroundColor(Color("Bac"))
                        .padding(20)
                }
            }
            Spacer()
            ZStack (alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color("Background"))
                    .frame(width: 380, height: 10)
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("card1"), Color("card2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 100, height: 10)
            }
           Spacer()
           Spacer()
        }
    }
}

struct circleBtn: View {
    
    @State var circleTapped = false
    @State var circlePressed = false
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 70) {
            ZStack {
                //We are going to give our buttton an icon from the SF Symbols app.
                Image(systemName: "backward.fill")
                    .font(.system(size: 20, weight: .bold))
                    .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
                    .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            }
            .frame(width: 60, height: 60) //This is the frame of the Image.
            .background(
                ZStack {
                    Circle()
                        .fill(Color("Background"))
                        .frame(width: 60, height: 60)//Button Size.
                        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                }
            )
            ZStack {
                //We are going to give our buttton an icon from the SF Symbols app.
                Image(systemName: "pause.fill")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color("Background"))
                    .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
                    .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            }
            .frame(width: 60, height: 60) //This is the frame of the Image.
            .background(
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("card1"), Color("card2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 100, height: 100)//Button Size.
                        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                }
            )
            ZStack {
                //We are going to give our buttton an icon from the SF Symbols app.
                Image(systemName: "forward.fill")
                    .font(.system(size: 20, weight: .bold))
                    .offset(x: circlePressed ? -90 : 0, y: circlePressed ? -90 : 0)
                    .rotation3DEffect(Angle(degrees: circlePressed ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            }
            .frame(width: 60, height: 60) //This is the frame of the Image.
            .background(
                ZStack {
                    Circle()
                        .fill(Color("Background"))
                        .frame(width: 60, height: 60)//Button Size.
                        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                }
            )
        }
    }
}

