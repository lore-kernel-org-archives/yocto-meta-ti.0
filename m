Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F3CCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:02:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.28509.1697724166162778702
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 07:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u9NF75Uv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JE2eSE047053;
	Thu, 19 Oct 2023 09:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697724161;
	bh=z2eUun4bvWS3IeQmm+hINMJQTPsReSCOp3yAGK3ar9k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=u9NF75UvX0mZdWPv+qoMK5ZkCEjEInoAj/yFAAhloaIsPk0huOkJCoQjqSuwNVkZC
	 068KiE7xe4tPMa2iqJXdr4PwhFBIGfHWS6tReU9T6gr7itCo76kfrIjQR6FUVgmrkJ
	 GG32GDEyPIY0mj2L/BbzMsYnQdRBByyGFEsS+JzA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JE2eZC028128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 09:02:41 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 09:02:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 09:02:40 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JE2eIb084887;
	Thu, 19 Oct 2023 09:02:40 -0500
Message-ID: <20ab0e29-d3c6-45cd-b914-1c25fdd8c204@ti.com>
Date: Thu, 19 Oct 2023 09:02:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 0/1] Update BBAI64 aarch64 target
 version
Content-Language: en-US
To: Prasanth Mantena <p-mantena@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <praneeth@ti.com>,
        <a-limaye@ti.com>, <u-kumar1@ti.com>
References: <20231019113938.1657179-1-p-mantena@ti.com>
 <20231019120010.GO2408@denix.org>
 <20231019121124.o2jtpaybwsxykkw3@uda0496754>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231019121124.o2jtpaybwsxykkw3@uda0496754>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 14:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17144



On 10/19/2023 7:11 AM, Prasanth Mantena wrote:
> On 08:00-20231019, Denys Dmytriyenko wrote:
>> On Thu, Oct 19, 2023 at 05:09:37PM +0530, Prasanth Babu Mantena via lists.yoctoproject.org wrote:
>>> The following patch is to update the kernel version of linux-bb.org from 5.10 to 6.1
>>> and is verified on BBAI64 board for successful booting of kernel.
>>
>> NAK.
>>
>> I'm sitting on the same changes for a few weeks now, waiting for the
>> corresponding EEPROM fix in U-boot. Otherwise it doesn't boot. Was this
>> tested with an old U-boot?
> 
> The EEPROM fix has been post to lpr and pulled to ti-u-boot-2023.04-next.
> This patch has been tested against the EEPROM fix. It was tested with
> old u-boot without fix by booting kernel using custom get_fdt_mmc
> throught uEnv.txt. But as proper fix is in place now, This patch should
> work without issues.

Then I think we should wait for the uboot change to be released into 
prod so that Denys can test his changes to verify that everything is 
good.  That promotion should be occuring anytime now.  We are just 
working through testing issues.



> Regards,
> Prasanth
> 
>>
>>
>>> The existing dtbs are added to the machine conf file. Further addition
>>> of dtb overlays to the tree requires them to be added to the machine conf
>>> file. I am not working on adding the overlays of BBAI64 to the kernel.
>>>
>>>
>>> Prasanth Babu Mantena (1):
>>>    linux-bb.org: update to 6.1.46 for aarch64 targets
>>>
>>>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 72 ++++++-------------
>>>   .../recipes-kernel/linux/linux-bb.org_git.bb  |  8 +--
>>>   2 files changed, 24 insertions(+), 56 deletions(-)
>>>
>>> -- 
>>> 2.33.3

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

