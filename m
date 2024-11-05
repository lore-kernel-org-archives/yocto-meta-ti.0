Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3AED35E59
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 20:57:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.31110.1730840249693228415
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 12:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB1B940CA8;
	Tue,  5 Nov 2024 20:57:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9TBpWXm7_4A; Tue,  5 Nov 2024 20:57:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B8C2140C50;
	Tue,  5 Nov 2024 20:57:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2B0EC1640CD; Tue,  5 Nov 2024 15:57:26 -0500 (EST)
Date: Tue, 5 Nov 2024 15:57:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][RFC PATCH 2/6] meta-beagle: create a
 separate layer for Beagle platforms
Message-ID: <20241105205726.GL20070@denix.org>
References: <20241105191100.532413-1-denis@denix.org>
 <20241105191100.532413-2-denis@denix.org>
 <b8b363e2-4f7f-42d2-a0e1-6c3d191586f7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b363e2-4f7f-42d2-a0e1-6c3d191586f7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Nov 2024 20:57:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18048

On Tue, Nov 05, 2024 at 02:24:40PM -0600, Ryan Eatmon wrote:
> 
> 
> On 11/5/2024 1:10 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >The new meta-beagle will host all supported Beagle platforms that
> >use TI SoCs and hence need to depend on meta-ti-bsp. The default
> >BSP for the platforms in this layer will use BeagleBoard.org
> >official trees for the Linux kernel and U-boot.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  meta-beagle/conf/layer.conf | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta-beagle/conf/layer.conf
> >
> >diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
> >new file mode 100644
> >index 00000000..ca920f29
> >--- /dev/null
> >+++ b/meta-beagle/conf/layer.conf
> >@@ -0,0 +1,15 @@
> >+# We have a conf and classes directory, append to BBPATH
> >+BBPATH .= ":${LAYERDIR}"
> >+
> >+# We have a recipes directory, add to BBFILES
> >+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >+
> >+BBFILE_COLLECTIONS += "meta-beagle"
> >+BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
> >+BBFILE_PRIORITY_meta-beagle = "6"
> >+
> >+LAYERSERIES_COMPAT_meta-beagle = "scarthgap styhead walnascar"
> >+
> >+LAYERDEPENDS_meta-bealge = " \
> 
> misspelling------------^

Indeed, thanks!


> >+    meta-ti-bsp \
> >+"

