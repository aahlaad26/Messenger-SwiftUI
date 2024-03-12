//
//  InboxRowView.swift
//  Messenger-SwiftUI
//


import SwiftUI
import Firebase

struct InboxRowView: View {
    @State private var isAppeared = false
    
    let message: Message
    
    var unread: Bool{
        return UserService.shared.currentUser?.id != message.fromId && message.unread
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            CircularProfileImageView(user: message.user, size: .medium)
            
            VStack(alignment: .leading, spacing: 13){
                Text("\(message.user?.username ?? "")")
                    .foregroundStyle(.text)
                    .fontWeight(unread ? .bold : .light)
            
                messageView
            }

            timeMessage
        }
        .frame(height: 72)
        .opacity(isAppeared ? 1 : 0)
        .offset(x: isAppeared ? 0 : -50)
        .onAppear {
            withAnimation {
                isAppeared = true
            }
        }
        .scrollTransition(topLeading: .interactive,bottomTrailing: .interactive){ content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0)
                .scaleEffect(phase.isIdentity ? 1 : 0.75)
                .blur(radius: phase.isIdentity ? 0 : 10)
        }
    }
}

extension InboxRowView{
    
    private var messageView: some View{
        VStack{
            if message.isRecalled{
                Text("\(message.fromId == UserService.shared.currentUser?.id ? "You" : "\(message.user?.firstName ?? "")") unsend a message")
                    .foregroundStyle(unread ? .text : .gray)
                    .fontWeight(unread ? .heavy : .regular)
                    .lineLimit(1)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }else{
                Text("\(message.fromId == UserService.shared.currentUser?.id ? "You: " : "")\(message.messageText)")
                    .foregroundStyle(unread ? .text : .gray)
                    .fontWeight(unread ? .heavy : .regular)
                    .lineLimit(1)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
        }
    }
    
    private var timeMessage: some View{
        HStack{
            Text("\(message.timestampString)")
                .foregroundStyle(unread ? .text : .gray)
                .fontWeight(unread ? .heavy : .regular)
            
            Image(systemName: "chevron.right")
                .imageScale(.small)
                .foregroundStyle(unread ? .text : .gray)
        }
    }
}
