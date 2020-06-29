Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1420.1593465691188770359
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 14:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S/+Lrjv2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05TLLMH6097645;
	Mon, 29 Jun 2020 16:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593465682;
	bh=0DoL+Dxs138OBncxMX+m07rztMKLt8lRX7aZjSKDXxg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=S/+Lrjv2z8XHaQyQJ/0fvbvg2doygVLuPqizYjskftJEFMN9kZs7vYQUJHjx7ifwP
	 /ntzBF7cURFzrfvTnA4avuJoLzxoMiS6bhNxHX4TYxVKvSgwT5aNqV/X360g+kzMJs
	 pVWwreGLGLObuoDASara3mPmC1eicJO4IiwZPogY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05TLLM5i122568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2020 16:21:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 29
 Jun 2020 16:21:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 29 Jun 2020 16:21:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05TLLMcg125843;
	Mon, 29 Jun 2020 16:21:22 -0500
Date: Mon, 29 Jun 2020 17:21:22 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Message-ID: <20200629212122.GB6525@beryl>
References: <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200615194140.GB10991@beryl>
 <1618CF3A292A2864.29686@lists.yoctoproject.org>
 <SY3PR01MB0809BA9DEC51834E825B56DEE59D0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200617235343.GA9923@beryl>
 <SY3PR01MB08097CC6172881D8261275DCE59B0@SY3PR01MB0809.ausprd01.prod.outlook.com>
 <20200618011926.GB9923@beryl>
 <1619871A2E16E3B4.23753@lists.yoctoproject.org>
 <SY3PR01MB19310CF89A41E9466FE17146E56E0@SY3PR01MB1931.ausprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SY3PR01MB19310CF89A41E9466FE17146E56E0@SY3PR01MB1931.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, was away for a bit. Can you please identify where in meta-arago 
"am335x-evm" machine is used directly where it should be "ti33x" family 
instead? Or you can send patches to fix those places. Thanks.

-- 
Denys


