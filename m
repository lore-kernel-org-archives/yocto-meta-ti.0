Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C33C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 23:39:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9772.1673393945024365888
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 15:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB67B40C2A;
	Tue, 10 Jan 2023 23:39:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvshzP3V-qQk; Tue, 10 Jan 2023 23:39:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B294740429;
	Tue, 10 Jan 2023 23:39:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 263891636F5; Tue, 10 Jan 2023 18:38:43 -0500 (EST)
Date: Tue, 10 Jan 2023 18:38:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-ti][dunfell][PATCH 2/2] optee-os: add back
 allow-setting-sysroot-for-libgcc-lookup.patch
Message-ID: <20230110233843.GT22689@denix.org>
References: <20221213183818.206660-1-jose.quaresma@foundries.io>
 <17306E4919830D85.9432@lists.yoctoproject.org>
 <CANPvuRmgtz2dJARawU8GBi=2_8o6qGbVL9vUAtRS78_1=ORHmQ@mail.gmail.com>
 <17373675ABC771C1.27663@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <17373675ABC771C1.27663@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jan 2023 23:39:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15545

Ok, this is not specific to the host OS.

It is toolchain-specific though - it doesn't fail with the external Arm=20
toolchain, but fails with the toolchain built by OE, i.e. Poky, etc.


On Wed, Jan 04, 2023 at 03:54:05PM -0500, Denys Dmytriyenko wrote:
> Not being able to reproduce the issue here:
>=20
> $ MACHINE=3Dam64xx-evm bitbake optee-os
>=20
> Builds just fine.
>=20
> Any more pointers - host OS/version, etc? I'm building Dunfell in Ubunt=
u 18.04=20
> container, but can try a newer one if that's the culprit.
>=20
>=20
> On Wed, Jan 04, 2023 at 07:18:50PM +0000, Jose Quaresma wrote:
> > Friendly ping :)
> >=20
> > thanks
> >=20
> > Jose Quaresma via lists.yoctoproject.org <quaresma.jose=3D
> > gmail.com@lists.yoctoproject.org> escreveu no dia ter=E7a, 13/12/2022=
 =E0(s)
> > 18:38:
> >=20
> > > f8182afd optee: Upgrade to upstream 3.17.0
> > > removes this patch but this is still required
> > >
> > > Currently building with am62xx-evm/am64xx-evm machine fails with:
> > >
> > > | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or
> > > directory
> > > | make: *** [ldelf/link.mk:60: out/arm-plat-k3/ldelf/ldelf.elf] Err=
or 1
> > > | make: *** Waiting for unfinished jobs....
> > >
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > ---
> > >  ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 +++++++++++++++=
++++
> > >  recipes-security/optee/optee-os_%.bbappend    |  6 +++-
> > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > >  create mode 100644
> > > recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libg=
cc-lookup.patch
> > >
> > > diff --git
> > > a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-li=
bgcc-lookup.patch
> > > b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-li=
bgcc-lookup.patch
> > > new file mode 100644
> > > index 00000000..17005396
> > > --- /dev/null
> > > +++
> > > b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-li=
bgcc-lookup.patch
> > > @@ -0,0 +1,34 @@
> > > +From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 =
2001
> > > +From: Ross Burton <ross.burton@arm.com>
> > > +Date: Tue, 26 May 2020 14:38:02 -0500
> > > +Subject: [PATCH] allow setting sysroot for libgcc lookup
> > > +
> > > +Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable whe=
n
> > > searching
> > > +for the compiler libraries as there's no easy way to reliably pass
> > > --sysroot
> > > +otherwise.
> > > +
> > > +Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issue=
s/4188]
> > > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > +---
> > > + mk/gcc.mk | 6 +++---
> > > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/mk/gcc.mk b/mk/gcc.mk
> > > +index adc77a24..81bfa78a 100644
> > > +--- a/mk/gcc.mk
> > > ++++ b/mk/gcc.mk
> > > +@@ -13,11 +13,11 @@ nostdinc$(sm)      :=3D -nostdinc -isystem $(s=
hell
> > > $(CC$(sm)) \
> > > +                       -print-file-name=3Dinclude 2> /dev/null)
> > > +
> > > + # Get location of libgcc from gcc
> > > +-libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm)))=
 \
> > > ++libgcc$(sm)   :=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS)
> > > $(CFLAGS$(arch-bits-$(sm))) \
> > > +                       -print-libgcc-file-name 2> /dev/null)
> > > +-libstdc++$(sm)        :=3D $(shell $(CXX$(sm))
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > ++libstdc++$(sm)        :=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CF=
LAGS)
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > +                       -print-file-name=3Dlibstdc++.a 2> /dev/null=
)
> > > +-libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm))
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > ++libgcc_eh$(sm)        :=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CF=
LAGS)
> > > $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> > > +                       -print-file-name=3Dlibgcc_eh.a 2> /dev/null=
)
> > > +
> > > + # Define these to something to discover accidental use
> > > diff --git a/recipes-security/optee/optee-os_%.bbappend
> > > b/recipes-security/optee/optee-os_%.bbappend
> > > index 751dc3d0..e8af0124 100644
> > > --- a/recipes-security/optee/optee-os_%.bbappend
> > > +++ b/recipes-security/optee/optee-os_%.bbappend
> > > @@ -1,6 +1,10 @@
> > > +FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
> > > +
> > >  PV_ti-soc =3D "3.19.0+git${SRCPV}"
> > >  SRCREV_ti-soc =3D "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
> > > -SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3D=
https"
> > > +SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3D=
https \
> > > +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > > +"
> > >
> > >  DEPENDS_append_ti-soc =3D " python3-cryptography-native"
> > >
> > > --
> > > 2.38.2

