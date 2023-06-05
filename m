Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F7CC7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 20:09:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.430.1685995740088435487
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 13:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MLdwH4aI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355K8xjE034472
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 15:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685995739;
	bh=sOJu8h0wlFwX63xlmGOMa2bkrgTrsDXfo/+fuFl++rM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=MLdwH4aI55i8VCntk3msATxq36SvtsfVPv7EPvljHOd7RKD6oJy3PpIHAgZ174ldU
	 gxTT0PWSGTtZead/uVlqM5B2Kj/NsIzqypgPRSOsICUOJwL2O7m0TM+GSPBAcgw+KL
	 ImvC+ON9qJyBfjh9vD9OjC5IAf4lDyXddB7gYu3o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355K8xG4000421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 15:08:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 15:08:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 15:08:59 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355K8xBe128243
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 15:08:59 -0500
Message-ID: <9d4eaa1a-e345-f4e3-00b1-074e7723b766@ti.com>
Date: Mon, 5 Jun 2023 15:08:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] [meta-ti] Mesa for SGX on kirkstone
Content-Language: en-US, en-US-large
To: <meta-ti@lists.yoctoproject.org>
References: <DB9PR06MB8106872E258ACB1F859619DCC44DA@DB9PR06MB8106.eurprd06.prod.outlook.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <DB9PR06MB8106872E258ACB1F859619DCC44DA@DB9PR06MB8106.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 20:09:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16669

On 6/5/23 12:17, Matthias Schnelte via lists.yoctoproject.org wrote:
> Hello everyone,
> 
> I was trying to build kirkstone for am335x with a SGX GPU.
> I was not able to use it with mesa.
> 
> On the latest kirkstone (1743b0101) (I tried it with the latest master, too) if I set
> 
> PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
> 
> bitbaking mesa-pvr fails with
> 
> ../git/meson.build:21:0: ERROR: Options "sgx" are not in allowed choices: "auto, kmsro, radeonsi, r300, r600, nouveau, freedreno, swrast, v3d, vc4, etnaviv, tegra, i915, svga, virgl, panfrost, iris, lima, zink, d3d12, asahi, crocus, pvr"
> 
> 
> There is a branch wip2/kirkstone/sgx-1.17-4948957/22.0 on the mesa-pvr repository that includes this option. But this branch fails to build with lots of undefined reference errors.
> 
> So the only way to build an image with working SGX support for me was to port the ti-sgx-ddk-um_1.17.4948957.bb from dunfell over to kirkstone and set preffered providers for my target as in dunfell.
> 
> PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
> 
> Is this currently the only way to get SGX working or am I doing sth wrong?
> 
> Tnx.
> 
> Matthias
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16667): https://lists.yoctoproject.org/g/meta-ti/message/16667
> Mute This Topic: https://lists.yoctoproject.org/mt/99345421/7094281
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Hey,

So, fun thing is, that branch does have some initial work to get SGX up 
and running in kirkstone, but it also introduces a cyclic dependency in 
its current state that yocto is unable to resolve. Technically there was 
some work to fix this by migrating sgx to use the new PVR-DRI interface 
present in Rogue, which is much more stable and would allow for greater 
code reuse between the platforms but it's been a real pain so far.

To make a long story short, that work is currently stalled while we 
stabilize rogue graphics (and the rest of the graphics utilities) under 
kirkstone. Expect that work to be picked back up for 9.1 when greater 
general legacy device support is present.

Regards,
Randolph Sapp

