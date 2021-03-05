Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.9862.1614938395495616141
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 01:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wyZFnQwj;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3680A38C0823
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 09:59:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1259xpPH055181;
	Fri, 5 Mar 2021 03:59:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614938391;
	bh=LY+3InFIDbE1LwVBSaD5meLZ7Y1kGJtTv3mAPVegR0o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wyZFnQwjee/h/2LrHnBcj/Zo5SQEQumUCrcfb/R31jKCk83NVG0xFjElClvsIipdy
	 gN3GQhXziuOv60nslOql3Um/5WRhVFxlVMaoqwCYef1shm8YxS3MCY0QiFbJSTv9W0
	 OauKyB44gXSdmTkQQ/QihF4kLYq+jmA8/hhyXeR8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1259xp9B060484
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 03:59:51 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 03:59:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 03:59:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1259xnwZ119204;
	Fri, 5 Mar 2021 03:59:50 -0600
Date: Fri, 5 Mar 2021 15:29:49 +0530
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@yoctoproject.org>, <praneeth@ti.com>, <lokeshvutla@ti.com>,
        <kishon@ti.com>, <nsekhar@ti.com>, <hnagalla@ti.com>,
        <saurabhnarang@ti.com>
Subject: Re: [meta-ti][PATCH] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210305095949.cjamdcgrdb267a2c@NiksLab>
References: <20210303180917.12872-1-nikhil.nd@ti.com>
 <20210303181749.GW4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210303181749.GW4892@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13:17-20210303, Denys Dmytriyenko wrote:
> On Wed, Mar 03, 2021 at 11:39:17PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > Update the wl18xx firmware recipe to latest version 8.9.0.0.86
> 
> Do you also need to update the version from 8.7.3 to 8.9.x?

I am not sure how the recipe version is decided.
Old commit ID had the firmware version 8.9.0.0.76 which is now
changed to 8.9.0.0.86

I don't know how the recipe version is tied to the firmware version.
Hari, Do you know?

Regards,
Nikhil Devshatwar
> 
> 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > index a52ec898..50b6c297 100644
> > --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > @@ -7,8 +7,7 @@ SRC_URI = " \
> >  	file://0001-Add-Makefile-to-install-firmware-files.patch \
> >  "
> >  
> > -# Tag: R8.7-SP3 (8.7.3)
> > -SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
> > +SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
> >  BRANCH = "master"
> >  
> >  S = "${WORKDIR}/git"
> > -- 
> > 2.17.1
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
