Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1933DC71136
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 20:23:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5438.1749673383842258991
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 13:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B12D40CBF;
	Wed, 11 Jun 2025 20:23:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msvMtpKfhikj; Wed, 11 Jun 2025 20:23:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 18EC940BEC;
	Wed, 11 Jun 2025 20:22:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6DD1C169E3D; Wed, 11 Jun 2025 16:22:54 -0400 (EDT)
Date: Wed, 11 Jun 2025 16:22:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: v-singh1@ti.com, meta-ti@lists.yoctoproject.org, reatmon@ti.com,
	praneeth@ti.com, c-shilwant@ti.com, khasim@ti.com, p-bhagat@ti.com
Subject: Re: [meta-ti] [scarthgap][PATCH V5] meta-ti-bsp : ipc: Add RPMsg
 DMA library
Message-ID: <20250611202254.GF18383@denix.org>
References: <20250610151623.211459-1-v-singh1@ti.com>
 <8561cc0b-fe5f-48f4-97d5-e51599509738@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8561cc0b-fe5f-48f4-97d5-e51599509738@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jun 2025 20:23:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18643

On Tue, Jun 10, 2025 at 10:34:15AM -0500, Andrew Davis wrote:
> On 6/10/25 10:16 AM, Vishnu Singh via lists.yoctoproject.org wrote:
> >From: Vishnu Singh <v-singh1@ti.com>
> >
> >This commit introduces the RPMsg DMA library:
> >
> >RPMsg DMA library (meta-ti-bsp/recipes-ti/ipc):
> 
> The "meta-ti-bsp/recipes-ti/ipc" part isn't needed, we can see
> where it is at from the patch below. Otherwise the recipe itself
> looks good to me,
> 
> Reviewed-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> >    - Provides librpmsg_dma.so shared library.
> >    - Includes APIs for:
> >      - RPMsg interface initialization
> >      - RPMsg-based send/receive communication
> >      - DMA heap buffer management
> >      - DSP firmware dynamic load/unload
> >
> >Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> >---
> >  meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >
> >diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >new file mode 100644
> >index 00000000..5dd3d6c7
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >@@ -0,0 +1,14 @@
> >+SUMMARY = "RPMsg DMA shared library"
> >+LICENSE = "MIT"
> >+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> >+
> >+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> >+SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+inherit cmake
> >+
> >+DEPENDS = "ti-rpmsg-char"
> >+
> >+EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"

