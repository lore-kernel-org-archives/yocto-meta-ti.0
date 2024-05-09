Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B388C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 13:51:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.10810.1715262690358415736
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 May 2024 06:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fl6MDMoN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 449DpLYL010594;
	Thu, 9 May 2024 08:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715262681;
	bh=0a3jKFzYvgRStZUQr0gdHd6hm/AdkLfPy3ZvC7O3E7g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fl6MDMoNKJ5A6Uv+MB0z3gxG1nCb7hHtWtYIb/+MwIGEwzZvp/vvGK4RARrbO4cYA
	 Wzb7xE4xHx9hRoCvfg0F5mvZmbb53ktp3zGn7yFY/vwEQzG44befTmeZueCI/ho7u/
	 RS8NqV19Gx6l81j5lZrKLxWqyOVRbyNxD4YayKIk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 449DpLHi005782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 May 2024 08:51:21 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 May 2024 08:51:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 May 2024 08:51:21 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 449DpLWa024133;
	Thu, 9 May 2024 08:51:21 -0500
Message-ID: <8babdd70-5c2c-46ae-a5cc-0611b853992b@ti.com>
Date: Thu, 9 May 2024 08:51:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCHv2 1/3] ti-img-rogue-*: add ddk
 24.1 recipes for ltsprep
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
References: <20240502191843.2380555-1-rs@ti.com>
 <20240502191843.2380555-2-rs@ti.com> <20240502194518.GW28791@denix.org>
 <D14K004H3SGW.3V2EISQLSIWJ1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <D14K004H3SGW.3V2EISQLSIWJ1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 May 2024 13:51:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17651



On 5/8/2024 3:42 PM, Randolph Sapp wrote:
> On Thu May 2, 2024 at 2:45 PM CDT, Denys Dmytriyenko wrote:
>> Can you make it a diff please? As shown previously, that helps with review and
>> allows spotting issues much easier.
>>
> [snip]
> 
> Yeah, sorry about the delay on this. Just got back to Dallas. Appending the diff
> here if people need it. I can submit a v3 for this if necessary. Just let me
> know.

I already accepted the patch, just for the future add the needed flags 
to the git format-patch call to generate what Denys is asking for.


> ---
> 
>  From 9666459f524333440c61eeae7c0ad430c58d740e Mon Sep 17 00:00:00 2001
> From: Randolph Sapp <rs@ti.com>
> Date: Tue, 30 Apr 2024 14:56:57 -0500
> Subject: [PATCH] ti-img-rogue-*: add ddk 24.1 recipes for ltsprep
> 
> Recipes for DDK 24.1, but lock them behind ltsprep tags because they
> require device tree changes that do not work on the current default
> kernel for this layer.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   ...6512818.bb => ti-img-rogue-driver_24.1.6554834.bb} |  4 +++-
>   ...6512818.bb => ti-img-rogue-umlibs_24.1.6554834.bb} | 11 +++++++----
>   2 files changed, 10 insertions(+), 5 deletions(-)
>   copy meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.3.6512818.bb => ti-img-rogue-driver_24.1.6554834.bb} (94%)
>   copy meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.3.6512818.bb => ti-img-rogue-umlibs_24.1.6554834.bb} (94%)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> similarity index 94%
> copy from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> copy to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> index 02ec9fe9..a1b76d27 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
>   LICENSE = "MIT | GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
>   
> +DEFAULT_PREFERENCE = "-1"
> +
>   inherit module
>   
>   PROVIDES = "virtual/gpudriver"
> @@ -22,7 +24,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
> +SRCREV = "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> similarity index 94%
> copy from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> copy to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> index a0a9a295..d43d1635 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
>   LICENSE = "TI-TFL"
>   LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>   
> +DEFAULT_PREFERENCE = "-1"
> +
>   inherit bin_package
>   
>   INHIBIT_DEFAULT_DEPS = ""
> @@ -14,7 +16,7 @@ PR = "r3"
>   
>   BRANCH = "linuxws/scarthgap/k6.6/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
> +SRCREV = "e473234158c736248cf71a60080b7faf76fca561"
>   S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
> @@ -109,7 +111,7 @@ python __anonymous() {
>           mlprefix = d.getVar("MLPREFIX")
>           pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
>           d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> -        d.setVar("INSANE_SKIP:" + fullp, "dev-so")
> +        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
>           d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
>   }
>   
> @@ -132,7 +134,8 @@ DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
>   
>   # optional tools and tests
>   FILES:${PN}-tools = "${bindir}/"
> -RDEPENDS:${PN}-tools = "python3-core ${PN}"
> +RDEPENDS:${PN}-tools = "python3-core libdrm ${PN}"
> +INSANE_SKIP:${PN}-tools = "ldflags"
>   
>   # required firmware
>   FILES:${PN}-firmware = "${base_libdir}/firmware/*"
> @@ -142,4 +145,4 @@ RRECOMMENDS:${PN} += " \
>       ${PN}-tools \
>   "
>   
> -INSANE_SKIP:${PN} += "already-stripped dev-so"
> +INSANE_SKIP:${PN} += "already-stripped dev-so ldflags"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

