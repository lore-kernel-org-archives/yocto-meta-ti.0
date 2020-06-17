Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.1569.1592438031950645787
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 16:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WI7YREjs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05HNri1F014461;
	Wed, 17 Jun 2020 18:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1592438024;
	bh=Lol0bAAUqDm6TViCJcOemvtbA6wtvnQHdCuRpKzKlm8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WI7YREjsVeH1zHiOEhAT0hCS8KmeeYQRzwmIOlTIKt5IU88l9r5RdeitIWy6HBrf/
	 +SSC4QD5LDHWJHs0unFGO3LxifLJ1FO6Oy7qzlFGdopxR1nZhx/rXTTQn/BqPtjHr3
	 3K2xAhx8GjFQb+r67Cf4UKIC39VHoRUT4M058Va8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05HNriAi082917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jun 2020 18:53:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 17
 Jun 2020 18:53:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 17 Jun 2020 18:53:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05HNriPX078494;
	Wed, 17 Jun 2020 18:53:44 -0500
Date: Wed, 17 Jun 2020 19:53:43 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Message-ID: <20200617235343.GA9923@beryl>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
 <1618CF3A292A2864.29686@lists.yoctoproject.org>
 <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 16, 2020 at 11:40:47PM +0000, Ankur Tyagi wrote:
> Hi Denys,
> 
> Do you want me to send another patch?
> Maybe with an updated subject to differentiate?
> 
> Let me know what's the best way to proceed

Have you considered what I said here:
https://lists.yoctoproject.org/g/meta-ti/topic/74828692


> Regards
> Ankur
> 
> -----Original Message-----
> From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Behalf Of Ankur Tyagi
> Sent: Tuesday, 16 June 2020 7:45 AM
> To: Denys Dmytriyenko <denys@ti.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> 
> Hi Denys,
> 
> I did received your response and resent the patch.
> This is the reminder for the second patch.
> 
> Regards
> Ankur
> 
> -----Original Message-----
> From: Denys Dmytriyenko <denys@ti.com>
> Sent: Tuesday, 16 June 2020 7:42 AM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> 
> On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> > Hi Denys,
> > 
> > Gentle reminder as this patch has been in the mailing list (#12992) 
> > for some time now but I haven't heard anything.
> 
> Is your subscription working properly? I did reply here:
> https://lists.yoctoproject.org/g/meta-ti/topic/74828692
> 
> 
> > Regards
> > Ankur
> > 
> > -----Original Message-----
> > From: Ankur Tyagi
> > Sent: Friday, 12 June 2020 10:49 AM
> > To: meta-ti@lists.yoctoproject.org
> > Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak 
> > assignment for uboot board config
> > 
> > When using meta-ti BSP layer, user should be able to override default 
> > uboot board config with their custom board config as it is common for 
> > customers to design custom board based upon am335x-evm dev kit.
> > 
> > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > ---
> >  conf/machine/include/ti33x.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/conf/machine/include/ti33x.inc 
> > b/conf/machine/include/ti33x.inc index abfd7ec7..ff72a382 100644
> > --- a/conf/machine/include/ti33x.inc
> > +++ b/conf/machine/include/ti33x.inc
> > @@ -39,7 +39,7 @@ KERNEL_DEVICETREE = " \  KERNEL_DEVICETREE += 
> > "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
> >  
> >  UBOOT_ARCH = "arm"
> > -UBOOT_MACHINE = "am335x_evm_config"
> > +UBOOT_MACHINE ?= "am335x_evm_config"
> >  
> >  UBOOT_ENTRYPOINT = "0x80008000"
> >  UBOOT_LOADADDRESS = "0x80008000"
> > --
> > 2.17.1
> > 
