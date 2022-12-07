Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AB1C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:16:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.21664.1670433361839899069
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 09:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NYgiODUP;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7HG0KX030571;
	Wed, 7 Dec 2022 11:16:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670433360;
	bh=wmoEONgSv5KuPMbIVfUzxefvs/ExUq7LkEgKUq/rZh0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NYgiODUPq618HkIxNdvClBDSy2ryGXfTNp2CR4foLeptxhlpRM2rYbhiwdtBUKufW
	 Oharh04P2CGdak+RbDraqmiuIZHr5mqdG6IQHzNtQ8ezCd9qGZUcWn8mkBIQXgqS8T
	 tGIyenfadz5fibolJu0p99obcDuCZT54uz/2c3j0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7HG0U6060629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 11:16:00 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 11:16:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 11:15:59 -0600
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7HFxS3028083;
	Wed, 7 Dec 2022 11:15:59 -0600
Message-ID: <996e7535-6ac0-0fcb-7a67-d8445f813c0c@ti.com>
Date: Wed, 7 Dec 2022 11:15:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [master][PATCH v2] meta-ti-bsp: Graphics recipe overhaul
To: Randolph Sapp <rs@ti.com>, <detheridge@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20221206174553.2391187-1-rs@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221206174553.2391187-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 17:16:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15419



On 12/6/2022 11:45 AM, Randolph Sapp wrote:
> Individually package rogue graphics components to prevent conflicts with
> other recipes.
> 
> The package ti-img-rogue-umlibs will now distribute the window system
> agnostic components of the DDK. This being the IMG's implementations of
> OpenGLES, OpenCL, and Vulkan in binary format and the device firmware.
> These are the only components that cannot be open source currently.
> 
> The mesa component is currently piggybacking off the default mesa
> package. It's not elegant, but it reflects the implementation well and
> allows users to config mesa as needed.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62xx.inc   |   4 -
>   meta-ti-bsp/conf/machine/include/j721e.inc    |   4 -
>   meta-ti-bsp/conf/machine/include/j721s2.inc   |   4 -
>   ...-OpenEmbedded-nodistro-internal-aarc.patch |  29 --
>   ...bb => ti-img-rogue-driver_1.18.6276027.bb} |  12 +-
>   .../ti-img-rogue-umlibs_1.15.6133109.bb       |  71 ----
>   .../ti-img-rogue-umlibs_1.18.6276027.bb       |  55 +++
>   ...nd-deprecate-drm_handle_format-and-d.patch | 158 +++++++++
>   ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ++
>   ...sdetects-64bit-atomics-on-mips-clang.patch |  25 ++
>   ...k-for-all-linux-host_os-combinations.patch |  43 +++
>   ...ormat-Check-for-NEON-before-using-it.patch |  47 +++
>   ...02-meson.build-make-TLS-ELF-optional.patch |  61 ++++
>   .../recipes-graphics/mesa/mesa-gl_22.0.3.bb   |  13 +
>   .../recipes-graphics/mesa/mesa_22.0.3.bb      |   1 +
>   .../recipes-graphics/mesa/rogue-mesa.inc      |  28 ++
>   .../recipes-graphics/mesa/vanilla-mesa.inc    | 320 ++++++++++++++++++
>   17 files changed, 790 insertions(+), 119 deletions(-)



> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/rogue-mesa.inc
> @@ -0,0 +1,28 @@
> +require vanilla-mesa.inc

This include logic seems a little convoluted.  I think it might a little 
cleaner if the mesa.bb files just included somthing like mesa.inc (like 
how oe is packaged).

Rename vanilla-mesa.inc to just mesa.inc.

Then at the end of the mesa.inc you could simply have something like this:

# Apply rogue driver overrides if applicable
require ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 
'ti-img-rogue-driver', 'rogue-mesa.inc', '', d)}


> +BRANCH = "rogue/kirkstone/pvr-1.18/22.0"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
> +           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> +           file://0002-meson.build-make-TLS-ELF-optional.patch \
> +           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> +           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> +           file://0001-util-format-Check-for-NEON-before-using-it.patch \
> +           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "fddf5106f04de2bd35892d30e5574c0b2881edd9"
> +
> +PV:append = "+rogue"
> +
> +GALLIUMDRIVERS:append = ",pvr"
> +
> +EXTRA_OEMESON:append = " -Dgallium-pvr-alias=tidss"
> +
> +do_install:append () {
> +    # remove pvr custom pkgconfig
> +    rm -rf ${D}${datadir}/pkgconfig
> +}
> +
> +RRECOMMENDS:mesa-megadriver += "ti-img-rogue-driver ti-img-rogue-umlibs"


This line needs to be:

RRECOMMENDS:class-target:mesa-megadriver += "ti-img-rogue-driver 
ti-img-rogue-umlibs"

Otherwise there are build dependency errors related to trying to build 
native/nativesdk versions of the rogue driver and umlibs, which we do 
not need/want to do.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

