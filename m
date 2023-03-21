Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1229C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:11:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22978.1679425889833378092
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3448040C46;
	Tue, 21 Mar 2023 19:11:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5IW7RmA1QuuM; Tue, 21 Mar 2023 19:11:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B6CF40C2C;
	Tue, 21 Mar 2023 19:11:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 739DB1637C5; Tue, 21 Mar 2023 15:10:55 -0400 (EDT)
Date: Tue, 21 Mar 2023 15:10:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [kirkstone][PATCH 11/54] machine: Add AM62Q HS-SE
 evm configuration
Message-ID: <20230321191055.GH18050@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
 <20230320033840.1193963-12-denis@denix.org>
 <5f879b75-202e-5131-629d-6342f919f9ba@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f879b75-202e-5131-629d-6342f919f9ba@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:11:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16222

On Tue, Mar 21, 2023 at 11:11:26AM -0500, Ryan Eatmon wrote:
> 
> 
> On 3/19/2023 22:37, Denys Dmytriyenko wrote:
> >From: Chirag Shilwant <c-shilwant@ti.com>
> >
> >Lets add the basic AM62Q HS-SE configuration.
> >- Add configurations.
> >- Add ti-sci-firmware overrides.
> >- Add u-boot overrides.
> >- Add optee overrides.
> >- Add ti-rtos-firmware overrides.
> >
> >Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >index 37d022e9..77709689 100644
> >--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >@@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 = "fs"
> >  SYSFW_PREFIX:j784s4-hs-evm-k3r5 = "fs"
> >  SYSFW_PREFIX:am62xx-evm-k3r5 = "fs"
> >  SYSFW_PREFIX:am62xx-lp-evm-k3r5 = "fs"
> >+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
> 
> Ooops.  We missed a dunfell to kirkstone syntax change.  No need to
> send an updated patch, I will just do a git fixup and address it.

Ah, nice catch! I guess I've had too many rebases... :)
Thanks for very careful reviewing!


> Thanks for your hard work on these patch sync ups, Denys.  It is
> very much appreciated.

The issue is that kirkstone and master have diverged from dunfell too much now 
and porting changes became heavily manual process and error-prone. Hopefull we 
can close dunfell for any new features very soon.

-- 
Denys

