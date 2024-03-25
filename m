Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47425C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 14:43:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.54007.1711377824816149011
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 07:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mS0TYNw4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42PEhhLD098421;
	Mon, 25 Mar 2024 09:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711377823;
	bh=9pEgXAMZFgPjM5mxAC9D/G1QlBALrQbZHSXtlGjsR0o=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=mS0TYNw4gORgJ9t35N/X03oMjmTfzGLRP84h2sFv7mIifwo+4xghnPMjj+Xc7ic/h
	 xN5LEzg7yL2fmHssft8PtBEwimNEfcSuM1HjJa7Z8FImEfmjuy/M/chKj7QrJTjkkP
	 KSuWH8lYIJ9yrZy1i1CSe5fiMcmrpf47h5/9fp7Y=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42PEhhhX092856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Mar 2024 09:43:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 25
 Mar 2024 09:43:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 25 Mar 2024 09:43:43 -0500
Received: from [10.249.39.109] ([10.249.39.109])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42PEhh9g100325;
	Mon, 25 Mar 2024 09:43:43 -0500
Message-ID: <683f783b-599d-4714-b1f6-def6659ce739@ti.com>
Date: Mon, 25 Mar 2024 09:43:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] Dunfell branch EOL ?
Content-Language: en-US
To: <mlynch@hi-techniques.com>, <meta-ti@lists.yoctoproject.org>
References: <O9SB.1711369070225727762.5uX5@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <O9SB.1711369070225727762.5uX5@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Mar 2024 14:43:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17552



On 3/25/2024 7:17 AM, mlynch@hi-techniques.com wrote:
> There was an announcement in the #Yocto group about the Dunfell branch going to EOL.  I was wondering, will TI still be pushing changes to that branch after it goes EOL or will changes only be pushed to different (newer) branch(s)?  I'm asking because I've been using the Dunfell branch to build for the "beagle" platform(s) because I have not been successful at getting a build on any other branch (kirkstone or master) for that platform to boot.


We have not been pushing many things to dunfell since we switched to 
kirkstone, and will likely not push that many changes to kirkstone once 
scarthgap comes out.  The majority of our efforts tend towards the 
latest kernel/uboot versions and the latest LTS branch of yocto.

The EOL refers to pushing any new security patches/CVEs for many of the 
packages out of oe-core.  There will never be any plans to remove the 
dunfell branch, so you are free to continue to use it if you cannot move 
to any of the newer branches.

If you have any bugs to report against mater/kirkstone/scarthgap with 
the beagle platform not booting properly, feel free to submit it.

There are currently 4 beagle boards supported in meta-ti-bsp, which one 
are you specifically using?



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

