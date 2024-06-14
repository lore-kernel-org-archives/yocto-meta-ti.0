Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E6EC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 18:56:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1907.1718391359843437069
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 11:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E0A6940CC7;
	Fri, 14 Jun 2024 18:55:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWpO9bR2TRge; Fri, 14 Jun 2024 18:55:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7A49D40C2E;
	Fri, 14 Jun 2024 18:55:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0F7A7163FA9; Fri, 14 Jun 2024 14:55:55 -0400 (EDT)
Date: Fri, 14 Jun 2024 14:55:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/4] conf/machine, ti-bsp:
 add support for multiple BSP providers
Message-ID: <20240614185555.GC21287@denix.org>
References: <20240613172254.770920-1-denis@denix.org>
 <f74e3a99-3dbc-4a68-b4b8-a5f77f6e149a@ti.com>
 <17D8EC1D0CB8CAB1.25108@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17D8EC1D0CB8CAB1.25108@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 18:56:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17741

On Fri, Jun 14, 2024 at 12:34:23PM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 13, 2024 at 04:18:16PM -0500, Ryan Eatmon wrote:
> > 
> > 
> > On 6/13/2024 12:22 PM, Denys Dmytriyenko wrote:
> > >From: Denys Dmytriyenko <denys@konsulko.com>
> > >
> > >This adds a facility to define multiple supported BSPs with their own
> > >preferences for individual components, as well as lets machine configs
> > >specify conditional configurations for different BSPs.
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > 
> > 
> > 
> > >diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> > >new file mode 100644
> > >index 00000000..3bb94a7f
> > >--- /dev/null
> > >+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> > >@@ -0,0 +1,109 @@
> > >+# Support multiple BSP providers
> > >+# The main input is TI_DEFAULT_BSP, which translates into default
> > >+# preferences for kernel, bootloader and graphics components, as
> > >+# well as a dedicated machine override.
> > >+
> > >+# Supported options are: mainline, ti-6_6, ti-6_1, bb_org
> > >+TI_DEFAULT_BSP ??= "ti-6_6"
> > 
> > Should this variable be named TI_DEFAULT_BSP?  That implies that
> > this is the value of the default for this feature.  But in reality
> > this variable is what chooses the TI BSP version.  Should it be
> > something like TI_BSP_VERSION instead?
> 
> It's not just the version, it's entire BSP stack. E.g. "mainline" vs. "bb_org"
> Initially I started with only 2 options - "ti" vs. "bb_org", but eventually 
> expanded it to support "mainline" and in case of "ti" also different LTS 
> versions - "ti-6_1" and "ti-6_6"... Hence the original name stayed. And not 
> sure how long both LTS versions will be supported in meta-ti...
> 
> Anyway, I'm fine changing it to something else, but I thing calling it 
> "version" will be more confusing.

How about TI_PREFERRED_BSP or something along those lines?

-- 
Denys

