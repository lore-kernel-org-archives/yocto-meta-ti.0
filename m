Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B88C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 14:53:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23072.1748530380739640080
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 May 2025 07:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A372F40CB3;
	Thu, 29 May 2025 14:52:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSvkTGirrRIZ; Thu, 29 May 2025 14:52:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3AB1E40C2C;
	Thu, 29 May 2025 14:52:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A8AA169520; Thu, 29 May 2025 10:52:52 -0400 (EDT)
Date: Thu, 29 May 2025 10:52:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, v-singh1@ti.com, c-shilwant@ti.com, khasim@ti.com
Subject: Re: [scarthgap][PATCH 2/2] Add rpmsg DMA library and simple DSP
 offload example
Message-ID: <20250529145252.GR18383@denix.org>
References: <20250528102653.323423-1-p-bhagat@ti.com>
 <20250528102653.323423-2-p-bhagat@ti.com>
 <20250528151659.GP18383@denix.org>
 <0f762d41-579f-4eec-bf5f-87a97d91e821@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f762d41-579f-4eec-bf5f-87a97d91e821@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 May 2025 14:53:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18610

On Wed, May 28, 2025 at 10:27:01AM -0500, Ryan Eatmon wrote:
> 
> 
> On 5/28/2025 10:16 AM, Denys Dmytriyenko wrote:
> >On Wed, May 28, 2025 at 03:56:53PM +0530, Paresh Bhagat wrote:
> >>From: Vishnu Singh <v-singh1@ti.com>
> >>
> >>Add rpmsg DMA library and simple DSP offload example, based on rpmsg & DMA Heap
> >>buffers. This includes librpmsg_dma.so shared library used for real-time audio
> >>offloading to DSP from Linux, Ethernet based control utility etc.
> >>
> >>Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> >>---
> >>  .../ipc/ti-librpmsg-dma-example_1.0.bb        | 28 +++++++++++++++++++
> >>  .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb     | 26 +++++++++++++++++
> >>  2 files changed, 54 insertions(+)
> >>  create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> >>  create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >>
> >>diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> >>new file mode 100644
> >>index 00000000..8b01fa46
> >>--- /dev/null
> >>+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
> >>@@ -0,0 +1,28 @@
> >>+SUMMARY = "Audio Offload Example using RPMsg DMA"
> >>+LICENSE = "MIT"
> >>+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> >>+
> >>+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> >>+SRCREV = "b71b6a2690eaac4ec1619a18733f73e505023ff7"
> >>+
> >>+S = "${WORKDIR}/git"
> >>+
> >>+DEPENDS = "ti-librpmsg-dma fftw libsndfile1 alsa-lib ti-rpmsg-char"
> >
> >See fftw comment below
> 
> My counter response... if this recipe depends on ti-librpmsg-dma,
> then does this recipe need to depend on fftw?  Same question for all
> of the other DEPENDS entries.  Does this recipe actually depend on
> all this other packages or just ti-librpmsg-dma?
> 
> 
> Follow on question.. why do we have two recipes that are both
> pointing at the same repository?
> 
> 
> >
> >>+
> >>+do_compile() {
> >>+	oe_runmake -C example/audio_offload
> >>+}
> >>+
> >>+do_install() {
> >>+	install -d ${D}${bindir}
> >>+	install -m 0755 example/audio_offload/bin/audio_offload ${D}${bindir}/
> >>+
> >>+	install -d ${D}${sysconfdir}
> >>+	install -d ${D}/opt
> >>+	install -m 0644 example/audio_offload/config/dsp_offload.cfg ${D}${sysconfdir}/dsp_offload.cfg
> >>+	install -m 0644 example/audio_offload/audio_sample/sample_audio.wav ${D}/opt/sample_audio.wav
> >>+}
> >>+
> >>+FILES:${PN} += "${sysconfdir}/dsp_offload.cfg"
> >>+FILES:${PN} += "/opt"
> >>+FILES:${PN} += "/opt/sample_audio.wav"
> >
> >Last 2 lines can be combined
> >
> >
> >>diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >>new file mode 100644
> >>index 00000000..666439dd
> >>--- /dev/null
> >>+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >>@@ -0,0 +1,26 @@
> >>+SUMMARY = "RPMsg DMA shared library"
> >>+LICENSE = "MIT"
> >>+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> >>+
> >>+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> >>+SRCREV = "b71b6a2690eaac4ec1619a18733f73e505023ff7"
> >>+
> >>+S = "${WORKDIR}/git"
> >>+
> >>+DEPENDS = "fftw libsndfile1 alsa-lib ti-rpmsg-char"
> >
> >fftw is not in oe-core, but in meta-openembedded, and meta-ti does not depend
> >on meta-openembedded
> 
> That's a problem then...  We don't want to blow up the requirements
> for building with just meta-ti-bsp (which a number of customers do).
> 
> Does this belong more in meta-ti-extras then?

I don't think meta-ti-extras makes much difference, as meta-ti overall does 
not depend on meta-openembedded.

* meta-ti-extras and meta-beagle both depend on meta-ti-bsp
* meta-ti-bsp depends only on oe-core and meta-arm

In general, BSPs are meant to have as fewer dependencies, as possible. E.g. 
OE-Core is obvious, while meta-arm provides some common pieces for ARM-based 
SoCs.

The entire split with meta-arago was partially to ensure this policy from the 
very beginning and we kept it this way for 15 years.


> >>+
> >>+do_compile() {
> >>+	oe_runmake
> >>+}
> >>+
> >>+do_install() {
> >>+	install -d ${D}${libdir}
> >>+	install -m 0755 lib/librpmsg_dma.so.1.0 ${D}${libdir}/
> >>+	ln -sf librpmsg_dma.so.1.0 ${D}${libdir}/librpmsg_dma.so.1
> >>+	ln -sf librpmsg_dma.so.1 ${D}${libdir}/librpmsg_dma.so
> >>+
> >>+	install -d ${D}${includedir}/rpmsg_dma
> >>+	install -m 0644 include/*.h ${D}${includedir}/rpmsg_dma/
> >>+}
> >>+
> >>+INSANE_SKIP:${PN} += "dev-so"
> >
> >Is it needed here? I see the versioned links are setup above, so this should
> >not be needed...

