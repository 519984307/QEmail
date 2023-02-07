#ifndef MAPDRIVERCONTROLLER_H
#define MAPDRIVERCONTROLLER_H

#include <QObject>
#include <windows.h>
#include <infrastructure/log/Logger.h>

class MapDriverController : public QObject
{
    Q_OBJECT
public:
    explicit MapDriverController(QObject *parent = nullptr);

    Q_INVOKABLE void onConnect(){
        NETRESOURCE nr;
            memset(&nr, 0, sizeof(NETRESOURCE));
            nr.dwType = RESOURCETYPE_DISK;
            nr.lpRemoteName = (LPWSTR)L"\\\\192.168.142.129\\123";
            nr.lpLocalName = (LPWSTR)L"Z:";

            DWORD result = WNetAddConnection2(&nr, NULL, NULL, 0);

            if (result == NO_ERROR) {
                qDebug() << "Mapping successful";
            } else {
                qDebug() << "Mapping failed with error code" << result;
            }
    }

};

#endif // MAPDRIVERCONTROLLER_H
