Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2F6C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 16:54:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26173.1703091273439414646
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Dec 2023 08:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=pn3kALRj;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BKGsUGu012498;
	Wed, 20 Dec 2023 10:54:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703091270;
	bh=zIMWYv+SrSO2R0UcAQp6HG97AB1EJAgcl3xdQd38Wqk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pn3kALRjKE1mmFiaK5dU9FM2zJy6ToYbdkVJIkurYFLJCrvZkTT8bwla5b9FCDew9
	 mQEFlqqnelMLL72s6pWF62hZuJ9oJJLNzkp2Gj4hhXsgpjblnfVPdXcJkUHsxv5OMX
	 KCGRPtmS6T5wKufNDvJ06bfdYHHYu4dIZW3vCc8E=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BKGsUcU075046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Dec 2023 10:54:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Dec 2023 10:54:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Dec 2023 10:54:30 -0600
Received: from [10.249.40.136] ([10.249.40.136])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BKGsTwn090236;
	Wed, 20 Dec 2023 10:54:29 -0600
Message-ID: <d069e36e-8e07-41cd-b378-22903917272b@ti.com>
Date: Wed, 20 Dec 2023 10:54:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][RFC] meta-ti-bsp: Build R5 bootloader
 without multiconfig
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>, <reatmon@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Ricardo Salveti <ricardo@foundries.io>
References: <20231220160737.40535-1-afd@ti.com>
 <dd3accba-30ea-4f0c-afe9-04475209c381@ti.com>
 <CANPvuRkzkVt=PeknKaFaQ6URoeJ--U2SF59pYF+XH0_0tmD-ag@mail.gmail.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CANPvuRkzkVt=PeknKaFaQ6URoeJ--U2SF59pYF+XH0_0tmD-ag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3BKGsUGu012498
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Dec 2023 16:54:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17355

On 12/20/23 10:43 AM, Jose Quaresma wrote:
> Hi Andrew,
>=20
> I believe=C2=A0this patchset can help fix some of the remaining=C2=A0is=
sues mainly in the kirstone branch.

I hope so, I was thinking of the troubles you have been having when
puting this together. (plus several others on E2E with multiconf issues)

> I will test it but maybe only next year.

This is a very early RFC so no guarantee it even boots on all platforms.
Denys and Ryan put a lot of work into keeping multiconf working so just
wanted to make sure they are okay with dropping it back out before I do
too much work on getting all the exact details right.

There is also a change needed up in the meta-arago layer so this all
will probably end up targeting only master/scarthgap and not kirkstone.

Andrew

>=20
> Jose
>=20
> Ryan Eatmon via lists.yoctoproject.org <http://lists.yoctoproject.org> =
<reatmon=3Dti.com@lists.yoctoproject.org <mailto:ti.com@lists.yoctoprojec=
t.org>> escreveu no dia quarta, 20/12/2023 =C3=A0(s) 16:14:
>=20
>=20
>=20
>     On 12/20/2023 10:07 AM, Andrew Davis wrote:
>      > The R5 SPL bootloader is the only software we build using the R5=
 (arm32)
>      > multiconfig environment. Using multiconfig pulls in a large numb=
er of
>      > build dependencies (see the -native environment in baremetal tmp=
 dir)
>      > this increases build time and space.
>      >
>      > Using multiconfig for a deploy target also leads to several oddi=
ties in
>      > the bitbake build system forcing use of a non-standard deploy di=
rectory
>      > and careful checks that no recipe built in both configuration de=
ploy
>      > the same files.
>      >
>      > While I believe we will get more use out of multiconfig for futu=
re
>      > devices, today let's simplify the K3 build infrastructure here b=
y
>      > building R5 SPL like a normal firmware using a foreign targeting=
 cross
>      > compiler. This is the technique meta-arm uses to build firmware =
(see
>      > scp-firmware and trusted-firmware-m recipes). Add a new tiboot3 =
firmware
>      > recipe here.
>      >
>      > With that we can also drop all the related k3r5 multiconfig file=
s and
>      > definitions. Do that here.
>=20
>     On first glance, this looks good.=C2=A0 Let me do some test builds.
>=20
>=20
>      > Signed-off-by: Andrew Davis <afd@ti.com <mailto:afd@ti.com>>
>      > ---
>      >=C2=A0 =C2=A0meta-ti-bsp/classes/ti-secdev.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 -
>      >=C2=A0 =C2=A0.../conf/machine/am62axx-evm-k3r5.conf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62axx-evm.conf=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/am62pxx-evm-k3r5.conf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 12 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62pxx-evm.conf=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 5 ++
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 12 -=
---
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xx-evm.conf=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/am62xx-lp-evm-k3r5.conf=C2=A0 =C2=A0=
 =C2=A0 | 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=C2=A0 =C2=
