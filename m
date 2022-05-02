Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10123C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 17:18:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.563.1651511920777638320
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 10:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JI1pkKma;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 242HIauZ097788;
	Mon, 2 May 2022 12:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651511916;
	bh=3fRoeRXfQbtXtCGYF3YY5p5ic7RAWc//z9Lf7ZspYqU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=JI1pkKmaj+QGsPUCFpV6XFK/EpmHHHupx26fmKXjbgIVzj6xhI3AOEj+Q5uAketOk
	 CTBiu9gPOX+5PNud76M7S5l47RgT0RBK8oHWSFNw948SwHaaUzFxkCrwVmbIJEs+EQ
	 dZc6VooRBtOWKnttSxsGd9PfnA5LeKTLnBRxFgy4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 242HIaM8008005
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 May 2022 12:18:36 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 12:18:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 12:18:36 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 242HIaw2013920;
	Mon, 2 May 2022 12:18:36 -0500
Message-ID: <602da4e2-36f4-eb06-fad7-2f1fa8dbb768@ti.com>
Date: Mon, 2 May 2022 12:18:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti] [master][PATCH 00/26] sync up with dunfell
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <20220502145120.726632-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 17:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14670


Series applied to master.


On 5/2/2022 9:50, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Port latest updates in Dunfell into master.
> 
> Denys Dmytriyenko (1):
>    linux-ti-staging/mainline: depend on libmpc-native and gmp-native
> 
> Devarsh Thakkar (1):
>    u-boot-ti: Use SRCREV to get short commit ID
> 
> Etheridge, Darren (1):
>    ti-graphics: gpu enable and move all platforms to ddk 1.15
> 
> Jonathan Humphreys (1):
>    conf: Enable bmap file for wic images on legacy platforms
> 
> Matthias Schiffer (1):
>    ti-sgx-ddk-um: avoid unnecessary dependency on -dev package
> 
> Nick Saulnier (2):
>    pru-icss_git.bb: update to PSSP v6.1.0
>    pru-icss_git.bb: add AM62x
> 
> Nishanth Menon (1):
>    machine: Add am62xx evm configuration
> 
> Praneeth Bajjuri (2):
>    ipc: ti-rpmsg-char: Update library to 0.4.1
>    k3conf: Update SRCREV to pick AM62x support
> 
> Ryan Eatmon (16):
>    linux-ti-staging: Bump to 08.02.00.004 release
>    linux-ti-staging-rt: Bump to 08.02.00.004 release
>    u-boot-ti-staging: Bump to 08.02.00.004 release
>    linux-ti-staging: Bump to 08.02.00.005 release
>    linux-ti-staging-rt: Bump to 08.02.00.005 release
>    u-boot-ti-staging: Bump to 08.02.00.005 release
>    ti-linux-fw: Bump to 08.02.00.005 release
>    u-boot-ti-staging: Bump to 08.02.00.006 release
>    u-boot-ti-staging: Bump to 08.03.00.001 release
>    linux-ti-staging: Bump to 08.03.00.001 release
>    linux-ti-staging-rt: Bump to 08.03.00.001 release
>    conf: machine: am62xx Add missing dtbo file
>    u-boot-ti-staging: Bump to 08.03.00.002 release
>    linux-ti-staging: Bump to 08.03.00.002 release
>    linux-ti-staging-rt: Bump to 08.03.00.002 release
>    ti-linux-fw: Bump to 08.03.00.002 release
> 
>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 11 +++++
>   meta-ti-bsp/conf/machine/am62xx-evm.conf      | 14 ++++++
>   meta-ti-bsp/conf/machine/include/am62xx.inc   | 17 +++++++
>   meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
>   meta-ti-bsp/conf/machine/include/ti33x.inc    |  2 +-
>   meta-ti-bsp/conf/machine/include/ti43x.inc    |  2 +-
>   meta-ti-bsp/conf/machine/j721s2-evm.conf      |  2 +
>   .../ti-img-rogue-driver_1.13.5776728.bb       | 40 -----------------
>   .../ti-img-rogue-driver_1.15.6133109.bb       | 44 +++++++++++++++++++
>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  4 +-
>   .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 18 ++++++++
>   .../u-boot/u-boot-ti-staging_2021.01.bb       |  4 +-
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 17 ++++---
>   .../recipes-devtools/k3conf/k3conf_git.bb     |  2 +-
>   ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} | 13 +++---
>   .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  2 +-
>   .../linux/linux-ti-mainline_git.bb            |  2 +-
>   .../linux/linux-ti-staging-rt_5.10.bb         |  4 +-
>   .../linux/linux-ti-staging_5.10.bb            |  6 ++-
>   meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc  |  6 +--
>   .../ti-rtos-bin/ti-rtos-firmware.bb           | 38 +++++++++++++---
>   .../recipes-bsp/pru/pru-icss_git.bb           | 25 ++++++++++-
>   22 files changed, 196 insertions(+), 79 deletions(-)
>   create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm.conf
>   create mode 100644 meta-ti-bsp/conf/machine/include/am62xx.inc
>   delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>   create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
>   rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.5776728.bb => ti-img-rogue-umlibs_1.15.6133109.bb} (84%)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14642): https://lists.yoctoproject.org/g/meta-ti/message/14642
> Mute This Topic: https://lists.yoctoproject.org/mt/90836855/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

