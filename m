Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E9FC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 04:32:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.51738.1683779553832603130
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 May 2023 21:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HkXys8fX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-bhatia1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34B4WR04080797;
	Wed, 10 May 2023 23:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683779547;
	bh=uwQc5gBm/RzIuExNRNYN44YfQiwZtyik5+wkt3tv+mE=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=HkXys8fXkHoW3ndhcNvHfrQWm4dXtuOCWMCtIL5TIu4/23Rz2a04TuZW/I6HzgJOx
	 pDA7mmU0rAivycVBhZS3g6K7c4+tR0QoeIIm4iVXEeHgJLhq9EtHwq7VyfnpINgtn8
	 PC9cpDUGzrpUJd5pOmX57kSOFfCcqmb2sY5APaNM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34B4WR6G006235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 May 2023 23:32:27 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 May 2023 23:32:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 May 2023 23:32:27 -0500
Received: from [172.24.217.218] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34B4WObe045727;
	Wed, 10 May 2023 23:32:25 -0500
Message-ID: <b2ab2c02-05ab-b09a-a97e-8764846ca0f4@ti.com>
Date: Thu, 11 May 2023 10:02:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [meta-ti] [kirkstone-next][PATCH] meta-ti: conf: am62xx-lp-evm:
 Fix DT and DT prefixes
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>,
        Sai Sree Kartheek Adivi
	<s-adivi@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230505083824.27085-1-a-bhatia1@ti.com>
 <20230506014021.GI9226@denix.org>
Content-Language: en-US
In-Reply-To: <20230506014021.GI9226@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 04:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16506

Hi Denys

Thank you for reviewing the patch.

On 06-May-23 07:10, Denys Dmytriyenko wrote:
> Couple minor comments regarding the subject tags:
> 
> 1. You want to specify the target release branch, such as "kirkstone", not the 
> intermediate branches, like "*-wip" or "*-next".
> 
Yup, noted!

> 2. We want to keep master up-to-date and in most cases the change is quite 
> straightforward and applies to both master and kirkstone, so it's best to 
> specify that in the tag as "master/kirkstone". And testing against those 
> branches is highly recommended! :)

Understood! This patch was tested for kirkstone, but not for master
branch.

After your comment, I checked, and this patch does apply cleanly on
master as well. However, I have not been able to find proper configs for
oe-layer setup for the master branch, and manually changing the
kirkstone config to point to master did not help either.

Do you have any suggestions on how I could test the patch on master?

Regards
Aradhya

> 
> 
> On Fri, May 05, 2023 at 02:08:24PM +0530, Aradhya Bhatia via lists.yoctoproject.org wrote:
>> The DT name k3-am62-lp-sk.dts was adopted instead of k3-am62x-lp-sk.dts
>> because the community prefers avoiding the wildcard letter 'x'.[1]
>>
>> Drop the letter 'x' from the strings in KERNEL_DEVICETREE_PREFIX and
>> KERNEL_DEVICETREE to accurately reflect the DT names.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> [1]:
>> https://lore.kernel.org/all/06cbcd7d-bc83-bfeb-0821-72c7caf9a5e7@linaro.org/
>> ---
>>  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> index ba1a12a7fdb7..ce306a2a0e17 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> @@ -5,12 +5,12 @@
>>  require conf/machine/include/am62xx-lp.inc
>>  
>>  KERNEL_DEVICETREE_PREFIX = " \
>> -    ti/k3-am62x-lp \
>> +    ti/k3-am62-lp \
>>      ti/k3-am625-sk \
>>  "
>>  
>>  KERNEL_DEVICETREE = " \
>> -    ti/k3-am62x-lp-sk.dtb \
>> +    ti/k3-am62-lp-sk.dtb \
>>  "
>>  
>>  SPL_BINARY = "tispl.bin_HS"
>> -- 
>> 2.40.1

