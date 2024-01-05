Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27488C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 16:14:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.27192.1704471241857076587
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 08:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LtNrvFWQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 405GE1qn098339
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 10:14:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704471241;
	bh=H/WdGEGC6ayBMZY8I6L/SL2+bEiUafn6diiVyXp6FsQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LtNrvFWQh1+wClKz+ahguL5YkoG/vml4ODUFyHiBNqg5iXPjJSksFZLay9sQcEjZK
	 KpPetfLa92S+8drRH3raHsw3WS5o227ncd2taYxsO2fVRfo2KlfaaHgl5P8Yuw46m3
	 DreAYaPNbmknBKCOQmdcLpmc089DQDZJwqgfWgCU=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 405GE1Ju018499
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 10:14:01 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 10:14:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 10:14:00 -0600
Received: from [10.249.38.142] ([10.249.38.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 405GE0Fw032623;
	Fri, 5 Jan 2024 10:14:00 -0600
Message-ID: <8ae6dd84-979c-4b13-b41b-36667699a2db@ti.com>
Date: Fri, 5 Jan 2024 10:14:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 1/2] meta-ti: powervr: add j722s
 support
Content-Language: en-US
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <a-nandan@ti.com>, Darren Etheridge <detheridge@ti.com>
References: <20240105082844.879372-1-a-limaye@ti.com>
 <20240105082844.879372-2-a-limaye@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240105082844.879372-2-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 16:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17385


Can we split this change into two?  One patch that explicitly changes 
the SRCREV and a second commit that adds support for j722s.  I know 
that's not how it was during wakeup, but that's what I would prefer for 
the long term record.


On 1/5/2024 2:28 AM, Aniket Limaye wrote:
> From: Darren Etheridge <detheridge@ti.com>
> 
> Bump srcrev to include j722s support for PowerVR components
> 
> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb      | 5 +++--
>   .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb       | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
> index a74cc7b8..9cc44673 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
> @@ -12,7 +12,7 @@ PR = "${MACHINE_KERNEL_PR}"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
> +COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>   
>   DEPENDS = "virtual/kernel"
>   
> @@ -22,13 +22,14 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "778aa5d1e104f36c7f7c1f50e99f8499cbbdadbb"
> +SRCREV = "64d1cac11363888b7a071b62d71b563568d483f1"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
>   TARGET_PRODUCT:j784s4 = "j784s4_linux"
>   TARGET_PRODUCT:am62xx = "am62_linux"
>   TARGET_PRODUCT:am62pxx = "am62p_linux"
> +TARGET_PRODUCT:j722s = "j722s_linux"
>   PVR_BUILD = "release"
>   PVR_WS = "lws-generic"
>   
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
> index 447812d3..5a5abdc2 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
> @@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de52
>   inherit bin_package
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx"
> +COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>   
>   PR = "r2"
>   
>   BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "d0543929cc6fe53959a64c60285896e2c14ed314"
> +SRCREV = "7c853b0c75b7c5c4fa30ded608588850d429f306"
>   S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
> @@ -20,6 +20,7 @@ TARGET_PRODUCT:j721s2 = "j721s2_linux"
>   TARGET_PRODUCT:j784s4 = "j784s4_linux"
>   TARGET_PRODUCT:am62xx = "am62_linux"
>   TARGET_PRODUCT:am62pxx = "am62p_linux"
> +TARGET_PRODUCT:j722s = "j722s_linux"
>   PVR_BUILD = "release"
>   PVR_WS = "lws-generic"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

