Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10771C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 12:29:26 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.7199.1658492959998781921
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Jul 2022 05:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fa3U9ogw;
 spf=pass (domain: konsulko.com, ip: 209.85.219.49,
 mailfrom: trini@konsulko.com)
Received: by mail-qv1-f49.google.com with SMTP id i13so3328370qvo.3
        for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Jul 2022 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X4/7ApaoUUFDDRfrD5nfUukLjwsrk9qCp2tc6vKpP/c=;
        b=fa3U9ogwk5YwEuihH33UaUUa7Xnhx/whVJYPm0zpIH/pqBVYBqDb1pWlMYlRKtcjzC
         UDdtnOl69Tlaq7NMFvvUQehydG3VOaxrn124HwCnjA6HUapnkbrzQD0hbOHYSmi2TL2T
         /cfrRQauf1tYJH42tBKb56DrZRAnPZ7S9yybI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X4/7ApaoUUFDDRfrD5nfUukLjwsrk9qCp2tc6vKpP/c=;
        b=Rbpk5uXvWWsVWBk+/2pT9WNMDYW6ejiY86tFiTbKKkeCp5URqkgJxov8d4zzWfaLMB
         FA+VZ+yeR22ottM7grP5PSpViddQGMPSHGP2zOxtCC7VDhSli8RUknN82cIcONVN007n
         RoJmGacPRqXVVgBqEOXtr8kk9QdufjO81BVkP5GiKA5hBOPDHTVpROV1sVjAVjuqd3lK
         xv6C3QpZiu6Cx2deQXQJ8NgaTemhk5vOsa7qhB74lIr0l7e63FnQ5rMVMr11X7+teHEs
         f1gD8KsZchLsesi3RlYUNLB7IDq66IW8cwji3ygccgcaIF4jqcZcGVEQv6Jr2ML1L+wp
         Fz+A==
X-Gm-Message-State: AJIora/LGm8QOYNR1Xx6eOGFmCeWwQfYH6BOKMyduCH88TmmLbUjyGXY
	bOIOy3pNswtBCEGN9dj+p5EpwQ==
X-Google-Smtp-Source: 
 AGRyM1tF8JiNU78P5ulJPaIcdMA+vfL4BwxQXnPe0eZeXRCVBmxWE8UHG/UpEaY83Xivh/k83FdJRg==
X-Received: by 2002:a05:6214:1d2f:b0:474:60b:2361 with SMTP id
 f15-20020a0562141d2f00b00474060b2361mr373195qvd.56.1658492959061;
        Fri, 22 Jul 2022 05:29:19 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 br13-20020a05622a1e0d00b0031ea2328edcsm2783084qtb.82.2022.07.22.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 05:29:18 -0700 (PDT)
Date: Fri, 22 Jul 2022 08:29:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Bryan Brattlof <bb@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
	Meta-TI <meta-ti@lists.yoctoproject.org>,
	Nishanth Menon <nm@ti.com>, Res Sapp <rs@ti.com>,
	Anand Gadiyar <gadiyar@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [dunfell PATCH] wic: move uboot/spls mountpoint to /boot/firmware
Message-ID: <20220722122916.GZ1146598@bill-the-cat>
References: <20220721210152.28223-1-bb@ti.com>
 <20220721225726.GP18692@denix.org>
 <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722023130.purpy4xkemeiuftp@bryanbrattlof.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Jul 2022 12:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14899

On Thu, Jul 21, 2022 at 09:31:30PM -0500, Bryan Brattlof wrote:
> Hi Denys!
> 
> +Tom Rini
> 
> On July 21, 2022 thus sayeth Denys Dmytriyenko:
> > I don't think this is a correct solution, or maybe I'm not understanding the 
> > problem. Can you please elaborate a bit more on the problem?
> >
> 
> I'm fairly new to yocto so I'm sure I've found the entirely wrong way to 
> get what I wanted :)
> 
> After boot it appears /etc/fstab is setup to mount our vfat boot 
> partition to the /boot directory currently holding the Image and dtbs.  
> I guess because uboot has already thrown the kernel and dtb into ddr at 
> this point only Anand was able to notice this.
> 
> My change should mount the vfat partition to /boot/firmware so we can 
> access to both our spls and kernel binaries in /boot.
> 
> I'm also not sure what folder name to use here. It seem like there may 
> be a standard to this? Would /boot/uboot be more correct?

So which SoCs are we talking about here?  For the 64bit parts, the
intention should be that the FAT partition on p1 be functional as the
ESP.  So that means mounting it to /boot/efi.  But I'm not sure off-hand
how that's being treated in upstream OE around the notion of making an
image that's what a UEFI system expects.

-- 
Tom

