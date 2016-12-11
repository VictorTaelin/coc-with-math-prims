// Command line interface.
// Usage: cd book; node ../cli.js name

var lib = require("./lib.js");

var file = process.argv[2];
var path = process.cwd();
var name = process.argv[2].slice(file.lastIndexOf("/")+1);

var sb = lib(path);

if (!sb.exists(name))
  console.log("Term `"+name+"` not found.");
else {
  console.log("Type:");
  console.log(sb.type(name));
  console.log("");
  console.log("Normal form:");
  console.log(sb.norm(name));
};

