var dsBridge = require("dsbridge")
function getStringMap() {
    let host = new Map() ;
    try {
        host = NativeFlutterInterface.getStringMap() ;
    }
    catch (e) {
        console.log(`NativeFlutterInterface not found !`);
    }
    console.log(`JS : Returning HOST : ${host}`);
    return host;
}


function closeFlutterView() {
    try {
        dsBridge.call("closeFlutterView", "");
    }
    catch (e) {
        console.log(`NativeFlutterInterface not found !`);
    }
}

function sendSeamlessLoginRequest() {
   try {
           dsBridge.call("sendSeamlessLoginRequest", "") ;
       }
       catch (e) {
           console.log(`NativeFlutterInterface not found !`);
       }
}

function onCreditCardLoginSuccess() {
   try {
           dsBridge.call("onCreditCardLoginSuccess", "") ;
       }
       catch (e) {
           console.log(`NativeFlutterInterface not found !`);
       }
}

function getString() {
let host = '' ;
    try {
       // host = NativeFlutterInterface.getString() ;
       host = dsBridge.call("getString", "abc");
    }
    catch (e) {
        console.log(`NativeFlutterInterface not found !`);
    }
    console.log(`JS : Returning HOST : ${host}`);
    return host;
}

function getMpinStatus() {
   let host = false ;
    try {
        host = NativeFlutterInterface.getMpinStatus;
    }
    catch (e) {
        console.log(`NativeFlutterInterface not found !`);
    }
    console.log(`JS : Returning HOST : ${host}`);
    return host;
}
