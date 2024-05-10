import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Page{
    id: indicator
    background: Rectangle{ color: bgColor }
    signal buttonClicked18();

    Keys.onPressed: {
        if (event.key === Qt.Key_1) {
            console.log("Key 1");
            myobj.driver1Call();
        }
        if (event.key === Qt.Key_Up) {
            console.log("Up");
            msgQML = "Нажмите клавишу включения любого индикатора клавиатуры";
            msgBool = true; //msgBool говорит о том, что сообщение выведено и надо обработать нажатие NumLock или CapsLock
        }
        if(msgBool && (event.key === Qt.Key_NumLock)){ msgQML = "NumLock pressed" }
        if(msgBool && (event.key === Qt.Key_CapsLock)){ msgQML = "CapsLock pressed" }
        if (event.key > Qt.Key_F1 && event.key < Qt.Key_F12) { // адреса клавиш от F1 до F12
            console.log("F1-F12 pressed");
            myobj.driver3Call();
        }
    }

    Button {
        text: "back"
        onClicked: indicator.buttonClicked18()
    }

    Column{
        anchors.centerIn: parent
        Text { text: "Нажмите кнопку 1, чтобы включить и выключить индикаторы" }
        Text { text: "Нажмите на стрелку вверх, чтобы узнать, какой индикатор будет включен"; }
        Text { text: "Нажмите на любую клавишу из F1-F12, чтобы инвертировать значения индикаторов";}

        Text{ text: " " } //
        Text{ text: " " } // для красоты
        Text{ text: " " }
        Text{ text: " " }

        Text{ text: msgQML } // этот текст меняется
    }
}
