.pragma library

const RouteTable = []
const Windows = {}
var App

const WINDOW_LOGIN = "qrc:/layout/WindowLogin.qml"
const WINDOW_MAIN = "qrc:/layout/WindowMain.qml"
const WINDOW_MAP_DRIVER = "qrc:/layout/WindowMapDriver.qml"
const WINDOW_COLORPICKER = "qrc:/layout/WindowColorPicker.qml"
const WINDOW_SETTINGS = "qrc:/layout/WindowSettings.qml"
const WINDOW_ABOUT = "qrc:/layout/WindowAbout.qml"


function init(app) {
    App = app
    RouteTable.push(WINDOW_LOGIN)
    RouteTable.push(WINDOW_MAIN)
    RouteTable.push(WINDOW_COLORPICKER)
    RouteTable.push(WINDOW_SETTINGS)
    RouteTable.push(WINDOW_ABOUT)
    RouteTable.push(WINDOW_MAP_DRIVER)
}

function addWindow(winId,window){
    Windows[winId] = window
}

function removeWindow(winId){
    delete Windows[winId]
}

function closeAllWindow(){
    for(var key in Windows){
        Windows[key].close()
    }
}

function obtWindow(path){
    for(var key in Windows){
        if (key.startsWith(path)) {
            return Windows[key]
        }
    }
    return null
}
