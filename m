Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF92EE0045D
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2012 14:29:35 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9HLTToQ012558;
	Wed, 17 Oct 2012 16:29:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9HLTT0u025136;
	Wed, 17 Oct 2012 16:29:29 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 17 Oct 2012 16:29:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Arago Project git <git@arago-project.org>
Thread-Topic: [meta-ti] Franklin S. Cooper Jr :
	linux-am335x-3.2.0-psp04.06.00.08: Add PSP v04.06. 00.08 of	the Linux
	kernel
Thread-Index: AQHNrKyTPaeIEBDagk+wDd19SCUjn5e+A6Dx
Date: Wed, 17 Oct 2012 21:29:28 +0000
Message-ID: <6C205CE6-8B6E-449A-B7BC-B1132C48040C@ti.com>
References: <20121017211539.E9DA6529EF@arago-project.org>
In-Reply-To: <20121017211539.E9DA6529EF@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Franklin S. Cooper Jr :	linux-am335x-3.2.0-psp04.06.00.08: Add PSP v04.06. 00.08 of	the Linux kernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 21:29:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

please pull into denzil

On Oct 18, 2012, at 5:15 AM, "Arago Project git" <git@arago-project.org> wr=
ote:

> Module: meta-ti
> Branch: master
> Commit: c911405cbc180ff4e0215bff6e6b9d393f819912
> URL:    http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3Dc911405cb=
c180ff4e0215bff6e6b9d393f819912
>=20
> Author: Franklin S. Cooper Jr <fcooper@ti.com>
> Date:   Fri Oct 12 00:14:45 2012 -0500
>=20
> linux-am335x-3.2.0-psp04.06.00.08: Add PSP v04.06.00.08 of the Linux kern=
el
>=20
> * Add the PSP release version of the Linux kernel for the am335x-evm
> * Include a variable called KERNEL_PATCHES which can be used to add
>  patches on top of the PSP release of the Linux kernel. Currently used
>  to apply various patches that add functionality or fixes bugs.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
> ...odified-WLAN-enable-and-irq-to-match-boar.patch |   62 +
> ...x-Add-crypto-driver-settings-to-defconfig.patch |  130 +
> ...m335x-Add-pm_runtime-API-to-crypto-driver.patch |  405 ++
> ...x-enable-pullup-on-the-WLAN-enable-pin-fo.patch |   57 +
> ...01-am335x_evm_defconfig-turn-off-MUSB-DMA.patch |   35 +
> ...-using-edge-triggered-interrupts-for-WLAN.patch |   35 +
> ...x-Add-memory-addresses-for-crypto-modules.patch |   41 +
> .../0001-am33xx-Add-SmartReflex-support.patch      | 2014 ++++++
> .../0001-mach-omap2-pm33xx-Disable-VT-switch.patch |   71 +
> ...date-PIO-mode-help-information-in-Kconfig.patch |   45 +
> ...1-omap-serial-add-delay-before-suspending.patch |   42 +
> .../0002-AM335x-OCF-Driver-for-Linux-3.patch       | 7228 +++++++++++++++=
+++++
> ...-suspend-resume-routines-to-crypto-driver.patch |  147 +
> ...Add-crypto-device-and-resource-structures.patch |  111 +
> ...2-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch |   26 +
> ...rypto-device-and-resource-structure-for-T.patch |   60 +
> ...d-crypto-drivers-to-Kconfig-and-Makefiles.patch |  124 +
> ...eate-header-file-for-OMAP4-crypto-modules.patch |  213 +
> ...m33x-Create-driver-for-TRNG-crypto-module.patch |  324 +
> ...am33x-Create-driver-for-AES-crypto-module.patch |  971 +++
> ...x-Create-driver-for-SHA-MD5-crypto-module.patch | 1444 ++++
> .../linux-am335x-3.2.0-psp04.06.00.08/defconfig    | 2656 +++++++
> .../linux/linux-am335x_3.2.0-psp04.06.00.08.bb     |   81 +
> 23 files changed, 16322 insertions(+), 0 deletions(-)
>=20
> Diff:   http://arago-project.org/git/meta-ti.git?a=3Dcommitdiff;h=3Dc9114=
05cbc180ff4e0215bff6e6b9d393f819912
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

