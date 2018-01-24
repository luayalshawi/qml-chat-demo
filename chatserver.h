#ifndef CHATSERVER_H
#define CHATSERVER_H

#include <QObject>
#include <QMap>

#include "client.h"
class ChatServer : public QObject
{
    Q_OBJECT
public:
    explicit ChatServer(QObject *parent = nullptr);
    Q_INVOKABLE void registerUser(QString user);
    Q_INVOKABLE void sendMessage(QString sender,QString receiver, QString msg);
signals:
    void update(QString sender,QString receiver, QString msg);
private:
    QMap <QString, QString> clients;
};

#endif // CHATSERVER_H
