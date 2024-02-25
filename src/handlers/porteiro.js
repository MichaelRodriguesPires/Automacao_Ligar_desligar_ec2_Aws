const AWS = require("aws-sdk");

AWS.config.update({ region: "us-east-1"});
const ec2= new AWS.EC2({ apiVersion: "2016-11-15 "});
const params ={
    InstanceIds:["i-0bfd31aa815eba8d7"] 
};


exports.startEC2Intances = ()  => {
    
    return ec2.startInstances(params, function (err, data) { 
     
       if (err) console.log(err, err.stack);
    
       else console.log("Porteiro Ligado com Sucesso")

    });

};

exports.stoptEC2Intances = ()  => {
    
    return ec2.stoptInstances(params, function (err, data) { 
      
        if (err) console.log(err, err.stack);
      
        else console.log("porteiro desligado com Sucesso")
 
    });
 
 };
 