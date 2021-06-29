Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.12795.1624992508320097150
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 11:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iAobCqiX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TImKet039433;
	Tue, 29 Jun 2021 13:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624992500;
	bh=CyfXAw0u0PAmk5SM2D0W7Kvn+A/ZIndpN6N8hmrBbb0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iAobCqiXJMlIOTdkKPUID5bhvg5yPk2tMpCsMBTp/YOT22yTM4+6JXYQNEK/aNDTP
	 E9AvC8VGbQWPdGmlY1acWZO/IHOHnZfWXtbOCrPnYHsoBRuc5ZGlqoUsH4htDKPKNe
	 lDrSsWewbkPMJemS36jhUS4YkwwzSxk5xEIus2fo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TImKML116698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 13:48:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 13:48:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 29 Jun 2021 13:48:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15TImKaX010771;
	Tue, 29 Jun 2021 13:48:20 -0500
Date: Tue, 29 Jun 2021 13:48:20 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH 1/4] ti-sci-fw: Update imggen to release 08.00.00.001 tag
Message-ID: <20210629184820.vu7prcgphnj2u2k4@unshaved>
References: <20210629002618.29822-1-yogeshs@ti.com>
 <20210629002618.29822-2-yogeshs@ti.com>
 <c7d88a6b-f8dd-0565-29bd-65849b049ab4@ti.com>
 <20210629020604.GZ1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210629020604.GZ1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 22:06-20210628, Denys Dmytriyenko wrote:
> On Mon, Jun 28, 2021 at 07:28:14PM -0500, praneeth via lists.yoctoproject.org wrote:
> > 
> > 
> > On 6/28/2021 7:26 PM, Yogesh Siraswar wrote:
> > >Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> > >---
> > >  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> > >index 7ec074c8..e6227632 100644
> > >--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> > >+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> > >@@ -7,7 +7,7 @@ PV = "2021.01a"
> > 
> > PV is 2021.05
> 
> This is just image gen, not the actual SYSFW. Should those be updated at the 
> same time to 2021.05?
> 
> 
> > >  SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
> > >  BRANCH ?= "ti-linux-firmware"
> > >-SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
> > >+SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
> > >  SRCREV_FORMAT = "imggen"
> > >  SRC_URI = " \
> > >


This series of updates has completely broken Upstream am64x support. I
cant figure out (at least personally) how to make it work consistently.

https://git.ti.com/cgit/k3-image-gen/k3-image-gen/commit/?id=e411dc16862b5bb2d8befb12496b03d7b01c87b2
is the offending commit.

Unfortunately we picked that up along with moving the baseline to latest
k3-image-gen - this implies upstream is looking at SPL at older address
while we are building which puts SPL and TF-A conflicting with each
other, resulting in a completely non-bootable system when using
mainline.

I have tried various forms of patching inside meta-ti, but I am not able
to think of a sensible manner to keep mainline functional for am64x.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
