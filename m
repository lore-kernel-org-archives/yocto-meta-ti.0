Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81A1FCA179
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:58:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22537.1773082693466623665
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 11:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B39A40CB9;
	Mon,  9 Mar 2026 18:58:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hk8tMwzu7bBc; Mon,  9 Mar 2026 18:58:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4417F40BD6;
	Mon,  9 Mar 2026 18:58:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E8BDA179BA9; Mon,  9 Mar 2026 14:58:08 -0400 (EDT)
Date: Mon, 9 Mar 2026 14:58:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Mahammed Sadik Shaik <s-sadik@ti.com>, meta-ti@lists.yoctoproject.org,
	Prudhvi Veeramachaneni <prudhvi@ti.com>
Subject: Re: [meta-ti] [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths
 QA warning
Message-ID: <20260309185808.GQ11121@denix.org>
References: <20260309170134.2779295-1-s-sadik@ti.com>
 <20260309170134.2779295-4-s-sadik@ti.com>
 <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 18:58:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19684

On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
> >Add -ffile-prefix-map flags to KCFLAGS to remove build path
> >references from kernel module compilation, ensuring reproducible
> >builds and preventing absolute path leakage in binaries.
> >
> >This resolves buildpaths QA warnings during packaging.
> >
> >Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
> >---
> >  meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> >index 91076c9e..8308f0e5 100644
> >--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> >+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> >@@ -80,8 +80,8 @@ USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
> >  TOOLS_SRC_DIR = "${S}/tools"
> >-EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR}"
> >-
> >+EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR} \
> >+    KCFLAGS='-ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}/= -ffile-prefix-map=${STAGING_KERNEL_DIR}/='"
> >  do_compile() {
> >          oe_runmake V=1
> >  }

Can you move V=1 into EXTRA_OEMAKE and remove overriding do_compile()


> Thank you.  I was going to comment on the v1 to not disable buildpaths.

+1

