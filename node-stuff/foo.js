//err = (e,data) => {if (e) console.log(`erp ${e}`); else console.log(`der data: ${data}`);};

// let raw = process.argv;
// let nums = raw.slice(2);

// console.log(nums);

// let fud = (a,n) => Number(a) + parseInt(n);

// console.log(nums.reduce(fud));

module.exports = {
ftr : 'arf',
//ftr : process.argv[4],
fs : require('fs'),
os : require('os')
//console.log(fs.readFileSync(ftr,'utf8').split(os.EOL).length-1);
}
