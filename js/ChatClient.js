
//import io.qt.challenge.chatserver 1.0
function func() {}
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
