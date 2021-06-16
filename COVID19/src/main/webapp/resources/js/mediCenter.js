$.ajax({
    url:"VaccCenterApiCall02.do",
    success:function(resultData){
        //console.log(resultData);
        //console.log(resultData.data[0]);
        $(".mediCenterList").html("");
        const mediCenterArray = resultData;
        $.each(mediCenterArray,function(i,item){
            console.log(mediCenterArray);
            // $(".mediCenterList").append(
            //     `<li>
            //         <h2>${item.gubun}</h2>
            //         <dl>
            //             <dt>지역내 발생자 수 : </dt>
            //             <dd>${item.localOccCnt}</dd>
            //         </dl>
            //         <dl>
            //             <dt>전일대비 증감 수 : </dt>
            //             <dd>${item.incDec}</dd>
            //         </dl>
            //         <dl>
            //             <dt>사망자수 : </dt>
            //             <dd>${item.deathCnt}</dd>
            //         </dl>
            //     </li>`
            // );
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

