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


function closeCreditCardModule() {
    try {
        dsBridge.call("credit_card.closeCreditCardModule", "");
    }
    catch (e) {
        console.log(`NativeFlutterInterface not found !`);
    }
}

function sendSeamlessLoginRequest() {
   try {
           dsBridge.call("credit_card.sendSeamlessLoginRequest", "") ;
       }
       catch (e) {
           console.log(`NativeFlutterInterface not found !`);
       }
}

function onCreditCardLoginSuccess() {
   try {
           dsBridge.call("credit_card.onCreditCardLoginSuccess", "") ;
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
    try {
        dsBridge.call("credit_card.onMpinAuthenticationRequest", "");
    }
    catch (e) {
        console.log(`NativeFlutterInterface not found !`);
    }
}

function startHelpSupportFlow(screenType) {
    try {
        dsBridge.call("credit_card.startHelpSupportFlow", screenType);
    }
    catch (e) {
        console.log(`NativeFlutterInterface not found !`);
    }
}
