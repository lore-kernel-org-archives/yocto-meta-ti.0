Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B3AFE01341
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 00:13:39 -0700 (PDT)
Received: by eyh5 with SMTP id 5so4908701eyh.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 00:13:38 -0700 (PDT)
Received: by 10.14.9.198 with SMTP id 46mr1712900eet.176.1319181218389;
	Fri, 21 Oct 2011 00:13:38 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q50sm32254147eef.9.2011.10.21.00.13.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 00:13:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319159079-4220-1-git-send-email-joelagnel@ti.com>
Date: Fri, 21 Oct 2011 09:13:35 +0200
Message-Id: <6A3878F8-1248-4B93-9EB9-AC2BE5028261@dominion.thruhere.net>
References: <1319159079-4220-1-git-send-email-joelagnel@ti.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: Re: [Angstrom-devel] [PATCH meta-ti 1/2] u-boot 2011.10rc: Fix kernel hang due to machine ID patches
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
X-List-Received-Date: Fri, 21 Oct 2011 07:13:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 03:04 heeft Joel A Fernandes het volgende =
geschreven:

> As we're not going to be allocating a new machine ID for BeagleBone

That's not what I heard yesterday.

And please follow the instructions at =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/tree/README


> , and as these patches
> have been verified to cause the kernel to hang and thus make newer =
images unbootable,
> lets drop it from the recipe but lets optionally leave the patches =
itself undeleted for now.
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> Build and run time tested
>=20
> recipes-bsp/u-boot/u-boot_2011.10rc.bb |    2 --
> 1 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb =
b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> index 3f6e570..35c84da 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> @@ -15,8 +15,6 @@ SRC_URI =3D =
"git://arago-project.org/git/projects/u-boot-am33x.git;protocol=3Dgit;br
>            =
file://2011.09git/0001-am335x_evm-boot-kernel-from-ext2-3-filesystem.patch=
 \
>            file://2011.09git/0002-am335x_evm-set-bootdelay-to-0.patch =
\
>            =
file://2011.09git/0003-am335x-evm-make-rootfs-RO-on-boot.patch \
> -           =
file://2011.09git/0001-mach-types-Add-new-beaglebone-machine-type.patch =
\
> -           =
file://2011.09git/0002-evm-If-beaglebone-is-detected-pass-the-MACH_TYPE_BE=
A.patch \
>            =
file://2011.09git/0003-am335x_evm-single-byte-address-EEPROM-for-board-ide=
n.patch \
>            =
file://2011.09git/0004-am335x-evm-fall-back-to-bone-if-header.config-is-em=
p.patch \
>           "
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Angstrom-distro-devel mailing list
> Angstrom-distro-devel@linuxtogo.org
> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel


