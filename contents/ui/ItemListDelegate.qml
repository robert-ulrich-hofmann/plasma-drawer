import QtQuick 2.15

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.extras as PlasmaExtras
import org.kde.kirigami as Kirigami
import org.kde.kquickcontrolsaddons

import "../code/tools.js" as Tools

Item {
    id: item

    implicitWidth: ListView.view.width
    implicitHeight: iconSize * 1.5

    property int iconSize: Kirigami.Units.iconSizes.large
    property bool usesPlasmaTheme: true

    readonly property int sourceIconSize: matchIcon.implicitWidth

    readonly property bool hasActionList: ("hasActionList" in model) && (model.hasActionList == true)
    
    function getActionList() {
        return model.actionList;
    }

    Kirigami.Icon {
        id: matchIcon

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            margins: Kirigami.Units.largeSpacing
        }

        width: item.iconSize
        height: width

        animated: false
        // usesPlasmaTheme: usesPlasmaTheme
        source: model.decoration

        roundToIconSize: width > Kirigami.Units.iconSizes.huge ? false : true
    }

    PlasmaComponents.Label {
        id: matchLabel

        anchors {
            left: matchIcon.right
            right: parent.right
            verticalCenter: parent.verticalCenter
            leftMargin: Kirigami.Units.largeSpacing
            rightMargin: Kirigami.Units.largeSpacing
        }

        height: parent.height
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        wrapMode: Text.Wrap

        text: model.display
        color: drawerTheme.textColor
    }
}