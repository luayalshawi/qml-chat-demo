import QtQuick 2.7
import QtQuick.Controls 2.2
import "js/ChatClient.js" as ChatClient

Rectangle {
    id: chatView
    height: (root.height / 2.0)
    width: root.width
    border.color: "#B6B6B6"

    property string userName: ""
    property string otherUser: ""
    property alias messagesAlias: messages.text
    property alias messagesScrollBarAlias: messagesScrollBar

    Keys.onReturnPressed: ChatClient.sendMessage()

    Component.onCompleted: function () {
        // registering new user
        chatserver.registerUser(userName)
    }

    Column {
        anchors.fill: parent

        // Display user name on the center of chat view
        Text {
            id: displayedNameId
            text: userName
            anchors.horizontalCenter: parent.horizontalCenter
            font {
                family: 'Helvetica'
                pixelSize: 20
            }
        }
        Row {
            id: row
            anchors.top: displayedNameId.bottom

            // Wrapper Rectangle for the message TextInput
            Rectangle {
                id: messageInputWrapper
                width: chatView.width - sendButton.width
                height: sendButton.height
                color: "white"
                border.color: "#E8E8E8"
                TextInput {
                    id: msgInput
                    color: "black"
                    anchors.fill: parent
                    wrapMode: Text.Wrap
                    clip: true
                    padding: 4
                    font {
                        pixelSize: 20
                    }
                }
            }
            // Send Messages' Button
            Button {
                id: sendButton
                text: "send"
                onPressed: ChatClient.sendMessage()
                anchors.verticalCenter: messageInputWrapper.verticalCenter
                font {
                    pixelSize: 18
                    bold: true
                    capitalization: Font.AllUppercase
                }
            }
        }
        ScrollView {
            id: messagesScrollView
            clip: true

            ScrollBar.vertical: ScrollBar {
                id: messagesScrollBar

                // Since we are overriding the defualt scrollbar
                // we need to explicitly position it to right of the view
                // and expand its height based on the parent (messagesScrollView)
                parent: messagesScrollView
                x: messagesScrollView.mirrored ? 0 : messagesScrollView.width - width
                y: messagesScrollView.topPadding
                height: messagesScrollView.availableHeight
                active: messagesScrollView.ScrollBar.horizontal.active
            }
            anchors {
                top: row.bottom
                bottom: parent.bottom
                right: parent.right
                left: parent.left
                bottomMargin: 5
                leftMargin: 4
                rightMargin: 4
            }
            TextEdit {
                id: messages
                anchors.fill: parent
                anchors.top: parent.top
                textFormat: Text.RichText // enables HTML formatting
                readOnly: true
                wrapMode: Text.Wrap
                font {
                    pixelSize: 16
                }
            }
        }
    }
}
