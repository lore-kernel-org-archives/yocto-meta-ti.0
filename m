Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D67CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 20:53:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5976.1781038393818844129
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 13:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E450F40CB0;
	Tue,  9 Jun 2026 20:53:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGP7VgD5Dh9v; Tue,  9 Jun 2026 20:53:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8714440C85;
	Tue,  9 Jun 2026 20:53:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C0EA517ED8A; Tue,  9 Jun 2026 16:53:07 -0400 (EDT)
Date: Tue, 9 Jun 2026 16:53:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org, denys@konsulko.com
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged
 overlay list
Message-ID: <20260609205307.GJ23325@denix.org>
References: <20260609202801.18252-1-jm@ti.com>
 <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 20:53:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19996

On Tue, Jun 09, 2026 at 03:45:05PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> I assume this is for wrynose as well?  If so, please make sure to
> add it on the subject going forward.
> 
> 
> On 6/9/2026 3:28 PM, Judith Mendez wrote:
> >Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
> >update overlay list packaged for AM62D mostly to include the new
> >k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.
> >
> >Signed-off-by: Judith Mendez <jm@ti.com>
> >---
> >  meta-ti-bsp/conf/machine/am62dxx-evm.conf | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> >index ef9df2f7..c776ffbf 100644
> >--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> >+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> >@@ -7,7 +7,14 @@ require conf/machine/include/am62dxx.inc
> >  KERNEL_DEVICETREE_PREFIX = " \
> >      ti/k3-am62d2 \
> >      ti/k3-am62a7-sk-edgeai \
> >-    ti/k3-am62x-sk \
> >+    ti/k3-am62x-sk-csi2 \
> >+    ti/k3-am62x-sk-ecap-capture \
> >+    ti/k3-am62x-sk-eqep \
> >+    ti/k3-am62x-sk-hdmi \
> >+    ti/k3-am62x-sk-lpm \
> >+    ti/k3-am62x-sk-mcspi-loopback \
> >+    ti/k3-am62x-sk-pwm \

Why are these needed? Shouldn't the first removed more generic prefix cover 
them all?


> >+    ti/k3-am62a7-sk-mcan.dtbo \
> >      ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
> >      ti/k3-am62a7-sk-e3-max-opp \
> >  "

