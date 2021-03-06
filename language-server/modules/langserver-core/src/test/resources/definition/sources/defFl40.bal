public type SimpleTypeDesc int;
public type SimpleTypeDesc2 float;

type Object1 object {
    public SimpleTypeDesc field1 = getObjectFieldDefaultValue();
    private int field2;

    public function __init(int arg) {
        self.field2 = arg;
    }

    public function objectFunction1(SimpleTypeDesc param1, SimpleTypeDesc param2 = 1, SimpleTypeDesc2 ...param3) returns SimpleTypeDesc {
        int funcField = param1;
        int funcField2 = param2;
        float[] funcField3 = param3;
        return 1;
    }
};

type ClientObject client object {
    public remote function remoteFunc(SimpleTypeDesc param1, SimpleTypeDesc param2 = 1, SimpleTypeDesc2 ...param3) returns SimpleTypeDesc {
        int funcField = param1;
        int funcField2 = param2;
        float[] funcField3 = param3;
        return 1;
    }
};

type AbstractObject abstract object {
    int field1;
    function abstractFunc1(SimpleTypeDesc param1, SimpleTypeDesc param2 = 1, SimpleTypeDesc2 ...param3) returns SimpleTypeDesc;
};

type Object2 object {
    *AbstractObject;
    
    public function __init(int arg) {
        self.field1 = arg;
    }

    function abstractFunc1(SimpleTypeDesc param1, SimpleTypeDesc param2 = 1, SimpleTypeDesc2 ...param3) returns SimpleTypeDesc {
        int funcField = param1;
        int funcField2 = param2;
        float[] funcField3 = param3;
        self.object2Function();
        return 1;
    }

    function object2Function() {
        // Logic goes here
    }
};

function getObjectFieldDefaultValue() returns int {
    return 1;
}
