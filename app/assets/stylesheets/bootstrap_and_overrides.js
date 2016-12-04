import React, {StyleSheet, Dimensions, PixelRatio} from "react-native";
const {width, height, scale} = Dimensions.get("window"),
    vw = width / 100,
    vh = height / 100,
    vmin = Math.min(vw, vh),
    vmax = Math.max(vw, vh);

export default StyleSheet.create({
    "main-container": {
        "marginTop": 60,
        "marginRight": 25,
        "marginBottom": 60,
        "marginLeft": 25
    }
});