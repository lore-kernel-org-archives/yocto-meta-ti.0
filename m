Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D8C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 20:25:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.3470.1654547148269188513
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 13:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eMx/Qaxd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 256KPlhq012214
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Jun 2022 15:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654547147;
	bh=KPNNt9/0o7oW0w+J+AJVi2i1ZYVYbKj1qZk1a6KNYp8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eMx/Qaxd4ze2Ssq8M0u0qBUXaI2PUCcSAwCUyVHHHNeHQ52s+hJzqEb2gIIw06DdB
	 i1HlNOIty0IPBaLdsDS7bnTC5gFttLMxcYFOg8TeyfhIJKL2jeEt6PpgcFp5c7SUko
	 oHdMXYkJRlP1qLlJ5pxC9HeGuZsBO9X0oVyXcRGI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 256KPlDi059244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Jun 2022 15:25:47 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Jun 2022 15:25:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Jun 2022 15:25:46 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 256KPk7W016877;
	Mon, 6 Jun 2022 15:25:46 -0500
Message-ID: <f9537b27-5e4b-7ce3-69b9-64fda91130c0@ti.com>
Date: Mon, 6 Jun 2022 15:25:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-ti] [dunfell PATCH 0/3] Add J721S2 HS platform support
Content-Language: en-US
To: <j-choudhary@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>
References: <20220602172220.24096-1-j-choudhary@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220602172220.24096-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Jun 2022 20:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14785



On 6/2/2022 12:22, Jayesh Choudhary via lists.yoctoproject.org wrote:
> This series add the yocto configuration for J721S2 HS platform.
> 
> There is a dependancy of this series on u-boot j721s2-hs support on
> ti-linux tree which is pending internal review.	
> 
> Jayesh Choudhary (3):
>    conf: machine: Add j721s2 hs platform
>    ti-rtos-firmware: Add j721s2 hs support
>    j721s2-hs: changes to support new hs platform
> 
>   conf/machine/j721s2-hs-evm-k3r5.conf          | 13 ++++++
>   conf/machine/j721s2-hs-evm.conf               | 22 +++++++++
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 18 ++++++++
>   .../trusted-firmware-a_%.bbappend             |  8 ++++
>   recipes-bsp/u-boot/u-boot-ti.inc              |  6 +++
>   recipes-security/optee/optee-os_%.bbappend    |  4 ++
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 46 +++++++++++++++++++
>   7 files changed, 117 insertions(+)
>   create mode 100644 conf/machine/j721s2-hs-evm-k3r5.conf
>   create mode 100644 conf/machine/j721s2-hs-evm.conf


There are a few other files that needs to be modified to correctly add 
j721s2-hs-evm support:

recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
recipes-kernel/linux/kernel-rdepends.inc

Jayesh will be sending a v2 with those additional changes as well.


> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14773): https://lists.yoctoproject.org/g/meta-ti/message/14773
> Mute This Topic: https://lists.yoctoproject.org/mt/91504465/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

