Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FFEC36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 23:10:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.526.1742425850822587547
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 16:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCA9040C56;
	Wed, 19 Mar 2025 23:10:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnYG6kPptaWL; Wed, 19 Mar 2025 23:10:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FB8740A2F;
	Wed, 19 Mar 2025 23:10:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F390D16439D; Wed, 19 Mar 2025 19:10:46 -0400 (EDT)
Date: Wed, 19 Mar 2025 19:10:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: afd@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] Re: [meta-ti][scarthgap/master][PATCH v5 3/3]
 recipes-graphics: port gc320 libs to work on kernel 6.12
Message-ID: <20250319231046.GN23729@denix.org>
References: <20250318023836.3507801-1-a-christidis@ti.com>
 <20250318023836.3507801-4-a-christidis@ti.com>
 <9859996f-68b6-485c-86cb-9182c5a5e219@ti.com>
 <20250318213853.GL23729@denix.org>
 <9c50229e-235d-4825-a3cd-1053f51bc234@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9c50229e-235d-4825-a3cd-1053f51bc234@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Mar 2025 23:10:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18412

On Wed, Mar 19, 2025 at 01:22:41PM -0500, Antonios Christidis wrote:
>=20
> On 3/18/25 4:38 PM, Denys Dmytriyenko wrote:
> >On Tue, Mar 18, 2025 at 04:=E2=80=8A01:=E2=80=8A37PM -0500, Andrew Dav=
is via
> >lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > On 3/17/25 9:=E2=80=8A=
38 PM, Antonios
> >Christidis via lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > >From=
: Antonios
> >Christidis <a-christidis@=E2=80=8Ati.=E2=80=8Acom> > >
> >ZjQcmQRYFpfptBannerStart
> >This message was sent from outside of Texas Instruments.
> >Do not click links or open attachments unless you recognize the
> >source of this email and know the content is safe.
> >Report=C2=A0Suspicious
> ><https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uPdqXRfP1m17CwYk=
HLKDfHEYvlwyW_vqb9VOfJCHARPcQCe_gAXq208Sc3o-G_CVgqCM4tPnpSqs9A$>
> >
> >ZjQcmQRYFpfptBannerEnd
> >On Tue, Mar 18, 2025 at 04:01:37PM -0500, Andrew Davis via lists.yocto=
project.org wrote:
> >> On 3/17/25 9:38 PM, Antonios Christidis via lists.yoctoproject.org w=
rote:
> >> >From: Antonios Christidis <a-christidis@ti.com>
> >> >
> >> >The user mode libraries needed recompiling with the scarthgap revis=
ion of gcc to
> >> >remove all the warnings about 32bit API usage during the linking st=
age, new
> >> >SRCREV and branch includes this changes. Versions of the libraries =
remain the
> >> >same.
> >> >
> >> >Signed-off-by: Antonios Christidis <a-christidis@ti>
> >> >---
> >> >v5:
> >> >- Move the symb link of libGAL.so within the ${PN} package. While m=
aking
> >> >   sure the header files are part of the ${PN}-dev package.
> >> >
> >> >v3:
> >> >- Removed commented lines and extra lib directory that was being cr=
eated
> >> >   in do_install()
> >> >
> >> >v2:
> >> >- No longer include withing the PN package /usr/include file and sy=
mb
> >> >   link to library file. This is done by not chaning the FILES/PACK=
AGES
> >> >   variables, thus creating a -dev package.
> >> >
> >> >  .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 +++=
++---
> >> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >> >
> >> >diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.=
11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> >> >index 807f421c..6b7226ab 100644
> >> >--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.b=
b
> >> >+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.b=
b
> >> >@@ -11,10 +11,10 @@ COMPATIBLE_MACHINE =3D "omap-a15"
> >> >  CLEANBROKEN =3D "1"
> >> >-BRANCH =3D "ti-${PV}"
> >> >+BRANCH =3D "ti-${PV}-scarthgap"
> >> >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-gc320-libs.git;prot=
ocol=3Dhttps;branch=3D${BRANCH}"
> >> >-SRCREV =3D "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
> >> >+SRCREV =3D "85c175e8425c33dda6e272aeb45afe0f69a79096"
> >> >  RRECOMMENDS:${PN} =3D "ti-gc320-driver"
> >> >@@ -43,4 +43,6 @@ do_install() {
> >> >      chown -R root:root ${D}
> >> >  }
> >> >-INSANE_SKIP:${PN} +=3D "ldflags"
> >> >+FILES:${PN}:append =3D " ${libdir}"
> >> > FILES:${PN} +=3D "${libdir}" ?
> >
> >1. I agree it's best not to use blank :append overrides and instead us=
e +=3D
> >2. ${libdir} is already a default and doesn't need to be added explici=
tly
>=20
> Regarding #1, moving forward I'll prefer to use "+=3D" instead of the
> "append". This will be included in a new version of the series.
> Regarding #2, the default search pattern for ${PN} packages is:
> "/usr/lib/lib*.so.* /usr/lib/*.so.*" so the symb link would never
> get included in the ${PN} package. I was not clear enough when
> making my change, but by explicitly stating ${libdir} the symb link
> is included in the ${PN} package.

As I had previously detailed in another thread to you[1], the best approa=
ch=20
is to override SOLIBS and FILES_SOLIBSDEV variables to make it explicit:
[1] https://lists.yoctoproject.org/g/meta-arago/message/15960

SOLIBS =3D ".so"
FILES_SOLIBSDEV =3D ""

It is also acceptable to adjust FILES:${PN} for the same, but you do want=
 to=20
explain it, e.g. in the comment...

--=20
Denys

