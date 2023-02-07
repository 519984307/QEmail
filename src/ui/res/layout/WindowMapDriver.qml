import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import Qt.labs.platform 1.1
import QtQuick.Layouts
import Controller 1.0
import "../js/Router.js" as R
import "../component"
import "../storage"

CusWindow {
    id:window
    width: 800
    height: 600
    minimumWidth: 800
    minimumHeight: 600
    maximumWidth: 800
    maximumHeight: 600
    title: "登录"
    closeDestory:false

    MapDriverController{
        id:controller
    }



    page: CusPage{


        CusToolBar {
            id:toolBar
            darkEnable: false
            topEnable: false
            isTop: false
            title:"映射网络驱动"
        }

        ColumnLayout{
            anchors{
                top: toolBar.bottom
                left: parent.left
                leftMargin: 40
                topMargin: 40
            }
            Text{
                text:"要映射的网络文件夹"
                font.pixelSize: 20
                color:Theme.colorPrimary
            }
            Text{
                text:"请为连接指定驱动器号，以及你要连接的文件夹"
                color:Theme.colorFontSecondary
                Layout.topMargin: 10
                font.pixelSize: 14
            }
            CusComboBox
            {
                Layout.topMargin: 10
                label: "驱动器号"
                model: ["Z:","Y:","X:","W:","V:","U:","T:","R:","Q:","P:","O:","N:","M:","L:","K:","J:","I:","H:","G:","F:","E:","B:","A:"]
            }
            PrimaryTextField{
                lableText:"文件夹："
                text:"//192.168.142.129/123"
                width: 260
            }
        }

        PrimaryButton{
            id:btn_connect
            width: 260
            height: 36
            text:"连接"

            anchors{
                horizontalCenter: parent.horizontalCenter
                bottom:parent.bottom
                bottomMargin: 30
            }
            onClicked: {
                controller.onConnect();
            }
        }


    }
}
