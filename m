Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCACC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 19:45:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.90797.1753731933325564744
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 12:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE11640CB8;
	Mon, 28 Jul 2025 19:45:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2AY24B5GXHhv; Mon, 28 Jul 2025 19:45:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6BE8E40CB7;
	Mon, 28 Jul 2025 19:45:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2698A16D17E; Mon, 28 Jul 2025 15:45:28 -0400 (EDT)
Date: Mon, 28 Jul 2025 15:45:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
Message-ID: <20250728194528.GM24899@denix.org>
References: <20250728165437.571427-1-afd@ti.com>
 <20250728165437.571427-3-afd@ti.com>
 <20250728182531.GJ24899@denix.org>
 <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 19:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18845

On Mon, Jul 28, 2025 at 11:28:36AM -0700, Khem Raj wrote:
> On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
> lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wrote=
:
> >
> > On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via lists.yoct=
oproject.org wrote:
> > > For all our platforms booting with EFI there is only one option tod=
ay.
> > > The timeout gives the user 3 seconds to choose a different option, =
but
> > > as there is only one, this just causes a needless 3 second delay in
> > > boot time. Remove this delay and boot the only option immediately.
> > > If we ever have more than one option we can always add this back.
> >
> > Well, menu delay in grub is not only used for selecting among availab=
le
> > predefined options, but also for interactively editing the command li=
ne
> > on the fly before booting.
> >
>=20
> for development, this sounds good, for production not so much.

Sure. And we also disable e.g. U-boot boot prompt delay all the time for =
our=20
customers during production hardening stage, among many other similar ite=
ms.=20
But it is done for the final product - I don't think it should be done in=
 a=20
generic BSP layer that many use for development.


> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > ---
> > >  meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp=
/wic/sdimage-2part-efi.wks.in
> > > index 7252411c..c1089762 100644
> > > --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > > +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > > @@ -3,6 +3,6 @@
> > >  # supports EFI.  Boot files are located in the first vfat partitio=
n with extra
> > >  # reserved space.  We cannot use a GPT here.
> > >
> > > -bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
> > > +bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait ${=
TI_WKS_BOOTLOADER_APPEND}"
> > >  part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-size 128M
> > >  part / --source rootfs --fstype=3Dext4 --label root --align 1024 -=
-use-uuid
> > > --
> > > 2.39.2

