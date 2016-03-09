var execSync = require("child_process").execSync;

var _ = require("lodash");

var concat = require("concat-stream");
var getOptMod = require("node-getopt");

function getOpt(options) {
    options.unshift(["h", "help", "display this help"]);

    return getOptMod.create(options)
        .bindHelp()
        .parseSystem();
}

function readStdinP() {
    return new Promise((resolve, reject) => {
        process.stdin.pipe(concat(input => {
            resolve(input.toString());
        }));
    });
}

function toObj(input, varName) {
    // Convert to object
    if(!_.isPlainObject(input)) {
        var newItem = {};
        newItem[varName] = input;
        input = newItem;
    };

    return input;
}

function exec(cmdTemplate, input) {
    // Generate and run command
    var cmd = cmdTemplate(input);
    var result = execSync(cmd).toString();
    return result;
}

module.exports = {
    exec: exec,
    getOpt: getOpt,
    readStdinP: readStdinP,
    toObj: toObj,
};
