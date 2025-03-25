//
//  SwiftUIView.swift
//  Mazaady
//
//  Created by mio on 25/03/2025.
//

import SwiftUI


import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack() {
      Group {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 15.79, height: 6)
          .background(Color(red: 0.93, green: 0.37, blue: 0.37))
          .cornerRadius(4)
          .offset(x: -29.60, y: 321)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 15.79, height: 6)
          .background(Color(red: 0.93, green: 0.93, blue: 0.93))
          .cornerRadius(4)
          .offset(x: -7.49, y: 321)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 15.79, height: 6)
          .background(Color(red: 0.93, green: 0.93, blue: 0.93))
          .cornerRadius(4)
          .offset(x: 14.61, y: 321)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 299, height: 360)
          .background(Color(red: 0, green: 0, blue: 0).opacity(0))
          .cornerRadius(24)
          .offset(x: -22, y: 122)
          .shadow(
            color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 14, x: 4, y: 8
          )
        Text("Product Designer")
          .font(Font.custom("Poppins", size: 10).weight(.medium))
          .lineSpacing(15)
          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.63))
          .offset(x: -49.47, y: 271.76)
        Text("Laurel Seilha")
          .font(Font.custom("Poppins", size: 16).weight(.semibold))
          .lineSpacing(24)
          .foregroundColor(.white)
          .offset(x: -40.49, y: 252.08)
        ZStack() {

        }
        .foregroundColor(.clear)
        .frame(width: 48.60, height: 41.28)
        .offset(x: -130.30, y: 261.20)
        ZStack() {
          HStack(spacing: undefined) {
            Text("6 lessons")
              .font(Font.custom("Poppins", size: 10).weight(.medium))
              .lineSpacing(15)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
          .background(Color(red: 0.30, green: 0.79, blue: 0.82))
          .cornerRadius(4)
          .offset(x: -1.55, y: 0.38)
        }
        .frame(width: 58.11, height: 18.24)
        .offset(x: -125.55, y: 223.76)
        ZStack() {
          HStack(spacing: undefined) {
            Text("UI/UX")
              .font(Font.custom("Poppins", size: 10).weight(.medium))
              .lineSpacing(15)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
          .background(Color(red: 0, green: 0.51, blue: 0.80))
          .cornerRadius(4)
          .offset(x: -4.21, y: 0.38)
        }
        .frame(width: 45.43, height: 18.24)
        .offset(x: -65.31, y: 223.76)
        ZStack() {
          HStack(spacing: undefined) {
            Text("Free")
              .font(Font.custom("Poppins", size: 10).weight(.medium))
              .lineSpacing(15)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
          .background(Color(red: 0.55, green: 0.37, blue: 0.95))
          .cornerRadius(4)
          .offset(x: -0.85, y: 0.38)
        }
        .frame(width: 31.70, height: 18.24)
        .offset(x: -18.30, y: 223.76)
      }Group {
        ZStack() {
          HStack(spacing: undefined) {
            Text("Free e-book")
              .font(Font.custom("Poppins", size: 10).weight(.medium))
              .lineSpacing(15)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
          .background(Color(red: 0.99, green: 0.80, blue: 0.46))
          .cornerRadius(20)
          .offset(x: -2.43, y: 0.46)
        }
        .frame(width: 90.86, height: 22.08)
        .offset(x: -109.17, y: -23.92)
        Text("Step design sprint for beginner")
          .font(Font.custom("Poppins", size: 18).weight(.semibold))
          .lineSpacing(25.20)
          .foregroundColor(.white)
          .offset(x: -22, y: 156.08)
        Text("5h 21m")
          .font(Font.custom("Poppins", size: 10).weight(.medium))
          .lineSpacing(15)
          .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
          .offset(x: -110.22, y: 191.12)
        ZStack() {

        }
        .frame(width: 16.90, height: 15.36)
        .offset(x: -146.15, y: 191.60)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 299, height: 330)
          .background(Color(red: 0, green: 0, blue: 0).opacity(0))
          .cornerRadius(24)
          .offset(x: 293, y: 107)
        Text("Product Designer")
          .font(Font.custom("Poppins", size: 10).weight(.medium))
          .lineSpacing(15)
          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.63))
          .offset(x: 265.53, y: 241.43)
        Text("Laurel Seilha")
          .font(Font.custom("Poppins", size: 16).weight(.semibold))
          .lineSpacing(24)
          .foregroundColor(.white)
          .offset(x: 274.51, y: 221.52)
        ZStack() {

        }
        .foregroundColor(.clear)
        .frame(width: 48.60, height: 41.74)
        .offset(x: 184.70, y: 230.75)
        ZStack() {
          HStack(spacing: undefined) {
            Text("2 lessons")
              .font(Font.custom("Poppins", size: 10).weight(.medium))
              .lineSpacing(15)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
          .background(Color(red: 0.30, green: 0.79, blue: 0.82))
          .cornerRadius(4)
          .offset(x: -1.55, y: 0.28)
        }
        .frame(width: 58.11, height: 18.44)
        .offset(x: 189.45, y: 192.90)
        ZStack() {
          HStack(spacing: undefined) {
            Text("Design")
              .font(Font.custom("Poppins", size: 10).weight(.medium))
              .lineSpacing(15)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
          .background(Color(red: 0, green: 0.51, blue: 0.80))
          .cornerRadius(4)
          .offset(x: -1.21, y: 0.28)
        }
        .frame(width: 45.43, height: 18.44)
        .offset(x: 249.69, y: 192.90)
      }Group {
        Text("Basic skill for sketch illustratio")
          .font(Font.custom("Poppins", size: 18).weight(.semibold))
          .lineSpacing(25.20)
          .foregroundColor(.white)
          .offset(x: 293, y: 124.48)
        Text("3h 21m")
          .font(Font.custom("Poppins", size: 10).weight(.medium))
          .lineSpacing(15)
          .foregroundColor(Color(red: 0.55, green: 0.55, blue: 0.55))
          .offset(x: 204.25, y: 159.90)
        ZStack() {

        }
        .frame(width: 16.90, height: 15.53)
        .offset(x: 168.85, y: 160.38)
        ZStack() {
          HStack(spacing: undefined) {
            Text("All")
              .font(Font.custom("Poppins", size: 14).weight(.medium))
              .lineSpacing(21)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
          .background(Color(red: 0.93, green: 0.37, blue: 0.37))
          .cornerRadius(8)
          .offset(x: 0, y: 0)
        }
        .frame(width: 48, height: 41)
        .offset(x: -147.50, y: -102.50)
        .shadow(
          color: Color(red: 0.93, green: 0.37, blue: 0.37, opacity: 0.25), radius: 14, y: 5
        )
        ZStack() {
          HStack(spacing: undefined) {
            Text("UI/UX")
              .font(Font.custom("Poppins", size: 14).weight(.medium))
              .lineSpacing(21)
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.63))
          }
          .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
          .background(Color(red: 0.96, green: 0.97, blue: 0.98))
          .cornerRadius(8)
          .offset(x: 0, y: 0)
        }
        .frame(width: 70, height: 41)
        .offset(x: -72.50, y: -102.50)
        ZStack() {
          HStack(spacing: undefined) {
            Text("Illustration")
              .font(Font.custom("Poppins", size: 14).weight(.medium))
              .lineSpacing(21)
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.63))
          }
          .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
          .background(Color(red: 0.96, green: 0.97, blue: 0.98))
          .cornerRadius(8)
          .offset(x: 0, y: 0)
        }
        .frame(width: 105, height: 41)
        .offset(x: 31, y: -102.50)
        ZStack() {
          HStack(spacing: undefined) {
            Text("3D Animation")
              .font(Font.custom("Poppins", size: 14).weight(.medium))
              .lineSpacing(21)
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.63))
          }
          .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
          .background(Color(red: 0.96, green: 0.97, blue: 0.98))
          .cornerRadius(8)
          .offset(x: 0, y: 0)
        }
        .frame(width: 126, height: 41)
        .offset(x: 162.50, y: -102.50)
        Text("Upcoming course of this week")
          .font(Font.custom("Poppins", size: 18).weight(.semibold))
          .lineSpacing(25.20)
          .foregroundColor(Color(red: 0.19, green: 0.19, blue: 0.19))
          .offset(x: -36, y: -152.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 72, height: 72)
          .background(Color(red: 0.93, green: 0.37, blue: 0.37))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .stroke(Color(red: 0.93, green: 0.37, blue: 0.37), lineWidth: 2.50)
          )
          .offset(x: 158.50, y: -230)
          .shadow(
            color: Color(red: 0.93, green: 0.37, blue: 0.37, opacity: 0.25), radius: 14, y: 5
          )
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 70, height: 70)
          .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .inset(by: 1.50)
              .stroke(.white, lineWidth: 1.50)
          )
          .offset(x: 158.50, y: -230)
      }Group {
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 24, height: 24)
          .background(Color(red: 0.30, green: 0.79, blue: 0.82))
          .overlay(Ellipse()
          .stroke(.white, lineWidth: 1))
          .offset(x: 184.50, y: -203)
        ZStack() {

        }
        .frame(width: 16, height: 16)
        .offset(x: 184.50, y: -203)
        .shadow(
          color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 7.50, x: 1.50, y: 4.50
        )
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 72, height: 72)
          .background(Color(red: 0.93, green: 0.37, blue: 0.37))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .stroke(Color(red: 0.93, green: 0.37, blue: 0.37), lineWidth: 2.50)
          )
          .offset(x: 60.50, y: -230)
          .shadow(
            color: Color(red: 0.93, green: 0.37, blue: 0.37, opacity: 0.25), radius: 14, y: 5
          )
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 70, height: 70)
          .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .inset(by: 1.50)
              .stroke(.white, lineWidth: 1.50)
          )
          .offset(x: 60.50, y: -230)
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 24, height: 24)
          .background(Color(red: 0.30, green: 0.79, blue: 0.82))
          .overlay(Ellipse()
          .stroke(.white, lineWidth: 1))
          .offset(x: 86.50, y: -203)
        ZStack() {

        }
        .frame(width: 16, height: 16)
        .offset(x: 86.50, y: -203)
        .shadow(
          color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 7.50, x: 1.50, y: 4.50
        )
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 72, height: 72)
          .background(Color(red: 0.93, green: 0.37, blue: 0.37))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .stroke(Color(red: 0.93, green: 0.37, blue: 0.37), lineWidth: 2.50)
          )
          .offset(x: -37.50, y: -230)
          .shadow(
            color: Color(red: 0.93, green: 0.37, blue: 0.37, opacity: 0.25), radius: 14, y: 5
          )
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 70, height: 70)
          .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .inset(by: 1.50)
              .stroke(.white, lineWidth: 1.50)
          )
          .offset(x: -37.50, y: -230)
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 24, height: 24)
          .background(Color(red: 0.30, green: 0.79, blue: 0.82))
          .overlay(Ellipse()
          .stroke(.white, lineWidth: 1))
          .offset(x: -11.50, y: -203)
        ZStack() {

        }
        .frame(width: 16, height: 16)
        .offset(x: -11.50, y: -203)
        .shadow(
          color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 7.50, x: 1.50, y: 4.50
        )
      }Group {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 72, height: 72)
          .background(Color(red: 0.93, green: 0.37, blue: 0.37))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .stroke(Color(red: 0.93, green: 0.37, blue: 0.37), lineWidth: 2.50)
          )
          .offset(x: -135.50, y: -230)
          .shadow(
            color: Color(red: 0.93, green: 0.37, blue: 0.37, opacity: 0.25), radius: 14, y: 5
          )
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 70, height: 70)
          .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
          .cornerRadius(24)
          .overlay(
            RoundedRectangle(cornerRadius: 24)
              .inset(by: 1.50)
              .stroke(.white, lineWidth: 1.50)
          )
          .offset(x: -135.50, y: -230)
        Ellipse()
          .foregroundColor(.clear)
          .frame(width: 24, height: 24)
          .background(Color(red: 0.30, green: 0.79, blue: 0.82))
          .overlay(Ellipse()
          .stroke(.white, lineWidth: 1))
          .offset(x: -109.50, y: -203)
        ZStack() {

        }
        .frame(width: 16, height: 16)
        .offset(x: -109.50, y: -203)
        .shadow(
          color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 7.50, x: 1.50, y: 4.50
        )
        ZStack() {

        }
        .foregroundColor(.clear)
        .frame(width: 375, height: 109)
        .offset(x: 0, y: -351.50)
        ZStack() {
          HStack(spacing: undefined) {

          }
          .foregroundColor(.clear)
          .offset(x: 0, y: 0)
        }
        .frame(width: 376, height: 64)
        .offset(x: 0.50, y: 374)
        .shadow(
          color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 20
        )
        ZStack() {
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 375, height: 44)
              .background(.white)
              .offset(x: 0, y: 0)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 21.70, height: 11.33)
              .cornerRadius(2.67)
              .overlay(
                RoundedRectangle(cornerRadius: 2.67)
                  .inset(by: 0.50)
                  .stroke(.black, lineWidth: 0.50)
              )
              .offset(x: 158.35, y: 0.99)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 17.76, height: 7.33)
              .background(.black)
              .cornerRadius(1.33)
              .offset(x: 158.35, y: 0.99)
            ZStack() {
              Text("9:41")
                .font(Font.custom("SF Pro Text", size: 14).weight(.semibold))
                .foregroundColor(.black)
                .offset(x: 0, y: 1)
            }
            .frame(width: 54, height: 21)
            .offset(x: -144.50, y: 1.50)
          }
          .frame(width: 375, height: 44)
          .offset(x: 0, y: 0)
        }
        .frame(width: 375, height: 44)
        .offset(x: 0, y: -384)
      }
    }
    .frame(width: 375, height: 812)
    .background(.white);
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
