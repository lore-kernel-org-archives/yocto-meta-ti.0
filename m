Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF85AC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 20:34:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5794.1675110869068448879
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 12:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uDw4EAcP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30UKYPjK041645;
	Mon, 30 Jan 2023 14:34:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675110865;
	bh=Is22BIicyuyyyg3fnqWZ+g3C0t6dHgAZNz3qUyOeQFQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uDw4EAcPzcOT/1ZbJLXgSW8OW1Hy/iMbqYCI4ibeuJoBfcObZTHwoXJSuSq4pAr+i
	 LY8k4YCS2eiLuJ0VFXSJFUJ7FhnqcR0josXSnjeKRNbuoVVmqKXuE/1bXDzWvrJ232
	 wPAvWF6izQOkgZOoS+zX72+c+f6q3BONqRsft//E=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30UKYPiZ031030
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Jan 2023 14:34:25 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 30
 Jan 2023 14:34:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 30 Jan 2023 14:34:24 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30UKYOnv101742;
	Mon, 30 Jan 2023 14:34:24 -0600
Message-ID: <82da30ed-442a-cd59-6a84-f6a3f78fc789@ti.com>
Date: Mon, 30 Jan 2023 14:34:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: handling
 the firmware installation with usrmerge
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <ricardo@foundries.io>, Jose Quaresma <jose.quaresma@foundries.io>
References: <20230125181100.297826-1-jose.quaresma@foundries.io>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230125181100.297826-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 20:34:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15705


This conflicts with some other graphics changes that we are making for 
kirkstone/master.  Mainly changing the version of the img-rogue-umlibs 
recipe.  Given that I'm not certain if the patch will still be 
applicable to the new version I'm not going to apply this patch at this 
time.  Once we have the new graphics changes rolled out, we can take a 
look if the issue still exists (likely it will) and we can look at a new 
patch at that time.


On 1/25/2023 12:11, Jose Quaresma wrote:
> The ti-img-rogue-umlibs package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   ...kefile-handle-firmware-with-usrmerge.patch | 33 +++++++++++++++++++
>   .../ti-img-rogue-umlibs_1.15.6133109.bb       | 11 +++++--
>   2 files changed, 41 insertions(+), 3 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
> new file mode 100644
> index 00000000..ca06f88a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
> @@ -0,0 +1,33 @@
> +From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <jose.quaresma@foundries.io>
> +Date: Tue, 24 Jan 2023 12:39:30 +0000
> +Subject: [PATCH] Makefile: handle firmware with usrmerge
> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +---
> + Makefile | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 48f9b9c..04b4154 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,4 +1,5 @@
> + DESTDIR ?= ${DISCIMAGE}
> ++FWDIR ?= lib
> + TARGET_PRODUCT ?= j721e_linux
> + BUILD ?= release
> + WINDOW_SYSTEM ?= nulldrmws
> +@@ -13,7 +14,7 @@ all:
> + install:
> + 	mkdir -p ${DESTDIR}/${etcdir}
> + 	mkdir -p ${DESTDIR}/${usrdir}
> +-	mkdir -p ${DESTDIR}/${fwdir}
> ++	mkdir -p ${DESTDIR}/${FWDIR}
> + 	cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdir}
> + 	cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdir}
> +-	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}
> ++	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}
> +--
> +2.34.1
> +
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> index a665c614..cb3f0056 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> @@ -10,11 +10,15 @@ REQUIRED_MACHINE_FEATURES = "gpu"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
>   
> -PR = "r2"
> +PR = "r3"
>   
>   BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
>   
> -SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> +SRC_URI = " \
> +	git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH} \
> +	file://0001-Makefile-handle-firmware-with-usrmerge.patch \
> +"
> +
>   SRCREV = "5977e82b96028f783d39c7219f016c1faf8dc5f5"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
> @@ -52,7 +56,8 @@ RRECOMMENDS:${PN} += "ti-img-rogue-driver"
>   S = "${WORKDIR}/git"
>   
>   do_install () {
> -    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
> +    oe_runmake install DESTDIR=${D} FWDIR=${nonarch_base_libdir} \
> +	TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
>       chown -R root:root ${D}
>   }
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15654): https://lists.yoctoproject.org/g/meta-ti/message/15654
> Mute This Topic: https://lists.yoctoproject.org/mt/96526423/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

