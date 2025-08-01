Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F071C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:03:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.90053.1754060580768476971
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 08:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25FA840C82;
	Fri,  1 Aug 2025 15:03:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ZHCxUQi9iqh; Fri,  1 Aug 2025 15:03:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C2FBB40A3D;
	Fri,  1 Aug 2025 15:02:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B09516D93E; Fri,  1 Aug 2025 11:02:53 -0400 (EDT)
Date: Fri, 1 Aug 2025 11:02:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: reatmon@ti.com, denys@konsulko.com, a-limaye@ti.com, afd@ti.com,
	u-kumar1@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH 2/2] ti-pka-fw: Update
 license to PKA-FW
Message-ID: <20250801150253.GU24899@denix.org>
References: <20250801044441.1059527-1-b-padhi@ti.com>
 <20250801044441.1059527-3-b-padhi@ti.com>
 <5208b043-f58c-4abf-a98d-c8fda3bd1d5a@ti.com>
 <20250801143406.GS24899@denix.org>
 <b7f781e5-a3c4-429a-881f-27a623889fc8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f781e5-a3c4-429a-881f-27a623889fc8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 15:03:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18884

On Fri, Aug 01, 2025 at 08:13:13PM +0530, Beleswar Prasad Padhi wrote:
> 
> On 8/1/2025 8:04 PM, Denys Dmytriyenko wrote:
> >On Fri, Aug 01, 2025 at 07:41:17AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>
> >>On 7/31/2025 11:44 PM, Beleswar Padhi wrote:
> >>>The PKA-FW license has been added to meta-ti. Point to that license in
> >>>the PKA firmware recipe.
> >>>
> >>>Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> >>>---
> >>>  meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> >>>index 49ae0251..bd31726c 100644
> >>>--- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> >>>+++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> >>>@@ -1,7 +1,7 @@
> >>>  SUMMARY = "PKA prebuilt binary firmware image"
> >>>-LICENSE = "TI-TFL & INSIDE Secure"
> >>>-LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
> >>>+LICENSE = "PKA-FW"
> >>>+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/PKA-FW;md5=251316268d8e7d1a546e5e6a08af6d9c"
> >>Also, when changing the value in LIC_FILES_CHKSUM it is required
> >>that you provide a line in the commit message:
> >>
> >>License-Update: reason
> >>
> >>Telling people in a short/brief manner the nature of the change.  In
> >>this case you could get away with:
> >>
> >>License-Update: see commit message
> >>
> >>Is that right, Denys?
> >Well, why so radical changes?
> >
> >Isn't it still "TI-TFL & INSIDE-Secure"?
> >
> >We already have TI-TFL license in meta-ti, we just need to add INSIDE-Secure
> >file.
> 
> 
> I was trying to keep everything same as done in ti-linux-firmware
> repo. They added a separate License file for PKA:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware-next&id=a2f39386f89d5ad68a324a9371da3bb8dd20f7de
> 
> >
> >And LIC_FILES_CHKSUM doesn't need to change, it should still point to the file
> >in the firmware repository.
> 
> Then why add the LICENSE FILE here, if checksum is compared from the
> one in ti-linux-firmware repo? Thanks, Beleswar

They serve slightly different purposes. LIC_FILES_CHKSUM should point to any 
license declaration inside the component - could even be a comment in a source 
file and as short as "licensed under <blah>"... The point is to catch when 
such declaration changes upon version update. And LICENSE then lists such 
<blah> with proper SPDX names and LICENSE_PATH then collects pristine texts 
for those <blah> - you don't want to checksum pristine texts, as they never 
change.

