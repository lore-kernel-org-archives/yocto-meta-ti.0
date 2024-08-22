Return-Path: <arcady.ruvidic@clearsy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5E9C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 11:52:02 +0000 (UTC)
Subject: Re: Yocto Development for custom AM335x/OSD335x board and more
To: meta-ti@lists.yoctoproject.org
From: "Arcadius" <arcady.ruvidic@clearsy.com>
X-Originating-Location: La Murette, Auvergne-Rhone-Alpes, FR (5.226.5.184)
X-Originating-Platform: Windows Firefox 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Aug 2024 04:52:00 -0700
References: <9dd2e104-d53e-4c64-8270-733f83f27286@ti.com>
In-Reply-To: <9dd2e104-d53e-4c64-8270-733f83f27286@ti.com>
Message-ID: <15565.1724327520184039524@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Aug 2024 11:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17945

I guess I am almost there.
I just have an issue with passing the dtb to extlinux.conf.
I include the meta-ti-bsp/conf/machine/include/ti33x.inc file in my machine=
 configuration.
This file has the following lines:=20

=3D=3D=3D=3D=3D=3D
DEVICETREE_FILE =3D "${@(d.getVar('KERNEL_DEVICETREE') or "").replace("ti/o=
map/","")}"

# Generate an extlinux.conf file
UBOOT_EXTLINUX =3D "1"
UBOOT_EXTLINUX_ROOT =3D "root=3DPARTUUID=3D${uuid}"
UBOOT_EXTLINUX_KERNEL_ARGS =3D "rootwait rw earlycon"
UBOOT_EXTLINUX_BOOT_FILES =3D " \
    extlinux.conf;extlinux/extlinux.conf \
    ${KERNEL_IMAGETYPE} \
    ${DEVICETREE_FILE} \
"
=3D=3D=3D=3D=3D=3D

So in my machine configuration I try to override it:

=3D=3D=3D=3D=3D=3D
DEVICETREE_FILE =3D "osd3358-bsm-refdesign.dtb"
UBOOT_EXTLINUX_BOOT_FILES =3D " \
    extlinux.conf;extlinux/extlinux.conf \
    ${KERNEL_IMAGETYPE} \
    ${DEVICETREE_FILE} \
"
=3D=3D=3D=3D=3D=3D

But when I check the outputted file, I still have "FDTDIR ../" instead of "=
FDTDIR ../osd3358-bsm-refdesign.dtb".
I could probably fix it manually, but I would like to not have to do so in =
the future.

I also wanted to ask where I could find a defconfig template for the AM335x=
 platform.
I would like to get rid of warnings complaining about some missing symbols.

I also wanted to know if I can just output a .wic instead a .wic.xz since I=
 end up decompressing it anyways before writing to my SD card.

Finally I just wanted to point out that fetching amx3-cm3 took up to 35 min=
utes to even start which was slightly annoying.
And I have seen a post about broken URLs, so it could do some fixing.

