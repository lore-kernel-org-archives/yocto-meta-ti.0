Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9376C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:02:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.78163.1673283721174690497
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 09:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1BF24406B7;
	Mon,  9 Jan 2023 17:02:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWk7ekkfPD88; Mon,  9 Jan 2023 17:02:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DABC640C52;
	Mon,  9 Jan 2023 17:01:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 95A701636C1; Mon,  9 Jan 2023 12:01:37 -0500 (EST)
Date: Mon, 9 Jan 2023 12:01:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Sinthu Raja <sinthu.raja@mistralsolutions.com>, denys@ti.com,
	detheridge@ti.com, meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [[meta-ti][master/dunfell][PATCH]] conf: machine: j721s2: Add
 AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE
Message-ID: <20230109170137.GR22689@denix.org>
References: <20221228112906.5301-1-sinthu.raja@ti.com>
 <176c06ef-ae8c-bfaf-20fe-5a20ae4a1e73@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176c06ef-ae8c-bfaf-20fe-5a20ae4a1e73@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Jan 2023 17:02:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15541

On Mon, Jan 09, 2023 at 10:19:53AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> On 12/28/2022 5:29, Sinthu Raja wrote:
> >From: Sinthu Raja <sinthu.raja@ti.com>
> >
> >AM68 Starter Kit is a low cost, small form factor board designed for
> >TI's AM68/J721S2 SoC[1] which is optimized to provide best in class performance
> >for industrial applications. Add DTB entry for the same.
> >
> >AM68 SK features camera support with MIPI(OV5640) and RPi(IMX219) connectors.
> >Add DTBO for the same. Also, add DTBO entry for the DDR memory carveout.
> >
> >[1]:http://www.ti.com/lit/zip/spruj28
> >
> >Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >---
> >  conf/machine/j721s2-evm.conf | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> >diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> >index 6377c459..abdd9e03 100644
> >--- a/conf/machine/j721s2-evm.conf
> >+++ b/conf/machine/j721s2-evm.conf
> >@@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
> >  OPTEE_K3_USART = "0x8"
> >  KERNEL_DEVICETREE = " \
> >+    ti/k3-am68-sk-base-board.dtb \
> >+    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
> >+    ti/k3-am68-sk-rpi-cam-imx219.dtbo \
> 
> This file is not what made it into the kernel.  The file in the kernel is:
> 
> ti/k3-am68-sk-bb-rpi-cam-imx219.dts
>               ^^
> 
> Fix this and resubmit the patch please.

Please also avoid nested brackets in the Subject, otherwise you get this issue 
in the git history:
https://git.yoctoproject.org/meta-ti/commit/?h=dunfell-wip&id=8e63da858658b7b6ac51803f943c1023248d178f


> >+    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
> >      ti/k3-j721s2-common-proc-board.dtb \
> >      ti/k3-j721s2-gesi-exp-board.dtbo \
> >  "

