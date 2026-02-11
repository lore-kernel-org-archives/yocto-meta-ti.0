Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A64FECD6F4
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 22:05:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31153.1770847507464098165
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 14:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4DB9E40C79;
	Wed, 11 Feb 2026 22:05:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9S07705VT_6; Wed, 11 Feb 2026 22:05:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 173FF40BA8;
	Wed, 11 Feb 2026 22:05:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6BDE6173C3C; Wed, 11 Feb 2026 17:05:02 -0500 (EST)
Date: Wed, 11 Feb 2026 17:05:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
Message-ID: <20260211220502.GK11121@denix.org>
References: <20260211200414.1642061-1-reatmon@ti.com>
 <20260211202546.GJ11121@denix.org>
 <07050526-1409-40cf-9882-6233bbcebfbb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07050526-1409-40cf-9882-6233bbcebfbb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 22:05:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19491

On Wed, Feb 11, 2026 at 03:57:28PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 2/11/2026 2:25 PM, Denys Dmytriyenko wrote:
> >On Wed, Feb 11, 2026 at 02:04:14PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>Clean up the logic of the new ti-core-initramfs to reduce the impact on
> >>downstream layers.
> >>
> >>- Flip the logic in the machine .conf files to track the list of
> >>   required kernel modules for that platform, but if the variable is set
> >>   to "" then the ti-core-initramfs will not be created.
> >>
> >>- Redo the logic of when we require creation/usage of the initramfs to
> >>   just platforms that need it (ie that set TI_CORE_INITRAMFS_KERNEL_MODULES).
> >>
> >>- Add a big switch to disable the initramfs entirely.  In that case, the
> >>   user is on their own to make sure that the kernel has everything it
> >>   needs to boot either via config fragments to turn on the needed
> >>   modules, or by using the TI_CORE_INITRAMFS_KERNEL_MODULES
> >>   variable to populate their own initramfs.
> >
> >In our discussion we agreed to use TI_CORE_INITRAMFS_KERNEL_MODULES to
> >determine whether to enable initramfs or not. While I don't mind adding
> >a separate global TI_CORE_INITRAMFS_ENABLED switch, but I now wonder if
> >two checks are redundant and whether it makes sense to create initramfs
> >even when the list of modules is empty, if it's enabled?
> 
> I thought about this and went this way for a reason.  If you want to
> turn off the initramfs, but you still want the list of what modules
> are required say for your own initramfs, then the list is gone.
> Because the list was the switch.
> 
> By splitting them into two lists, we gain the fact that we don't
> force the initramfs on platforms that don't need it, and you can
> still turn it all off if you want but have all of the infrastructure
> in place to use it in your own layer later.

I think you missed my point - I'm not against the "enable" flag, but since we 
now have it explicitly, does it make sense to also build the initramfs with an 
empty modules list when the "enable" flag is set to "1"?


> >Also see below for another comment.
> >
> >
> >>+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> >>@@ -0,0 +1,29 @@
> >>+#------------------------------------------------------------------------------
> >>+#
> >>+# To turn off the ti-core-initramfs.cpio creation just set:
> >>+#
> >>+#   TI_CORE_INITRAMFS_ENABLED = "0"
> >>+#
> >>+#------------------------------------------------------------------------------
> >>+TI_CORE_INITRAMFS_ENABLED ?= "0"
> >
> >Did you mean to weakly set it to "1" here? :)
> 
> Doh.  I did.  That was from testing.  I'll send a v2.  Good catch.

