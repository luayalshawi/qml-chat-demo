#include <QtDebug>
#include "chatserver.h"

ChatServer::ChatServer(QObject *parent) : QObject(parent)
{

}
void ChatServer::registerUser(QString user){
    qInfo() <<"C++ Backend: "<< user << "I am in registerUser\n" ;
    // map can be better used on a real chat application
    // since it's useful to keep track of logged in users
    // if this approach is fully used then there should be
    // another emitter to remove the user from the map
    // this->clients.insert(user,user);
}

void ChatServer::sendMessage(QString sender,QString receiver, QString msg){
    qInfo() << "C++ Backend: sendMessage\n" ;
    if( !(msg.isNull() || msg.isEmpty()) ){
        emit update(sender,receiver,msg);
    }
}
