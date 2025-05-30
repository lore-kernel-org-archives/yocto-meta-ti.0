Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80332C5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 20:13:00 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4297.1748635971814625724
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 May 2025 13:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ny/+Q/E2;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54UKClVe2753085;
	Fri, 30 May 2025 15:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748635967;
	bh=Bpn693OCoMgZUgMgM/ItN7kZuPZVI1v4Dlxw57xxBjI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ny/+Q/E2qgeb9FOZdcSqbJ8aaa0tcDypZmxS3NqurrbtJ1LYpq6abDjnmBRf2mF+z
	 CTeO+C5F292y0YO/tx3ZaelA6Ln0rm/2LUiYiayL2Pyno19Op0OpnA0iEB9rKtHZmZ
	 mK3nsYM5iNMt8ZE+j0MrkHN0GXOaAy5jqGd7glyg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54UKCl461039927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 30 May 2025 15:12:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 May 2025 15:12:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 May 2025 15:12:47 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54UKCl8Q3602575;
	Fri, 30 May 2025 15:12:47 -0500
Message-ID: <48a818e0-300f-4050-bd13-a5e9f38d2f7e@ti.com>
Date: Fri, 30 May 2025 15:12:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH V3] Add rpmsg DMA library and simple DSP offload
 example
To: <v-singh1@ti.com>, <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
References: <20250530070151.537124-1-v-singh1@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250530070151.537124-1-v-singh1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 May 2025 20:13:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18618

On 5/30/25 2:01 AM, Vishnu Singh via lists.yoctoproject.org wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> 1. rpmsg DMA library (meta-ti-bsp/recipes-ti/ipc):
> 	based on rpmsg & DMA Heap buffers. this includes librpmsg_dma.so shared library
> 	which provides apis for

API should be capitalized. Same for DMA, Linux, and the first letter of sentences..

> 		1. rpmsg interface initialization
> 		2. rpmsg based recv/send api for communication
> 		3. dma heap buffer management
> 		4. DSP firmware synamin load/unload

synamin?

> 
> 2. rpmsg DMA offload example (meta-ti-extras/recipes-ti/ipc):
> 	provides example foraudio offloading to DSP from linux using
> 	ti-rpmsg-dma library. Alsove provide Ethernet based control

Alsove? Please run spell check.

> 	utility (host).
> 
> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> ---
>   .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb     | 25 +++++++++++++++++
>   .../ipc/ti-librpmsg-dma-example_1.0.bb        | 27 +++++++++++++++++++
>   2 files changed, 52 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>   create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> new file mode 100644
> index 00000000..0461ac46
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "RPMsg DMA shared library"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> +
> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> +SRCREV = "cd18ced927aa2b916708d611758caab25a795feb"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "ti-rpmsg-char"
> +
> +EXTRA_OEMAKE = "lib"
> +do_compile() {
> +	oe_runmake ${EXTRA_OEMAKE}
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}
> +	install -m 0755 lib/librpmsg_dma.so.1.0 ${D}${libdir}/
> +	ln -sf librpmsg_dma.so.1.0 ${D}${libdir}/librpmsg_dma.so.1
> +	ln -sf librpmsg_dma.so.1 ${D}${libdir}/librpmsg_dma.so

This is messy, why should we handle basic installation tasks here
in the Yocto recipe? This should be done by the project's build system.
Since this is your project you should go fix that. Otherwise someone will
have to deal with adding these steps manually like this to every distro
system that wants to use this project.

I'd recommend just having CMake do this for you.

> +
> +	install -d ${D}${includedir}/rpmsg_dma
> +	install -m 0644 include/*.h ${D}${includedir}/rpmsg_dma/
> +}
> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb b/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> new file mode 100644
> index 00000000..0806cccd
> --- /dev/null
> +++ b/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb

The example can/should just build as part of the library build, these
come from the same source / project. One recipe can make more than
one package. The -example package can be made as part of the above recipe.

PACKAGES =+ "${PN}-examples"
FILES:${PN}-examples += "${bindir}/rpmsg_audio_offload_example"

Andrew

> @@ -0,0 +1,27 @@
> +SUMMARY = "Audio Offload Example using RPMsg DMA"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> +
> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> +SRCREV = "cd18ced927aa2b916708d611758caab25a795feb"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "ti-librpmsg-dma fftw libsndfile1 alsa-lib"
> +
> +do_compile() {
> +	oe_runmake -C example/audio_offload
> +}
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 0755 example/audio_offload/bin/rpmsg_audio_offload_example ${D}${bindir}/
> +
> +	install -d ${D}${sysconfdir}
> +	install -d ${D}/opt
> +	install -m 0644 example/audio_offload/config/dsp_offload.cfg ${D}${sysconfdir}/dsp_offload.cfg
> +	install -m 0644 example/audio_offload/audio_sample/sample_audio.wav ${D}/opt/sample_audio.wav
> +}
> +
> +FILES:${PN} += "${sysconfdir}/dsp_offload.cfg"
> +FILES:${PN} += "/opt/sample_audio.wav"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18614): https://lists.yoctoproject.org/g/meta-ti/message/18614
> Mute This Topic: https://lists.yoctoproject.org/mt/113375625/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