=A0|=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/am62xxsip-evm-k3r5.conf=C2=A0 =C2=A0=
 =C2=A0 | 16 -----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am62xxsip-evm.conf=C2=A0 =C2=
=A0| 10 +++
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf | 11 -=
---
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am64xx-evm.conf=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 5 ++
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 11 -=
---
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am65xx-evm.conf=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/am65xx-hs-evm-k3r5.conf=C2=A0 =C2=A0=
 =C2=A0 | 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/am65xx-hs-evm.conf=C2=A0 =C2=
=A0|=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/beaglebone-ai64-k3r5.conf=C2=A0 =C2=
=A0 | 17 -----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/beaglebone-ai64.conf |=C2=A0=
 5 ++
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 14 -=
---
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/beagleplay.conf=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 5 ++
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/include/k3.inc=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 4 +-
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/include/k3r5.inc=C2=A0 =C2=A0=
 =C2=A0| 27 --------
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf=C2=A0 |=
 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j7200-evm.conf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/j7200-hs-evm-k3r5.conf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j7200-hs-evm.conf=C2=A0 =C2=
=A0 |=C2=A0 5 ++
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf=C2=A0 |=
 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721e-evm.conf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/j721e-hs-evm-k3r5.conf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721e-hs-evm.conf=C2=A0 =C2=
=A0 |=C2=A0 3 +-
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 11 -=
---
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721s2-evm.conf=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/j721s2-hs-evm-k3r5.conf=C2=A0 =C2=A0=
 =C2=A0 | 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j721s2-hs-evm.conf=C2=A0 =C2=
=A0|=C2=A0 2 +
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf | 11 -=
---
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 5 ++
>      >=C2=A0 =C2=A0.../conf/machine/j784s4-hs-evm-k3r5.conf=C2=A0 =C2=A0=
 =C2=A0 | 11 ----
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/machine/j784s4-hs-evm.conf=C2=A0 =C2=
=A0|=C2=A0 2 +
>      >=C2=A0 =C2=A0meta-ti-bsp/conf/multiconfig/k3r5.conf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 10 ---
>      >=C2=A0 =C2=A0.../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb <http://t=
i-sci-fw_git.bb>=C2=A0 =C2=A0 |=C2=A0 3 -
>      >=C2=A0 =C2=A0.../u-boot/tiboot3-staging_2023.5.bb <http://tiboot3=
-staging_2023.5.bb>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 65 ++++++++++++++=
+++++
>      >=C2=A0 =C2=A0.../recipes-bsp/u-boot/u-boot-bb.org_git.bb <http://=
u-boot-bb.org_git.bb>=C2=A0 =C2=A0|=C2=A0 2 -
>      >=C2=A0 =C2=A0meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0 |=
 40 ------------
>      >=C2=A0 =C2=A044 files changed, 152 insertions(+), 303 deletions(-=
)
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62axx-=
evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62pxx-=
evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62xx-e=
vm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62xx-l=
p-evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am62xxsi=
p-evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am64xx-e=
vm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am65xx-e=
vm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/am65xx-h=
s-evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/beaglebo=
ne-ai64-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/beaglepl=
ay-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/include/=
k3r5.inc
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j7200-ev=
m-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs=
-evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721e-ev=
m-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs=
-evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721s2-e=
vm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j721s2-h=
s-evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j784s4-e=
vm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/machine/j784s4-h=
s-evm-k3r5.conf
>      >=C2=A0 =C2=A0delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5=
.conf
>      >=C2=A0 =C2=A0create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/ti=
boot3-staging_2023.5.bb <http://tiboot3-staging_2023.5.bb>
>      >
>      > diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass b/meta-ti-bsp=
/classes/ti-secdev.bbclass
>      > index b3d70e5c..18d15269 100644
>      > --- a/meta-ti-bsp/classes/ti-secdev.bbclass
>      > +++ b/meta-ti-bsp/classes/ti-secdev.bbclass
>      > @@ -2,14 +2,11 @@
>      >
>      >=C2=A0 =C2=A0# K3 SECDEV scripts use OpenSSL
>      >=C2=A0 =C2=A0DEPENDS:append:k3 =3D " openssl-native"
>      > -DEPENDS:append:k3r5 =3D " openssl-native"
>      >
>      >=C2=A0 =C2=A0# Use package version of TI SECDEV for K3 if one is =
not provided through the environment
>      >=C2=A0 =C2=A0DEPENDS:append:k3 =3D "${@ '' if d.getVar('TI_SECURE=
_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
>      > -DEPENDS:append:k3r5 =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_=
K3') else ' ti-k3-secdev-native' }"
>      >=C2=A0 =C2=A0TI_K3_SECDEV_INSTALL_DIR =3D "${STAGING_DIR_NATIVE}$=
{datadir}/ti/ti-k3-secdev"
>      >=C2=A0 =C2=A0TI_SECURE_DEV_PKG:k3 =3D "${@ d.getVar('TI_SECURE_DE=
V_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
>      > -TI_SECURE_DEV_PKG:k3r5 =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3'=
) or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
>      >
>      >=C2=A0 =C2=A0# For non-K3 we require the SECDEV tools be provided=
 through the environment with the following vars
