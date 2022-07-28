Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4936FC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 11:31:17 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.31243.1659007876159619111
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Jul 2022 04:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=O8zrrNzj;
 spf=pass (domain: konsulko.com, ip: 209.85.222.179,
 mailfrom: trini@konsulko.com)
Received: by mail-qk1-f179.google.com with SMTP id l3so1204207qkl.3
        for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Jul 2022 04:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=idyVTNjNNGuWxCT0frNa8+tpn1w9SYJhLrKZPm6fQuo=;
        b=O8zrrNzjdOO70CndElcaR27DFwPYcK9eVd+gIGtmmpp4pfuhPksUCA9p2KjC35AKwR
         ZcVhKhajdqbGq+nHWyJg4evETr4DNzow6IXdm2rwWjTpfgllnBbdzVU6/2OTEc4IpDjR
         8J1iQp2MocgkE7dU7AZduxvXIBVIK4lkHrWgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=idyVTNjNNGuWxCT0frNa8+tpn1w9SYJhLrKZPm6fQuo=;
        b=lCUBO80uYOzStXp+KmuN3XtuiPlIUwt5wGEVjE+44j9FBi2r4pKyGwPUaVStGYuy9s
         unIWo7gd8MvGJRgOeuiVaqaUrJINrt1q04jSK9zqivIqeF7Fb6awV8sq0F1d4enIv/s7
         0cuCngRrBuyRW+lfCMm4i0eynHLSgUyu9tSQI2ylRD0sugmX1vE70IwDEjuhBbiJ1cUf
         Y1ovE5z1EoHqxuG/4zKq3NZYqj3cjiB9I66IzjOzihacXgCpbRZxc+4BVLurebgxYQxx
         eXPvafqxjvey0/84GsRfAwNW8aVREPjSwwOm9+ISAUg44pQ3uLNjLxipKqWaH5OcO/jz
         gUlw==
X-Gm-Message-State: AJIora8LrCIF3QFCfh5ESTniZDnSozHEHFe3Tzdt/RrB9XGKxTQKVwNH
	9fl2/7OcoFSNP8IPxI/3O5Ffxg==
X-Google-Smtp-Source: 
 AGRyM1s6T81wyeKo6eBzu1aZ/PKZ9sLDn9ZzOfzymT4KvE4bhjJnDM0AhWnAwSv+w/dPnynMSQ9iMw==
X-Received: by 2002:a05:620a:f0d:b0:6a9:b3e9:dc3f with SMTP id
 v13-20020a05620a0f0d00b006a9b3e9dc3fmr20004737qkl.437.1659007875198;
        Thu, 28 Jul 2022 04:31:15 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 c12-20020ac87dcc000000b0031ede43512bsm310991qte.44.2022.07.28.04.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:31:14 -0700 (PDT)
Date: Thu, 28 Jul 2022 07:31:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Bryan Brattlof <bb@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
	Meta-TI <meta-ti@lists.yoctoproject.org>,
	Nishanth Menon <nm@ti.com>, Res Sapp <rs@ti.com>,
	Anand Gadiyar <gadiyar@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [dunfell PATCH] wic: move uboot/spls mountpoint to /boot/firmware
Message-ID: <20220728113112.GF1146598@bill-the-cat>
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
 <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
 <20220722122916.GZ1146598@bill-the-cat>
 <20220725232904.bwhkfm2ztpu5h6kq@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725232904.bwhkfm2ztpu5h6kq@bryanbrattlof.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Jul 2022 11:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14912

On Mon, Jul 25, 2022 at 06:29:04PM -0500, Bryan Brattlof wrote:
> On July 22, 2022 thus sayeth Tom Rini:
> > On Thu, Jul 21, 2022 at 09:31:30PM -0500, Bryan Brattlof wrote:
> > > On July 21, 2022 thus sayeth Denys Dmytriyenko:
> > > > I don't think this is a correct solution, or maybe I'm not understanding the 
> > > > problem. Can you please elaborate a bit more on the problem?
> > > >
> > > 
> > > I'm fairly new to yocto so I'm sure I've found the entirely wrong way to 
> > > get what I wanted :)
> > > 
> > > After boot it appears /etc/fstab is setup to mount our vfat boot 
> > > partition to the /boot directory currently holding the Image and dtbs.  
> > > I guess because uboot has already thrown the kernel and dtb into ddr at 
> > > this point only Anand was able to notice this.
> > > 
> > > My change should mount the vfat partition to /boot/firmware so we can 
> > > access to both our spls and kernel binaries in /boot.
> > > 
> > > I'm also not sure what folder name to use here. It seem like there may 
> > > be a standard to this? Would /boot/uboot be more correct?
> > 
> > So which SoCs are we talking about here?  For the 64bit parts, the
> > intention should be that the FAT partition on p1 be functional as the
> > ESP.  So that means mounting it to /boot/efi.  But I'm not sure off-hand
> > how that's being treated in upstream OE around the notion of making an
> > image that's what a UEFI system expects.
> 
> Ideally this should be for all TI's K3 devices. I'm unfamiliar with the 
> UEFI format and don't know if we currently follow it, however I like the 
> idea of /boot/efi from what I googled.  I also found raspian is using 
> /boot/firmware. Could this be less of a standard than I think?

Keep in mind this is a generic OE on 64bit Arm problem and not a TI
specific problem.  Where to mount the ESP should have a consistent
default.  And it should look like it does on an off the shelf distro.

-- 
Tom

