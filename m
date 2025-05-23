Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAD8C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 23:38:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.405.1748043524627726564
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 May 2025 16:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 870B040CBD;
	Fri, 23 May 2025 23:38:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtT0ExVmAHEF; Fri, 23 May 2025 23:38:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4904F40C2B;
	Fri, 23 May 2025 23:38:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A76CA168EC0; Fri, 23 May 2025 19:38:39 -0400 (EDT)
Date: Fri, 23 May 2025 19:38:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH 5/6] beagley-ai: upgrade BeagleY-AI
 to 6.12
Message-ID: <20250523233839.GJ18383@denix.org>
References: <20250517005430.3648211-1-denis@denix.org>
 <20250517005430.3648211-5-denis@denix.org>
 <23d2cb8c-3603-4389-8737-caf2fc9b3d0f@ti.com>
 <20250519175202.GZ18383@denix.org>
 <CAOCHtYhAwQ=NXkgYzgTcCZnPjOzXcWPn3LBA6u4f1WAfGvbExg@mail.gmail.com>
 <CAOCHtYg2Vr0USbPbT9tryNw7-Qr0QjOHeYBsbPt=jtuE4-c3+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOCHtYg2Vr0USbPbT9tryNw7-Qr0QjOHeYBsbPt=jtuE4-c3+g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 May 2025 23:38:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18598

On Fri, May 23, 2025 at 05:32:14PM -0500, Robert Nelson wrote:
> On Fri, May 23, 2025 at 5:30=E2=80=AFPM Robert Nelson <robertcnelson@gm=
ail.com> wrote:
> >
> > > > >@@ -10,3 +10,10 @@ UBOOT_GIT_URI =3D "git://github.com/beagleboa=
rd/u-boot.git"
> > > > >  UBOOT_GIT_PROTOCOL =3D "https"
> > > > >  BRANCH =3D "v2025.04-Beagle"
> > > > >  SRCREV =3D "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
> > > > >+
> > > > >+BRANCH:beagley-ai =3D "v2025.04-rc3-BeagleY-AI"
> >
> > Ugh... this was a build test of Andrew's patchset!
> >
> > > >
> > > > BeagleY-AI support is now in the latest upstream master. This bra=
nch here
> > > > is missing some updates for BeagleY-AI that can be found in maste=
r.
> > > >
> > > > Would it be better here to take the v2025.07-rc1-Beagle here whic=
h
> > > > includes both these additional BeagleY-AI patches and also PB2 su=
pport?
> > > > Maybe it should be the default then.
> > >
> > > I'd be fine switching to 2025.07 eventually, once it matures a bit =
- I'm not
> > > comfortable taking rc1 at this point.
> > >
> > > We can do this in stages - now update 6.1 -> 6.12 with 2025.04 in a=
 seaprate
> > > branch, then update 2025.04 -> 2025.07 when it's ready (either fina=
l or at
> > > least rc3/rc4).
> >
> > https://github.com/beagleboard/u-boot/tree/v2025.07-rc2-Beagle
>=20
> I also tested on 2 BeaglePlay's and 2 BBAI-64's.. so i've moved
> BeagleY-AI, BeaglePlay and BBAI-64 to v2025.07-rc2..
>=20
> I'll hack on PB2 over the weekend, that's going to take more of a
> cleanup for am6232- -> am62 changes..

Sounds good! I believe this series for meta-ti is ready to be merged, as =
it's=20
been in different stages of testing for quite some time, plus the backlog=
 of=20
pending commits is quite long as it is now. After that we'll be able to d=
o a=20
quick U-boot update to 2025.07 in a couple of weeks, once you push your=20
branches and I do quick testing. Ah, and that means I'll need to get myse=
lf=20
a new PB2 A1...

--=20
Denys

