Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC87C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 19:01:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4098.1714158066430340555
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 12:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 388C540CBE;
	Fri, 26 Apr 2024 19:01:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_af1GPteh0H; Fri, 26 Apr 2024 19:01:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4EC1240BE6;
	Fri, 26 Apr 2024 19:01:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0C399163F49; Fri, 26 Apr 2024 15:01:01 -0400 (EDT)
Date: Fri, 26 Apr 2024 15:01:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: "Limaye, Aniket" <a-limaye@ti.com>, meta-ti@lists.yoctoproject.org,
	b-padhi@ti.com
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM69-SK
 machine configuration
Message-ID: <20240426190100.GJ28791@denix.org>
References: <20240424083546.2190336-1-a-limaye@ti.com>
 <33f34e2b-ab8b-469e-b2f3-6261a5067428@ti.com>
 <8309620e-3aed-4bae-b0f2-b6b0a98b33ca@ti.com>
 <7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <7e4668e3-d834-4d55-bd17-9a6a98f96251@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Apr 2024 19:01:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17603

On Thu, Apr 25, 2024 at 02:36:10PM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
>=20
> On 4/24/2024 10:59 PM, Limaye, Aniket wrote:
> >On 4/24/2024 6:53 PM, Ryan Eatmon wrote:
> >>
> >>We have consistently named the machines with -evm and not -sk.=A0
> >>Is there a good reason to not name this am69-evm?
> >>
> >Well this is just following the naming convention that got
> >accepted in u-boot:
> >
> >https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/configs?h=3Dti-u-boot=
-2024.04
> >
> >Yeah other parts have been like "am62x_evm_*_defconfig" and such,
> >but for am69 we have gone with "am69_sk_*_defconfig"
> >
> >Even the dts files for these, everywhere, have -sk suffixes.
> >
> >Hence the change here as well.
>=20
> Just because the configs in uboot have sk does not imply that the
> machine name in meta-ti needs to have sk.  From my understanding,
> generally the sk comes first and latest a full up evm.  But the
> Yocto machine usually supports all of the variations and so they
> were named with -evm to be the broadest possible name.
>=20
> My personal preference would be to eliminate the -evm for all of the
> machines and just go with the soc name.

Just make sure that won't conflict with the SoC family name, as currently=
=20
the part of the machine name w/o -evm is what's used for SoC name...


> But if we are going to have
> it then I think they should be consistent.
>=20
>=20
> >Regards,
> >Aniket
> >
> >>
> >>
> >>On 4/24/2024 3:35 AM, Aniket Limaye wrote:
> >>>From: Beleswar Padhi <b-padhi@ti.com>
> >>>
> >>>As of commits [1] and [2] in ti-u-boot-2024.04 and upstream respecti=
vely
> >>>there is a separate defconfig to build u-boot for j784s4-evm and am6=
9-sk
> >>>
> >>>Hence, introduce new yocto machine configs for am69-sk. Also remove =
am69
> >>>devicetree builds from the j784s4-evm conf
> >>>
> >>>[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-bo=
ot-2024.04&id=3D8a46af7a39e6218e4de5c6195697af36201c778c
> >>>[2]: https://source.denx.de/u-boot/u-boot/-/commit/740759d558e632e15=
40d620baadbcc46fdf24db2
> >>>
> >>>Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> >>>Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> >>>---
> >>>=A0 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11 +++++++++++
> >>>=A0 meta-ti-bsp/conf/machine/am69-sk.conf=A0=A0=A0=A0=A0 | 20 ++++++=
++++++++++++++
> >>>=A0 meta-ti-bsp/conf/machine/j784s4-evm.conf=A0=A0 |=A0 1 -
> >>>=A0 3 files changed, 31 insertions(+), 1 deletion(-)
> >>>=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>>=A0 create mode 100644 meta-ti-bsp/conf/machine/am69-sk.conf
> >>>
> >>>diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>>b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>>new file mode 100644
> >>>index 00000000..9d2b4cd6
> >>>--- /dev/null
> >>>+++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> >>>@@ -0,0 +1,11 @@
> >>>+#@TYPE: Machine
> >>>+#@NAME: AM69 SK (R5F)
> >>>+#@DESCRIPTION: Machine configuration for the TI AM69 SK (R5F core)
> >>>+
> >>>+require conf/machine/include/k3r5.inc
> >>>+
> >>>+SYSFW_SOC =3D "j784s4"
> >>>+SYSFW_CONFIG =3D "evm"
> >>>+SYSFW_SUFFIX =3D "hs-fs"
> >>>+
> >>>+UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
> >>>diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf
> >>>b/meta-ti-bsp/conf/machine/am69-sk.conf
> >>>new file mode 100644
> >>>index 00000000..233a4618
> >>>--- /dev/null
> >>>+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
> >>>@@ -0,0 +1,20 @@
> >>>+#@TYPE: Machine
> >>>+#@NAME: AM69 SK
> >>>+#@DESCRIPTION: Machine configuration for the TI AM69 SK
> >>>+
> >>>+require conf/machine/include/j784s4.inc
> >>>+
> >>>+TFA_K3_USART =3D "0x8"
> >>>+OPTEE_K3_USART =3D "0x8"
> >>>+
> >>>+KERNEL_DEVICETREE_PREFIX =3D " \
> >>>+=A0=A0=A0 ti/k3-am69-sk \
> >>>+=A0=A0=A0 ti/k3-fpdlink \
> >>>+=A0=A0=A0 ti/k3-v3link \
> >>>+"
> >>>+
> >>>+KERNEL_DEVICETREE =3D " \
> >>>+=A0=A0=A0 ti/k3-am69-sk.dtb \
> >>>+"
> >>>+
> >>>+UBOOT_MACHINE =3D "am69_sk_a72_defconfig"
> >>>diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> >>>b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> >>>index e451bf47..6573e5c5 100644
> >>>--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> >>>+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> >>>@@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX =3D " \
> >>>=A0=A0=A0=A0=A0 ti/k3-j784s4 \
> >>>=A0=A0=A0=A0=A0 ti/k3-fpdlink \
> >>>=A0=A0=A0=A0=A0 ti/k3-j7200-evm-mcspi-loopback \
> >>>-=A0=A0=A0 ti/k3-am69-sk \
> >>>=A0=A0=A0=A0=A0 ti/k3-v3link \
> >>>=A0 "
> >>

