Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1299C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 23:56:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.876.1678924584029144712
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 16:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BEB0640C6C;
	Wed, 15 Mar 2023 23:56:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY5i1mEpGAzn; Wed, 15 Mar 2023 23:56:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8305740BD4;
	Wed, 15 Mar 2023 23:56:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 14F331637C3; Wed, 15 Mar 2023 19:55:47 -0400 (EDT)
Date: Wed, 15 Mar 2023 19:55:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: praneeth@ti.com
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>
Subject: Re: [meta-ti] [kirkstone PATCH] u-boot-ti-staging: upgrade to
 2023.01
Message-ID: <20230315235547.GB18050@denix.org>
References: <20230315234025.5531-1-praneeth@ti.com>
 <249580c9-1d6a-c93c-5d70-e20284426346@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <249580c9-1d6a-c93c-5d70-e20284426346@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Mar 2023 23:56:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15986

I haven't seen the original patch on the list and nothing is in Patchwork:

https://patchwork.yoctoproject.org/project/ti/list/


On Wed, Mar 15, 2023 at 06:42:21PM -0500, praneeth via lists.yoctoproject.org wrote:
> On 3/15/2023 6:40 PM, Praneeth Bajjuri wrote:
> >upgrade to 2023.01 and make 2021.01 recipe as not
> >default version.
> 
> build and sanity boot tested bootloader on am62xx gp.

What about other platforms?


> >Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> >---
> >  .../recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb      | 2 ++
> >  .../recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb      | 9 +++++++++
> >  2 files changed, 11 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> >index 1640d042..df428dfa 100644
> >--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> >+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> >@@ -7,3 +7,5 @@ PR = "r33"
> >  BRANCH = "ti-u-boot-2021.01"
> >  SRCREV = "78a217ca9ea687ee5c3e7dd3a339a1f7d136e93d"
> >+
> >+DEFAULT_PREFERENCE = "-1"

You don't need to do this - by default bitbake prefers any higher/newer 
version available.


> >diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> >new file mode 100644
> >index 00000000..f1867e73
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> >@@ -0,0 +1,9 @@
> >+require u-boot-ti.inc
> >+
> >+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
> >+
> >+PR = "r0"
> >+
> >+BRANCH = "ti-u-boot-2023.01"
> >+
> >+SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"

