Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1ACC7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 21:08:12 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.6884.1750453687699938987
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 14:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=DEi0stwg;
 spf=pass (domain: criticallink.com, ip: 209.85.219.173, mailfrom: jcormier@criticallink.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e81ec95d944so1995849276.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jun 2025 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1750453687; x=1751058487; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y+DPw/jutlA+RBljLQA9YlzfCIcn/NwMWMwTLS2bss=;
        b=DEi0stwgFhD388bG9zBbabGXbxCbfTrmKMB/VlFlXPMkviZz07JM3vCMSH82D/vD8M
         HAQftgGxzbsutLdsM+/5z+uvk09d3vBhMf5s4NU4Ye56Hekrmt+Vry2MyKMWo7bdpWVw
         1ZUBBF0OOlM1wU8KjFMV1SpSbHFNPYowKeEhXuglq4Fb0wplG5Cv6Bt8RBrdl41cQq4F
         cEaP76CBr19MDssTST49WaPMsDY6c6AdqsppUBZJzHormv9m5dQNcHrRDiktz8Ai+DbV
         03RiyTS8i022lxHwtO0OVNY7sZCHtxn88bmFNryma5EhpPNBZ6x9hq0VqNoXw+y29oGG
         2OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453687; x=1751058487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y+DPw/jutlA+RBljLQA9YlzfCIcn/NwMWMwTLS2bss=;
        b=sC7OiWHi0LpjUsU2vrEU52UjHqlStsD+/P9TV6neoDUFN1oPEXObMdCAI6HrRnIbqY
         vvm0v+WM3/QkEVmwm1UKST6UUJd1MWcoW1phU1kT5FBYI+HpOI7O7fdCYUMQJ32oqEN4
         0wVjf5v5ME/kuZX3PZH7rVt4+sdWkD/Ektv8jMq7Elbk06KuNnl3cTjtHRRnd7Ggzi4r
         mk2AU10ga6sPgqu2nU2T/bmWHccy9thg12S0m1+JKZJQa8Fttfd2jMNpesVD97GWY5dJ
         yOJTYgngv34eflkAMEAJbeEKKKrYUSUBm1kO8VFMpkEDnZFdsPTQ0c6Q+m4x8BlfY4LO
         AyKw==
X-Forwarded-Encrypted: i=1; AJvYcCU9bEctYqQwJK7nzWqcyPKoXQDSCRFU/aFv5s74JhfT7z6q14nkcCzYxH9TkBMKPY7XnkH1QSWJ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz+hEsxUowcBV3oBxTVa33V9wlcMdF8bh5darisUFeXSq3o8uWF
	mAmJ04RQCdztNnlPFq97n8X6SFWQPjEQZAU/QaOFs/NqI733IL9gL7vxuAGgILDd0vGJXC3ACdF
	f4u8lJkV7etXTLvQR4PpAlckXH6FNLGmG97GWKsTI
X-Gm-Gg: ASbGnctIJ3bb5TcsOL2dcF8ib7NyeOdfHL5N+qkqHk5v9P48IP19k9qtj6XkfnN4anS
	fjy1Q/nqZ93Zr+JZ1yH8rrsADt6iI8AAp2e4snCrYY/5MXBcquL++sU5+Tj6CzPbHGxcYIL/nMm
	YHIHYxlgHtln7xom00dOWHeNDtutjFm0JYlUWH8Sy8jQ==
X-Google-Smtp-Source: AGHT+IHT24F3gWup+z2utBO3zb58pBt+4zHyTnavCZJ+tZY3eL/iagNDnofsbgqQmdFt79ze6M/zCP4KRmMqtOpSoqY=
X-Received: by 2002:a05:690c:9418:10b0:712:c295:d01f with SMTP id
 00721157ae682-712ca2f7576mr34512877b3.3.1750453686732; Fri, 20 Jun 2025
 14:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca>
 <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com> <535c39ee-0174-b4ef-e3ef-5500cb493762@crashcourse.ca>
 <20250620184347.GI18383@denix.org>
In-Reply-To: <20250620184347.GI18383@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 20 Jun 2025 17:07:55 -0400
X-Gm-Features: AX0GCFucsTqXCA7WvpEMYQE2lwljCMkumHG8Y7Otm9BbpsFasv90mTB2uxMjQ4E
Message-ID: <CADL8D3bd2uX_QzwOHZKDnwhRN9dsTZ3zOVv8MyBDJaDDGBSrcg@mail.gmail.com>
Subject: Re: [meta-ti] is this the right place to ask about building for
 PocketBeagle 2?
To: denis@denix.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jun 2025 21:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18662

Likely you need to add wic to IMAGE_FSTYPES.

IMAGE_FSTYPES +=3D "wic wic.xz wic.bmap"


On Fri, Jun 20, 2025 at 2:43=E2=80=AFPM Denys Dmytriyenko via
lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>
> On Fri, Jun 20, 2025 at 12:27:47PM -0400, Robert P. J. Day wrote:
> > On Thu, 19 Jun 2025, Andrew Davis wrote:
> >
> > > On 6/19/25 6:50 AM, Robert P. J. Day wrote:
> > > > is this the right place to ask about building for PocketBeagle 2?
> > >
> > > The Beagle forums and Discord channel are probably the best place,
> > > but we are friendly here so let's see if we can help you out :)
> > >
> > > >    I'm trying to build a simple core-image-minimal for the
> > > > PocketBeagle 2; I've checked out the walnascar branch for Poky, and
> > > > the master branches for all of meta-ti and meta-arm. (I'm using
> > > > MACHINE "pocketbeagle2").
> > > >
> > > Why use walnascar for Poky but master for the other branches? You sho=
uldn't
> > > mix like that, if you want master then all branches should be master.=
 Note
> > > though that master is a moving target and there is no guarantee to bu=
ild.
> > >
> > > We don't provide a walnascar branch for meta-ti, but if you want to s=
et
> > > all your layers back to scarthgap then you should have no issue build=
ing
> > > for pocketbeagle2.
> > >
> > > Looking at the actual issue, seems to be some failure building re2c
> > > which is provided by the oe-core layer, nothing specific to TI or
> > > the PocketBeagle2. Also looks like re2c was updated to 4.2 back in
> > > May so I'd also guess you haven't updated your branches in a while,
> > > start with that.
> > >
> > > Andrew
> >
> >   Thanks for your guidance ... I eventually got a build, despite
> > weird, non-reproducible build errors. In the end, I built a
> > core-image-minimal for the PocketBeagle2, but did not get a final SD
> > card image, so I guess there's no .wks file that's associated with
> > this particular build. I will keep poking around.
>
> # pre-expansion value:
> #   "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.w=
ks.in", "sdimage-2part.wks", d)}"
> WKS_FILE=3D"sdimage-2part.wks"
>
> --
> Denys
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18661): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18661
> Mute This Topic: https://lists.yoctoproject.org/mt/113723766/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

