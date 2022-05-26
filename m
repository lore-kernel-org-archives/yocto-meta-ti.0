Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DE0C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 16:50:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.22261.1653583832555008940
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 May 2022 09:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KoqEXff/;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24QGoR4X117423;
	Thu, 26 May 2022 11:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653583827;
	bh=mQbeibiTP2Id2R/H/78VOUpf8olMawecLc44uRM7YAg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KoqEXff//X9uuceHqqRBGrro3PkqTw0sv+kU1TNGIOvZ1teiRjdIdEYjyKyDXj7wc
	 iIrR1E8H0U2UGLy0IC0e8ndTt4P/OYxnVHWV7Hcs2qqZb+i7fGTkbfnBSEmr+Gfq4R
	 oh4B3wgnlHMJUsfahj2yG2xHa6TzENqYQRd3ynNM=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24QGoRfk110668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 May 2022 11:50:27 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 26
 May 2022 11:50:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 26 May 2022 11:50:27 -0500
Received: from [128.247.81.234] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24QGoR1k112903;
	Thu, 26 May 2022 11:50:27 -0500
Message-ID: <03374226-e829-fbf6-871c-14dc0c582c10@ti.com>
Date: Thu, 26 May 2022 11:50:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH 1/2] trusted-firmware-a: Update to
 latest upstream master
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220526155254.32536-1-afd@ti.com>
 <20220526160802.GX9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220526160802.GX9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 May 2022 16:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14761

On 5/26/22 11:08 AM, Denys Dmytriyenko wrote:
> On Thu, May 26, 2022 at 10:52:53AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> For TF-A we work against upstream first, our fork has only been
>> used in the rare cases we need to ship a feature before we can
>> get it upstream. This is not currently the case so lets switch
>> to upstream repo until there is a need for our fork.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index 68bfa899..207f3dac 100644
>> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -1,8 +1,6 @@
>>   PV_k3 = "2.6"
>>   LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>> -BRANCH_k3 = "ti-atf"
>> -SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
>> -SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
>> +SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
> 
> What is the corresponding TFA version for this commit?
> 


2.7-rc0, so still technically a 2.6. When the final 2.7 drops I'll
update as needed.

Andrew


> 
>>   COMPATIBLE_MACHINE_k3 = "k3"
>>   TFA_BUILD_TARGET_k3 = "all"
>>   TFA_INSTALL_TARGET_k3 = "bl31"
>> -- 
>> 2.36.1
> 

