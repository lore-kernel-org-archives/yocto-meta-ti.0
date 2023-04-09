Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760EEC77B6F
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 16:10:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23345.1681056630861103525
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 09 Apr 2023 09:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C4F1640C68;
	Sun,  9 Apr 2023 16:10:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfZU8_a0g55N; Sun,  9 Apr 2023 16:10:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9466C40AC9;
	Sun,  9 Apr 2023 16:10:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E5511637FA; Sun,  9 Apr 2023 12:09:50 -0400 (EDT)
Date: Sun, 9 Apr 2023 12:09:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [master/kirkstone][PATCH 1/5] linux-bb.org: update to 5.10.162
 and dedicated branches
Message-ID: <20230409160950.GP9226@denix.org>
References: <20230407203636.3265548-1-denis@denix.org>
 <20230407203636.3265548-2-denis@denix.org>
 <CAOCHtYjcpjOwOL-kHT7s-HhLzi1CjWx-R0pu2=qBTwWiBJmoUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOCHtYjcpjOwOL-kHT7s-HhLzi1CjWx-R0pu2=qBTwWiBJmoUw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 09 Apr 2023 16:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16332

On Fri, Apr 07, 2023 at 03:50:43PM -0500, Robert Nelson wrote:
> On Fri, Apr 7, 2023 at 3:36=E2=80=AFPM Denys Dmytriyenko <denis@denix.o=
rg> wrote:
> >
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >
> > * Update both 32 and 64-bit trees to 5.10.162
> > * Switch from using a common branch that gets periodically rebased to=
 using
> >   dedicated per-merge branches
> > * Patch 32-bit defconfig to use LZMA compression instead of LZO, that=
 is
> >   being deprecated in OE-Core
> >
> > Cc: Robert Nelson <robertcnelson@gmail.com>
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  ...h-default-kernel-compression-to-LZMA.patch | 30 +++++++++++++++++=
++
> >  .../recipes-kernel/linux/linux-bb.org_git.bb  | 18 ++++++-----
> >  2 files changed, 40 insertions(+), 8 deletions(-)
> >  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/000=
1-defconfig-switch-default-kernel-compression-to-LZMA.patch
> >
> > diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defco=
nfig-switch-default-kernel-compression-to-LZMA.patch b/meta-ti-bsp/recipe=
s-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compress=
ion-to-LZMA.patch
> > new file mode 100644
> > index 00000000..f6bff39f
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-sw=
itch-default-kernel-compression-to-LZMA.patch
> > @@ -0,0 +1,30 @@
> > +From 0ccadc7a676341bbd66eb176308c7c59931e9dd2 Mon Sep 17 00:00:00 20=
01
> > +From: Denys Dmytriyenko <denys@konsulko.com>
> > +Date: Fri, 7 Apr 2023 01:44:56 +0000
> > +Subject: [PATCH] defconfig: switch default kernel compression to LZM=
A
> > +
> > +LZO compression and lzop tool haven't been maintained for long time =
and have
> > +been removed in recent versions of OE-Core, even though Debian may s=
till use
> > +them. Switch to LZMA compression that is used by default in TI kerne=
l config.
> > +
> > +Upstream-Status: Inappropriate [OE-specific]
> > +
> > +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > +---
> > + arch/arm/configs/bb.org_defconfig | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/arch/arm/configs/bb.org_defconfig b/arch/arm/configs/bb=
.org_defconfig
> > +index 6bf0fb860683..7c035735172d 100644
> > +--- a/arch/arm/configs/bb.org_defconfig
> > ++++ b/arch/arm/configs/bb.org_defconfig
> > +@@ -1,5 +1,5 @@
> > + # CONFIG_LOCALVERSION_AUTO is not set
> > +-CONFIG_KERNEL_LZO=3Dy
> > ++CONFIG_KERNEL_LZMA=3Dy
> > + CONFIG_SYSVIPC=3Dy
> > + CONFIG_POSIX_MQUEUE=3Dy
> > + CONFIG_NO_HZ_IDLE=3Dy
>=20
> Oh! I didn't realize, lzo is in a sorry state.

Well, lzo is still kind of supported in OE-Core... But since lzop tool ha=
s=20
been removed (actually, moved to supplemental meta-openembedded layer), y=
ou=20
can't easily build lzo-compressed kernel w/o extra dependencies.


> Our only reason for using lzo over lzma, was purely a boot-up speed
> race. (Thinking with the am335x single core at 1Ghz..)
>=20
> Does OE-Core have proper support for lz4 as a replacement? Or just in
> general lzma is the most recommended?

lzma, lz4, zstd are all supported, with zstd being the hot addition latel=
y.=20
Agree, lz4 may be the best choice for low-power devices like am335x...

https://indico.fnal.gov/event/16264/contributions/36466/attachments/22610=
/28037/Zstd__LZ4.pdf
https://linuxreviews.org/Comparison_of_Compression_Algorithms

--=20
Denys

