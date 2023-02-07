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

    property int pageIndex: 0

    LoginController{
        id:controller

        onProtocolChanged: {
            input_email_2.text = input_email.text
            input_password_2.text = input_password.text
            if(JSON.stringify(protocol) === '{}'){
                input_recv.text = ""
                input_send.text = ""
            }else{
                input_recv.text = protocol.servers.imap[0].hostname
                input_send.text = protocol.servers.smtp[0].hostname
            }
            pageIndex = 1
        }

    }

    page: CusPage{


        SwipeView{

            currentIndex: pageIndex
            interactive: false
            anchors{
                top: toolBar.bottom
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            Rectangle{
                color: Theme.colorBackground
                Image{
                    id:img_logo
                    width: 60
                    height: 60
                    anchors{
                        top: parent.top
                        topMargin: 60
                        horizontalCenter: parent.horizontalCenter
                    }
                    source: "qrc:/image/ic_login_logo.png"
                }


                Text{
                    id:text_title
                    text:"添加你的IMAP账号"
                    anchors{
                        top: img_logo.bottom
                        topMargin: 20
                        horizontalCenter: parent.horizontalCenter
                    }
                    color: Theme.colorFontPrimary
                    font.pixelSize: 20
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                        }
                    }
                }

                Text{
                    id:text_desc
                    anchors{
                        top: text_title.bottom
                        topMargin: 10
                        horizontalCenter: parent.horizontalCenter
                    }
                    color: Theme.colorFontTertiary
                    horizontalAlignment: Text.AlignHCenter
                    text:"输入您的电子邮件账户凭据以开始使用，QEmail\n安全地储存您的电子邮件密码，它永远不会发送的服务器"
                }

                PrimaryTextField{
                    id:input_name
                    lableText:"名称"
                    text:"朱子楚"
                    width: 260
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top:parent.top
                        topMargin: 250
                    }
                }


                PrimaryTextField{
                    id:input_email
                    lableText:"邮件"
                    text:"zhuzichu520@outlook.com"
                    width: 260
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top:input_name.bottom
                        topMargin: 10
                    }
                }

                PrimaryTextField{
                    id:input_password
                    lableText:"密码"
                    text:"qaioasd520"
                    width: 260
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top:input_email.bottom
                        topMargin: 10
                    }
                }


                PrimaryButton{
                    id:btn_login
                    width: 260
                    height: 36
                    text:"继续"
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top:input_password.bottom
                        topMargin: 20
                    }
                    onClicked: {
                        controller.loadProtocolByAccount(input_email.text)
                    }
                }
            }


            Rectangle{
                color: Theme.colorBackground

                Text{
                    id:text_title2
                    text:"设定账号"
                    anchors{
                        top: parent.top
                        topMargin: 20
                        horizontalCenter: parent.horizontalCenter
                    }
                    color: Theme.colorFontPrimary
                    font.pixelSize: 20
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                        }
                    }
                }

                Text{
                    id:text_desc2
                    anchors{
                        top: text_title2.bottom
                        topMargin: 10
                        horizontalCenter: parent.horizontalCenter
                    }
                    color: Theme.colorFontSecondary
                    horizontalAlignment: Text.AlignHCenter
                    text:"完成下面的IMAP和SMTP设置以连接您的账户。"
                }

                Item{
                    id:layout_content
                    width: 600
                    height: 250
                    anchors{
                        top: text_desc2.bottom
                        topMargin: 30
                        horizontalCenter: parent.horizontalCenter
                    }

                    ColumnLayout{
                        width: 300
                        spacing: 12
                        x:20
                        Text {
                            text: "接收邮件(IMAP)"
                            Layout.topMargin: 15
                        }
                        PrimaryTextField{
                            id:input_recv
                            lableText:"Server"
                            text:"qaioasd520"
                            width: 260
                        }
                        CusComboBox
                        {
                            id:box_recv_port
                            label: "端口"
                            model: ["143","993","自定义"]
                        }
                        CusComboBox
                        {
                            id:box_recv_safe
                            label: "安全性"
                            model: ["SSL/TLS","STARTTLS","没有"]
                        }
                    }


                    ColumnLayout{
                        width: 300
                        spacing: 12
                        x:320
                        Text {
                            text: "外发邮件(SMTP)"
                            Layout.topMargin: 15
                        }
                        PrimaryTextField{
                            id:input_send
                            lableText:"Server"
                            text:"qaioasd520"
                            width: 260
                        }
                        CusComboBox
                        {
                            id:box_send_port
                            label: "端口"
                            model: ["25","465","587"]
                        }
                        CusComboBox
                        {
                            id:box_send_safe
                            label: "安全性"
                            model: ["SSL/TLS","STARTTLS","没有"]
                        }
                    }


                    PrimaryTextField{
                        id:input_email_2
                        anchors{
                            horizontalCenter: parent.horizontalCenter
                            top:layout_content.bottom
                        }
                        lableText:"Username"
                        text:"qaioasd520"
                        width: 260
                    }
                    PrimaryTextField{
                        id:input_password_2
                        anchors{
                            horizontalCenter: parent.horizontalCenter
                            top:input_email_2.bottom
                            topMargin: 10
                        }
                        lableText:"密码"
                        text:"qaioasd520"
                        width: 260
                    }

                    Rectangle{
                        width: 1
                        height: parent.height
                        color: Theme.colorDivider
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                }


                PrimaryButton{
                    id:btn_connect
                    width: 260
                    height: 36
                    text:"连接账户"

                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        bottom:parent.bottom
                        bottomMargin: 30
                    }
                    onClicked: {
                        controller.login(input_email.text,input_password.text,input_recv.text,box_recv_port.currentText,box_recv_safe.currentText,input_send.text,box_send_port.currentText,box_send_safe.currentText)
                    }
                }
            }
        }

        CusToolBar {
            id:toolBar
            darkEnable: false
            topEnable: false
            isTop: false

            Text{
                text:"返回"
                color:Theme.colorPrimary
                visible: pageIndex !== 0
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 15
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        pageIndex--;
                    }
                }
            }
        }
    }
}
