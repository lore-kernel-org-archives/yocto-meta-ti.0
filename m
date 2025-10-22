Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2A4CCD195
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 10:55:14 +0000 (UTC)
Subject: Re: [scarthgap/master][PATCH] conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
To: meta-ti@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Firefox 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 22 Oct 2025 03:55:10 -0700
References: <26313.1760592243413874082@lists.yoctoproject.org>
In-Reply-To: <26313.1760592243413874082@lists.yoctoproject.org>
Message-ID: <13211.1761130510356553328@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Oct 2025 10:55:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19155

On Thu, Oct 16, 2025 at 10:54 AM, Jeevan wrote:

>
> On Wed, Oct 15, 2025 at 10:20 PM, Denys Dmytriyenko wrote:
>=20
> >
> > On Wed, Oct 15, 2025 at 10:03:36PM +0530, Jeevan via lists.yoctoproject=
.org
> > wrote:
> > > New features added require another increase to max_leb_cnt
> >=20

Ping on this patch. Processor SDK builds are failing due to insufficient ma=
x_leb_cnt.=20


> > Quick question - is UBI still being used and/or tested on these platfor=
ms?
> >=20
> > If this is no longer part of regular testing, maybe it's time to disabl=
e UBI
>=20
> > by default?
> >=20
>=20
> We need to maintain this as UBIFS is being tested for NAND on am335x and
> am437x.=20
>=20
> >=20
> > > Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> > > ---
> > >  meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
> > >  meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf
> > b/meta-ti-bsp/conf/machine/am335x-evm.conf
> > > index 029e761b..cc5d87d7 100644
> > > --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
> > > +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
> > > @@ -22,7 +22,7 @@ SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS3"
> > >  # UBI: logical eraseblock size:    126976 bytes
> > >  # from ubiattach stdout:
> > >  # UBI device number 0, total 1988 LEBs
> > > -MKUBIFS_ARGS ?=3D "-F -m 2048 -e 126976 -c 16000"
> > > +MKUBIFS_ARGS ?=3D "-F -m 2048 -e 126976 -c 18000"
> > > =20
> > >  # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> > >  # from dmesg:
> > > diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf
> > b/meta-ti-bsp/conf/machine/am437x-evm.conf
> > > index 248add70..bbe956f2 100644
> > > --- a/meta-ti-bsp/conf/machine/am437x-evm.conf
> > > +++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
> > > @@ -21,7 +21,7 @@ SERIAL_CONSOLES =3D "115200;ttyS0"
> > >  # UBI: logical eraseblock size:    253952 bytes
> > >  # from ubiattach stdout:
> > >  # UBI device number 0, total 994 LEBs
> > > -MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 8000"
> > > +MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 10000"
> > > =20
> > >  # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
> > >  # from dmesg:
> > > --=20
> > > 2.34.1
> >
>

