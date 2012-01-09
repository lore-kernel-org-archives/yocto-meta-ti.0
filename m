Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 847F8E0127D
	for <meta-ti@yoctoproject.org>; Mon,  9 Jan 2012 01:47:04 -0800 (PST)
Received: by wgbdq11 with SMTP id dq11so1219017wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 09 Jan 2012 01:47:03 -0800 (PST)
Received: by 10.180.90.136 with SMTP id bw8mr3422424wib.1.1326102423317;
	Mon, 09 Jan 2012 01:47:03 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ee6sm942621wib.4.2012.01.09.01.47.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 01:47:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1324486741-23134-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 9 Jan 2012 10:47:00 +0100
Message-Id: <84DA4353-76E0-4AB7-9589-49B2BC259A9A@dominion.thruhere.net>
References: <1324486741-23134-1-git-send-email-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V2] u-boot_2011.09: Always use gnu ld for LD
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
X-List-Received-Date: Mon, 09 Jan 2012 09:47:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I suspect you did this for the beagleboard machine, which isn't using =
2011.09 anymore. Do you still want this patch in?

Op 21 dec. 2011, om 17:59 heeft Khem Raj het volgende geschreven:

> u-boot wants GNU ld and cant link with gold
> so when default linker is gold we make sure
> that it still uses good old GNU ld
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../u-boot/0001-config-Always-use-GNU-ld.patch     |   43 =
++++++++++++++++++++
> recipes-bsp/u-boot/u-boot_2011.09.bb               |    3 +-
> 2 files changed, 45 insertions(+), 1 deletions(-)
> create mode 100644 =
recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch =
b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
> new file mode 100644
> index 0000000..2564d1d
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
> @@ -0,0 +1,43 @@
> +=46rom dff01fc9346e6f4e3386536df309d2e78f03f3ee Mon Sep 17 00:00:00 =
2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 21 Dec 2011 08:53:02 -0800
> +Subject: [PATCH] config: Always use GNU ld
> +
> +This patch makes sure that we always use the GNU ld. u-boot uses =
certain
> +construct e.g. OVERLAY which are not implemented in gold therefore it
> +always needs GNU ld for linking. It works well if default linker in
> +toolchain is GNU ld but in some cases we can have gold to be the
> +default linker and also ship GNU ld but not as default in such cases
> +its called $(PREFIX)ld.bfd, with this patch we make sure that if
> +$(PREFIX)ld.bfd exists than we use that for our ld. This way it
> +does not matter what the default ld is.
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + config.mk |    4 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +diff --git a/config.mk b/config.mk
> +index ddaa477..59b3e71 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -126,11 +126,13 @@ cc-option =3D $(strip $(if $(findstring =
$1,$(CC_OPTIONS)),$1,\
> + 		$(if $(call cc-option-sys,$1),$1,$2)))
> + endif
> +=20
> ++exists_bfd_ld =3D $(shell if $(CROSS_COMPILE)ld.bfd -v >& /dev/null; =
\
> ++		then echo "$(1)"; else echo "$(2)"; fi; )
> + #
> + # Include the make variables (CC, etc...)
> + #
> + AS	=3D $(CROSS_COMPILE)as
> +-LD	=3D $(CROSS_COMPILE)ld
> ++LD	=3D $(call exists_bfd_ld, "$(CROSS_COMPILE)ld.bfd", =
"$(CROSS_COMPILE)ld")
> + CC	=3D $(CROSS_COMPILE)gcc
> + CPP	=3D $(CC) -E
> + AR	=3D $(CROSS_COMPILE)ar
> +--=20
> +1.7.5.4
> +
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb =
b/recipes-bsp/u-boot/u-boot_2011.09.bb
> index 74c8518..4a9d3cb 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
> @@ -1,6 +1,6 @@
> require u-boot.inc
>=20
> -PR =3D "r5"
> +PR =3D "r6"
>=20
> # SPL build
> UBOOT_BINARY =3D "u-boot.img"
> @@ -32,6 +32,7 @@ SRC_URI =3D =
"git://www.denx.de/git/u-boot.git;protocol=3Dgit \
>            =
file://2011.09/0019-BeagleBoard-config-Really-switch-to-ttyO2.patch \
>            =
file://2011.09/0020-beagleboard-add-support-for-TCT-Beacon-board.patch \
>            =
file://2011.09/0021-beagleboard-add-support-for-scanning-loop-through-ex.p=
atch \
> +           file://0001-config-Always-use-GNU-ld.patch \
>            file://fw_env.config \
>           "
>=20
> --=20
> 1.7.5.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


