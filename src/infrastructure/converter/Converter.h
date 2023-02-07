#pragma once


#include <domain/entity/User.h>
#include <infrastructure/dto/UserDto.h>

#include <QDateTime>
#include <QJsonDocument>
#include <QObject>
#include <QTimeZone>

class Converter {
  public:


    static User dto2User(const UserDto& val) {
        User obj;
        obj.email = QString::fromStdString(val.email);
        obj.password = QString::fromStdString(val.email);
        return obj;
    };


};
