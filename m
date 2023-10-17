Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D19CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:07:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.227208.1697566040696395271
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 11:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9691840CEF;
	Tue, 17 Oct 2023 18:07:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FaiAPBX-yETS; Tue, 17 Oct 2023 18:07:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89BA140CEE;
	Tue, 17 Oct 2023 18:07:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 14F23163CF9; Tue, 17 Oct 2023 14:07:12 -0400 (EDT)
Date: Tue, 17 Oct 2023 14:07:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, c-shilwant@ti.com, s-adivi@ti.com, g-gupta@ti.com
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-extras: recipes-ti:
 Update jailhouse SRC_URI to point to ti-jailhouse repo
Message-ID: <20231017180712.GM2408@denix.org>
References: <20231017114107.3791996-1-p-bhagat@ti.com>
 <3a112273-5625-4685-96ef-d9ce22e4d388@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a112273-5625-4685-96ef-d9ce22e4d388@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 18:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17137

On Tue, Oct 17, 2023 at 08:46:15AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 10/17/2023 6:41 AM, Paresh Bhagat wrote:
> >The ti-jailhouse repo is synced with the Siemens/jailhouse
> >at https://github.com/siemens/jailhouse. Use this for
> >development and build for TI devices.
> 
> Is this TI repo a perfect clone of the Siemens' repo?  Or is a loose
> copy with patches from TI on top of it?

I don't see SRCREV being changed, which means it's a perfect clone as of now. 
In this case it doesn't make sense to deviate from upstream (yet?).


> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> >index 1c63b400..a96a7831 100644
> >--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> >+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> >@@ -19,7 +19,7 @@ SRCREV = "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
> >  BRANCH = "master"
> >  SRC_URI = " \
> >-    git://github.com/siemens/jailhouse.git;protocol=https;branch=${BRANCH} \
> >+    git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
> >      file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
> >      file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch \
> >      file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \

