Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB10C43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:49:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.401.1654102142232080321
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 09:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF17B40CCF;
	Wed,  1 Jun 2022 16:49:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7g5SqCQKOoEn; Wed,  1 Jun 2022 16:49:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A57B440CCB;
	Wed,  1 Jun 2022 16:48:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D69DB17495B; Wed,  1 Jun 2022 12:48:56 -0400 (EDT)
Date: Wed, 1 Jun 2022 12:48:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Christopher Larson <kergoth@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, meta-ti@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-ti] [PATCH] multiconfig: use diferent TMPDIR for each
 machine
Message-ID: <20220601164856.GH9834@denix.org>
References: <20220530143810.4064720-1-jose.quaresma@foundries.io>
 <20220531193302.GC9834@denix.org>
 <CANPvuRkX=xftYt2RWasxE-E2MJJuKBhdQdV+jQg15tH3TpSMwg@mail.gmail.com>
 <CABcZAN=0fXtmoVK2WfvUjOuptOpDbqk-uvk_EJAesdXR2c71pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: 
 <CABcZAN=0fXtmoVK2WfvUjOuptOpDbqk-uvk_EJAesdXR2c71pg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jun 2022 16:49:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14771

On Wed, Jun 01, 2022 at 09:32:58AM -0700, Christopher Larson wrote:
> Multi-machine builds in a single tmpdir has been supported by oe since
> before multiconfig existed, and certainly works fine with multiconfig, =
it's
> only other configuration changes, such as distro, that result in confli=
cts
> and failures when using multiconfig in a single tmpdir. I don't think i=
t's
> a good idea to force the matter due to flaws in archiver, personally.

Yes, I agree that in this case it is best to fix the archiver class.

The reason everything else just works is because there's already per-mach=
ine=20
separation in many places - deploy, images, work, cache, stamps, etc.

There's also a great re-use of shared components between similar machines=
=20
built in the same tmpdir. As Chris says, this always worked even before=20
multiconfig - you just change MACHINE and re-run bitbake. And multiconfig=
=20
simply allows doing it in one invocation of bitbake, that's all.

Denys


> On Wed, Jun 1, 2022 at 2:17 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>=20
> >
> >
> > Denys Dmytriyenko <denis@denix.org> escreveu no dia ter=E7a, 31/05/20=
22
> > =E0(s) 20:33:
> >
> >> On Mon, May 30, 2022 at 03:38:10PM +0100, Jose Quaresma wrote:
> >> > Bitbake manual [1] recomends to use one TMPDIR for each machine:
> >> >
> >> >  "Minimally, each configuration file must define the machine and t=
he
> >> >  temporary directory BitBake uses for the build.
> >> >  Suggested practice dictates that you do not overlap the temporary
> >> >  directories used during the builds."
> >>
> >> What specific issue are you trying to fix with this?
> >>
> >
> > The issue that I have is in the OE-core archiver.bbclasse that doesn'=
t
> > support multiconfig when
> > using the same TMPDIR, this because the shared recipes like gcc, kern=
el
> >
> > It can be replicates in kirkstone using the am64xx-evm with the follo=
wing:
> >
> > # archive sources for target recipes in conf/local.conf
> > INHERIT +=3D "archiver"
> > COPYLEFT_RECIPE_TYPES =3D "target"
> > ARCHIVER_MODE[src] =3D "original"
> > ARCHIVER_MODE[diff] =3D "1"
> >
> > # and run bitbake with:
> > bitbake mc:k3r5:gcc-source-11.2.0 gcc-source-11.2.0 -c do_unpack_and_=
patch
> > -f
> >
> > more info in following patch:
> > https://lists.openembedded.org/g/openembedded-core/message/166203
> >
> >
> >> I'm not aware of any immediate issues (because here multiconfig is u=
sed
> >> for
> >> completely separate machines and those are well isolated inside the =
temp
> >> dir),
> >> but I see few problems this will cause down the road, so I'm against=
 this
> >> change.
> >>
> >
> > What you are saying is that this change will introduce new  problems =
or
> > regressions?
> >
> > Jose
> >
> >
> >>
> >>
> >> > [1]
> >> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-us=
er-manual-intro.html#executing-a-multiple-configuration-build
> >> >
> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> > ---
> >> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >> b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >> > index deb07210..0ba163ae 100644
> >> > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >> > +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> >> > @@ -3,3 +3,5 @@ MAINMACHINE :=3D "${MACHINE}"
> >> >  DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
> >> >
> >> >  MACHINE:append =3D "-k3r5"
> >> > +
> >> > +TMPDIR =3D "${TOPDIR}/tmp-${MACHINE}"
> >> > --
> >> > 2.36.1
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=E9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#14769):
> > https://lists.yoctoproject.org/g/meta-ti/message/14769
> > Mute This Topic: https://lists.yoctoproject.org/mt/91431962/3617123
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> > kergoth@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
>=20
> --=20
> Christopher Larson
> chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
> Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
> Industries Software

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

