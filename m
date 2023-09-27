Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B105E82CC6
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:02:47 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.25440.1695841363248102061
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Sep 2023 12:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lgkceT/N;
 spf=pass (domain: konsulko.com, ip: 209.85.128.176, mailfrom: trini@konsulko.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59bebd5bdadso147298057b3.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 27 Sep 2023 12:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1695841362; x=1696446162; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYyg5gogzHYvIRZSvi4GpHyGez2XHkM22xYfsq3ABKs=;
        b=lgkceT/Nv0QsowCohA1umHBfAqjb0nZCqNBVfe4ca8j5EZ8+HgmaKGNA19RYk4KiUe
         f1Eac75J4z8xJcqTJEoMU7Mo2Rr4Ky7gP41ixbWNg4KE39+DuGWra5lgmnFCOlL1ifxH
         GQJFCpOIMRtOv/5ycBBE+j8bOFroKw1JQXKg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695841362; x=1696446162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYyg5gogzHYvIRZSvi4GpHyGez2XHkM22xYfsq3ABKs=;
        b=trOSXbP3Wnr2XFeQrJYgIiWZtTVYlGCVS5KSfy/TAxsi9tiIWkuK2nzZml4YGtNjpv
         l/RCRXaSI1G8MNtJuqs0FDI1wrTO+MqczGmA1TpUF15p0b1Im7vR2QAHLtvjsDqDgTiI
         h2vyi3MjAhBpHJse+o30iblQzGnP242dZN8vi3rv0LPErtSVyiI5QoezQSKlprFQ6yud
         4Zr/Jm+KPnV8Y7KUvqPkI0Y8hvjwK8nVPtleNP5hRFkDBQ6t4cMRHb0601O+m0igRJpj
         4NeLrEqPdjoEWCHoZZnAAjm8PQfXN+NhjKIiHUoDvfK5vLobWNeydZ9+V6IhQZz+WNAQ
         1k4g==
X-Gm-Message-State: AOJu0YzfOmj3OiWkTZzzq3HduvKq3h43/JM9cFfGG9e0oByWnL1wNp83
	NxdmS+1sSYs8AIAWZ5v9E34kqA==
X-Google-Smtp-Source: AGHT+IGSRdnjZiU2qyX0iBFEG0vgPVVzNlG4byTcWOQAKjvyXor5vnudr643RxWDihvnxWsE4G+YLg==
X-Received: by 2002:a81:a542:0:b0:59e:7fc1:dba0 with SMTP id v2-20020a81a542000000b0059e7fc1dba0mr3139242ywg.44.1695841362381;
        Wed, 27 Sep 2023 12:02:42 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-3e45-2793-b330-6d4a.res6.spectrum.com. [2603:6081:7b00:6400:3e45:2793:b330:6d4a])
        by smtp.gmail.com with ESMTPSA id t141-20020a0dea93000000b005a20ab8a184sm365084ywe.31.2023.09.27.12.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 12:02:41 -0700 (PDT)
Date: Wed, 27 Sep 2023 15:02:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Andrew Davis <afd@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	Ryan Eatmon <reatmon@ti.com>,
	Meta-TI <meta-ti@lists.yoctoproject.org>,
	Nishanth Menon <nm@ti.com>, Res Sapp <rs@ti.com>,
	Anand Gadiyar <gadiyar@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti] [dunfell PATCH] wic: move uboot/spls mountpoint to
 /boot/firmware
Message-ID: <20230927190239.GC305624@bill-the-cat>
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
 <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
 <20220722122916.GZ1146598@bill-the-cat>
 <20220725232904.bwhkfm2ztpu5h6kq@bryanbrattlof.com>
 <20220728113112.GF1146598@bill-the-cat>
 <ba8d9b4c-a500-5775-bfaa-88f6bb2ef881@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba8d9b4c-a500-5775-bfaa-88f6bb2ef881@ti.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 27 Sep 2023 19:02:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17016

On Wed, Sep 27, 2023 at 02:00:26PM -0500, Andrew Davis wrote:
> On 7/28/22 6:31 AM, Tom Rini wrote:
> > On Mon, Jul 25, 2022 at 06:29:04PM -0500, Bryan Brattlof wrote:
> > > On July 22, 2022 thus sayeth Tom Rini:
> > > > On Thu, Jul 21, 2022 at 09:31:30PM -0500, Bryan Brattlof wrote:
> > > > > On July 21, 2022 thus sayeth Denys Dmytriyenko:
> > > > > > I don't think this is a correct solution, or maybe I'm not understanding the
> > > > > > problem. Can you please elaborate a bit more on the problem?
> > > > > > 
> > > > > 
> > > > > I'm fairly new to yocto so I'm sure I've found the entirely wrong way to
> > > > > get what I wanted :)
> > > > > 
> > > > > After boot it appears /etc/fstab is setup to mount our vfat boot
> > > > > partition to the /boot directory currently holding the Image and dtbs.
> > > > > I guess because uboot has already thrown the kernel and dtb into ddr at
> > > > > this point only Anand was able to notice this.
> > > > > 
> > > > > My change should mount the vfat partition to /boot/firmware so we can
> > > > > access to both our spls and kernel binaries in /boot.
> > > > > 
> > > > > I'm also not sure what folder name to use here. It seem like there may
> > > > > be a standard to this? Would /boot/uboot be more correct?
> > > > 
> > > > So which SoCs are we talking about here?  For the 64bit parts, the
> > > > intention should be that the FAT partition on p1 be functional as the
> > > > ESP.  So that means mounting it to /boot/efi.  But I'm not sure off-hand
> > > > how that's being treated in upstream OE around the notion of making an
> > > > image that's what a UEFI system expects.
> > > 
> > > Ideally this should be for all TI's K3 devices. I'm unfamiliar with the
> > > UEFI format and don't know if we currently follow it, however I like the
> > > idea of /boot/efi from what I googled.  I also found raspian is using
> > > /boot/firmware. Could this be less of a standard than I think?
> > 
> > Keep in mind this is a generic OE on 64bit Arm problem and not a TI
> > specific problem.  Where to mount the ESP should have a consistent
> > default.  And it should look like it does on an off the shelf distro.
> > 
> 
> While not an exact ESP partition, we are working on making our boot
> partition as close as we can given ROM constraints.
> 
> I'm running into the problem now of updating kernel on a live system,
> would fail as we have mounted our boot partition over the rootfs boot/
> directory, so new images are not installed to the right spot/partition.
> 
> Let's go with /boot/efi if that works for everyone.
> 
> Bryan, could you re-send this with that change and the same for
> sdimage-2part-efi.wks.in?

The only feedback I would provide here is to work with the ROM team to
fix whatever constraints prevent an "ESP" itself from being used as this
will hinder the long term viability of the processors being widely
supported.

-- 
Tom

