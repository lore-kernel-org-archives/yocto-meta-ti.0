Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2553.1624932368901308333
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 19:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9DAC40C30;
	Tue, 29 Jun 2021 02:06:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XM_tHLB0Mitx; Tue, 29 Jun 2021 02:06:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3E0A40C1E;
	Tue, 29 Jun 2021 02:06:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1969E17461A; Mon, 28 Jun 2021 22:06:04 -0400 (EDT)
Date: Mon, 28 Jun 2021 22:06:04 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master][PATCH 1/4] ti-sci-fw: Update imggen to release 08.00.00.001 tag
Message-ID: <20210629020604.GZ1528@denix.org>
References: <20210629002618.29822-1-yogeshs@ti.com>
 <20210629002618.29822-2-yogeshs@ti.com>
 <c7d88a6b-f8dd-0565-29bd-65849b049ab4@ti.com>
MIME-Version: 1.0
In-Reply-To: <c7d88a6b-f8dd-0565-29bd-65849b049ab4@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 07:28:14PM -0500, praneeth via lists.yoctoproject.org wrote:
> 
> 
> On 6/28/2021 7:26 PM, Yogesh Siraswar wrote:
> >Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> >---
> >  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> >index 7ec074c8..e6227632 100644
> >--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> >+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> >@@ -7,7 +7,7 @@ PV = "2021.01a"
> 
> PV is 2021.05

This is just image gen, not the actual SYSFW. Should those be updated at the 
same time to 2021.05?


> >  SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
> >  BRANCH ?= "ti-linux-firmware"
> >-SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
> >+SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
> >  SRCREV_FORMAT = "imggen"
> >  SRC_URI = " \
> >

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
