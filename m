Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFA7C761A6
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:39:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24114.1679427562470710042
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 12:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C4A6F40C16;
	Tue, 21 Mar 2023 19:39:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pw8x1SVwn8YS; Tue, 21 Mar 2023 19:39:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DC9440C06;
	Tue, 21 Mar 2023 19:39:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F20701637C5; Tue, 21 Mar 2023 15:38:46 -0400 (EDT)
Date: Tue, 21 Mar 2023 15:38:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [kirkstone][PATCH 11/54] machine: Add AM62Q HS-SE
 evm configuration
Message-ID: <20230321193846.GJ18050@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
 <20230320033840.1193963-12-denis@denix.org>
 <5f879b75-202e-5131-629d-6342f919f9ba@ti.com>
 <20230321191055.GH18050@denix.org>
 <CANPvuR=K0=PHzaxd+9HqyhC6uEh50q9aMB-Tw8CDCz=ZY8mTGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuR=K0=PHzaxd+9HqyhC6uEh50q9aMB-Tw8CDCz=ZY8mTGg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 19:39:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16226

On Tue, Mar 21, 2023 at 07:24:17PM +0000, Jose Quaresma wrote:
> Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=E7a, 21/03/2023=
 =E0(s)
> 19:11:
>=20
> > On Tue, Mar 21, 2023 at 11:11:26AM -0500, Ryan Eatmon wrote:
> > >
> > >
> > > On 3/19/2023 22:37, Denys Dmytriyenko wrote:
> > > >From: Chirag Shilwant <c-shilwant@ti.com>
> > > >
> > > >Lets add the basic AM62Q HS-SE configuration.
> > > >- Add configurations.
> > > >- Add ti-sci-firmware overrides.
> > > >- Add u-boot overrides.
> > > >- Add optee overrides.
> > > >- Add ti-rtos-firmware overrides.
> > > >
> > > >Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> > > >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > > >---
> > > >diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > > >index 37d022e9..77709689 100644
> > > >--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > > >+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > > >@@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
> > > >  SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
> > > >  SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
> > > >  SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
> > > >+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
> > >
> > > Ooops.  We missed a dunfell to kirkstone syntax change.  No need to
> > > send an updated patch, I will just do a git fixup and address it.
> >
> > Ah, nice catch! I guess I've had too many rebases... :)
> > Thanks for very careful reviewing!
> >
> >
> > > Thanks for your hard work on these patch sync ups, Denys.  It is
> > > very much appreciated.
> >
> > The issue is that kirkstone and master have diverged from dunfell too=
 much
> > now
> > and porting changes became heavily manual process and error-prone.
> > Hopefull we
> > can close dunfell for any new features very soon.
> >
>=20
> The dunfell branch supports the new bitbake syntax as well so another
> solution to lower the divergence
> can be mitigating the dunfelll branch to the new syntax, however doing =
that
> won't be easy either.

This would be a major change globally across the layer in dunfell, akin t=
o a=20
new feature. It would require re-testing everything all over again.

Also, it would provide very little benefit, since there were some major l=
ayer=20
restructuring and soc/platform configuration changes in meta-ti in kirkst=
one.

--=20
Denys

