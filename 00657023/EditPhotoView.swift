//
//  EditPhotoView.swift
//  00657023
//
//  Created by User10 on 2019/11/20.
//  Copyright © 2019 Starmy. All rights reserved.
//

import SwiftUI

struct EditPhotoView: View {
    @State private var brightnessAmount: Double = 0
    var roles = ["乳房脹痛", "排卵", "頭痛", "腹部絞痛"]
    @State private var selectedIndex = 0

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(self.roles[self.selectedIndex])
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                                   .clipped()
                                   .brightness(self.brightnessAmount)
                
                Form {
                    BrightnessSlider(brightnessAmount:self.$brightnessAmount)
                    Picker(selection: self.$selectedIndex, label: Text("月經疼痛")) {
                               Text(self.roles[0]).tag(0)
                               Text(self.roles[1]).tag(1)
                               Text(self.roles[2]).tag(2)
                               Text(self.roles[3]).tag(3)
                    }.pickerStyle(WheelPickerStyle())
                    .frame(width: 400, height: 200)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .shadow(radius: 30)
                    if self.selectedIndex == 0 {
                        Text("若想舒緩乳房疼痛，飲食方面應採「低脂肪」飲食，多吃富含維生素E，堅果、種子、植物油等食物，並特別注意咖啡攝取量。此外，根據美國約翰霍普金斯醫學院研究顯示，除「低脂肪」飲食外，多吃高纖維的亞麻籽也有幫助。").foregroundColor(.blue)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 5))

                    }
                    else if self.selectedIndex == 1 {
                        Text("黑豆可以促進卵泡發育、補充雌激素。桑椹、栗子、高麗菜等果蔬也是幫助排卵的好夥伴，可以強腎健腎幫助卵子順利排出。大蔥、豆類、南瓜、大蒜、生薑、栗子、橘子等食物也可以幫助卵泡正常長大並排卵，服用肌醇更可以提升卵子品質，進而提升受孕機率。").foregroundColor(.green)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: 5))

                    }
                    else if self.selectedIndex == 2 {
                        Text("花椰菜、菠菜、堅果等，富含了充足的維他命B群以及鎂離子，幫助穩定神經和情緒，其中醫師最推薦的是酪梨，以及黑芝麻、小魚乾").foregroundColor(.yellow)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.yellow, lineWidth: 5))

                    }
                    else {
                        Text("黑木耳、黑豆、黑糖、黑芝麻、黑胡椒這些黑色食物，都有舒緩經痛的效用。以黑木耳來說，它能活血化瘀、通經脈，可緩解瘀血引發的經痛；黑豆由於可補腎且不躁，有助改善腎虛型的經痛，還能減經生理期的腰痠。").foregroundColor(.gray)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 5))

                    };
                }
            }
            
        }
        
       
    }
}

struct EditPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhotoView()
    }
}

struct BrightnessSlider: View {
    @Binding var brightnessAmount: Double
    var body: some View {
        HStack {
            Text("亮度")
            Slider(value: self.$brightnessAmount, in: 0...1, minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)) {
                Text("")
            }
        }
    }
}
