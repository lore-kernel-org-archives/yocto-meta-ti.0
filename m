Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1099C531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 17:24:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.492.1724174673443461305
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Aug 2024 10:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=R7qLlb89;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47KHOTIO082314;
	Tue, 20 Aug 2024 12:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724174669;
	bh=NV8QMVCsDB5GsU1SrDPQpfpDsL/6yPqOSdxYZmaDIiY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=R7qLlb89zU2IRI2VDwuL/mPZxYfPfSaOKDZdJIh4ffAkNAhy17k3PeVqf9hIsZZMs
	 zrflHbH6HZ4S0PO7fDoaAvOqKCRdBpWIi53ppysWpWXygsBfMGZm+3HGs8Ztqoii0j
	 x1z3RRW0fna4ffz+Q864OTryjLa8vcDyGG2xyAmc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47KHOTAq041611
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Aug 2024 12:24:29 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Aug 2024 12:24:29 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Tue, 20 Aug
 2024 12:24:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Aug 2024 12:24:28 -0500
Received: from [10.249.36.103] ([10.249.36.103])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47KHOSDi068287;
	Tue, 20 Aug 2024 12:24:28 -0500
Message-ID: <9dd2e104-d53e-4c64-8270-733f83f27286@ti.com>
Date: Tue, 20 Aug 2024 12:24:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] Yocto Development for custom AM335x/OSD335x board and
 more
To: Arcadius <arcady.ruvidic@clearsy.com>, <meta-ti@lists.yoctoproject.org>
References: <xdSV.1724144833468760472.3FMY@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <xdSV.1724144833468760472.3FMY@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Aug 2024 17:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17944



On 8/20/2024 4:07 AM, Arcadius wrote:
> Hello everyone,
> 
> This is my first attempt at working with Linux on a custom board, which seems quite differently from RTOS development I am used to.
> I have been looking into the Yocto Project to create a custom distribution, but before modifying Linux itself I would like to understand how to start working from the default Poky distro to get it running on a custom board.
> I currently have the OSD3358-SM-RED dev kit board from Octavo Systems and will soon have my custom board based on the OSD3358 C-SiP (SiP with AM3358 inside).
> As a first step I would like to get Poky running on the dev kit.
> 
> I have checked that Yocto succeeds building the minimal image for Qemu on branch Scarthgap and Ubuntu 22.04 host.
> I got the device tree sources for the board from Octavo Systems' GitHub.
> I guess that adding the meta-ti layer along with its dependencies should add support for the AM3358 processor (although I am unsure as to what exactly Arago is and if I can ignore it for a minimal Poky build).

Arago is a reference distribution that TI uses as the basis for our 
downloadable SDKs off of ti.com.  Poky is also a distribution, so you 
cannot mix the two.  You should be fine just building a poky build.  You 
just need to add the meta-ti-bsp layer from the meta-ti repo and you 
should be able to build a minimal system that you can boot on your board.


> Then I would probably need a custom layer to add custom recipes including the device tree sources.
> But with my current knowledge, I can't get much further than this.
> 
> I have seen the processor SDK for AM335x but I was wondering if there would be a more direct way of doing things starting from Poky.
> Additionally, I would like to be able to use my Linux distro on other custom boards which won't necessarily use TI processors (e.g. Microchip's SAMA7G54), so I was unsure if the SDK was a good development environment for this case.
> I would basically like to learn a process that would work for any board with any processor as long as BSPs are provided.
> I have checked the documents from Octavo Systems but their approach of "hacking" a Beaglebone image doesn't really fit into my objective.

There are a number of YouTube videos of talks from past Yocto Summits 
that might help with getting started.


> So, any help would be appreciated!
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17943): https://lists.yoctoproject.org/g/meta-ti/message/17943
> Mute This Topic: https://lists.yoctoproject.org/mt/107997584/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

