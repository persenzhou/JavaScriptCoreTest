
var foo = function(a){
    return "function" + a;
}

function bar(a){
    return "bar" + a;
}

foo(111);
bar(222);

console.log(Date.now());
console.log(bar(222));


function Girl(){
    this.boyFriend = {};
}

var girl = new Girl();

function currentGirl(){

    return girl;
}
