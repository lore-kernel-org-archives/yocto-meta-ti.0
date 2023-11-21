Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B1CC61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 21:48:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5869.1700603317383079732
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 13:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3400340CB1;
	Tue, 21 Nov 2023 21:48:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9-NyPJuxDz5; Tue, 21 Nov 2023 21:48:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C0A4740A2F;
	Tue, 21 Nov 2023 21:48:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E3B7163D64; Tue, 21 Nov 2023 16:48:34 -0500 (EST)
Date: Tue, 21 Nov 2023 16:48:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH] k3r5: ensure separate
 TMPDIR used for this multiconfig
Message-ID: <20231121214834.GC26739@denix.org>
References: <20231112190743.1496752-1-denis@denix.org>
 <CANPvuRmdh8EteVzjJto1BgLYdiO1HGdUxihvsDrEYgv3YykOJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuRmdh8EteVzjJto1BgLYdiO1HGdUxihvsDrEYgv3YykOJg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 21:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17320

On Mon, Nov 13, 2023 at 01:20:25PM +0000, Jose Quaresma wrote:
> Denys Dmytriyenko <denis@denix.org> escreveu no dia domingo, 12/11/2023
> =E0(s) 19:07:
>=20
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >
> > This k3r5 multiconfig builds baremetal components (and corresponding
> > native,
> > nativesdk and cross tools) and sets TCLIBC accordingly to "baremetal"=
. The
> > expectation is that those components and tools will use a separate TM=
PDIR
> > to isolate from the main Linux build that uses "glibc" TCLIBC and to =
avoid
> > potential conflicts.
> >
> > OE-Core "nodistro" default configuration already sets TCLIBCAPPEND fa=
cility
> > to automatically add a suffix to TMPDIR, resulting in "tmp-baremetal"=
 temp
> > directory for this multiconfig and "tmp-glibc" for the main Linux one=
.
> > Other
> > distros like Arago follow this convention and even extend a bit (e.g.=
 Arago
> > also adds TCMODE suffix to TMPDIR for external toolchain support
> > separation).
> >
> > But Poky (and derivative distros, like AGL or YoE) disable TCLIBCAPPE=
ND and
> > result in a combined TMPDIR, leading to potential conflicts, such as:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15273
> >
> > And that's just the beginning, there were other conflicts observed la=
ter in
> > the build, e.g. during nativesdk builds - that's why we also set a un=
ique
> > SDKPKGSUFFIX here.
> >
> > To force a separate TMPDIR for k3r5 multiconfig, we have to directly =
append
> > a suffix to it. Multiple other options were tested in hopes of making=
 it
> > slightly cleaner, but they either didn't work or were dismissed. For
> > example,
> > trying to override TCLIBCAPPEND getting cleared by a distro would req=
uire
> > using a machine/soc-override, which doesn't have enough scope (native=
sdk)
> > or forcing it with :forcevariable would also change the main Linux TM=
PDIR
> > and affect existing CI flows. Also, using TCLIBC itself as a suffix t=
o add
> > to TMPDIR may result in getting it appended twice (tmp-baremetal-bare=
metal)
> > when normal TCLIBCAPPEND facility is used. Hence the least
> > invasive/confusing
> > option is to always append "-k3r5" suffix to this multiconfig TMPDIR.=
 That
> > results in "tmp-k3r5" in Poky (leaving main TMPDIR as "tmp"), while O=
E-Core
> > "nodistro" and Arago would end up with "tmp-baremetal-k3r5" (and
> > "tmp-glibc"
> > for the main).
> >
> > Also note, meta-ti-bsp layer.conf sets up images and sdks to be deplo=
yed
> > into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY varia=
ble
> > that controls it is set weakly, allowing to be modified from a distro
> > configuration or local.conf. It means that all images and sdks can be
> > deployed into the main TMPDIR if one's CI flow expects tmp/deploy/ as
> > the final destination, by using :=3D for immediate variable expansion=
:
> > TI_COMMON_DEPLOY :=3D "${TMPDIR}/deploy"
> >
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > index 04b9a746..e36c87ed 100644
> > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > @@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 =3D
> > "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
> >
> >  MACHINE:append =3D "-k3r5"
> >  TCLIBC =3D "baremetal"
> > +TMPDIR:append =3D "-k3r5"
> > +
> >
>=20
> Thanks for fixing this long remaining issue on the kirkstone branch.
>=20
> AFAIK all the collision issues are mostly fixed on oe-core master.

Yes, there were several related fixes in oe-core master recently, correct=
.=20
But not everything was fixes yet even in master.


> For me there are still sporadic failures with the SPDX bbclass.

And SPDX was one of the areas that seen collision fixes in master.=20
Unfortunately, those fixes have very little chances to get backported=20
to kirkstone. Hence this change.


> Can this change be optional? with something like:
>=20
> TMPDIRAPPEND ?=3D "-k3r5"
> TMPDIR:append =3D "${TMPDIRAPPEND}"
>=20
> This adds the possibility of more easily reverting this change
> to being able to fix what is pending in oe-core master.

The point of this fix was to force separate TMPDIRs to avoid potential=20
breakage - I was not planning on making it optional...

The request seems to be very specific to layer/framework debugging purpos=
es=20
at which point this can be modified directly in the conf file. Allowing i=
t to=20
be disabled cleanly for a build seems dubious. But if there's a strong de=
sire,=20
I can send a v2...

--=20
Denys