>      >=C2=A0 =C2=A0TI_SECURE_DEV_PKG:ti33x =3D "${TI_SECURE_DEV_PKG_CAT=
}/am3x"
>      > diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/me=
ta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 2af3317e..00000000
>      > --- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM62A HS-FS EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM62A EVM (R5F =
core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "am62ax"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs-fs"
>      > -
>      > -UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti=
-bsp/conf/machine/am62axx-evm.conf
>      > index 22f61401..59884629 100644
>      > --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>      > @@ -14,4 +14,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am62a7-sk.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "am62ax"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs-fs"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am62ax_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am62ax_evm_a53_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/me=
ta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 36915381..00000000
>      > --- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,12 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM62PX EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F=
 core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -require conf/machine/include/ti-extras.inc
>      > -
>      > -SYSFW_SOC =3D "am62px"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs-fs"
>      > -
>      > -UBOOT_MACHINE =3D "am62px_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti=
-bsp/conf/machine/am62pxx-evm.conf
>      > index d7c9f589..116d819b 100644
>      > --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>      > @@ -15,4 +15,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am62p5-sk.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "am62px"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs-fs"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am62px_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am62px_evm_a53_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/met=
a-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 548369ca..00000000
>      > --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,12 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM62XX EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F=
 core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -require conf/machine/include/ti-extras.inc
>      > -
>      > -SYSFW_SOC =3D "am62x"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs-fs"
>      > -
>      > -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-=
bsp/conf/machine/am62xx-evm.conf
>      > index fadbc6f4..6f234811 100644
>      > --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>      > @@ -14,4 +14,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am625-sk.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "am62x"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs-fs"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am62x_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/=
meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>      > deleted file mode 100644
>      > index aa9422cd..00000000
>      > --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM62XX LP GP EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EV=
M (R5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "am62x"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs-fs"
>      > -
>      > -UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-=
ti-bsp/conf/machine/am62xx-lp-evm.conf
>      > index 229b74bc..e33b60e2 100644
>      > --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>      > @@ -16,4 +16,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am62-lp-sk.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "am62x"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs-fs"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am62x_lpsk_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/=
meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 0daff2b9..00000000
>      > --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,16 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM62XX SIP EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM =
(R5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "am62x"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs-fs"
>      > -
>      > -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>      > -
>      > -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragme=
nts which has to be build
>      > -# along with the base defconfig mentioned in UBOOT_MACHINE. Ref=
er u-boot-mergeconfig.inc
>      > -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>      > -UBOOT_CONFIG_FRAGMENTS =3D "am62xsip_sk_r5.config"
>      > diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-=
ti-bsp/conf/machine/am62xxsip-evm.conf
>      > index b5dd18f1..2e077f75 100644
>      > --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>      > @@ -13,4 +13,14 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-am625-sk.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "am62x"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs-fs"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am62x_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>      > +
>      > +# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragme=
nts which has to be build
>      > +# along with the base defconfig mentioned in UBOOT_MACHINE. Ref=
er u-boot-mergeconfig.inc
>      > +# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>      > +UBOOT_CONFIG_FRAGMENTS_R5 =3D "am62xsip_sk_r5.config"
>      > diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/met=
a-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
>      > deleted file mode 100644
>      > index e932928a..00000000
>      > --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM64xx EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F=
 core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "am64x_sr2"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs-fs"
>      > -
>      > -UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-=
bsp/conf/machine/am64xx-evm.conf
>      > index c6ba2a87..dc21c174 100644
>      > --- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
>      > @@ -4,4 +4,9 @@
>      >
>      >=C2=A0 =C2=A0require conf/machine/include/am64xx.inc
>      >
>      > +SYSFW_SOC =3D "am64x_sr2"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs-fs"
>      > +
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
>      > +UBOOT_MACHINE_R5 =3D "am64x_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/met=
a-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 8744ac3e..00000000
>      > --- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM65xx EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM65xx EVM (R5F=
 core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "am65x_sr2"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "gp"
>      > -
>      > -UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-=
bsp/conf/machine/am65xx-evm.conf
>      > index f6eb6f0c..9b050b03 100644
>      > --- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
>      > @@ -4,6 +4,11 @@
>      >
>      >=C2=A0 =C2=A0require conf/machine/include/am65xx.inc
>      >
>      > +SYSFW_SOC =3D "am65x_sr2"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "gp"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am65x_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am65x_evm_a53_defconfig"
>      >
>      >=C2=A0 =C2=A0MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw-=
am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>      > diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/=
meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 337c8413..00000000
>      > --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: AM65xx HS EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (=
R5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "am65x_sr2"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs"
>      > -
>      > -UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-=
ti-bsp/conf/machine/am65xx-hs-evm.conf
>      > index f8221f31..4164ae53 100644
>      > --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
>      > @@ -4,4 +4,9 @@
>      >
>      >=C2=A0 =C2=A0require conf/machine/include/am65xx.inc
>      >
>      > +SYSFW_SOC =3D "am65x_sr2"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am65x_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am65x_evm_a53_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf =
b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>      > deleted file mode 100644
>      > index b893f380..00000000
>      > --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,17 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: BeagleBone AI-64 (R5F)
>      > -#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (=
R5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j721e"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "gp"
>      > -
>      > -SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
>      > -SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
>      > -UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
>      > -UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUF=
FIX}"
>      > -UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>      > -
>      > -UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/met=
a-ti-bsp/conf/machine/beaglebone-ai64.conf
>      > index e529f565..bad86a22 100644
>      > --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>      > +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>      > @@ -4,6 +4,11 @@
>      >
>      >=C2=A0 =C2=A0require conf/machine/include/j721e.inc
>      >
>      > +SYSFW_SOC =3D "j721e"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "gp"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "j721e_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "j721e_evm_a72_config"
>      >
>      >=C2=A0 =C2=A0PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org =
<http://linux-bb.org>"
>      > diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/met=
a-ti-bsp/conf/machine/beagleplay-k3r5.conf
>      > deleted file mode 100644
>      > index c40615c9..00000000
>      > --- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,14 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: BeaglePlay (R5F)
>      > -#@DESCRIPTION: Machine configuration for the BeaglePlay (R5F co=
re)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org <http:=
//u-boot-bb.org>"
>      > -PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org <http://u-boot-bb.=
org>"
>      > -
>      > -SYSFW_SOC =3D "am62x"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "gp"
>      > -
>      > -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-=
bsp/conf/machine/beagleplay.conf
>      > index ac4a202a..312fc503 100644
>      > --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>      > +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>      > @@ -18,6 +18,11 @@ TFA_K3_SYSTEM_SUSPEND =3D "1"
>      >
>      >=C2=A0 =C2=A0OPTEEMACHINE =3D "k3-am62x"
>      >
>      > +SYSFW_SOC =3D "am62x"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "gp"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "am62x_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>      >
>      >=C2=A0 =C2=A0PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org =
<http://linux-bb.org>"
>      > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-b=
sp/conf/machine/include/k3.inc
>      > index 2415f0ba..84feee08 100644
>      > --- a/meta-ti-bsp/conf/machine/include/k3.inc
>      > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>      > @@ -5,8 +5,6 @@ SOC_FAMILY:append =3D ":k3"
>      >
>      >=C2=A0 =C2=A0require conf/machine/include/arm/arch-arm64.inc
>      >
>      > -BBMULTICONFIG +=3D "k3r5"
>      > -
>      >=C2=A0 =C2=A0# Increase this everytime you change something in th=
e kernel
>      >=C2=A0 =C2=A0MACHINE_KERNEL_PR =3D "r0"
>      >
>      > @@ -62,7 +60,7 @@ MACHINE_FEATURES +=3D "efi"
>      >=C2=A0 =C2=A0WKS_FILE ?=3D "${@bb.utils.contains("MACHINE_FEATURE=
S", "efi", "sdimage-2part-efi.wks.in <http://sdimage-2part-efi.wks.in>", =
"sdimage-2part.wks", d)}"
>      >
>      >=C2=A0 =C2=A0do_image_wic[depends] +=3D "virtual/bootloader:do_de=
ploy"
>      > -do_image[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy=
"
>      > +do_image[depends] +=3D "tiboot3-staging:do_deploy"
>      >
>      >=C2=A0 =C2=A0SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
>      >=C2=A0 =C2=A0SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>      > diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti=
-bsp/conf/machine/include/k3r5.inc
>      > deleted file mode 100644
>      > index 63267a5e..00000000
>      > --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
>      > +++ /dev/null
>      > @@ -1,27 +0,0 @@
>      > -# TI K3 Armv7 profile for Cortex-R5F cores
>      > -
>      > -require conf/machine/include/ti-soc.inc
>      > -SOC_FAMILY:append =3D ":k3r5"
>      > -
>      > -# The closest of existing tunes for Cortex-R5F
>      > -DEFAULTTUNE =3D "armv7athf"
>      > -require conf/machine/include/arm/armv7a/tune-cortexa8.inc
>      > -
>      > -# R5 runs early bootloader and loads SYSFW
>      > -# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti=
/j721e_evm.rst <https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/boar=
d/ti/j721e_evm.rst>
>      > -# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti=
/am62x_sk.rst <https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board=
/ti/am62x_sk.rst>
>      > -# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti=
/k3.rst <https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3=
.rst>
>      > -PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
>      > -PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
>      > -PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
>      > -
>      > -SPL_SUFFIX =3D "bin"
>      > -SPL_BINARY =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CO=
NFIG}.${SPL_SUFFIX}"
>      > -SPL_SYMLINK =3D "tiboot3.${SPL_SUFFIX}"
>      > -UBOOT_SUFFIX =3D "bin"
>      > -UBOOT_BINARY =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
>      > -UBOOT_IMAGE =3D "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOO=
T_SUFFIX}"
>      > -UBOOT_SYMLINK =3D "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
>      > -
>      > -PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
>      > -PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
>      > diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf b/meta=
-ti-bsp/conf/machine/j7200-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 68061883..00000000
>      > --- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J7200 EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J7200 EVM (R5F =
core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j7200"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "gp"
>      > -
>      > -UBOOT_MACHINE =3D "j7200_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-b=
sp/conf/machine/j7200-evm.conf
>      > index dff1da69..e733d15a 100644
>      > --- a/meta-ti-bsp/conf/machine/j7200-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
>      > @@ -10,4 +10,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j7200-common-proc-board.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "j7200"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "gp"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "j7200_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "j7200_evm_a72_config"
>      > diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/m=
eta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 1922d5c8..00000000
>      > --- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J7200 HS EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R=
5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j7200_sr2"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs"
>      > -
>      > -UBOOT_MACHINE =3D "j7200_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-t=
i-bsp/conf/machine/j7200-hs-evm.conf
>      > index 54fd2b4a..fc33106c 100644
>      > --- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
>      > @@ -4,4 +4,9 @@
>      >
>      >=C2=A0 =C2=A0require conf/machine/j7200-evm.conf
>      >
>      > +SYSFW_SOC =3D "j7200_sr2"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "hs"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "j7200_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "j7200_evm_a72_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta=
-ti-bsp/conf/machine/j721e-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 070bf7aa..00000000
>      > --- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J721e EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F =
core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j721e"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "gp"
>      > -
>      > -UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-b=
sp/conf/machine/j721e-evm.conf
>      > index 5e1f6dca..ca23e3e3 100644
>      > --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
>      > @@ -15,4 +15,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j721e-sk.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "j721e"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "gp"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "j721e_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "j721e_evm_a72_config"
>      > diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/m=
eta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 7904c660..00000000
>      > --- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J721e HS EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R=
5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j721e_sr1_1"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs"
>      > -
>      > -UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-t=
i-bsp/conf/machine/j721e-hs-evm.conf
>      > index 441ca169..3d4bedb6 100644
>      > --- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>      > @@ -4,4 +4,5 @@
>      >
>      >=C2=A0 =C2=A0require conf/machine/j721e-evm.conf
>      >
>      > -UBOOT_MACHINE =3D "j721e_evm_a72_defconfig"
>      > +SYSFW_SOC =3D "j721e_sr1_1"
>      > +SYSFW_SUFFIX =3D "hs"
>      > diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/met=
a-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 508e96e5..00000000
>      > --- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J721S2 EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F=
 core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j721s2"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "gp"
>      > -
>      > -UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-=
bsp/conf/machine/j721s2-evm.conf
>      > index ecb1836f..63d86af0 100644
>      > --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>      > @@ -18,4 +18,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j721s2-common-proc-board.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "j721s2"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "gp"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "j721s2_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "j721s2_evm_a72_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/=
meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 58cd92c4..00000000
>      > --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J721S2 HS EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (=
R5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j721s2"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs"
>      > -
>      > -UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-=
ti-bsp/conf/machine/j721s2-hs-evm.conf
>      > index 4cf32a28..1129a189 100644
>      > --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
>      > @@ -3,3 +3,5 @@
>      >=C2=A0 =C2=A0#@DESCRIPTION: Machine configuration for the TI J721=
S2 HS EVM
>      >
>      >=C2=A0 =C2=A0require conf/machine/j721s2-evm.conf
>      > +
>      > +SYSFW_SUFFIX =3D "hs"
>      > diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/met=
a-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 04feebc6..00000000
>      > --- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J784S4 EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F=
 core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j784s4"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "gp"
>      > -
>      > -UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-=
bsp/conf/machine/j784s4-evm.conf
>      > index 40a63651..a242ef8a 100644
>      > --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>      > @@ -18,4 +18,9 @@ KERNEL_DEVICETREE =3D " \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0ti/k3-j784s4-evm.dtb \
>      >=C2=A0 =C2=A0"
>      >
>      > +SYSFW_SOC =3D "j784s4"
>      > +SYSFW_CONFIG =3D "evm"
>      > +SYSFW_SUFFIX =3D "gp"
>      > +
>      > +UBOOT_MACHINE_R5 =3D "j784s4_evm_r5_defconfig"
>      >=C2=A0 =C2=A0UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf b/=
meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
>      > deleted file mode 100644
>      > index 80a228a0..00000000
>      > --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
>      > +++ /dev/null
>      > @@ -1,11 +0,0 @@
>      > -#@TYPE: Machine
>      > -#@NAME: J784S4 HS EVM (R5F)
>      > -#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (=
R5F core)
>      > -
>      > -require conf/machine/include/k3r5.inc
>      > -
>      > -SYSFW_SOC =3D "j784s4"
>      > -SYSFW_CONFIG =3D "evm"
>      > -SYSFW_SUFFIX =3D "hs"
>      > -
>      > -UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
>      > diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-=
ti-bsp/conf/machine/j784s4-hs-evm.conf
>      > index 8fa1c1fd..42468088 100644
>      > --- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
>      > +++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
>      > @@ -3,3 +3,5 @@
>      >=C2=A0 =C2=A0#@DESCRIPTION: Machine configuration for the TI J784=
S4 HS EVM
>      >
>      >=C2=A0 =C2=A0require conf/machine/j784s4-evm.conf
>      > +
>      > +SYSFW_SUFFIX =3D "hs"
>      > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bs=
p/conf/multiconfig/k3r5.conf
>      > deleted file mode 100644
>      > index 936bce2f..00000000
>      > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
>      > +++ /dev/null
>      > @@ -1,10 +0,0 @@
>      > -MAINMACHINE :=3D "${MACHINE}"
>      > -
>      > -DEPLOY_DIR_IMAGE:k3r5 =3D "${TI_COMMON_DEPLOY}/images/${MAINMAC=
HINE}"
>      > -
>      > -MACHINE:append =3D "-k3r5"
>      > -TCLIBC =3D "baremetal"
>      > -TI_TMPDIR_APPEND ?=3D "-k3r5"
>      > -TMPDIR:append =3D "${TI_TMPDIR_APPEND}"
>      > -
>      > -SDKPKGSUFFIX =3D "k3r5-nativesdk"
>      > diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb =
<http://ti-sci-fw_git.bb> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_g=
it.bb <http://ti-sci-fw_git.bb>
>      > index 12292c88..0597d9bb 100644
>      > --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb <http:/=
/ti-sci-fw_git.bb>
>      > +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb <http:/=
/ti-sci-fw_git.bb>
>      > @@ -17,9 +17,6 @@ do_install() {
>      >=C2=A0 =C2=A0}
>      >
>      >=C2=A0 =C2=A0do_deploy(){
>      > -}
>      > -
>      > -do_deploy:k3r5() {
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${DEPLOYDIR}/ti-sysfw
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/ti-sysfw/ti-sci-fi=
rmware-* ${DEPLOYDIR}/ti-sysfw
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/ti-sysfw/ti-fs-fir=
mware-* ${DEPLOYDIR}/ti-sysfw
>      > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023=
.5.bb <http://tiboot3-staging_2023.5.bb> b/meta-ti-bsp/recipes-bsp/u-boot=
/tiboot3-staging_2023.5.bb <http://tiboot3-staging_2023.5.bb>
>      > new file mode 100644
>      > index 00000000..0f1929b5
>      > --- /dev/null
>      > +++ b/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb <=
http://tiboot3-staging_2023.5.bb>
>      > @@ -0,0 +1,65 @@
>      > +require u-boot-ti.inc
>      > +
>      > +include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_=
EXTRAS') else ''}
>      > +
>      > +PR =3D "r0"
>      > +BRANCH =3D "ti-u-boot-2023.04"
>      > +SRCREV =3D "b0d717b732ee28e446baf94522b3491e590f7fbb"
>      > +
>      > +PROVIDES:remove =3D "virtual/bootloader"
>      > +PROVIDES:remove =3D "u-boot"
>      > +
>      > +# Using gcc-cross-arm-native here would have been ideal
>      > +# as the compiler version would match between R5 and
>      > +# main ARM core builds. arm-oe-linux-gnueabi-
>      > +DEPENDS +=3D "gcc-arm-none-eabi-native"
>      > +
>      > +EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Darm-none-eabi- CC=3Darm-none=
-eabi-gcc"
>      > +
>      > +UBOOT_MACHINE =3D "${UBOOT_MACHINE_R5}"
>      > +
>      > +SPL_SUFFIX =3D "bin"
>      > +SPL_BINARY =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CO=
NFIG}.${SPL_SUFFIX}"
>      > +SPL_SYMLINK =3D "tiboot3.${SPL_SUFFIX}"
>      > +UBOOT_SUFFIX =3D "bin"
>      > +UBOOT_BINARY =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
>      > +UBOOT_IMAGE =3D "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOO=
T_SUFFIX}"
>      > +UBOOT_SYMLINK =3D "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
>      > +
>      > +do_compile:append () {
>      > +=C2=A0 =C2=A0 =C2=A0if [ -n "${UBOOT_CONFIG}" ];
>      > +=C2=A0 =C2=A0 =C2=A0then
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for config in $=
{UBOOT_MACHINE}; do
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0i=3D$(expr $i + 1);
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0for type in ${UBOOT_CONFIG}; do
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=3D$(expr $j + 1);
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $j -eq $i ];
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if !=
 [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_B=
INARY} ]; then
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFI=
X} ${B}/${config}/${UBOOT_BINARY}
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0done
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0unset=C2=A0 j
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset=C2=A0 i
>      > +=C2=A0 =C2=A0 =C2=A0else
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! [ -f ${B}/=
${UBOOT_BINARY} ]; then
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > +=C2=A0 =C2=A0 =C2=A0fi
>      > +}
>      > +
>      > +do_deploy:append () {
>      > +=C2=A0 =C2=A0 =C2=A0for f in ${B}/tiboot3-*.bin; do
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f "$f" ];=
 then
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0install -m 644 $f ${DEPLOYDIR}/
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > +=C2=A0 =C2=A0 =C2=A0done
>      > +
>      > +=C2=A0 =C2=A0 =C2=A0for f in ${B}/sysfw*.itb; do
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f "$f" ];=
 then
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0install -m 644 $f ${DEPLOYDIR}/
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > +=C2=A0 =C2=A0 =C2=A0done
>      > +}
>      > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb=
 <http://u-boot-bb.org_git.bb> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb=
