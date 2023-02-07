#ifndef USERSERVICE_H
#define USERSERVICE_H

#include "BaseService.h"
#include <QJsonObject>
#include <QObject>
#include <infrastructure/helper/UserHelper.h>
#include <infrastructure/log/Logger.h>
#include <infrastructure/tool/CommonTool.h>

using namespace QInjection;

class UserService : public BaseService {
  Q_OBJECT
public:
  explicit UserService(QObject *parent = nullptr,
                       Repository *repository = QInjection::Inject)
      : repository(repository){};

  void login(const QString &email, const QString &password,
             const QString &imapHost, const QString &imapPort,
             const QString &imapSecurity, const QString &smtpHost,
             const QString &smtpPort, const QString &smtpSecurity);

  User loadUser();

  Q_SIGNAL void loginSuccess();

  QJsonObject getProtocolByAccount(const QString &email);

private:
  Repository *repository;
};

#endif // USERSERVICE_H
