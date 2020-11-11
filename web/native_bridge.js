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
