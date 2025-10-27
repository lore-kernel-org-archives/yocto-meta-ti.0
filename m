Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6E0CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 21:20:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2984.1761600015353339700
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 14:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6BADD40C82;
	Mon, 27 Oct 2025 21:20:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JqybYG-5JEY; Mon, 27 Oct 2025 21:20:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F1F240021;
	Mon, 27 Oct 2025 21:20:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 67B6016E27C; Mon, 27 Oct 2025 17:20:11 -0400 (EDT)
Date: Mon, 27 Oct 2025 17:20:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: vishnu singh <v-singh1@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev &
 license
Message-ID: <20251027212011.GC3125@denix.org>
References: <20251027040535.3340080-1-v-singh1@ti.com>
 <03baf840-71b6-4260-ad63-7f3f3d781c74@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03baf840-71b6-4260-ad63-7f3f3d781c74@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 21:20:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19186

On Mon, Oct 27, 2025 at 08:03:59AM -0500, Ryan Eatmon wrote:
> 
> The subject does not state which recipe is being updated.  Please
> change it to:
> 
> ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
> 
> Also you did not include the branches in the subject so PRC only
> checked against master.  Likely you will need two patches, one for
> scarthgap and one for master making the same changes in both.
> 
> Also, when sending v2 and higher you should always include the
> version history in the patch after the --- to document what each
> revision was changing.

Can we also get a little bit more reasoning behind the license change?

Re-licensing is very rare and usually is something to stay away from, 
especially when changing from a more permissive license to a less 
permissive one.

Also, the commit that changes the licensing updates the README file from 
MIT to BSD-3-Clause, not TI-TFL - so which one is it?

https://github.com/TexasInstruments/rpmsg-dma/commit/47beb4c0a98c1fbbac73ef46d69b48b2002c941b

https://github.com/TexasInstruments/rpmsg-dma/blob/scarthgap/README.md#-license

Please be very specifici when it comes to licensing. Thanks.


> On 10/26/2025 11:05 PM, vishnu singh wrote:
> >From: Vishnu Singh <v-singh1@ti.com>
> >
> >Update recipe license to TI-TFL, use scarthgap branch
> >Disable 2dfft and audio offload example build for rpmsg-dma library.
> >
> >License-Update: license change to TI-TFL
> >
> >Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> >---
> >  meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >index b624871d..7600f867 100644
> >--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> >@@ -1,9 +1,9 @@
> >  SUMMARY = "RPMsg DMA shared library"
> >-LICENSE = "MIT"
> >-LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> >+LICENSE = "TI-TFL"
> >+LIC_FILES_CHKSUM = "file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"
> >-SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> >-SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
> >+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=scarthgap"
> >+SRCREV = "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
> >  S = "${WORKDIR}/git"
> >@@ -11,6 +11,6 @@ inherit cmake
> >  DEPENDS = "ti-rpmsg-char"
> >-EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
> >+EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=OFF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=OFF"
> >  COMPATIBLE_MACHINE = "^(k3)$"

