Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAD9C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 19:57:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.118661.1712606223025334763
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 12:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dxXaFLo3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 438Juw9T080533;
	Mon, 8 Apr 2024 14:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712606218;
	bh=jYlGG3AJs5CB3OA+vdeDm8ZB9EeTVkw7Skb6kqtDiZE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dxXaFLo38nBGEtnfGWIj9lib1Y07/ZAcyN2F40nHx1X04Du0FZ67pbBXcmS7wzq6K
	 CqTUwA0IS6etBpa0J6UFzgI8O9JLWZP1o5HAF4Kx9KUXbUPLZE9uGjjc4H/xRx6wwq
	 4hrXxjtrWkSI0jqa4cNVzOsEsk9iGiry1pX1NWZ0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 438JuwB9116724
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Apr 2024 14:56:58 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Apr 2024 14:56:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Apr 2024 14:56:58 -0500
Received: from [10.249.32.64] ([10.249.32.64])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 438JuwtM012484;
	Mon, 8 Apr 2024 14:56:58 -0500
Message-ID: <f2900f06-fa1f-40a7-b8d0-5cd5352a65b5@ti.com>
Date: Mon, 8 Apr 2024 14:56:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: am335x-evm: Bump up max_leb_cnt
To: Denys Dmytriyenko <denis@denix.org>, Chirag Shilwant <c-shilwant@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Sai
 Sree Kartheek Adivi <s-adivi@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Gyan
 Gupta <g-gupta@ti.com>
References: <20240408161301.835852-1-c-shilwant@ti.com>
 <20240408180912.GA28791@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240408180912.GA28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Apr 2024 19:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17563



On 4/8/2024 1:09 PM, Denys Dmytriyenko wrote:
> Are there still any UBI-based tests running on am335x platform?

No idea.  Let me check.


> 
> On Mon, Apr 08, 2024 at 09:43:01PM +0530, Chirag Shilwant wrote:
>> New features added require another increase to max_leb_cnt.
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
>> index 97a4b8b0..5b7739ce 100644
>> --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
>> @@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
>>   # UBI: logical eraseblock size:    126976 bytes
>>   # from ubiattach stdout:
>>   # UBI device number 0, total 1988 LEBs
>> -MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 12000"
>> +MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 13000"
>>   
>>   # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>>   # from dmesg:
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

