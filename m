Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C213CC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:34:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.89237.1754058854433482803
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 07:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 71B2340C82;
	Fri,  1 Aug 2025 14:34:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFXw3kTmofmr; Fri,  1 Aug 2025 14:34:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 19BDB40A3D;
	Fri,  1 Aug 2025 14:34:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 73CFA16D8F6; Fri,  1 Aug 2025 10:34:06 -0400 (EDT)
Date: Fri, 1 Aug 2025 10:34:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Beleswar Padhi <b-padhi@ti.com>, denys@konsulko.com, a-limaye@ti.com,
	afd@ti.com, u-kumar1@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH 2/2] ti-pka-fw: Update
 license to PKA-FW
Message-ID: <20250801143406.GS24899@denix.org>
References: <20250801044441.1059527-1-b-padhi@ti.com>
 <20250801044441.1059527-3-b-padhi@ti.com>
 <5208b043-f58c-4abf-a98d-c8fda3bd1d5a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5208b043-f58c-4abf-a98d-c8fda3bd1d5a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 14:34:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18874

On Fri, Aug 01, 2025 at 07:41:17AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 7/31/2025 11:44 PM, Beleswar Padhi wrote:
> >The PKA-FW license has been added to meta-ti. Point to that license in
> >the PKA firmware recipe.
> >
> >Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> >---
> >  meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> >index 49ae0251..bd31726c 100644
> >--- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> >+++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> >@@ -1,7 +1,7 @@
> >  SUMMARY = "PKA prebuilt binary firmware image"
> >-LICENSE = "TI-TFL & INSIDE Secure"
> >-LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
> >+LICENSE = "PKA-FW"
> >+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/PKA-FW;md5=251316268d8e7d1a546e5e6a08af6d9c"
> 
> Also, when changing the value in LIC_FILES_CHKSUM it is required
> that you provide a line in the commit message:
> 
> License-Update: reason
> 
> Telling people in a short/brief manner the nature of the change.  In
> this case you could get away with:
> 
> License-Update: see commit message
> 
> Is that right, Denys?

Well, why so radical changes?

Isn't it still "TI-TFL & INSIDE-Secure"?

We already have TI-TFL license in meta-ti, we just need to add INSIDE-Secure 
file.

And LIC_FILES_CHKSUM doesn't need to change, it should still point to the file 
in the firmware repository.

