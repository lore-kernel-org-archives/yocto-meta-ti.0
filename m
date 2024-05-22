Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309F7C25B79
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 16:29:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.58.1716395386846772560
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 09:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C900940CCA;
	Wed, 22 May 2024 16:29:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjFtjgzIOm_h; Wed, 22 May 2024 16:29:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC89440CC8;
	Wed, 22 May 2024 16:29:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 02F53163F6F; Wed, 22 May 2024 12:29:38 -0400 (EDT)
Date: Wed, 22 May 2024 12:29:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, bb@ti.com, Gyan Gupta <g-gupta@ti.com>,
	Praneeth <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 UBOOT_MACHINE for am62xx-lp-evm
Message-ID: <20240522162937.GJ21287@denix.org>
References: <20240522130057.1346796-1-c-shilwant@ti.com>
 <6b9f0fc1-077d-4d03-a54b-5b72996925dd@ti.com>
 <4baccef5-2db3-4dc8-b22e-598b5ec0f2af@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4baccef5-2db3-4dc8-b22e-598b5ec0f2af@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 16:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17676

On Wed, May 22, 2024 at 07:06:25PM +0530, Chirag Shilwant via lists.yocto=
project.org wrote:
> + Bryan for providing more details on the u-boot defconfig name
> change for am62xx-lp-evm
>=20
> On 22/05/24 18:46, Ryan Eatmon wrote:
> >
> >This changes make scarthgap and master incompatible with the
> >current default for uboot...=A0 2024.04 is not the default yet.=A0 Why
> >was this change made in uboot?
> >
> >We cannot accept this change until we default to 2024.04.
>=20
>=20
> Hi Ryan,
>=20
> How should we plan to enable am62xx-lp-evm scarthgap builds?
> Delaying the am62xx-lp-evm builds after ltsprep may not be advisable.

You can put as a machine override in ltsprep branding in meta-arago for n=
ow.



> >On 5/22/2024 8:00 AM, Chirag Shilwant wrote:
> >>Modify the U-Boot defconfig names for A53 and R5
> >>machine configurations based on ti-u-boot-2024.04 [1]
> >>
> >>[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boo=
t-2024.04&id=3D781b6a4a9ffde2428484d5c061b80e6c192b2049
> >>
> >>Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >>---
> >>=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 +-
> >>=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=A0=A0=A0=A0=A0 | 2 +-
> >>=A0 2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> >>b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> >>index 52b69a72..ddcd79c4 100644
> >>--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> >>+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> >>@@ -9,4 +9,4 @@ SYSFW_SOC =3D "am62x"
> >>=A0 SYSFW_CONFIG =3D "evm"
> >>=A0 SYSFW_SUFFIX =3D "hs-fs"
> >>=A0 -UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
> >>+UBOOT_MACHINE =3D "am62x_lp_sk_r5_defconfig"
> >>diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> >>b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> >>index 51e99728..9ffb9898 100644
> >>--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> >>+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> >>@@ -17,4 +17,4 @@ KERNEL_DEVICETREE =3D " \
> >>=A0=A0=A0=A0=A0 ti/k3-am62-lp-sk.dtb \
> >>=A0 "
> >>=A0 -UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
> >>+UBOOT_MACHINE =3D "am62x_lp_sk_a53_defconfig"

