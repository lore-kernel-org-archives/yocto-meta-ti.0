Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4234FC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 18:48:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.24425.1670438882710119343
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 10:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E5HrwP69;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7Im1Wr049860
	for <meta-ti@lists.yoctoproject.org>; Wed, 7 Dec 2022 12:48:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670438881;
	bh=zToL1Bbbo1Gwl1+S2IYyu1Aqht94BJGhpg9gD+Z+zYc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E5HrwP69H+1iFmX6p6TZC/avh4fWJOcwDfnS3MsSHS17gFvVvmbOAcChf54wxWZ72
	 2/n0xhIMivOzUf0xR6ipkMSUOkuFD57ChCEgs+c3dTrWCA30iOUTmLEvkpoDZHIfZe
	 ng/cn0xabkX0nHEn98GN5avYAM4UmvwJiHBB3K8E=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7Im1NC028374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 7 Dec 2022 12:48:01 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 12:48:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 12:48:00 -0600
Received: from [10.250.38.44] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7Im0gr114552;
	Wed, 7 Dec 2022 12:48:00 -0600
Message-ID: <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
Date: Wed, 7 Dec 2022 12:48:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics recipe
 overhaul
Content-Language: en-US
To: <rs@ti.com>, <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20221206174553.2391187-1-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221206174553.2391187-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 18:48:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15420

On 12/6/22 11:45 AM, Randolph Sapp via lists.yoctoproject.org wrote:
>   
> -PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   

Since the UM driver now RDEPENDS on the KM, could we also drop this
last line everywhere?

> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> new file mode 100644
> index 00000000..c9110053
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> @@ -0,0 +1,55 @@
> +DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> +HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
> +
> +inherit features_check
> +
> +REQUIRED_MACHINE_FEATURES = "gpu"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
> +
> +PR = "r2"
> +
> +BRANCH = "linuxws/kirkstone/k5.10/${PV}"
> +
> +SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> +SRCREV = "540919e26f2a3674ba6a3044a113905298125894"
> +
> +TARGET_PRODUCT:j721e = "j721e_linux"
> +TARGET_PRODUCT:j721s2 = "j721s2_linux"
> +TARGET_PRODUCT:j784s4 = "j784s4_linux"
> +TARGET_PRODUCT:am62xx = "am62_linux"
> +PVR_BUILD ?= "release"
> +PVR_WS = "lws-generic"
> +
> +INITSCRIPT_NAME = "rc.pvr"
> +INITSCRIPT_PARAMS = "defaults 8"
> +
> +inherit update-rc.d
> +
> +DEPENDS += "libdrm wayland expat"
> +RDEPENDS:${PN} += "bash mesa-megadriver ti-img-rogue-driver"

Bash? Are we sure we need that?

> +RDEPENDS:${PN} += "wayland expat"

These are already in the "DEPENDS", if any of the shipped shared objects link
to them, they will be auto-added to the RDEPENDS.

> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}

Could we add these to EXTRA_OEMAKE instead of overriding do_install()?

EXTRA_OEMAKE += 'DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}'


> +    chown -R root:root ${D}
> +}

This still needed? I'd think the default do_install() should handle file ownership.

> +
> +PACKAGES = "${PN}-tools ${PN}"
> +FILES:${PN}-tools += " ${bindir}/"
> +RDEPENDS:${PN}-tools += "python3-core"
> +RRECOMMENDS:${PN} += "${PN}-tools"
> +
> +FILES:${PN} += " ${nonarch_base_libdir}/firmware/"
> +FILES:${PN} += " ${datadir}/"
> +FILES:${PN} += " ${libdir}/"
> +FILES:${PN} += " ${etcdir}/OpenCL ${etcdir}/vulkan"
> +
> +INSANE_SKIP:${PN} += "ldflags arch already-stripped dev-so"

"ldflags already-stripped" should be the only skips we still need.

Andrew

