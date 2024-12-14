Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E12E7716A
	for <webhook@archiver.kernel.org>; Sat, 14 Dec 2024 20:06:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24359.1734206768931587102
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 14 Dec 2024 12:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B29E40C85;
	Sat, 14 Dec 2024 20:06:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbmwF5xRJCrf; Sat, 14 Dec 2024 20:06:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 24CD440800;
	Sat, 14 Dec 2024 20:06:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D9FA216412C; Sat, 14 Dec 2024 15:06:05 -0500 (EST)
Date: Sat, 14 Dec 2024 15:06:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [meta-ti] [master][PATCH 02/12] meta-beagle: create
 a separate layer for Beagle platforms
Message-ID: <20241214200605.GH23825@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
 <20241213233203.2688541-2-denis@denix.org>
 <72d10229-7bb1-4a1a-a1bd-9c8a1e45e77d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72d10229-7bb1-4a1a-a1bd-9c8a1e45e77d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Dec 2024 20:06:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18121

On Sat, Dec 14, 2024 at 10:21:25PM +0530, Chirag Shilwant wrote:
> Hi,
> >diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
> >new file mode 100644
> >index 00000000..df6a77ed
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
> 
> Post [1], LAYERSERIES_COMPAT_meta-beagle shouldn't have scarthgap
> in meta-ti:master since this sublayer has a hard dependency on
> meta-ti-bsp via LAYERDEPENDS & meta-ti-bsp has dropped scarthgap
> from LAYERSERIES_COMPAT in master

v2 posted.

