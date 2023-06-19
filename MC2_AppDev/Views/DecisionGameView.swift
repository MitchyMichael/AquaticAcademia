//
//  DecisionGameView.swift
//  MC2_AppDev
//
//  Created by Anna Bella Atmadjaja on 16/06/23.
//

import SwiftUI

struct DecisionGameView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var healthProgress: CGFloat? = 60
    @State private var happinessProgress: CGFloat? = 80
    @State private var cleanlinessProgress: CGFloat? = 40
    @State private var energyProgress: CGFloat? = 20
    
    var body: some View {
        NavigationStack{
            CardView(
                question: "Anda melihat suhu akuarium Nemo Anda meningkat secara signifikan.",
                healthProgress: $healthProgress,
                happinessProgress: $happinessProgress,
                cleanlinessProgress: $cleanlinessProgress,
                energyProgress: $energyProgress
            )
            
            
            Text("Apa yang harus Anda lakukan?")
                .padding(5).font(.headline)
            
            OptionButtonView(
                healthProgress: $healthProgress,
                happinessProgress: $happinessProgress,
                cleanlinessProgress: $cleanlinessProgress,
                energyProgress: $energyProgress
            )
            .frame(width: UIScreen.main.bounds.width * 0.95)
            .padding(.bottom)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label : {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

struct CardView: View {
    
    var question: String
    @Binding var healthProgress: CGFloat?
    @Binding var happinessProgress: CGFloat?
    @Binding var cleanlinessProgress: CGFloat?
    @Binding var energyProgress: CGFloat?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(question)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
//                Divider()
                
                HStack(alignment: .top, spacing: 0) {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Health")
                        Text("Happiness")
                        Text("Cleanliness")
                        Text("Energy")
                    }
//                    .background(.blue)
                    .padding(.horizontal)
                    .padding(.bottom)

                    VStack(alignment: .leading, spacing: 10) {
                        ProgressBar(progress: healthProgress ?? 0)
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .padding(.top, 6)
                        ProgressBar(progress: happinessProgress ?? 0)
                            .frame(width: UIScreen.main.bounds.width / 2)
                        ProgressBar(progress: cleanlinessProgress ?? 0)
                            .frame(width: UIScreen.main.bounds.width / 2)
                        ProgressBar(progress: energyProgress ?? 0)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
//                    .background(.red)
                }

            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
        }
    }
}

struct OptionButtonView: View {
    @Binding var healthProgress: CGFloat?
    @Binding var happinessProgress: CGFloat?
    @Binding var cleanlinessProgress: CGFloat?
    @Binding var energyProgress: CGFloat?
    
    var body: some View {
        VStack(spacing: 16) {
                    Button(action: {
                        healthProgress = 80
                    }) {
                        Text("Biarkan saja, ikan Nemo bisa beradaptasi dengan suhu yang berubah.")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.pink)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
                        happinessProgress = 60
                    }) {
                        Text("Matikan pemanas akuarium untuk menurunkan suhu.")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.mint)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
                        cleanlinessProgress = 70
                    }) {
                        Text("Gunakan kipas angin untuk menurunkan suhu.")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.cyan)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
                        energyProgress = 40
                    }) {
                        Text("Tambahkan es ke dalam akuarium.")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.indigo)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
    }
}

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width, height: 10)
                
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: geometry.size.width * progress / 100, height: 10)
            }
        }
        .frame(height: 15)
    }
}

struct DecisionGameView_Previews: PreviewProvider {
    static var previews: some View {
        DecisionGameView()
    }
}
