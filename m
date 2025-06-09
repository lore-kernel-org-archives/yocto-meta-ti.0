Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64622C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 19:25:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.68955.1749497108903742503
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 12:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qescItie;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559JP2FZ2086116;
	Mon, 9 Jun 2025 14:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749497102;
	bh=sBoC4hIVsWpvixiDFnyBXh+7nboeV7yPLPvW0NFKrcQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qescItieDwumU2VHe2aaxIezQKIvA7woWKW/jWn4aefs9Jc0TCbnKt4PvmdyAJ7CV
	 abg8kt0gjTsoEPJKHz9bJEk3V5ipj75xb8WQD/2G314xWYJ1WVzKU5K2hJLH6wMLav
	 n9At0nGmMZeoG+tE1NOxwO341Juk2lDY04O/semY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559JP2fF316040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 14:25:02 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 14:25:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 14:25:01 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559JP1o51735657;
	Mon, 9 Jun 2025 14:25:01 -0500
Message-ID: <597eb5f1-4156-4980-a6d3-5188c76d61c1@ti.com>
Date: Mon, 9 Jun 2025 14:25:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [[scarthgap][PATCH V4]] meta-ti-bsp : ipc: Add RPMsg
 DMA library
To: <v-singh1@ti.com>, <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
References: <20250609125451.17148-1-v-singh1@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250609125451.17148-1-v-singh1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Jun 2025 19:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18630

On 6/9/25 7:54 AM, Vishnu Singh via lists.yoctoproject.org wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> This commit introduces the RPMsg DMA library:
> 
> RPMsg DMA library (meta-ti-bsp/recipes-ti/ipc):
>     - Provides librpmsg_dma.so shared library.
>     - Includes APIs for:
>       - RPMsg interface initialization
>       - RPMsg-based send/receive communication
>       - DMA heap buffer management
>       - DSP firmware dynamic load/unload
> 
> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> ---
>   .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb        | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> new file mode 100644
> index 00000000..c6d1f229
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "RPMsg DMA shared library"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> +
> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> +SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS = "ti-rpmsg-char "

Extra space at the end of string not needed

> +
> +EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_INSTALL_LIBDIR=${libdir}"
> +

The last two items shouldn't be needed, if they are then your CMake
file might be messed up.

> +FILES:${PN} += "${libdir}/libti_rpmsg_dma.so"
> 

This line should not be needed, this file should go into the -dev package.

Also your subject line tags seems to be getting messed up here,
not sure if you use git format-patch you can use this:

--subject-prefix="meta-ti][scarthgap][PATCH v4"

and get a patch that the mailing list won't mangle.

Andrew

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18628): https://lists.yoctoproject.org/g/meta-ti/message/18628
> Mute This Topic: https://lists.yoctoproject.org/mt/113549311/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

