//
//  ProfileHost.swift
//  Landmarks
//
//  Created by DaikiIwamoto on 2022/04/10.
//

import SwiftUI

struct ProfileHost: View {
        
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProile = Profile.default
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            
            HStack{
                
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProile)
                    .onAppear{
                        draftProile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProile
                    }
            }
            
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
