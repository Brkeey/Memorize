//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Berke Yılmaz on 4.02.2025.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
