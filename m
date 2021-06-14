Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.55.1623688072410776258
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 09:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oiWygn+m;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15EGRngI083685;
	Mon, 14 Jun 2021 11:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623688069;
	bh=Gi1KxKYY+kIU+6m4KRGjMRvQCEf1MDPBtwyQF4w7OjA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oiWygn+mMVxBFxB+0MCpALRlBD3rYfVaPuYYCWDGRvYNQhnwjTzwo7hUsf1atV6C1
	 LBX7Xv9Lz1O0og13hmGhJcWKAqgyiUh7pY1IZZPGI1lr9AGkCo2fBDbPl3rPELYir9
	 jyGTi4L8JbuTCvWfluptECRYCw2/OJsI0GJcFvO0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15EGRn7o075169
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Jun 2021 11:27:49 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 14
 Jun 2021 11:27:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 14 Jun 2021 11:27:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15EGRmeo030098;
	Mon, 14 Jun 2021 11:27:48 -0500
Date: Mon, 14 Jun 2021 11:27:48 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Tom Rini <trini@konsulko.com>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCHv2] conf: am335x-evm: Add extlinux.conf support
Message-ID: <20210614162748.wq2ceh4ocodyedoc@pacifier>
References: <16875AD11A54340A.8333@lists.yoctoproject.org>
 <20210612131331.13439-1-trini@konsulko.com>
 <20210613193641.GB1528@denix.org>
 <20210614144353.oajmyqlnv4sjhyzf@reputably>
 <20210614160207.GF9516@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20210614160207.GF9516@bill-the-cat>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:02-20210614, Tom Rini wrote:
> On Mon, Jun 14, 2021 at 09:43:53AM -0500, Nishanth Menon wrote:
> > On 15:36-20210613, Denys Dmytriyenko wrote:
> > > On Sat, Jun 12, 2021 at 09:13:31AM -0400, Tom Rini wrote:
> > > > To make use of the "generic distro boot" support in U-Boot, an
> > > > extlinux.conf file needs to be generated and reside in the extlinux
> > > > directory.  The extlinux.conf file will be parsed by U-Boot and the
> > > > "append" line will be evaluated and expanded and used entirely as the
> > > > bootargs passed to the kernel.  Our generated extlinux.conf states
> > > > that the kernel image and device trees live one level up (so the root
> > > > directory) from it, so populate that location with our kernel and device
> > > > trees.
> > > > 
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > 
> > > Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> > > 
> > > 
> > > > ---
> > > > Changes in v2:
> > > > - Elaborate on how this feature works in the commit message.
> > > > ---
> > > >  conf/machine/include/ti33x.inc | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> > > > index 6dfda754e9dd..35e057d57497 100644
> > > > --- a/conf/machine/include/ti33x.inc
> > > > +++ b/conf/machine/include/ti33x.inc
> > > > @@ -43,6 +43,15 @@ UBOOT_MACHINE = "am335x_evm_config"
> > > >  UBOOT_ENTRYPOINT = "0x80008000"
> > > >  UBOOT_LOADADDRESS = "0x80008000"
> > > >  
> > > > +# Generate an extlinux.conf file
> > > > +UBOOT_EXTLINUX = "1"
> > > > +UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
> > > > +UBOOT_EXTLINUX_BOOT_FILES = " \
> > > > +    extlinux.conf;extlinux/extlinux.conf \
> > > > +    ${KERNEL_IMAGETYPE} \
> > > > +    ${KERNEL_DEVICETREE} \
> > > > +"
> > > > +
> > 
> > Does it make better if we do this in ti-soc.inc ?
> 
> The problem here is that we'll have one set of changes for 32bit
> platforms, where I think extlinux.conf ends up being best as if you look
> at other distributions (ie Debian), they end up doing the not-EFI path.
> But on 64bit, everyone goes the EFI path.  So I'm working through making
> an OE image that has a reasonable grub-efi path for us to boot up with.

OK. I see now. Thanks for explaining.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
