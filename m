Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3BFC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 23:29:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.510.1658791750308570244
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 16:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CMU4k2Jd;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: bb@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PNT4ug123191;
	Mon, 25 Jul 2022 18:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658791744;
	bh=JHvREANdceZi1Gy+pjsCYrSu/jQbbBCHP4zRx8aYxa0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CMU4k2JdRIrnUZD5dHoI+0yfTQ7jvexdztnt42IgyKJhy4jKMsGvBk31/YOa5lyNd
	 RZqqhHaRm/TyzgMtxpLU3tD/yOcZdbrncgJLs7sKNo+b5ZHASPGSqSOzs5SUBa5QqI
	 nLVJKAkAhztfOUOy+r7iBTqHre5uAeaBxUDM/VFo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PNT4CL005919
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jul 2022 18:29:04 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 18:29:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 18:29:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PNT4TU055197;
	Mon, 25 Jul 2022 18:29:04 -0500
Date: Mon, 25 Jul 2022 18:29:04 -0500
From: Bryan Brattlof <bb@ti.com>
To: Tom Rini <trini@konsulko.com>
CC: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Meta-TI
	<meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>,
        Res Sapp
	<rs@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
Subject: Re: [dunfell PATCH] wic: move uboot/spls mountpoint to /boot/firmware
Message-ID: <20220725232904.bwhkfm2ztpu5h6kq@bryanbrattlof.com>
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
 <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
 <20220722122916.GZ1146598@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220722122916.GZ1146598@bill-the-cat>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Jul 2022 23:29:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14904

On July 22, 2022 thus sayeth Tom Rini:
> On Thu, Jul 21, 2022 at 09:31:30PM -0500, Bryan Brattlof wrote:
> > On July 21, 2022 thus sayeth Denys Dmytriyenko:
> > > I don't think this is a correct solution, or maybe I'm not understanding the 
> > > problem. Can you please elaborate a bit more on the problem?
> > >
> > 
> > I'm fairly new to yocto so I'm sure I've found the entirely wrong way to 
> > get what I wanted :)
> > 
> > After boot it appears /etc/fstab is setup to mount our vfat boot 
> > partition to the /boot directory currently holding the Image and dtbs.  
> > I guess because uboot has already thrown the kernel and dtb into ddr at 
> > this point only Anand was able to notice this.
> > 
> > My change should mount the vfat partition to /boot/firmware so we can 
> > access to both our spls and kernel binaries in /boot.
> > 
> > I'm also not sure what folder name to use here. It seem like there may 
> > be a standard to this? Would /boot/uboot be more correct?
> 
> So which SoCs are we talking about here?  For the 64bit parts, the
> intention should be that the FAT partition on p1 be functional as the
> ESP.  So that means mounting it to /boot/efi.  But I'm not sure off-hand
> how that's being treated in upstream OE around the notion of making an
> image that's what a UEFI system expects.

Ideally this should be for all TI's K3 devices. I'm unfamiliar with the 
UEFI format and don't know if we currently follow it, however I like the 
idea of /boot/efi from what I googled.  I also found raspian is using 
/boot/firmware. Could this be less of a standard than I think?

~Bryan

