Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AF3C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 23:34:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4638.1651707234688447789
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 16:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LFGW6zuu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244NXm3j063855;
	Wed, 4 May 2022 18:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651707228;
	bh=kESeb/njWaif8nGXbCy1GmWdSfhD0BRdQnjzRHV4WQ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LFGW6zuuLxKMuIt8JY9mJTkEqjZcrMnWTI2zz59gOzldvzCNwcF+x1HdV5JGI+qBa
	 1uJ2Mg2F6QXa+yl1EkmyrcPoQEv3GsMYO8UjXBUvfPWC17A2QqpTCCCQKG9x77XKwN
	 LDCT8XVlmdfLVS+UjBK22HACfS6FpsTp/QsmVl2s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244NXmRY031205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 18:33:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 18:33:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 18:33:47 -0500
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244NXlsq067405;
	Wed, 4 May 2022 18:33:47 -0500
Message-ID: <f9de7223-f471-7741-b7bf-c34beb7af017@ti.com>
Date: Wed, 4 May 2022 18:33:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [dunfell PATCH] conf/machine: am62xx: Update build flag for low
 power mode
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Nishanth Menon <nm@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        Dave Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220503192509.24537-1-praneeth@ti.com>
 <20220503201610.GA9834@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220503201610.GA9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 23:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14696



On 5/3/2022 3:16 PM, Denys Dmytriyenko wrote:
> On Tue, May 03, 2022 at 02:25:09PM -0500, Praneeth Bajjuri wrote:
>> Update build flag for arm-trusted-firmware to include low power mode
>> support
>>
>> K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
>> low power mode support for am62xx.
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   conf/machine/include/am62xx.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
>> index e8823dd2..59cb7053 100644
>> --- a/conf/machine/include/am62xx.inc
>> +++ b/conf/machine/include/am62xx.inc
>> @@ -13,5 +13,6 @@ do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>>   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>>   
>>   TFA_BOARD = "lite"
>> +K3_PM_SYSTEM_SUSPEND = "1"
> 
> How is this getting passed to ATF?

This patch is wrong, Will submit a new one.

> 
> 
>>   OPTEEMACHINE = "k3-am65x"
>>   OPTEEOUTPUTMACHINE = "k3"
>> -- 
>> 2.17.1
>>

