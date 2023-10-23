Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4D1C004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 16:56:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.126275.1698080208159211874
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 09:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 821DA40C1E;
	Mon, 23 Oct 2023 16:56:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UH_OKYg8oXsZ; Mon, 23 Oct 2023 16:56:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 07B8740BD4;
	Mon, 23 Oct 2023 16:56:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 90E3C163D10; Mon, 23 Oct 2023 12:56:43 -0400 (EDT)
Date: Mon, 23 Oct 2023 12:56:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: afd@ti.com, meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 5/5] conf: beagle*:
 recommend essential FW images for Beagle devices
Message-ID: <20231023165643.GS2408@denix.org>
References: <20231020204458.546852-1-denis@denix.org>
 <20231020204458.546852-5-denis@denix.org>
 <190bcd54-29fd-4c2c-a39e-18e7fe42c4bd@ti.com>
 <4ce5d40f-3e97-4266-a695-b76be040e967@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4ce5d40f-3e97-4266-a695-b76be040e967@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17172

On Mon, Oct 23, 2023 at 10:52:49AM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 10/23/2023 10:50 AM, Andrew Davis via lists.yoctoproject.org wrote:
> >On 10/20/23 3:44 PM, Denys Dmytriyenko wrote:
> >>From: Denys Dmytriyenko <denys@konsulko.com>
> >>
> >>Set MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS per platform to list recommen=
ded
> >>essential FW images to be added to rootfs by default.
> >>
> >>Correct beagle-x15 to pull devicetrees and kernel image as well.
> >>
> >
> >Would it be better to have the bb.org kernel pull in
> >`kernel-rdepends.inc` like
> >the other kernels and get all these RDEPENDS/RRECOMMENDS from that?
>=20
> Someone submitted that patch earlier and I was hoping that Denys was
> going to address it as part of this series.

Yes, this patch does address it.


> >>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >>---
> >>=A0 meta-ti-bsp/conf/machine/beagle-x15.conf=A0=A0=A0=A0=A0 | 2 ++
> >>=A0 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +++
> >>=A0 meta-ti-bsp/conf/machine/beaglebone.conf=A0=A0=A0=A0=A0 | 2 ++
> >>=A0 meta-ti-bsp/conf/machine/beagleplay.conf=A0=A0=A0=A0=A0 | 3 +++
> >>=A0 4 files changed, 10 insertions(+)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf
> >>b/meta-ti-bsp/conf/machine/beagle-x15.conf
> >>index be27705c..3b857165 100644
> >>--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> >>+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> >>@@ -19,3 +19,5 @@ MACHINE_GUI_CLASS =3D "bigscreen"
> >>=A0 SERIAL_CONSOLES =3D "115200;ttyS2"
> >>=A0 UBOOT_MACHINE =3D "am57xx_evm_config"
> >>+
> >>+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree
> >>kernel-image-zimage"
> >>diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>index 2f9c7288..3f5a027e 100644
> >>--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> >>@@ -24,4 +24,7 @@ ti/k3-j721e-sk.dtb \
> >>=A0 "
> >>=A0 MACHINE_GUI_CLASS =3D "bigscreen"
> >>+
> >>=A0 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree
> >>kernel-image-image"
> >>+
> >>+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw=
"
> >>diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf
> >>b/meta-ti-bsp/conf/machine/beaglebone.conf
> >>index 2d811d0d..45944ce8 100644
> >>--- a/meta-ti-bsp/conf/machine/beaglebone.conf
> >>+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> >>@@ -23,3 +23,5 @@ MACHINE_FEATURES +=3D "screen"
> >>=A0 SERIAL_CONSOLES =3D "115200;ttyS0"
> >>=A0 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree
> >>kernel-image-zimage"
> >>+
> >>+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3"
> >>diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf
> >>b/meta-ti-bsp/conf/machine/beagleplay.conf
> >>index 6a0f697f..4dd550a1 100644
> >>--- a/meta-ti-bsp/conf/machine/beagleplay.conf
> >>+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> >>@@ -42,4 +42,7 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
> >>=A0 "
> >>=A0 MACHINE_GUI_CLASS =3D "bigscreen"
> >>+
> >>=A0 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree
> >>kernel-image-image"
> >>+
> >>+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D ""

