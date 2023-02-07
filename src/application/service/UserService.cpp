#include "UserService.h"

void UserService::login(const QString &email, const QString &password,
                        const QString &imapHost, const QString &imapPort,
                        const QString &imapSecurity, const QString &smtpHost,
                        const QString &smtpPort, const QString &smtpSecurity) {
  User user;
  user.email = email;
  user.password = password;
  user.imapHost = imapHost;
  user.imapPort = imapPort;
  user.imapSecurity = imapSecurity;
  user.smtpHost = smtpHost;
  user.smtpPort = smtpPort;
  user.smtpSecurity = smtpSecurity;
  repository->login(user);
}

User UserService::loadUser() {
  User user;
  return user;
}

QJsonObject UserService::getProtocolByAccount(const QString &email) {
  return repository->getProtocolByAccount(email);
}