On Mon, Jun 29, 2020 at 04:05:13PM +0000, Ankur Tyagi wrote:
> Hi Denys,
> 
> Didn't got your feedback so does that mean my reason doesn't stack up?
> 
> Regards
> Ankur
> 
> -----Original Message-----
> From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Behalf Of Ankur Tyagi
> Sent: Thursday, 18 June 2020 3:55 PM
> To: Denys Dmytriyenko <denys@ti.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> 
> Apologies, my bad
> 
> > The idea is that if you are creating a custom board based on am335x-evm and
> > adding new config to U-boot, you should consider adding a new OE machine. Even
> > if your machine includes ti33x.inc for common SoC definitions, you can still
> > overwrite UBOOT_MACHINE in your <custom-machine>.conf file...
> 
> I did started with this idea but meta-arago has lot of "am335x-evm" machine usage throughout.
> That would mean to add new machine override in lot of meta-arago recipes.
> 
> Keeping a new board config in u-boot is desired to allow easy upgrading of u-boot from sitara-u-boot git repo.
> Modifying am335x board specific in u-boot doesn't scale well.
> 
> Hence came up with this approach to allow uboot config override in bsp layer but still use most of distro layer
> as it is.
> 
> But I am open to new ideas/suggestions as well.
> 
> Regards
> Ankur
> 
> -----Original Message-----
> From: Denys Dmytriyenko <denys@ti.com>
> Sent: Thursday, 18 June 2020 1:19 PM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> 
> On Thu, Jun 18, 2020 at 12:40:23AM +0000, Ankur Tyagi wrote:
> > Hi Denys,
> >
> > Yes, I did sent the patch again on mailing list and once the patch appeared,
> > then only I sent reminder.
> >
> > To begin with, this is what I think happened:
> > - Sent a patch to the list but somehow it failed
> > - without realizing that failure, I sent reminder for the failed one
> > https://lists.yoctoproject.org/g/meta-ti/message/12990
> > - you identified the problem and suggested to send it again
> > https://lists.yoctoproject.org/g/meta-ti/message/12991
> 
> And also there ^^^ I commented on feasibility of the change, which you seem to
> have missed...
> 
> 
> > - I did sent the patch again and it made it to mailing list
> > https://lists.yoctoproject.org/g/meta-ti/message/12992
> > - and then reminder for the successful sent patch
> > https://lists.yoctoproject.org/g/meta-ti/message/12993
> >
> > I sent the patch again with the same subject, somehow it got merged in the same topic
> > and doesn't appear as a separate patch?
> > Should I do slight change in the subject so that it appears as a separate topic in the list?
> >
> > Not sure what's the best way to proceed here.
> >
> > Regards
> > Ankur
> >
> > -----Original Message-----
> > From: Denys Dmytriyenko <denys@ti.com>
> > Sent: Thursday, 18 June 2020 11:54 AM
> > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > Cc: meta-ti@lists.yoctoproject.org
> > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> >
> > On Tue, Jun 16, 2020 at 11:40:47PM +0000, Ankur Tyagi wrote:
> > > Hi Denys,
> > >
> > > Do you want me to send another patch?
> > > Maybe with an updated subject to differentiate?
> > >
> > > Let me know what's the best way to proceed
> >
> > Have you considered what I said here:
> > https://lists.yoctoproject.org/g/meta-ti/topic/74828692
> >
> >
> > > Regards
> > > Ankur
> > >
> > > -----Original Message-----
> > > From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Behalf Of Ankur Tyagi
> > > Sent: Tuesday, 16 June 2020 7:45 AM
> > > To: Denys Dmytriyenko <denys@ti.com>
> > > Cc: meta-ti@lists.yoctoproject.org
> > > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> > >
> > > Hi Denys,
> > >
> > > I did received your response and resent the patch.
> > > This is the reminder for the second patch.
> > >
> > > Regards
> > > Ankur
> > >
> > > -----Original Message-----
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > Sent: Tuesday, 16 June 2020 7:42 AM
> > > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > > Cc: meta-ti@lists.yoctoproject.org
> > > Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> > >
> > > On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> > > > Hi Denys,
> > > >
> > > > Gentle reminder as this patch has been in the mailing list (#12992)
> > > > for some time now but I haven't heard anything.
> > >
> > > Is your subscription working properly? I did reply here:
> > > https://lists.yoctoproject.org/g/meta-ti/topic/74828692
> > >
> > >
> > > > Regards
> > > > Ankur
> > > >
> > > > -----Original Message-----
> > > > From: Ankur Tyagi
> > > > Sent: Friday, 12 June 2020 10:49 AM
> > > > To: meta-ti@lists.yoctoproject.org
> > > > Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak
> > > > assignment for uboot board config
> > > >
> > > > When using meta-ti BSP layer, user should be able to override default
> > > > uboot board config with their custom board config as it is common for
> > > > customers to design custom board based upon am335x-evm dev kit.
> > > >
> > > > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > > > ---
> > > >  conf/machine/include/ti33x.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/conf/machine/include/ti33x.inc
> > > > b/conf/machine/include/ti33x.inc index abfd7ec7..ff72a382 100644
> > > > --- a/conf/machine/include/ti33x.inc
> > > > +++ b/conf/machine/include/ti33x.inc
> > > > @@ -39,7 +39,7 @@ KERNEL_DEVICETREE = " \  KERNEL_DEVICETREE +=
> > > > "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
> > > >
> > > >  UBOOT_ARCH = "arm"
> > > > -UBOOT_MACHINE = "am335x_evm_config"
> > > > +UBOOT_MACHINE ?= "am335x_evm_config"
> > > >
> > > >  UBOOT_ENTRYPOINT = "0x80008000"
> > > >  UBOOT_LOADADDRESS = "0x80008000"
> > > > --
> > > > 2.17.1
> > > >
> ________________________________
>  This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
> ________________________________
