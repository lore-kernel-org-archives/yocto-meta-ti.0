Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165C4C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:32:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.44356.1679495573257450872
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 07:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vrQTXdCo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32MEWpp9017787;
	Wed, 22 Mar 2023 09:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679495571;
	bh=AtodqvILjsqMEtmTkbC+zVD61BQA4O2FMvTQ8KKg3aY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=vrQTXdCo27uQRY1eRvqM5NClyQtKUltfed8UxquuS9K2uledNbWStS67pGcCSTqiI
	 NMEPkeFxwTqV8GlZWNDaRSO1c/CZW+1z9+B7qbi2+wFq69B+od4d2BW/stE7DeJuz0
	 KmiQh3aIkHuhnECW8lktyCa6e7kHIZajnht69MVk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32MEWpFP020809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Mar 2023 09:32:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 22
 Mar 2023 09:32:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 22 Mar 2023 09:32:51 -0500
Received: from [10.250.32.15] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32MEWoY0051920;
	Wed, 22 Mar 2023 09:32:50 -0500
Message-ID: <82cd0c2c-2946-3729-f3f5-f63c05a642b7@ti.com>
Date: Wed, 22 Mar 2023 09:32:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][dunfell][PATCH v4 0/3] Kernel and u-boot LTS
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <174EC3630CC18359.22739@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <174EC3630CC18359.22739@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Mar 2023 14:32:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16237


Ignore this series against dunfell.  I used the wrong command when 
generating the patch.  This is for kirkstone/master.


On 3/22/2023 9:15, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are preparing for LTS migration to the 6.1 kernel and 2023.01 u-boot
> versions.  This series creates the recipes for them as well doing a
> little cleanup of how we handle specifying the DTB/DTBO files in the
> machine confs.
> 
> Ryan Eatmon (3):
>    linux-ti-*: Add filtering for which dtb/dtbo to include
>    linux-ti-staging: Add 6.1 kernel in prep for LTS migration
>    u-boot-ti-staging: Add 2023.01 in prep for LTS migration
> 
> v4: Rebase on top of recent dunfell sync.
> v3: Set DEFAULT_PREFERENCE for new rt and systest recipes.
> v2: - Do not use the prefix for mainline or next kernels.
>      - Add rt and systest variations for the kernel.
> 
>   meta-ti-bsp/conf/machine/am57xx-evm.conf      | 17 ++++----
>   meta-ti-bsp/conf/machine/am62axx-evm.conf     | 20 +++-------
>   meta-ti-bsp/conf/machine/am62xx-evm.conf      | 10 +----
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  9 +++--
>   meta-ti-bsp/conf/machine/beagle-x15.conf      |  8 +++-
>   meta-ti-bsp/conf/machine/beaglebone.conf      | 13 +++++--
>   meta-ti-bsp/conf/machine/dra7xx-evm.conf      | 14 +++----
>   meta-ti-bsp/conf/machine/include/am64xx.inc   |  5 +--
>   meta-ti-bsp/conf/machine/include/am65xx.inc   | 12 +-----
>   meta-ti-bsp/conf/machine/include/ti33x.inc    | 15 +++++--
>   meta-ti-bsp/conf/machine/include/ti43x.inc    | 10 +++--
>   meta-ti-bsp/conf/machine/j7200-evm.conf       |  4 +-
>   meta-ti-bsp/conf/machine/j721e-evm.conf       | 29 +++-----------
>   meta-ti-bsp/conf/machine/j721s2-evm.conf      | 32 +++------------
>   meta-ti-bsp/conf/machine/j784s4-evm.conf      | 33 +++-------------
>   meta-ti-bsp/conf/machine/omapl138-lcdk.conf   |  7 +++-
>   .../u-boot/u-boot-ti-staging_2023.01.bb       | 11 ++++++
>   .../linux/linux-ti-mainline_git.bb            | 23 -----------
>   .../recipes-kernel/linux/linux-ti-next_git.bb | 15 -------
>   .../linux/linux-ti-staging-6.1/defconfig      |  2 +
>   .../linux/linux-ti-staging-6.1/k3/defconfig   |  2 +
>   .../linux-ti-staging-6.1/omapl138/defconfig   |  1 +
>   .../linux/linux-ti-staging-rt-6.1/defconfig   |  2 +
>   .../linux-ti-staging-rt-6.1/k3/defconfig      |  2 +
>   .../omapl138/defconfig                        |  1 +
>   .../linux/linux-ti-staging-rt_6.1.bb          | 12 ++++++
>   .../linux-ti-staging-systest-6.1/defconfig    |  2 +
>   .../linux-ti-staging-systest-6.1/k3/defconfig |  2 +
>   .../omapl138/defconfig                        |  1 +
>   .../linux/linux-ti-staging-systest_6.1.bb     |  7 ++++
>   .../linux/linux-ti-staging_5.10.bb            |  1 +
>   .../linux/linux-ti-staging_6.1.bb             | 39 +++++++++++++++++++
>   .../linux/ti-kernel-devicetree-prefix.inc     | 21 ++++++++++
>   33 files changed, 193 insertions(+), 189 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/k3/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.1/omapl138/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/k3/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.1/omapl138/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/k3/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.1/omapl138/defconfig
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16229): https://lists.yoctoproject.org/g/meta-ti/message/16229
> Mute This Topic: https://lists.yoctoproject.org/mt/97778892/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

