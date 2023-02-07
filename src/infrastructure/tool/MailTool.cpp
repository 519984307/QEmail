#include "MailTool.h"

Q_GLOBAL_STATIC(MailTool, mailTool)

MailTool *MailTool::instance() { return mailTool; }

MailTool::MailTool(QObject *parent) : QObject{parent} {}
