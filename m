Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.445.1617234938253985830
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GjCXSY7+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNtUXr124043;
	Wed, 31 Mar 2021 18:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617234930;
	bh=HLgS8ghvo9UgNvG7J0HFoKgwxF6ChedS8JUn1de1d0M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GjCXSY7+I6TnP1JLd+ABru91xtegdEJFYkT8CzFHX2x8ryXHv6GbeGNBTMLy8sRt9
	 IbpCTKSbRgNjaEQk9LMRsQ4SGjDZAAPX4BNWKouiBtBX2qHgZkaRPmCm8XPO02wvWP
	 5t/hE6+y5P3UZSRQvdBlFcpMh/ZSBiaFZEsNudeI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNtU73115197
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:55:30 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:55:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:55:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNtUiM093897;
	Wed, 31 Mar 2021 18:55:30 -0500
Date: Wed, 31 Mar 2021 18:55:30 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master][PATCH 6/7] conf/machine: am64xx: Switch to multi-certificate boot images
Message-ID: <20210331235529.pqofgmoezaorckal@handled>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-7-nm@ti.com>
 <16718E3613B720CC.10817@lists.yoctoproject.org>
 <20210331223557.GK23013@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210331223557.GK23013@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 18:35-20210331, Denys Dmytriyenko wrote:
> On Wed, Mar 31, 2021 at 06:35:00PM -0400, Denys Dmytriyenko wrote:
> > On Wed, Mar 31, 2021 at 11:51:32AM -0500, Nishanth Menon wrote:
> > > Switch to using all of multi-certificate boot images. This allows us
> > > to create bootable images - in this case, we are missing tiboot3.bin
> > > 
> > > Signed-off-by: Nishanth Menon <nm@ti.com>
> > > ---
> > >  conf/machine/include/am64xx.inc | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> > > index 3173319df354..9d40b066a03a 100644
> > > --- a/conf/machine/include/am64xx.inc
> > > +++ b/conf/machine/include/am64xx.inc
> > > @@ -10,7 +10,8 @@ KERNEL_DEVICETREE = " \
> > >      ti/k3-am642-evm.dtb \
> > >  "
> > >  
> > > -IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> > > +# AM64 supports multi-certificate images, use the same
> > > +IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> > >  do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> > >  do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> > 
> > Same comment - TF-A is not needed here.
> 
> I guess this can be cleaned up separately. The main change is fine:

Done in the upcoming V2.
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
> > >  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> > > -- 
> > > 2.31.0
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
