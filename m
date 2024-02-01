Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59507C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:33:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9449.1706826779218111639
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 14:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Kpg+Ue4H;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411MWvYG129544;
	Thu, 1 Feb 2024 16:32:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706826777;
	bh=R0rXEdp4wqv43xDP494P383zuPhgBEgnouCmZSITQUk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Kpg+Ue4HGU2NmYyI/Z7kV+Jvy9W+BLfgwW2Pc9ZGNBXTWc7EOen4l8LgIC3oqT2g8
	 CdjqYqu/FzuoT/m/rXkrvbH3p1ThSeNOvWdB19fEzxDemE05kBUYbHu+qVhQNgXvF4
	 fEd/zmEfU/rmZGIjGvDg12I7flr4BfCgmrzveC7s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411MWvU7019452
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 16:32:57 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 16:32:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 16:32:57 -0600
Received: from [10.249.43.59] ([10.249.43.59])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411MWvMx083872;
	Thu, 1 Feb 2024 16:32:57 -0600
Message-ID: <697d5fb4-d7ff-48ce-8c35-6a41189bcf3b@ti.com>
Date: Thu, 1 Feb 2024 16:32:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone/master][PATCH] ti-img-rogue-*: version bump
 to 23.3.6512818
To: <rs@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240201163615.3873848-1-rs@ti.com>
Content-Language: en-US
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <20240201163615.3873848-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Feb 2024 22:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17434



On 2/1/2024 10:36 AM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Migrate to version 23.3.6512818, this includes the stability updates
> released in 23.2 as well as some additional modifications to help with
> userspace application support, namely Chromium.
>

Working great with Chromium v111 that we are targeting - I tested on 
AM62P  (BXS-4-64 GPU)

Tested-by: Darren Etheridge <detheridge@ti.com>


> We're also dropping the x11 window system extensions from the Vulkan
> libraries for now. Ideally, both x11 and wayland extensions will be
> provided by mesa's vulkan-wsi-layer in the future, but currently x11
> isn't supported and this just added extra complexity to the package in
> Yocto.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   ..._23.2.6460340.bb => ti-img-rogue-driver_23.3.6512818.bb} | 2 +-
>   ..._23.2.6460340.bb => ti-img-rogue-umlibs_23.3.6512818.bb} | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.2.6460340.bb => ti-img-rogue-driver_23.3.6512818.bb} (96%)
>   rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.2.6460340.bb => ti-img-rogue-umlibs_23.3.6512818.bb} (95%)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> similarity index 96%
> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> index 1b21273a..bc59816a 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> @@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "2595524729c5acbabcbdee2185de64e7fcd6b36a"
> +SRCREV = "41a494accb30aa2f247e6a4e123a4954982f2a88"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> similarity index 95%
> rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> index bc5a1a47..c84f9d3c 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> @@ -12,7 +12,7 @@ PR = "r2"
>   
>   BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "c2671c6eaf85ec6a1183c023bbb4d6e9e288fc10"
> +SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
>   S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
> @@ -31,7 +31,7 @@ RDEPENDS:${PN} = " \
>   "
>   
>   PACKAGECONFIG ?= " \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan x11 wayland', 'vulkan', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', '', d)} \
>       ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
>   "
>   
> @@ -119,7 +119,7 @@ RDEPENDS:libgles2-rogue += "mesa-megadriver"
>   
>   # vulkan specific shared objects and configs
>   FILES:libvk-rogue = "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
> -RDEPENDS:libvk-rogue += "vulkan-loader libx11-xcb wayland libdrm"
> +RDEPENDS:libvk-rogue += "vulkan-loader wayland libdrm"
>   
>   # opencl specific shared objects and configs
>   FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"

