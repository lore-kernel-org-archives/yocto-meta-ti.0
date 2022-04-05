Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F848C38A2E
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.8120.1649173881407987735
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 08:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eidV+KBW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235FpDGi093261;
	Tue, 5 Apr 2022 10:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649173873;
	bh=WMl+S2AcyGa/IvOddjH8bczzk4CxuUpLgRQ0H2MHTug=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eidV+KBWNyeIejK4xnDYwckZny+Iwk6OkEgn/PJtp9WoJ6OpseQBNgjx3h0UHpcg1
	 8B77ZsDH0zzjVE18V7rim3+HzTPjl6ujE24RiDajT+FDhgX93GD1+SkZH/SBC7560L
	 pW+JhCqmbkOFiPh2sClLtFfwZQk+99bphO13fKzE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235FpDIM122991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Apr 2022 10:51:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 10:51:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 10:51:13 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235FpD8F001055;
	Tue, 5 Apr 2022 10:51:13 -0500
Message-ID: <2596715d-987a-1547-2d60-8282707b5be0@ti.com>
Date: Tue, 5 Apr 2022 10:51:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti] [master][PATCH] wl18xx-fw: Make it support usrmerge
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>,
        Alessio Igor Bogani
	<alessio.bogani@elettra.eu>
CC: <meta-ti@lists.yoctoproject.org>
References: <20220330104511.19292-1-alessio.bogani@elettra.eu>
 <20220405035455.GH23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220405035455.GH23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14591



On 4/4/2022 22:54, Denys Dmytriyenko wrote:
> On Wed, Mar 30, 2022 at 12:45:11PM +0200, Alessio Igor Bogani wrote:
>> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Applied patch to master.

> 
>> ---
>>   .../recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
>> index 48b500a8..09968993 100644
>> --- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
>> +++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
>> @@ -19,7 +19,11 @@ do_compile() {
>>   }
>>   
>>   do_install() {
>> -    oe_runmake 'DEST_DIR=${D}' install
>> +    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
>> +        oe_runmake 'DEST_DIR=${D}/usr' install
>> +    else
>> +        oe_runmake 'DEST_DIR=${D}' install
>> +    fi
>>   }
>>   
>> -FILES:${PN} = "/lib/firmware/ti-connectivity/*"
>> +FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
>> -- 
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14590): https://lists.yoctoproject.org/g/meta-ti/message/14590
>> Mute This Topic: https://lists.yoctoproject.org/mt/90128496/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

