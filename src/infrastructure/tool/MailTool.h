#ifndef MAILTOOL_H
#define MAILTOOL_H

#include <QGlobalStatic>
#include <QObject>
#include <QRegularExpression>

class MailTool : public QObject {
  Q_OBJECT
public:
  static MailTool *instance();
  explicit MailTool(QObject *parent = nullptr);

  QString imapEncode(const QString &folder) { return ""; }

  QString imapDeconde(const QString &folder) {

    return folder;
  }

};

#endif // MAILTOOL_H
