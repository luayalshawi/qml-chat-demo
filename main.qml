import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import challenge.chatserver 1.0
import "js/ChatClient.js" as ChatClient

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Chat Application")
    id: root

    property var usersArray: [{
            userId: 1,
            userName: "Luay"
        }, {
            userId: 2,
            userName: "Robot"
        }]

    ChatServer {
        id: chatserver
        onUpdate: function (sender, receiver, msg) {
            ChatClient.onReceivedMessage(sender, receiver, msg)
        }
    }

    Rectangle {
        id: mainView
        width: parent.width
        height: parent.height
        color: "#ffb"
        Column {
            UserChatArea {
                id: user1
                color: "white"
                userName: usersArray[0].userName
                otherUser: usersArray[1].userName
            }
            UserChatArea {
                id: user2
                color: "white"
                userName: usersArray[1].userName
                otherUser: usersArray[0].userName
            }
        }
    }
}
