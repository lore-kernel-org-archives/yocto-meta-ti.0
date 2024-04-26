Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716A7C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 19:02:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4117.1714158136697172270
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 12:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 141BE40CBE;
	Fri, 26 Apr 2024 19:02:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inYRC7AqWScd; Fri, 26 Apr 2024 19:02:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF50D40BE6;
	Fri, 26 Apr 2024 19:02:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B6DFE163F49; Fri, 26 Apr 2024 15:02:14 -0400 (EDT)
Date: Fri, 26 Apr 2024 15:02:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap/kirkstone][PATCH v2] wic: prevent
 boot FAT partition mounting under /boot
Message-ID: <20240426190214.GK28791@denix.org>
References: <20240424223624.1938639-1-denis@denix.org>
 <CADL8D3axA893RdRHLVLjhiUyAnX0XHRXtxx993J_U4LhAewpyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADL8D3axA893RdRHLVLjhiUyAnX0XHRXtxx993J_U4LhAewpyw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Apr 2024 19:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17604

Ryan,

Will you be able to pick up v2 of this? Thanks.


On Wed, Apr 24, 2024 at 12:46:48PM -1000, Jon Cormier wrote:
> Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
>=20
> On Wed, Apr 24, 2024, 12:36=E2=80=AFPM Denys Dmytriyenko via lists.yoct=
oproject.org
> <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>=20
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >
> > Separate FAT boot partition holds SPL, SYSFW and U-boot images, while
> > rootfs places kernel images and DTBs into /boot directory. So it is n=
ot
> > desirable to mount boot FAT partition into /boot directory of the roo=
tfs
> > and shadow its original content - adjust corresponding entry in wic
> > templates.
> >
> > While at it, remove unused ondisk parameter when using use-uuid, whic=
h
> > takes precedence and is more flexible.
> >
> > Note: boot FAT partition will be automounted at /run/media/boot-mmcbl=
k0p1/
> >
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> > v2 changes:
> > * remove <mountpoint> from boot partition to avoid undocumented behav=
ior
> > * add explicit size specifier to --fixed-size 128M
> >
> >  meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 3 ++-
> >  meta-ti-bsp/wic/sdimage-2part.wks        | 4 ++--
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/w=
ic/
> > sdimage-2part-efi.wks.in
> > index 2213a348..ca042be1 100644
> > --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> > @@ -2,6 +2,7 @@
> >  # long-description: Creates a partitioned SD card image for TI platf=
orms
> > that
> >  # supports EFI.  Boot files are located in the first vfat partition =
with
> > extra
> >  # reserved space.  We cannot use a GPT here.
> > +
> >  bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4"
> > -part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PRO=
VIDER}"
> > --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-size
> > 128M
> > +part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER}=
"
> > --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fixed=
-size
> > 128M
> >  part / --source rootfs --fstype=3Dext4 --label root --align 1024 --u=
se-uuid
> > diff --git a/meta-ti-bsp/wic/sdimage-2part.wks
> > b/meta-ti-bsp/wic/sdimage-2part.wks
> > index 3eab9407..5073176e 100644
> > --- a/meta-ti-bsp/wic/sdimage-2part.wks
> > +++ b/meta-ti-bsp/wic/sdimage-2part.wks
> > @@ -2,5 +2,5 @@
> >  # long-description: Creates a partitioned SD card image for TI platf=
orms.
> >  # Boot files are located in the first vfat partition with extra rese=
rved
> > space.
> >
> > -part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=3Dvf=
at
> > --label boot --active --align 1024 --fixed-size 128 --use-uuid
> > -part / --source rootfs --ondisk mmcblk0 --fstype=3Dext4 --label root
> > --align 1024 --use-uuid
> > +part --source bootimg-partition --fstype=3Dvfat --label boot --activ=
e
> > --align 1024 --use-uuid --fixed-size 128M
> > +part / --source rootfs --fstype=3Dext4 --label root --align 1024 --u=
se-uuid
> > --
> > 2.25.1

