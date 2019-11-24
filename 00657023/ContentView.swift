import SwiftUI

struct ContentView: View {
    @State private var showSecondPage = false
    @State private var showAlert = false
    @State private var isRain = true
    @State private var name = ""
    @State private var selectDate = Date()
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -20, to: Date())!
    var year: Int {
        Calendar.current.component(.year, from: selectDate)
    }
    var roles = ["稀少", "中量", "量多", "點狀出血"]
    @State private var selectedIndex = 0
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double

    
    var body: some View {
        
        VStack {
            Text("月經紀錄")
            VStack {
                if isRain {
                    Image("girl")
                        .resizable()
                        .frame(width: 64, height: 64)
                    Text("我是可愛的女生")
                    
                } else {
                    Image("boy")
                        .resizable()
                        .frame(width: 64, height: 64)
                    Text("我是帥氣的男生")
                }
                Toggle("是否為生理女性", isOn: $isRain)
            }
            Form {
                TextField("你的名字", text: $name, onEditingChanged: { (editing) in
                    print("onEditingChanged", editing)
                     self.showAlert = true
                }){
                    print(self.name)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 5))
                .padding()
                /* Button("印出名字") {
                 print(self.name)
                 }*/
                .alert(isPresented: $showAlert) { () -> Alert in
                   let result: String
                    if self.name.isEmpty {
                      result = "沒有填名字喔！！"
                   } else {
                        result = self.name + "歡迎光臨～"
                   }
                   return Alert(title: Text(result))
                }
    
                DatePicker("日期", selection: self.$selectDate, in: self.startDate...self.today, displayedComponents:.date)
                VStack {
                    Text("月經血量")
                    Picker(selection: $selectedIndex, label: Text("月經血量")) {
                        ForEach(0..<roles.count) { (index) in
                            Text(self.roles[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Image(roles[selectedIndex])
                }
                
                VStack{
                    Text("月經顏色")
                    Rectangle()
                    .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0))
                    HStack {
                      Text("R: \(Int(rGuess * 255.0))")
                      Text("G: \(Int(gGuess * 255.0))")
                      Text("B: \(Int(bGuess * 255.0))")
                    }
                    ColorSlider(value: $rGuess, textColor: .red)
                    ColorSlider(value: $gGuess, textColor: .green)
                    ColorSlider(value: $bGuess, textColor: .blue)
                }
            }
            Button("show second page") {
                self.showSecondPage = true
            }.sheet(isPresented: self.$showSecondPage) {
                EditPhotoView()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
#endif
struct ColorSlider: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
          Text("0")
              .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
              .foregroundColor(textColor)
        }
        .padding()
    }
}

