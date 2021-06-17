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
            $(".mediCenterList").append(`
                <li>
                    <h2>예방접종센터</h2>
                    <dl>
                        <dt>예방접종 센터이름 : </dt>
                        <dd>${item.centerName}</dd>
                    </dl>
                    <dl>
                        <dt>센터 주소: </dt>
                        <dd>${item.address}</dd>
                    </dl>
                    <dl>
                        <dt>전화번호 : </dt>
                        <dd>${item.phoneNumber}</dd>
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

