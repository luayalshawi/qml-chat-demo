function sendMessage() {
    // get the message text value
    var msg = msgInput.text

    if (msg.length > 0) {
        // c++ backend function to send messages
        chatserver.sendMessage(userName, otherUser, msg)

        //clear text input after sending the message
        //recommended by qt docs instead of msgInput.text = ""
        msgInput.clear()
    } else {
        console.log("Please send non-empty text!")
    }
}

function onReceivedMessage(sender, receiver, msg) {
    //console.log("-- "+userName+" -- Received a message:")
    console.log("sender:" + sender + " receiver:" + receiver + " msg:" + msg)

    if (user1.userName === sender) {
        user1.messagesAlias += "<b><font color=\"green\">" + sender
                + ":</font> " + msg + "</font></b>\n"
        user2.messagesAlias += "<b><font color=\"blue\">" + sender + ":</font> "
                + msg + "</font></b>\n"
    } else {
        user2.messagesAlias += "<b><font color=\"green\">" + sender + ":</font> " + msg + "</b>\n"
        user1.messagesAlias += "<b><font color=\"blue\">" + sender + ":</font> "
                + msg + "</font></b>\n"
    }
    user1.messagesScrollBarAlias.increase()
    user2.messagesScrollBarAlias.increase()
}