.org_git.bb <http://u-boot-bb.org_git.bb>
>      > index 5bb20213..1ec5f9bf 100644
>      > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb <http:=
//u-boot-bb.org_git.bb>
>      > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb <http:=
//u-boot-bb.org_git.bb>
>      > @@ -12,6 +12,4 @@ BRANCH =3D "v2023.04-ti-09.00.00.011"
>      >=C2=A0 =C2=A0SRCREV =3D "4b8f8be8870f03d92a2b01d0d30ab912118adc82=
"
>      >
>      >=C2=A0 =C2=A0BRANCH:beagleplay =3D "v2023.04-ti-09.00.00.011-Beag=
lePlay"
>      > -BRANCH:beagleplay-k3r5 =3D "v2023.04-ti-09.00.00.011-BeaglePlay=
"
>      >=C2=A0 =C2=A0SRCREV:beagleplay =3D "10afea462ea1113701f6f0f8853fd=
ff985aa275d"
>      > -SRCREV:beagleplay-k3r5 =3D "10afea462ea1113701f6f0f8853fdff985a=
a275d"
>      > diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta=
-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>      > index 2f15c4fb..b0f88a5a 100644
>      > --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>      > +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>      > @@ -31,7 +31,6 @@ DEPENDS +=3D "python3-pyelftools-native python=
3-pyyaml-native python3-jsonschema-n
>      >
>      >=C2=A0 =C2=A0# SYSFW/TIFS Firmware
>      >=C2=A0 =C2=A0DEPENDS:append:k3 =3D " ti-sci-fw"
>      > -DEPENDS:append:k3r5 =3D " ti-sci-fw"
>      >
>      >=C2=A0 =C2=A0DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip=
.xer5f"
>      >
>      > @@ -79,7 +78,6 @@ SYSROOT_DIRS +=3D "/boot"
>      >
>      >=C2=A0 =C2=A0# SPL (Second Program Loader) to be loaded over UART
>      >=C2=A0 =C2=A0SPL_UART_BINARY =3D "u-boot-spl.bin"
>      > -SPL_UART_BINARY:k3r5 =3D ""
>      >
>      >=C2=A0 =C2=A0SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-$=
{PV}-${PR}"
>      >=C2=A0 =C2=A0SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}=
"
>      > @@ -108,30 +106,6 @@ UBOOT_HS_2ND_BINARY =3D "u-boot-spl_HS_2ND"
>      >=C2=A0 =C2=A0UBOOT_HS_2ND_IMAGE =3D "u-boot-spl_HS_2ND-${MACHINE}=
-${PV}-${PR}"
>      >=C2=A0 =C2=A0UBOOT_HS_2ND_SYMLINK =3D "u-boot-spl_HS_2ND-${MACHIN=
E}"
>      >
>      > -do_compile:append:k3r5 () {
>      > -=C2=A0 =C2=A0 =C2=A0if [ -n "${UBOOT_CONFIG}" ];
>      > -=C2=A0 =C2=A0 =C2=A0then
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for config in $=
{UBOOT_MACHINE}; do
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0i=3D$(expr $i + 1);
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0for type in ${UBOOT_CONFIG}; do
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j=3D$(expr $j + 1);
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $j -eq $i ];
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if !=
 [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_B=
INARY} ]; then
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFI=
X} ${B}/${config}/${UBOOT_BINARY}
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0done
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0unset=C2=A0 j
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset=C2=A0 i
>      > -=C2=A0 =C2=A0 =C2=A0else
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ! [ -f ${B}/=
${UBOOT_BINARY} ]; then
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > -=C2=A0 =C2=A0 =C2=A0fi
>      > -}
>      > -
>      >=C2=A0 =C2=A0do_install:append () {
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n "${UBOOT_CONFIG}" ]
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0then
>      > @@ -204,20 +178,6 @@ do_install:append () {
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      >=C2=A0 =C2=A0}
>      >
>      > -do_deploy:append:k3r5 () {
>      > -=C2=A0 =C2=A0 =C2=A0for f in ${B}/tiboot3-*.bin; do
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f "$f" ];=
 then
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0install -m 644 $f ${DEPLOYDIR}/
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > -=C2=A0 =C2=A0 =C2=A0done
>      > -
>      > -=C2=A0 =C2=A0 =C2=A0for f in ${B}/sysfw*.itb; do
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f "$f" ];=
 then
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0install -m 644 $f ${DEPLOYDIR}/
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      > -=C2=A0 =C2=A0 =C2=A0done
>      > -}
>      > -
>      >=C2=A0 =C2=A0do_deploy:append () {
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n "${UBOOT_CONFIG}" ]
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0then
>=20
>     --=20
>     Ryan Eatmon reatmon@ti.com <mailto:reatmon@ti.com>
>     -----------------------------------------
>     Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#17353): https://lists.yoctoproject.org/g/meta-t=
i/message/17353 <https://lists.yoctoproject.org/g/meta-ti/message/17353>
>     Mute This Topic: https://lists.yoctoproject.org/mt/103283292/505261=
2 <https://lists.yoctoproject.org/mt/103283292/5052612>
>     Group Owner: meta-ti+owner@lists.yoctoproject.org <mailto:meta-ti%2=
Bowner@lists.yoctoproject.org>
>     Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/1136986=
5/5052612/926574700/xyzzy <https://lists.yoctoproject.org/g/meta-ti/leave=
/11369865/5052612/926574700/xyzzy> [quaresma.jose@gmail.com <mailto:quare=
sma.jose@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
>=20
> --=20
> Best regards,
>=20
> Jos=C3=A9 Quaresma

