#pragma once

#include <QObject>

class User
{
public:
    User(){};
    ~User(){};
    QString email;
    QString password;
    QString imapHost;
    QString imapPort;
    QString imapSecurity;
    QString smtpHost;
    QString smtpPort;
    QString smtpSecurity;
};
