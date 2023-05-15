Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF98C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:07:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.83814.1684141640767193825
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 May 2023 02:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yNB6rv/z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-bhatia1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34F977EB086575;
	Mon, 15 May 2023 04:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684141627;
	bh=lraoeUttnrdr+QKbWMHplOOgiHn1o3+St2aR3B6IKBc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yNB6rv/zpJwGvAzV44eEEL0ZChMl5w3429OTpncnzcALW4d3O7L17JBkbiGPF6ZIK
	 NCxAwXS8D5tFR8nLjwue0uBs6re42ro51c0p3V4Gw78pZagllPep4efJnzS5QQWrKd
	 xqUdnKf6m1TjbVOe2vfjO8VpdUm3u3el0A4qhf6w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34F977Xd045719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 May 2023 04:07:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 May 2023 04:07:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 May 2023 04:07:07 -0500
Received: from [172.24.217.218] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34F9728B011914;
	Mon, 15 May 2023 04:07:03 -0500
Message-ID: <ccc589fe-9632-a2d0-d48f-8628f31fab0e@ti.com>
Date: Mon, 15 May 2023 14:37:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
 <b2ab2c02-05ab-b09a-a97e-8764846ca0f4@ti.com>
 <20230512030004.GD9226@denix.org>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20230512030004.GD9226@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 May 2023 09:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16531

Hi Denys

On 12-May-23 08:30, Denys Dmytriyenko wrote:
> On Thu, May 11, 2023 at 10:02:23AM +0530, Aradhya Bhatia wrote:
>> Hi Denys
>>
>> Thank you for reviewing the patch.
>>
>> On 06-May-23 07:10, Denys Dmytriyenko wrote:
>>> Couple minor comments regarding the subject tags:
>>>
>>> 1. You want to specify the target release branch, such as "kirkstone", not the 
>>> intermediate branches, like "*-wip" or "*-next".
>>>
>> Yup, noted!
>>
>>> 2. We want to keep master up-to-date and in most cases the change is quite 
>>> straightforward and applies to both master and kirkstone, so it's best to 
>>> specify that in the tag as "master/kirkstone". And testing against those 
>>> branches is highly recommended! :)
>>
>> Understood! This patch was tested for kirkstone, but not for master
>> branch.
>>
>> After your comment, I checked, and this patch does apply cleanly on
>> master as well. However, I have not been able to find proper configs for
>> oe-layer setup for the master branch, and manually changing the
>> kirkstone config to point to master did not help either.
>>
>> Do you have any suggestions on how I could test the patch on master?
> 
> If you use oe-layersetup scripts, then there are arago-kirkstone-config.txt 
> and arago-master-config.txt config files available. Let us know if you see any 
> issues.
> 

Thank you! I ended up using the arago-master-wip-config.txt file for
oe-layersetup. By default it takes the 5.10 branch, but making it point
to the ti-linux-6.1.y-cicd:HEAD locally, the required DTBs propped up in
the build.

Regards
Aradhya

