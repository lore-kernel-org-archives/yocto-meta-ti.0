Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.10079.1614940270245908726
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 02:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RZWtMhyL;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D3F9538C0655
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 10:31:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 125AUwCL117632;
	Fri, 5 Mar 2021 04:30:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614940258;
	bh=UNw2aXfCrz9ZFaQRhyNFsrm42UMlLAhVzRnGMjD77vM=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=RZWtMhyL41lmouzyHPx1+Nd0/ETUKfQuUnHb89/87Tyz6mk5K9WfStTNCHnLgM8ir
	 BR1YrQO3Wn2qRsJ4WTB1mN0211ghX32jNF5ItlgayFRWEW1ND21iCk0zkTf4Ml+TvL
	 JV6WCAokq41NFZRw5WDA9vfFOxyntk6tgB4NxrwA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 125AUvdt006418
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Mar 2021 04:30:58 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 04:30:57 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 04:30:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 125AUuel020942;
	Fri, 5 Mar 2021 04:30:57 -0600
Date: Fri, 5 Mar 2021 16:00:55 +0530
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@yoctoproject.org>,
        <praneeth@ti.com>, <lokeshvutla@ti.com>, <kishon@ti.com>,
        <nsekhar@ti.com>, <hnagalla@ti.com>, <saurabhnarang@ti.com>
Subject: Re: [meta-ti][PATCH] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210305103055.3uf5ypbaxsx2yezb@NiksLab>
References: <20210303180917.12872-1-nikhil.nd@ti.com>
 <20210303181749.GW4892@denix.org>
 <166969EA2A6821A6.22430@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <166969EA2A6821A6.22430@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 15:29-20210305, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> On 13:17-20210303, Denys Dmytriyenko wrote:
> > On Wed, Mar 03, 2021 at 11:39:17PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > > Update the wl18xx firmware recipe to latest version 8.9.0.0.86
> > 
> > Do you also need to update the version from 8.7.3 to 8.9.x?
> 
> I am not sure how the recipe version is decided.
> Old commit ID had the firmware version 8.9.0.0.76 which is now
> changed to 8.9.0.0.86
> 
> I don't know how the recipe version is tied to the firmware version.
> Hari, Do you know?

I looked at the git history of the firmware and the last commit was
tagged with R8.7_SP3 Maybe this is used to derive the firmware version
8.7.3

But since the last tag in 2017, there haven't been new tags but the
firmware has been updated 7 times.

In this case, the recipe is adding only a single file, so let's just use
the firmware version in the recipe rather than using tags from the repo.

While at it, maybe it does not make sense to keep renaming the file for
every version change, so we just make it _git.bb and set
PV += "8.9.0.0.86"

Regards,
Nikhil Devshatwar

> 
> Regards,
> Nikhil Devshatwar
> > 
> > 
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > ---
> > >  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > index a52ec898..50b6c297 100644
> > > --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > @@ -7,8 +7,7 @@ SRC_URI = " \
> > >  	file://0001-Add-Makefile-to-install-firmware-files.patch \
> > >  "
> > >  
> > > -# Tag: R8.7-SP3 (8.7.3)
> > > -SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
> > > +SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
> > >  BRANCH = "master"
> > >  
> > >  S = "${WORKDIR}/git"
> > > -- 
> > > 2.17.1
> > 
> > -- 
> > Regards,
> > Denys Dmytriyenko <denis@denix.org>
> > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

> 
> 
> 

