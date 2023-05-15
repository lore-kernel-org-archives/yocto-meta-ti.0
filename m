Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEA4C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:21:42 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.88003.1684156897953030590
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 May 2023 06:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I5B38gkb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34FDLWUx096778;
	Mon, 15 May 2023 08:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684156892;
	bh=jTjCGqld2nYdSl1LxQ3KeTwJLzcqXMf33Cw4EwejD5g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I5B38gkbMS9ZW9LYK3G71Wbsp7Kiba8/e5qg7u/9014RRTSHmet080YNl0aYKFysc
	 AcTy/OwK8v+iR8JpDfJlNoJNoAKct+hGj7RbMdjL987l2U9oMwTKFeshEkpsmpd/GU
	 WLnxV9FO+IlM8Hr1jkkvJdwuTq2dtwZDs68WyvAc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34FDLWtF094479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 May 2023 08:21:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 May 2023 08:21:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 May 2023 08:21:32 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34FDLWMK070277;
	Mon, 15 May 2023 08:21:32 -0500
Message-ID: <43b0a671-4a78-56dc-1cb4-bc50ef3e31af@ti.com>
Date: Mon, 15 May 2023 08:21:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone-next][PATCH] meta-ti: conf: am62xx-lp-evm:
 Fix DT and DT prefixes
To: Aradhya Bhatia <a-bhatia1@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Meta-TI List
	<meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230505083824.27085-1-a-bhatia1@ti.com>
 <20230506014021.GI9226@denix.org>
 <b2ab2c02-05ab-b09a-a97e-8764846ca0f4@ti.com>
 <20230512030004.GD9226@denix.org>
 <ccc589fe-9632-a2d0-d48f-8628f31fab0e@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ccc589fe-9632-a2d0-d48f-8628f31fab0e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 May 2023 13:21:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16532



On 5/15/2023 4:07 AM, Aradhya Bhatia wrote:
> Hi Denys
> 
> On 12-May-23 08:30, Denys Dmytriyenko wrote:
>> On Thu, May 11, 2023 at 10:02:23AM +0530, Aradhya Bhatia wrote:
>>> Hi Denys
>>>
>>> Thank you for reviewing the patch.
>>>
>>> On 06-May-23 07:10, Denys Dmytriyenko wrote:
>>>> Couple minor comments regarding the subject tags:
>>>>
>>>> 1. You want to specify the target release branch, such as "kirkstone", not the
>>>> intermediate branches, like "*-wip" or "*-next".
>>>>
>>> Yup, noted!
>>>
>>>> 2. We want to keep master up-to-date and in most cases the change is quite
>>>> straightforward and applies to both master and kirkstone, so it's best to
>>>> specify that in the tag as "master/kirkstone". And testing against those
>>>> branches is highly recommended! :)
>>>
>>> Understood! This patch was tested for kirkstone, but not for master
>>> branch.
>>>
>>> After your comment, I checked, and this patch does apply cleanly on
>>> master as well. However, I have not been able to find proper configs for
>>> oe-layer setup for the master branch, and manually changing the
>>> kirkstone config to point to master did not help either.
>>>
>>> Do you have any suggestions on how I could test the patch on master?
>>
>> If you use oe-layersetup scripts, then there are arago-kirkstone-config.txt
>> and arago-master-config.txt config files available. Let us know if you see any
>> issues.
>>
> 
> Thank you! I ended up using the arago-master-wip-config.txt file for
> oe-layersetup. By default it takes the 5.10 branch, but making it point
> to the ti-linux-6.1.y-cicd:HEAD locally, the required DTBs propped up in
> the build.

We have not ported the 6.1 changes to master yet as we are still working 
on the LTS migration on the kirkstone branch.  Once we release the 6.1 
kernel to kirkstone as the default we will also make the same change on 
master.


> Regards
> Aradhya

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

