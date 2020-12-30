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

function getString() {
let host = '' ;
    try {
        host = NativeFlutterInterface.getString() ;
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
