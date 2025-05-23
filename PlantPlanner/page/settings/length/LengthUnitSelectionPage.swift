import SwiftUI

struct LengthUnitSelectionPage: View {
    @Binding var selectedLengthUnit: String
    @Environment(\.presentationMode) var presentationMode
    
    private let units = ["Meters", "Feet"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                VStack {
                    header
                    unitList
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.cyan.opacity(0.35), Color.green.opacity(0.35)]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    private var header: some View {
        HStack {
            Text("Select Length Unit")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.top, 20)
    }
    
    private var unitList: some View {
        VStack(spacing: 15) {
            ForEach(units, id: \.self) { unit in
                Button(action: {
                    selectedLengthUnit = unit
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text(unit)
                            .font(.custom("Helvetica", size: 18))
                            .foregroundColor(.black)
                        Spacer()
                        if selectedLengthUnit == unit {
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
                }
            }
        }
    }
}

