Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F922C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:31:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3604.1658457099512841146
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Jul 2022 19:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qNTHlV7D;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: bb@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26M2VU6v009053;
	Thu, 21 Jul 2022 21:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658457090;
	bh=MLsQbnvKaaoCAOExCFs/WJAImBtukP7Ec90nFm0m4Mw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qNTHlV7D0OnGVxUa56JB1A/XUdt6Cbjf5GXYTWQJEmVRrzG46p2RD62H+KqJ8LqIP
	 Z1+BfMd7YUrrQcki1pAhGflL+qy8/T81h/7PjJkM8msb0Wy7nFmIxukxPM8tyhM6Mm
	 8Z6CGp2BqtqD7ksIhY7W2HbCHRx2JyQtnPFeeui4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26M2VUk2021482
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Jul 2022 21:31:30 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Jul 2022 21:31:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Jul 2022 21:31:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26M2VUm4028959;
	Thu, 21 Jul 2022 21:31:30 -0500
Date: Thu, 21 Jul 2022 21:31:30 -0500
From: Bryan Brattlof <bb@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Tom Rini <trini@konsulko.com>
CC: Ryan Eatmon <reatmon@ti.com>, Meta-TI <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon <nm@ti.com>, Res Sapp <rs@ti.com>,
        Anand Gadiyar
	<gadiyar@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [dunfell PATCH] wic: move uboot/spls mountpoint to /boot/firmware
Message-ID: <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220721225726.GP18692@denix.org>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Jul 2022 02:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14898

Hi Denys!

+Tom Rini

On July 21, 2022 thus sayeth Denys Dmytriyenko:
> I don't think this is a correct solution, or maybe I'm not understanding the 
> problem. Can you please elaborate a bit more on the problem?
>

I'm fairly new to yocto so I'm sure I've found the entirely wrong way to 
get what I wanted :)

After boot it appears /etc/fstab is setup to mount our vfat boot 
partition to the /boot directory currently holding the Image and dtbs.  
I guess because uboot has already thrown the kernel and dtb into ddr at 
this point only Anand was able to notice this.

My change should mount the vfat partition to /boot/firmware so we can 
access to both our spls and kernel binaries in /boot.

I'm also not sure what folder name to use here. It seem like there may 
be a standard to this? Would /boot/uboot be more correct?

Thanks
~Bryan

> 
> On Thu, Jul 21, 2022 at 04:01:52PM -0500, Bryan Brattlof wrote:
> > Currently out boards will auto-mount the sd-card's boot partition into
> > the /boot folder, effectively hiding the kernel image and dtb files that
> > are already there.
> > 
> > Move the boot partition mount point to /boot/firmware allowing access to
> > both the bootloader binares and kernel images.
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >  wic/sdimage-2part.wks | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/wic/sdimage-2part.wks b/wic/sdimage-2part.wks
> > index 77d6f7b576aef..7567c4429a2eb 100644
> > --- a/wic/sdimage-2part.wks
> > +++ b/wic/sdimage-2part.wks
> > @@ -2,5 +2,5 @@
> >  # long-description: Creates a partitioned SD card image for TI platforms.
> >  # Boot files are located in the first vfat partition with extra reserved space.
> >  
> > -part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
> > +part /boot/firmware --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
> >  part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --use-uuid
> > -- 2.17.1

