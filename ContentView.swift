import SwiftUI


struct ContentView: View {
    @State private var animate = false
    @State private var showSecondView = false

    var body: some View {
        ZStack {
            Color(hex: "#D86787")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("P Z O")
                    .font(.system(size: 92, weight: .regular))
                    .foregroundColor(Color(hex: "442D7B"))
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text("0")
                        .font(.system(size: 427))
                        .foregroundColor(Color(hex: "442D7B"))
                        .offset(x: animate ? 0 : -UIScreen.main.bounds.width/2, y: 0)
                        .animation(.easeInOut(duration: 4))
                        .zIndex(1)
                    
               
                    
                    Text("1")
                        .font(.system(size: 427))
                        .foregroundColor(Color(hex: "442D7B"))
                        .offset(x: animate ? 0 : UIScreen.main.bounds.width/2, y: 0)
                        .animation(.easeInOut(duration: 4))
                        .zIndex(0)
                    
                    Spacer()
                }
                
                Spacer()
                
            }
        }
        .onAppear {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showSecondView = true
            }
        }
        .fullScreenCover(isPresented: $showSecondView, content: SecondView.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
