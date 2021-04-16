%dw 2.0
output application/json
---
{
	customerHeaders:(payload.ZDEBMAS06.IDOC.E1KNA1M.*ZE1KNVVM map (docH, docHIndex) ->{
		recTimeStamp:now() as String {format: "yyyy-MM-dd HH:mm:ss.SSSSSS"},
		sourceSysId:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.SYSID,
		businessSector:p('BusinessSector') default 'MDD',
		uid: payload.ZDEBMAS06.IDOC.E1KNA1M.KUNNR,
		name: payload.ZDEBMAS06.IDOC.E1KNA1M.NAME1,
		locName:payload.ZDEBMAS06.IDOC.E1KNA1M.NAME2,
		active:if (payload.ZDEBMAS06.IDOC.E1KNA1M.LOEVM ==null) ('1') else if 
		 (payload.ZDEBMAS06.IDOC.E1KNA1M.LOEVM =='X') ('0') else null ,
		accountGroupCode:payload.ZDEBMAS06.IDOC.E1KNA1M.KTOKD,
		taxId:payload.ZDEBMAS06.IDOC.E1KNA1M.STCD1,
		centralOrderBlock:payload.ZDEBMAS06.IDOC.E1KNA1M.AUFSD,
		gstIn:payload.ZDEBMAS06.IDOC.E1KNA1M.STCD3,
		line1:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.STREET,
		line2:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.STR_SUPPL1,
		line3:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.STR_SUPPL2,
		line4:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.STR_SUPPL3,
		poBox:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.PO_BOX,
		town:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.CITY1,
		countyName:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.COUNC,
		region:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.REGION,
		jnjGtState:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.BEZEI,
		postalCode:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.POST_CODE1,
		poBoxPostalCode:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.POST_CODE2,
		countryCode:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.COUNTRY,
		countryName:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.LANDX,
		email:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1ADRC.SMTP_ADDR,
		payerInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.PAYIND,
		shipToInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.SHPIND,
		soldToInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.SLDIND,
		stockPartnerInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.STPIND,
		endUserInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.ENDIND,
		salesAgentInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.SAIND,
		surgeonInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.SURIND,
		billToInd:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.BILIND,
		ghsIndicator:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.GHSIND,
				
		division:docH.SPART
			
		}),
		
	customerSalesOrgs:(payload.ZDEBMAS06.IDOC.E1KNA1M.*ZE1KNVVM map (docS, docSIndex) ->{
		recTimeStamp: (now() as String {format: "yyyy-MM-dd HH:mm:ss.SSSSSS"}),
		uid:payload.ZDEBMAS06.IDOC.E1KNA1M.KUNNR,
		sourceSysId:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.SYSID,
		businessSector:p('BusinessSector') default 'MDD',
		
		salesOrg:docS.VKORG,
		division:docS.SPART,
		distributionChanel:docS.VTWEG,
		cutomerGroup:docS.KDGRP,
		userPriceGroup:docS.PLTYP,
		customerOrderBlock:docS.AUFSD,
		divisionDesc:docS.VTEXT_S
					
		}),
		
	partnerFunctions:(payload.ZDEBMAS06.IDOC.E1KNA1M.*ZE1KNVVM.*ZE1KNVPM map (docF, docFIndex) ->{
		recTimeStamp: (now() as String {format: "yyyy-MM-dd HH:mm:ss.SSSSSS"}),
		uid:payload.ZDEBMAS06.IDOC.E1KNA1M.KUNNR,
		sourceSysId:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNA1M.SYSID,
		businessSector:p('BusinessSector') default 'MDD',
		salesOrg:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNVVM.VKORG,
		division:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNVVM.SPART,
		distributionChanel:payload.ZDEBMAS06.IDOC.E1KNA1M.ZE1KNVVM.VTWEG,
		  //partnerFuncCode: if (docF1.PARVW contains p('transformPartnerFunction')) p('doc1.PARVW')	else (docF1.PARVW ),
			partnerUid:docF.KUNN2,
			partnerFuncName:docF.NAME1
			
		})
			
			
		
}		
