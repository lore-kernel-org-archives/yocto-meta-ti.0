Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06227C25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 19:19:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.621.1698088754956396556
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 12:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0B4840CD0;
	Mon, 23 Oct 2023 19:19:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAZv_jA6bx05; Mon, 23 Oct 2023 19:19:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BE88240CC1;
	Mon, 23 Oct 2023 19:19:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 61B65163D1C; Mon, 23 Oct 2023 15:19:11 -0400 (EDT)
Date: Mon, 23 Oct 2023 15:19:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 3/5] linux-bb.org: update
 kernel to 6.1 for Beagle devices
Message-ID: <20231023191911.GW2408@denix.org>
References: <20231020204458.546852-1-denis@denix.org>
 <20231020204458.546852-3-denis@denix.org>
 <57734958-cb3c-4165-93dc-6645df9bfa04@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57734958-cb3c-4165-93dc-6645df9bfa04@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 19:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17179

On Mon, Oct 23, 2023 at 10:53:55AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> I just sent a patch for master only against this recipe that removes
> all of the patches.  Not sure if you want a v2 series that includes
> that change, or just have a follow on patch.

Unless you explicitly want a v2 with master patch removal and possibly 
kernel-rdepends.inc rework all squashed in, I'm fine with follow on patches.


> On 10/20/2023 3:44 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Update both 32-bit and 64-bit configs to use the latest 6.1 Linux kernel
> >from beagleboard.org repository, which is based on ti-linux-kernel repo
> >used in linux-ti-staging, but with extra Beagle-specific features on top.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  .../recipes-kernel/linux/linux-bb.org_git.bb  | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> >index f4c1775d..4048e106 100644
> >--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> >@@ -10,21 +10,24 @@ inherit kernel
> >  require recipes-kernel/linux/setup-defconfig.inc
> >  require recipes-kernel/linux/ti-kernel.inc
> >+# BB.org hasn't switched to "vendored" DTB layout by default yet
> >+KERNEL_DTBVENDORED = "0"
> >+
> >  DEPENDS += "gmp-native libmpc-native"
> >  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
> >  S = "${WORKDIR}/git"
> >-# 5.10.168 version for 32-bit
> >-SRCREV:armv7a = "a943fc1987e1b8057b0b5219ecd3c5a85285d62a"
> >-PV:armv7a = "5.10.168+git${SRCPV}"
> >-BRANCH:armv7a = "v5.10.168-ti-r70"
> >+# 6.1.33 version for 32-bit
> >+SRCREV:armv7a = "feb1c153a9693d44dec5772d134bd2c7986ff95d"
> >+PV:armv7a = "6.1.33+git${SRCPV}"
> >+BRANCH:armv7a = "v6.1.33-ti-r7"
> >-# 5.10.162 version for 64-bit
> >-SRCREV:aarch64 = "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
> >-PV:aarch64 = "5.10.162+git${SRCPV}"
> >-BRANCH:aarch64 = "v5.10.162-ti-arm64-r99"
> >+# 6.1.46 version for 64-bit
> >+SRCREV:aarch64 = "0a1e93a38c699fdd3c629d57f5cd015f90ab0d36"
> >+PV:aarch64 = "6.1.46+git${SRCPV}"
> >+BRANCH:aarch64 = "v6.1.46-ti-arm64-r9"
> >  SRC_URI = " \
> >      git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \

