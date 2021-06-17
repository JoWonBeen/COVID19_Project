$.ajax({
    url:"VaccCenterApiCall.do",
    success:function(resultData){
        console.log(resultData);
        console.log(resultData.data[0]);
       
        const mediCenterArray = resultData.data;
        console.log(mediCenterArray);
        $(".mediCenterList").html("");
        $.each(mediCenterArray, function(i,item){
            //console.log(mediCenterArray[i])
            // console.log(item);
            let address = item.address;
            let centerName = item.centerName.split("19");
            let facilityName = "("+item.facilityName+")";
            centerName = centerName[1] + facilityName; 
            let phoneNumber = item.phoneNumber;

            console.log(address);
            console.log(centerName);
            //console.log(facilityName);
            console.log(phoneNumber);

            $(".mediCenterList").append(`
                <li>
                    <h2>예방접종센터</h2>
                    <dl>
                        <dt>예방접종 센터이름 : </dt>
                        <dd>${centerName}</dd>
                    </dl>
                    <dl>
                        <dt>센터 주소: </dt>
                        <dd>${address}</dd>
                    </dl>
                    <dl>
                        <dt>전화번호 : </dt>
                        <dd>${phoneNumber}</dd>
                    </dl>
                </li>
            `)
        });
    }
});
// $.ajax({
//     url:"ConsignedInstApiCall.do",
//     success:function(resultData){
//         console.log(resultData);
//         console.log(Number(resultData.data[0].slrYmd)-1);
//     }
// });

// function MediCenterData(){
//     let mediCenterList = null;
// 	$.ajax({
// 		url:"",
// 		success:function(resultData){
//             $.ajax({
//                 url:"VaccCenterApiCall.do",
//                 success:function(resultData){
//                     let list_length = 0;
//                     if(resultData.data != null) {
//                         mediCenterList = resultData.data;
//                         list_length = mediCenterList.length;
//                         console.log(mediCenterList);
//                     }
//                     let dataList = "";
//                     for(let i = 0; i < list_length-1; i++){
//                         let address = mediCenterList[i].address;
//                         let centerName = mediCenterList[i].centerName;
//                         let phoneNumber = mediCenterList[i].phoneNumber
//                     }
//                     sendData = {
//                         dataList:dataList
//                     }
//                     $.ajax({
//                         url:"MediCenterInfo.do",
//                         data:sendData,
//                         success:function(resultData){
//                             console.log(resultData);
//                         }
//                     })
//                 }
//             })        
// 		}
// 	});		
// }
