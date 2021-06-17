$.ajax({
    url:"VaccCenterApiCall.do",
    success:function(resultData){
        console.log(resultData);
        console.log(resultData.data[0]);
       
        const mediCenterArray = resultData.data;
        $(".mediCenterList").html("");
        $.each(mediCenterArray, function(i,item){
            // $(".mediCenterList").append(`
                // <li>
                //     <h2>${item.gubun}</h2>
                //     <dl>
                //         <dt>확진자 수 : </dt>
                //         <dd>${item.localOccCnt}</dd>
                //     </dl>
                //     <dl>
                //         <dt>전일대비 증감수 : </dt>
                //         <dd>${item.incDec}</dd>
                //     </dl>
                //     <dl>
                //         <dt>사망자 수 : </dt>
                //         <dd>${item.deathCnt}</dd>
                //     </dl>
                // </li>
            // `)
        });
    }
});
$.ajax({
    url:"ConsignedInstApiCall.do",
    success:function(resultData){
        console.log(resultData);
        console.log(Number(resultData.data[0].slrYmd)-1);
    }
});

