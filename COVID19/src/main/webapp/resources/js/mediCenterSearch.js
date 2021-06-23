// $(".searchBtn").on("click", function(){
//    if($("#centerType").val() == "") {
       
//    }
// })

$("#search").on("click",function(){
    //console.log("btn이 눌렸어요");
    if($("#sido").val() == "광역시도"){
        alert("광역시,도를 선택해주세요.");
        return;
    } else if($("#sigungu").val() == "시군구"){
        alert("시,군,구를 선택해주세요");
        return;
    } else if($("#roadName").val().length == 0 ){
        alert("도로명을 입력해주세요");
        return;
    }else {
        searchMediCenter();
    }
});

function searchMediCenter(){
    let centerType = $("#centerType").val();
    let sido = $("#sido").val();
    let sigungu = $("#sigungu").val();
    let roadName = $("#roadName").val();

	let centerGubun = "0";
    if(centerType == "All"){
        sendOptData = {
        	gubun:centerGubun,
            sido:sido,
            sigungu:sigungu,
            roadName:roadName
        }   
    } else{
        if(centerType == "예방접종센터") centerGubun = "1";
        if(centerType == "위탁의료기관") centerGubun = "2";
        sendOptData = {
            gubun:centerGubun,
            sido:sido,
            sigungu:sigungu,
            roadName:roadName
        }
    }

    $.ajax({
        url: "ShowAllCenter.do",
        data:sendOptData,
        success:function(resultData){
            console.log(resultData);
            
            const mediCenterArray = resultData;
            $(".mediCenterList").html("");
            $.each(mediCenterArray, function(i,item){
                $(".mediCenterList").append(`
                    <li>
                        <dl>
                            <dd>${item.centerName}</dd>
                        </dl>
                        <dl>
                            <dt>주소 : </dt>
                            <dd>${item.address}</dd>
                        </dl>
                        <dl>
                            <dt>전화번호 : </dt>
                            <dd>${item.phone}</dd>
                        </dl>
                    </li>
                `);
            })
        }
    })
}





function changeCategory(){
    let seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구","강서구","금정구"];
    let busan = ["남구","동구","동래구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","진구","해운대구","기장군"];
    let daegu = ["남구","달서구","북구","서구","중구","동구","남구","수성구","달성군"];
    let inchen = [ "미추홀구","연수구","남동구","북구","부평구","계양구","강화군","옹진군","동구","서구","남구"];
    let gwangju = ["북구","광산구","동구","서구","남구"];
    let daejeon = ["유성구","대덕구","중구","동구","서구"];
    let ulsan = ["중구","남구","동구","북구","울주군"];
    let sejong = ["세종시"];
    let gyenggi = ["수원시","성남시","의정부시","안양시","부천시","광명시","평택시","동두천시","안산시","용인시","고양시","과천시","구리시","미금시","남양주시","오산시","시흥시","군포시","의왕시","하남시","파주시","이천시","안성시","김포시","화성시","광주시","양주시","포천시","여주시"];
    
    
    let target = $("#sigungu");
    let _this = $("#sido");
    let addList = null;
    console.log(_this.val());

    if(_this.val() == "서울") addList = seoul;
    else if(_this.val() == "부산") addList = busan;
    else if(_this.val() == "대구") addList = daegu;
    else if(_this.val() == "인천") addList = inchen;
    else if(_this.val() == "광주") addList = gwangju;
    else if(_this.val() == "대전") addList = daejeon;
    else if(_this.val() == "울산") addList = ulsan;
    else if(_this.val() == "세종") addList = sejong;
    else if(_this.val() == "경기") addList = gyenggi;
     
    $("#sigungu option").remove();  
    target.append(`<option value="시군구">시군구</option>`);
    for (x in addList) {
       target.append(`<option value=`+addList[x]+`>`+ addList[x] +"</option>");
    }   
 }
 
 