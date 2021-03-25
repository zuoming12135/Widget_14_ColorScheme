//
//  Page1.swift
//  WidgetExtension
//
//  Created by Michael_Zuo on 2021/3/24.
//

import SwiftUI

struct Page1: View {
    var bgColor : some View {
        Color.red
    }
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                bgColor
                VStack{
                    Spacer().frame(height: 10)
                    HStack{
                        Spacer().frame(width: 10)
                        Text("标题")
                        Image("icon")
                            .frame(width: 20, height: 20)
                            .clipped()
                        Spacer()
                        Text("副标题")
                        Spacer().frame(width: 10)
                    }
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        Item()
                        Item()
                        Item()
                        Item()
                    })
                    Spacer()
                }
            }
        })
    }
}



struct Item : View {
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            Spacer().frame(width: 10)
            Text("第1个Text")
                .font(.system(size: 14))
                .foregroundColor(.white)
            Text("第2个Text")
                .font(.system(size: 14))
                .foregroundColor(.white)
            Text("第3个Text")
                .font(.system(size: 14))
                .foregroundColor(.white)
            Spacer()
            Text("第4个Text")
                .font(.system(size: 14))
                .foregroundColor(.white)
            Spacer().frame(width: 10)
        })
    }
}


struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
