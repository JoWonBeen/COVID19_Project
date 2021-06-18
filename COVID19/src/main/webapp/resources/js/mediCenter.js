 getMediCenterInfo2();

function getMediCenterInfo1() {
    $.ajax({
        url: "VaccCenterApiCall.do",
        success: function(resultData) {
            const mediCenterArray = resultData.data;
             console.log(mediCenterArray);
             let sendStr = "";
             for(let i = 0; i < mediCenterArray.length; i++){
                 let phoneNum = mediCenterArray[i].phoneNumber;
                 if (phoneNum == "") phoneNum = "번호가 등록되지 않았습니다.";
                 
                 sendStr += mediCenterArray[i].address + "/" + mediCenterArray[i].centerName + "(" + mediCenterArray[i].facilityName + ")/" + phoneNum;
                 sendStr += "&";
             }
             let sendData = {
                 sendData:sendStr 
             }
             $.ajax({
                 url: "InsertVaccCenterInfo.do",
                 data: sendData,
                 success: function(resultData) {
                     console.log(resultData);
                 }
             })

                // $(".mediCenterList").append(`
                //     <li>
                //         <h2>예방접종센터</h2>
                //         <dl>
                //             <dt>예방접종 센터이름 : </dt>
                //             <dd>${centerName}</dd>
                //         </dl>
                //         <dl>
                //             <dt>센터 주소: </dt>
                //             <dd>${address}</dd>
                //         </dl>
                //         <dl>
                //             <dt>전화번호 : </dt>
                //             <dd>${phoneNumber}</dd>
                //         </dl>
                //     </li>
                //     `);
            
        }
    });
}


function getMediCenterInfo2() {
    let sendDataList = [];
    let sendData = {
     sendData: 10   
    }
    $.ajax({
        url:"ConsignedInstApiCall.do",
        data : sendData,
        success:function(resultData){
            //console.log(resultData);
            let maxCount = resultData.totalCount;
			//console.log(maxCount);
			sendData ={
				sendData : maxCount
			}
			$.ajax({
		        url:"ConsignedInstApiCall.do",
		        data : sendData,
		        success:function(resultData){
		            //console.log(resultData);
                    const mediCenterArray = resultData.data;
                    console.log(mediCenterArray);
                    let lastNum = 0;
                    for(let j = 0; j<15; j++){
                        let sendStr = "";
                        if (j==14) lastNum = maxCount;
                        else lastNum = (j+1)*1000;
                        for(let i = j*1000; i < lastNum; i++){
                            let phoneNum = mediCenterArray[i].orgTlno;
                            if (phoneNum == "") phoneNum = "번호가 등록되지 않았습니다.";
                           sendStr += mediCenterArray[i].orgZipaddr + "^" + mediCenterArray[i].orgnm +"^" + phoneNum;
                           sendStr += "$";
                       }
                       sendDataList.push(sendStr);
                    } 
                    let numberList = [8,9,10];
					    sendData = {
					       sendData:sendDataList[numberList[0]]
					   }
					   $.ajax({
					       url: "InsertConsignedInstInfo.do",
					       data: sendData,
					       success: function(resultData) {
					           console.log(resultData);
					       }
					   })
					   
					   
					    sendData = {
					       sendData:sendDataList[numberList[1]]
					   }
					   $.ajax({
					       url: "InsertConsignedInstInfo.do",
					       data: sendData,
					       success: function(resultData) {
					           console.log(resultData);
					       }
					   })
					   
					   
                    
		        }
		    });
        }
    });
}
        

