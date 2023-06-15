Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F436EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:12:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.19556.1686838334754949401
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TEV0VGtq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FECArh087314;
	Thu, 15 Jun 2023 09:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686838330;
	bh=fKI3r/VU8lnLaP4d0esEwyrA8+tokOK+2TiErpUHzRY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TEV0VGtq6CfwI0DxOWJ1ecsBsnTLaHgFrjXZDhIYkBHGYKnD4xRJB/UcRh8yE/yHn
	 voJtsYhYKZooWx89J2maXgYjNFnc8zyGy6NPKyoD1VymFfakSVhMzvCzqvzo5nvTBH
	 zi+ql6KuPCpXyxJgKK5O2xQ8sSQ7UD0G52WCAGms=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FECAh4012432
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 09:12:10 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 09:12:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 09:12:10 -0500
Received: from [10.249.34.224] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FEC9TM030062;
	Thu, 15 Jun 2023 09:12:10 -0500
Message-ID: <a497d65c-5798-9e23-0259-b33b36feccb3@ti.com>
Date: Thu, 15 Jun 2023 09:12:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2] u-boot-ti-staging_2023.04:
 Copy bitmap file to boot partition for AM62x
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Devarsh Thakkar <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
 <77b8b5bb-4c33-bfb9-3eab-0c73734b8638@ti.com>
 <20230615141055.GB1518@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230615141055.GB1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16734



On 6/15/2023 9:10 AM, Denys Dmytriyenko wrote:
> On Thu, Jun 15, 2023 at 08:36:36AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 6/14/2023 9:33 AM, Devarsh Thakkar wrote:
>>> Early splash screen support for AM62x has been enabled in u-boot
>>> and it requires bitmap tarball to be present in boot partition
>>> as per the default environment settings done in u-boot [1].
>>>
>>> Copy the ti logo bitmap tarball to boot partition of wic image in order
>>> to enable out of box early display on AM62x.
>>>
>>> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
>>> V2: Rename ti logo tarball as per suggested changes (same is being
>>>      done in ti-u-boot too)
>>> ---
>>>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> index e6da84cb..c948e1ed 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>> @@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
>>>   SRCREV = "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>>> +do_install:append:am62xx() {
>>> +	install -d ${D}/boot
>>> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
>>> +}
>>> +
>>> +do_deploy:append:am62xx() {
>>> +	install -d ${DEPLOYDIR}
>>> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
>>> +}
>>
>>
>> Denys,
>>
>> In the longer term, should this be in the u-boot.inc file and not in
>> the recipe itself?  That's were all of the other do_* appends are...
> 
> In the longer term I was going to ask if this logo should be enabled for
> all TI platforms, instead of just am62x?

Valid question.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

