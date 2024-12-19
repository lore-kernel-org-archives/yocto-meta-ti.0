Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC03E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:52:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.141181.1734648758794936170
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 14:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x9JaLn/6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJMqZjn374153
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 16:52:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734648755;
	bh=Sc6Lt8A8BrorBZTCACFdapNwJap2pFbkHtfzbC2ikzQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=x9JaLn/67XQX+ulZsmKfa/w5g0IZ5LaSI6lNXMsVYoa+n2cAR2wPgy7Duhbp6O4RO
	 mGgeGuz2Ebas3D5U/q7h+v5ImoYe0ymvw/6CftZvECeqesAtebJma1j74o6PkW+lJG
	 GCV7mXIrhxBlfOWjaqMXHqKt5LZo7CYzLLV3w62o=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJMqZiL110653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 16:52:35 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 16:52:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 16:52:35 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJMqYwP130372;
	Thu, 19 Dec 2024 16:52:35 -0600
Message-ID: <6ac547cc-8ad6-4789-b3a0-c31b3c0ed0dc@ti.com>
Date: Thu, 19 Dec 2024 16:52:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH 00/13] Add meta-beagle layer
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20241219215402.28324-1-reatmon@ti.com>
 <20241219223752.GK23825@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241219223752.GK23825@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 22:52:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18162



On 12/19/2024 4:37 PM, Denys Dmytriyenko wrote:
> On Thu, Dec 19, 2024 at 03:53:49PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Backport of the meta-beagle patches from master.
> 
> Are there any changes here from my backport to scarthgap I posted yesterday?
> Or is it just a re-post?

I just completely missed that you sent the series yesterday.  Ooops.


> 
>> Denys Dmytriyenko (12):
>>    conf/machine: rename beagleplay machine to beagleplay-ti
>>    meta-beagle: create a separate layer for Beagle platforms
>>    meta-beagle: layer.conf: add lz4c to host tools list
>>    conf/machine: move "bb_org" BSP settings to meta-beagle
>>    conf/machine: split beagleplay config between meta-ti-bsp and
>>      meta-beagle
>>    conf/machine: move remaining Beagle platforms to meta-beagle
>>    u-boot-bb_org, linux-bb_org: move "bb_org" providers to meta-beagle
>>    linux-bb.org: update Beagle BSP to 6.1.83
>>    conf/machine: add BeagleY-AI platform
>>    linux-bb.org, u-boot-bb.org: rename recipes with version
>>    beagle-bsp, linux-bb.org, u-boot-bb.org: add support for 6.6 BSP
>>    linux-bb.org_6.6: disable FORTIFY_SOURCE for now
>>
>> Ryan Eatmon (1):
>>    meta-beagle: Add SECURITY file
>>
>>   {meta-ti-extras => meta-beagle}/COPYING.MIT   | 24 ++---
>>   {meta-ti-extras => meta-beagle}/README        | 10 +-
>>   {meta-ti-bsp => meta-beagle}/SECURITY         |  0
>>   meta-beagle/conf/layer.conf                   | 17 ++++
>>   .../conf/machine/beagle-x15.conf              |  5 +-
>>   .../conf/machine/beaglebone-ai64-k3r5.conf    | 11 ++-
>>   .../conf/machine/beaglebone-ai64.conf         | 22 +++--
>>   .../conf/machine/beaglebone.conf              |  5 +-
>>   meta-beagle/conf/machine/beagleplay-k3r5.conf | 11 +++
>>   meta-beagle/conf/machine/beagleplay.conf      | 78 +++++++++++++++
>>   meta-beagle/conf/machine/beagley-ai-k3r5.conf | 16 ++++
>>   meta-beagle/conf/machine/beagley-ai.conf      | 25 +++++
>>   .../conf/machine/include/beagle-bsp.inc       | 43 +++++++++
>>   .../u-boot/u-boot-bb.org_2023.04.bb           |  7 +-
>>   .../u-boot/u-boot-bb.org_2024.10.bb           | 12 +++
>>   .../linux/linux-bb.org-6.1}/defconfig         |  0
>>   .../linux/linux-bb.org-6.6}/defconfig         |  0
>>   .../linux/linux-bb.org-6.6/no-fortify.cfg     |  1 +
>>   .../recipes-kernel/linux/linux-bb.org_6.1.bb  | 19 ++--
>>   .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 71 ++++++++++++++
>>   ...play-k3r5.conf => beagleplay-ti-k3r5.conf} |  1 -
>>   meta-ti-bsp/conf/machine/beagleplay-ti.conf   | 49 ++++++++++
>>   meta-ti-bsp/conf/machine/beagleplay.conf      | 96 -------------------
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 21 +---
>>   ...void-64-bit-division-in-ioc_timer_fn.patch | 56 -----------
>>   ...-gcc13-keep-large-values-in-a-new-en.patch | 54 -----------
>>   26 files changed, 382 insertions(+), 272 deletions(-)
>>   copy {meta-ti-extras => meta-beagle}/COPYING.MIT (86%)
>>   copy {meta-ti-extras => meta-beagle}/README (82%)
>>   copy {meta-ti-bsp => meta-beagle}/SECURITY (100%)
>>   create mode 100644 meta-beagle/conf/layer.conf
>>   rename {meta-ti-bsp => meta-beagle}/conf/machine/beagle-x15.conf (89%)
>>   rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64-k3r5.conf (66%)
>>   rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64.conf (65%)
>>   rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone.conf (92%)
>>   create mode 100644 meta-beagle/conf/machine/beagleplay-k3r5.conf
>>   create mode 100644 meta-beagle/conf/machine/beagleplay.conf
>>   create mode 100644 meta-beagle/conf/machine/beagley-ai-k3r5.conf
>>   create mode 100644 meta-beagle/conf/machine/beagley-ai.conf
>>   create mode 100644 meta-beagle/conf/machine/include/beagle-bsp.inc
>>   rename meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb => meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb (61%)
>>   create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
>>   copy {meta-ti-bsp/recipes-kernel/linux/linux-bb.org => meta-beagle/recipes-kernel/linux/linux-bb.org-6.1}/defconfig (100%)
>>   rename {meta-ti-bsp/recipes-kernel/linux/linux-bb.org => meta-beagle/recipes-kernel/linux/linux-bb.org-6.6}/defconfig (100%)
>>   create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg
>>   rename meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb => meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb (76%)
>>   create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
>>   rename meta-ti-bsp/conf/machine/{beagleplay-k3r5.conf => beagleplay-ti-k3r5.conf} (88%)
>>   create mode 100644 meta-ti-bsp/conf/machine/beagleplay-ti.conf
>>   delete mode 100644 meta-ti-bsp/conf/machine/beagleplay.conf
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
>>
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

