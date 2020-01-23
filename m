Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.533.1579800445518100484
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jan 2020 09:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VAmLes3L;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NHROLJ052579
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 11:27:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579800444;
	bh=6FlZ2ZqW36STlwjQdrtA8APkeqpKrOZQdr85LpCjL70=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VAmLes3LX3z06jqNV80Wjvup/Ift90rhlRutsMwGi6uSbRHe2CNNi18NcL7dzozjw
	 mWD6a3wGV1k3QJqFfTKwiepM+8LcQQE5GtxRgSKaYUncCDYZ0XXLttn/GSnceOzd4b
	 hXD8dM1jxqt+CCaiX+a/o/XaPqLa0ca/ATZguSzc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NHROab125603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 11:27:24 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 23
 Jan 2020 11:27:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 23 Jan 2020 11:27:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00NHROSB006775;
	Thu, 23 Jan 2020 11:27:24 -0600
Date: Thu, 23 Jan 2020 12:27:23 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Huang, David" <d-huang@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Hernandez, Alejandro" <ajhernandez@ti.com>
Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
Message-ID: <20200123172723.GQ3658@beryl>
References: <20200123165856.26907-1-d-huang@ti.com>
 <20200123170515.GN3658@beryl>
 <c3b4990d4ef6439caa8b638f884fdaf7@ti.com>
MIME-Version: 1.0
In-Reply-To: <c3b4990d4ef6439caa8b638f884fdaf7@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, updated and merged to thud-next!

On Thu, Jan 23, 2020 at 12:08:31PM -0500, Huang, David wrote:
> Hi Denys,
> 
> Yes, I think I tried to enter it as $(CROSS_COMPILE) and that got interpreted away. Please go ahead and fix this while merging.
> 
> Thanks,
> David
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, January 23, 2020 11:05 AM
> To: Huang, David
> Cc: meta-ti@lists.yoctoproject.org; Hernandez, Alejandro
> Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
> 
> Thanks!
> 
> On Thu, Jan 23, 2020 at 10:58:56AM -0600, David Huang via Lists.Yoctoproject.Org wrote:
> > From: David Huang <d-huang@ti.com>
> > 
> > Pick up latest version of ti-img-encode-decode recipe
> > with Makefiles using instead of hard coding
> 
> Is this message incomplete? Did you miss "using CROSS_COMPILE"? If that's the 
> case and you have tested the recipe update, I can fix the commit message while 
> merging. Please let me know. Thanks.
> 
> Denys
> 
> 
> > aarch64-linux-gnu as the cross compiler.
> > 
> > Signed-off-by: David Huang <d-huang@ti.com>
> > ---
> >  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> > index 86d954756600..a1da9585e368 100644
> > --- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> > +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> > @@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
> >  
> >  inherit module
> >  
> > -MACHINE_KERNEL_PR_append = "f"
> > +MACHINE_KERNEL_PR_append = "g"
> >  PR = "${MACHINE_KERNEL_PR}"
> >  
> >  COMPATIBLE_MACHINE = "j7-evm"
> >  
> > -SRCREV = "030e50dd0c53ec8e7825c85479ac3208925bb58d"
> > +SRCREV = "0eba3678300f649e49f03d92d1b624cf0e008008"
> >  
> >  EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
> >  TARGET_CC_ARCH += "${LDFLAGS}"
> > -- 
> > 2.17.1
> > 
> 
> > 
> 
