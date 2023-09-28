Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9C3E732D8
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 13:39:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.13552.1695908365110205227
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 06:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fs7dmvw9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: bb@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38SDdItg080765;
	Thu, 28 Sep 2023 08:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695908358;
	bh=vauDNMuJKMnIZIQWfZ96Pl6yMtdDzjmneQiphWIMOiU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Fs7dmvw9amhfizWisC0E14mmd3hBZOJgj0jtBNuBSKMe4w/HejMyIZa8JMUpyV4gd
	 XqS8VzWSE3csUKJ/sLrkloweDBwfv1ysRXGiM1ct553HTgmsDMTBpn92pdwFXXQ3C/
	 da9lFFSbotA7ZOS42I5PY4m3IJRYiZ3fmSBbfaiU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38SDdIXS007298
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Sep 2023 08:39:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Sep 2023 08:39:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Sep 2023 08:39:18 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38SDdIXd084376;
	Thu, 28 Sep 2023 08:39:18 -0500
Date: Thu, 28 Sep 2023 08:39:18 -0500
From: Bryan Brattlof <bb@ti.com>
To: Res Sapp <res.sapp@gmail.com>
CC: Tom Rini <trini@konsulko.com>, Andrew Davis <afd@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Meta-TI
	<meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>,
        Res Sapp
	<rs@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
Subject: Re: [meta-ti] [dunfell PATCH] wic: move uboot/spls mountpoint to
 /boot/firmware
Message-ID: <20230928133918.vf7suv6eujo7jc5e@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
 <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
 <20220722122916.GZ1146598@bill-the-cat>
 <20220725232904.bwhkfm2ztpu5h6kq@bryanbrattlof.com>
 <20220728113112.GF1146598@bill-the-cat>
 <ba8d9b4c-a500-5775-bfaa-88f6bb2ef881@ti.com>
 <20230927190239.GC305624@bill-the-cat>
 <e8d92c23-cf7b-4b5f-8092-ab587169c026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e8d92c23-cf7b-4b5f-8092-ab587169c026@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Sep 2023 13:39:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17022

On September 28, 2023 thus sayeth Res Sapp:
> On 9/27/23 14:02, Tom Rini wrote:
> > On Wed, Sep 27, 2023 at 02:00:26PM -0500, Andrew Davis wrote:
> > > On 7/28/22 6:31 AM, Tom Rini wrote:
> > > > On Mon, Jul 25, 2022 at 06:29:04PM -0500, Bryan Brattlof wrote:
> > > > > On July 22, 2022 thus sayeth Tom Rini:
> > > > > > On Thu, Jul 21, 2022 at 09:31:30PM -0500, Bryan Brattlof wrote:
> > > > > > > On July 21, 2022 thus sayeth Denys Dmytriyenko:
> > > > > > > > I don't think this is a correct solution, or maybe I'm not understanding the
> > > > > > > > problem. Can you please elaborate a bit more on the problem?
> > > > > > > > 
> > > > > > > 
> > > > > > > I'm fairly new to yocto so I'm sure I've found the entirely wrong way to
> > > > > > > get what I wanted :)
> > > > > > > 
> > > > > > > After boot it appears /etc/fstab is setup to mount our vfat boot
> > > > > > > partition to the /boot directory currently holding the Image and dtbs.
> > > > > > > I guess because uboot has already thrown the kernel and dtb into ddr at
> > > > > > > this point only Anand was able to notice this.
> > > > > > > 
> > > > > > > My change should mount the vfat partition to /boot/firmware so we can
> > > > > > > access to both our spls and kernel binaries in /boot.
> > > > > > > 
> > > > > > > I'm also not sure what folder name to use here. It seem like there may
> > > > > > > be a standard to this? Would /boot/uboot be more correct?
> > > > > > 
> > > > > > So which SoCs are we talking about here?  For the 64bit parts, the
> > > > > > intention should be that the FAT partition on p1 be functional as the
> > > > > > ESP.  So that means mounting it to /boot/efi.  But I'm not sure off-hand
> > > > > > how that's being treated in upstream OE around the notion of making an
> > > > > > image that's what a UEFI system expects.
> > > > > 
> > > > > Ideally this should be for all TI's K3 devices. I'm unfamiliar with the
> > > > > UEFI format and don't know if we currently follow it, however I like the
> > > > > idea of /boot/efi from what I googled.  I also found raspian is using
> > > > > /boot/firmware. Could this be less of a standard than I think?
> > > > 
> > > > Keep in mind this is a generic OE on 64bit Arm problem and not a TI
> > > > specific problem.  Where to mount the ESP should have a consistent
> > > > default.  And it should look like it does on an off the shelf distro.
> > > > 
> > > 
> > > While not an exact ESP partition, we are working on making our boot
> > > partition as close as we can given ROM constraints.
> > > 
> > > I'm running into the problem now of updating kernel on a live system,
> > > would fail as we have mounted our boot partition over the rootfs boot/
> > > directory, so new images are not installed to the right spot/partition.
> > > 
> > > Let's go with /boot/efi if that works for everyone.
> > > 
> > > Bryan, could you re-send this with that change and the same for
> > > sdimage-2part-efi.wks.in?
> > 
> > The only feedback I would provide here is to work with the ROM team to
> > fix whatever constraints prevent an "ESP" itself from being used as this
> > will hinder the long term viability of the processors being widely
> > supported.
> 
> Haha, this debate has lasted so long that systemd-boot has standardized
> mounting the ESP partition to just /efi now [1].
> 
> [1] https://www.freedesktop.org/software/systemd/man/systemd-boot.html

Even systemd was having trouble trying to figure it out[2] ;)

I'll respin this today with /boot/efi

~Bryan

[2] https://github.com/systemd/systemd/pull/3757



