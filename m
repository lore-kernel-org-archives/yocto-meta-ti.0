Return-Path: <jdk@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40074E01304
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:57:31 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6Q1vTfX018759;
	Wed, 25 Jul 2012 20:57:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6Q1vTta000598;
	Wed, 25 Jul 2012 20:57:29 -0500
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 25 Jul 2012 20:57:29 -0500
From: "Kridner, Jason" <jdk@ti.com>
To: Arago Project git <git@arago-project.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Koen Kooi : u-boot 2011.09+git: update to latest
	version of Tom Rini's tree
Thread-Index: AQHNatICVSu6B8CUME6oPVAVVVTevA==
Date: Thu, 26 Jul 2012 01:57:27 +0000
Message-ID: <CC361C01.B0548%jdk@ti.com>
In-Reply-To: <20120726013212.1F5DA52AA6@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.2.3.120616
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Koen Kooi : u-boot 2011.09+git: update to latest version of Tom Rini's tree
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 01:57:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FCC8F19B3915774FAC814E438714F00B@owa.mail.ti.com>
Content-Transfer-Encoding: quoted-printable


-----Original Message-----
From: Arago Project git <git@arago-project.org>
Date: Wednesday, July 25, 2012 9:32 PM
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: [meta-ti] Koen Kooi : u-boot 2011.09+git: update to latest
version	of Tom Rini's tree

>Module: meta-ti
>Branch: master
>Commit: e1b4ab72cfb3ea4599701d1600c44fe3c5f8ba66
>URL:   =20
>http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3De1b4ab72cfb3ea4599=
701d
>1600c44fe3c5f8ba66
>
>Author: Koen Kooi <koen@dominion.thruhere.net>
>Date:   Wed Jul 11 11:53:27 2012 +0200
>
>u-boot 2011.09+git: update to latest version of Tom Rini's tree

Aren't all of Tom's patches upstream now?  Why not pull from the latest
u-boot release? Are we carrying any patches that would be accepted
upstream?

>
>All patches have been rediffed and boot tested
>
>Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
>---
>
> ...add-option-to-boot-kernel-from-boot-in-ex.patch |   26 ++++++
> ...only-do-in-kernel-dhcp-when-using-NFS-use.patch |   35 --------
> ...ddr_defs-change-DDR-timings-for-15x15-EVM.patch |   30 -------
> ...boot-kernel-from-boot-in-ext2-3-filesyste.patch |   27 -------
> ...ch =3D> 0002-am335x_evm-set-bootdelay-to-1.patch} |   18 ++--
> ...make-MMC-rootfs-RO-on-boot-so-fsck-works.patch} |   12 ++--
> ....patch =3D> 0004-am335x_evm-switch-to-ext4.patch} |   14 ++--
> ...ge-mmc_load_uimage-to-load-at-a-fixed-add.patch |   49 ------------
> ...5x-evm-enable-i2c2-pinmux-for-beaglebone.patch} |   18 ++--
> ...vm-Fix-bone-pmic-shut-down-over-USB-power.patch |   82
>--------------------
> ...tch =3D> 0006-ext2load-increase-read-speed.patch} |   10 +-
> ...fix-ext2load-and-specify-partition-for-bo.patch |   30 +++++++
> ...-evm-turn-d-cache-on-globally-turn-it-off.patch |   46 -----------
> ...vm-load-uImage-from-boot-instead-of-VFAT.patch} |   18 ++--
> ...ort.patch =3D> 0009-ext4fs-ls-load-support.patch} |   12 ++--
> ...patch =3D> 0010-am335x-switch-to-ext4-mode.patch} |   33 ++++----
> ...fix-ext2load-and-specify-partition-for-bo.patch |   28 -------
> recipes-bsp/u-boot/u-boot_2011.10rc.bb             |   31 +++----
> 18 files changed, 137 insertions(+), 382 deletions(-)
>
>Diff:  =20
>http://arago-project.org/git/meta-ti.git?a=3Dcommitdiff;h=3De1b4ab72cfb3ea=
4599
>701d1600c44fe3c5f8ba66
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


