Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EE4C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 16:59:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.20650.1661187567515555650
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 09:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=abyvPMib;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27MGxMcE125352;
	Mon, 22 Aug 2022 11:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661187562;
	bh=mbUqzp3vwRBoHUHIUpH82s7Dr2Faro4CKSkiov84v7A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=abyvPMibn7j8+RonP88ArytFr35+3lrDXPOAhTFC+sBEcCGPgRXNO8jUdvZ3VhrE1
	 lhVj/qoDH/uLjcAICI9BBPRutQjj+3ilIMIxYNsAOW0do7cZEJ5PJ8Qmo60oKoVagk
	 zMHqn4FpLGvwyX5W9ccYKgKFO71hqvKFcvNPjC5Y=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27MGxMtN081805
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Aug 2022 11:59:22 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 22
 Aug 2022 11:59:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 22 Aug 2022 11:59:22 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27MGxMHp027454;
	Mon, 22 Aug 2022 11:59:22 -0500
Message-ID: <bfcaab85-af1f-e742-cab2-eb7b74ddd1a1@ti.com>
Date: Mon, 22 Aug 2022 11:59:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [meta-ti][dunfell][PATCH v3] all: Stop using git://git.ti.com
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220821183710.21919-1-reatmon@ti.com>
 <20220822010550.GB18429@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220822010550.GB18429@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Aug 2022 16:59:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14966





On 8/21/2022 20:05, Denys Dmytriyenko wrote:
> On Sun, Aug 21, 2022 at 01:37:10PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Stop using un-encrypted git:// protocol to access TI repositories.
>>
>> This is inline with the same arguments as made by github in
>> https://github.blog/2021-09-01-improving-git-protocol-security-github/
>>
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v3: Rework/rebase of the original patch from Nishanth now that our new
>>      build servers can handle this change.
>>
>>   classes/ti-pdk-fetch.bbclass                    |   4 ++--
>>   conf/machine/include/.k3r5.inc.swp              | Bin 0 -> 12288 bytes
> 
> ????????
>

My bad.  I missed that.  I had so many files to update that I just ran 
git add.  I'll fix it.




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

