Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C46FC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 20:31:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5464.1699389051166247947
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 12:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB70940CC8;
	Tue,  7 Nov 2023 20:30:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-pBLM7yyDsu; Tue,  7 Nov 2023 20:30:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0357040CAF;
	Tue,  7 Nov 2023 20:30:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A5F0163D4C; Tue,  7 Nov 2023 15:30:38 -0500 (EST)
Date: Tue, 7 Nov 2023 15:30:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, denys@konsulko.com, c-shilwant@ti.com,
	s-adivi@ti.com, khasim@ti.com, g-gupta@ti.com
Subject: Re: [meta-ti] [kirkstone][RFC] ti-extras: Add support for extra
 kernel features for RT
Message-ID: <20231107203038.GS2408@denix.org>
References: <20231107160558.2661070-1-p-bhagat@ti.com>
 <b52f8875-e6f7-4686-b279-1009cdd5a66d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b52f8875-e6f7-4686-b279-1009cdd5a66d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 20:31:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17261

On Tue, Nov 07, 2023 at 10:28:11AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 11/7/2023 10:05 AM, Paresh Bhagat wrote:
> >Add support for ti-extras features for rt as it was added for non
> >rt kernel and u-boot earlier. It will also be accessible via the
> >TI_EXTRAS variable in the local.conf file.
> >
> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  .../recipes-kernel/linux/linux-ti-staging-rt_6.1.bb   |  5 +++--
> >  meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc     | 11 +++++++++++
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> >
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> >index a600630e..93e1be39 100644
> >--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> >@@ -1,10 +1,11 @@
> >  require linux-ti-staging_6.1.bb
> >+include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
> >  # Look in the generic major.minor directory for files
> >  # This will have priority over generic non-rt path
> >  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
> >-BRANCH = "ti-rt-linux-6.1.y"
> >+BRANCH ?= "ti-rt-linux-6.1.y"
> >-SRCREV = "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
> >+SRCREV ?= "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
> 
> I may need Denys to weigh on these comments:
> 
> You cannot use the ?= here.  This recipe includes the
> linux-ti-staging_6.1.bb recipe which has the default lines already
> in there.  And the ?= is a soft default which will only set the
> value IF it is not already set.  So this will break RT builds.
> 
> Bitbake also processes the = at the moment you see it.  So the
> "last" time a variable is set with = it will be the value that wins.
> 
> So for the RT recipe, you will likely need to move the include to
> AFTER the above BRANCH/SRCREV settings.
> 
> Basically, I think you need:
> 
>   BRANCH = "ti-rt-linux-6.1.y"
> 
>   SRCREV = "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
> 
>   include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if
> d.getVar('TI_EXTRAS') else ''}
> 
> 
> So this inclusion of the extra will need to be different in the RT
> recipe versus the non-RT recipe.  All because the RT recipe includes
> the non-RT recipe.

Yes, this explanation is correct. Some re-ordering is required. Simply making 
those assignments as weak at the end of -rt recipe is incorrect - that will 
break -rt recipe regardless of whether ti-extras is enabled or not.


> >  PV = "6.1.46+git${SRCPV}"
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> >new file mode 100644
> >index 00000000..1fc40934
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
> >@@ -0,0 +1,11 @@
> >+
> >+# Use different commit, repo and branch for TI extras build
> >+# This will have priority over generic rt path
> >+
> >+COMPATIBLE_MACHINE = "am62xx"
> >+
> >+BRANCH = "ti-rt-linux-6.1.y"
> >+BRANCH:tie-jailhouse = "ti-rt-linux-6.1.y-jailhouse"
> >+
> >+SRCREV = "685e77152461bd6b791500f717bec62d17c1b36d"
> >+SRCREV:tie-jailhouse = "a74088b40b4d27478a2af5c20cdc0b4ec8ed9470"
> 
> This file should be fine.

