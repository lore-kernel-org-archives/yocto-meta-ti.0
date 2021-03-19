Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1420.1616194711390697882
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 15:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fKN0MbEK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12JMwQfl021652;
	Fri, 19 Mar 2021 17:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616194706;
	bh=wN0DERJqciqI1t7G5E9xOIHc6vLnop+y6JRnoLXtMoQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fKN0MbEKiBeUEm4FCVlupYH2PSL/zEnXpWN8zcdCZB5sP+7Xx7D2koHJPZ84AtYyy
	 qKPwVVkMSRl+1jPx+r1n+slCabVBJ6GLs8GHYwCxVx5ECZBKgllN3tIjf0c8VGLda8
	 MkA7lbt4AhA2e2vdVjK/TrN5ETZlos343muuzhY4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12JMwQIl002089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Mar 2021 17:58:26 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 19
 Mar 2021 17:58:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 19 Mar 2021 17:58:26 -0500
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12JMwQPY076052;
	Fri, 19 Mar 2021 17:58:26 -0500
Subject: Re: [meta-ti] [master][PATCH] layer.conf: add hardknott to compatible release branches
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <166DD7328409F7DB.26345@lists.yoctoproject.org>
 <20210319203112.GE18041@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <e9f6187c-9a07-3331-a0e0-4485ec779990@ti.com>
Date: Fri, 19 Mar 2021 17:58:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319203112.GE18041@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/19/2021 3:31 PM, Denys Dmytriyenko wrote:
> Praneeth,
> 
> When merging, please make sure the correct patch goes to correct branch,
> as indicated in the subject tag - this one is for master and the other
> for dunfell. Best time to merge them is when you don't have anything
> pending in -next. So, instead of cherry-picking between branches, just
> merge different patches. Thanks!
> 

sounds good. done . merged to master and dunfell the seperate patches.


> 
> On Fri, Mar 19, 2021 at 04:07:19PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> While at it, remove old releases before dunfell.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   conf/layer.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index 2393e61..3bed9fc 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
>>   BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
>>   BBFILE_PRIORITY_meta-ti = "6"
>>   
>> -LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth"
>> +LAYERSERIES_COMPAT_meta-ti = "dunfell gatesgarth hardknott"
>>   
>>   LICENSE_PATH += "${LAYERDIR}/licenses"
>>   
>> -- 
>> 2.7.4
> 
