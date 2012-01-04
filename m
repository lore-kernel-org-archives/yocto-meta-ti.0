Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18D93E006DD
	for <meta-ti@yoctoproject.org>; Wed,  4 Jan 2012 10:47:37 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qadc16 with SMTP id c16so13008446qad.14
	for <meta-ti@yoctoproject.org>; Wed, 04 Jan 2012 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=kHg3dH11bvl5oUdHMuyL9Sdw9arBWwsgcC+JVQMvr40=;
	b=NEe73upSKpuYe9UslyNmuPrZshRp2JDB6d0aIsckKfZzk+JlkxtNLowN5E+0C/7qce
	1W8nNp0TA7VJhUJIZN4aGY9b1ftsl2mo+6xWpwOzE9B517lvF5lLDlwU6eN1s6bkZWdT
	mRo23B3R8tW9YOCv1ERkRnm1BdSVt3F1yNuOM=
MIME-Version: 1.0
Received: by 10.224.102.2 with SMTP id e2mr68573554qao.31.1325702856269; Wed,
	04 Jan 2012 10:47:36 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Wed, 4 Jan 2012 10:47:36 -0800 (PST)
In-Reply-To: <1324486741-23134-1-git-send-email-raj.khem@gmail.com>
References: <1324486741-23134-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 4 Jan 2012 11:47:36 -0700
Message-ID: <CA+M6bXk7vTW0M37D6_aRHp2eNrBjycw97SjSh27ipe-z5U69HQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 04 Jan 2012 18:47:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2011 at 9:59 AM, Khem Raj <raj.khem@gmail.com> wrote:
> u-boot wants GNU ld and cant link with gold
> so when default linker is gold we make sure
> that it still uses good old GNU ld
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Tom Rini <trini@ti.com>

> ---
> =A0.../u-boot/0001-config-Always-use-GNU-ld.patch =A0 =A0 | =A0 43 ++++++=
++++++++++++++
> =A0recipes-bsp/u-boot/u-boot_2011.09.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A03 +-
> =A02 files changed, 45 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes-bsp/u-boot/u-boot/0001-config-Always-use-GN=
U-ld.patch
>
> diff --git a/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patc=
h b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
> new file mode 100644
> index 0000000..2564d1d
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
> @@ -0,0 +1,43 @@
> +From dff01fc9346e6f4e3386536df309d2e78f03f3ee Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 21 Dec 2011 08:53:02 -0800
> +Subject: [PATCH] config: Always use GNU ld
> +
> +This patch makes sure that we always use the GNU ld. u-boot uses certain
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
> + config.mk | =A0 =A04 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +diff --git a/config.mk b/config.mk
> +index ddaa477..59b3e71 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -126,11 +126,13 @@ cc-option =3D $(strip $(if $(findstring $1,$(CC_OP=
TIONS)),$1,\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(if $(call cc-option-sys,$1),$1,$2)))
> + endif
> +
> ++exists_bfd_ld =3D $(shell if $(CROSS_COMPILE)ld.bfd -v >& /dev/null; \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0then echo "$(1)"; else echo "$(2)"; fi; )
> + #
> + # Include the make variables (CC, etc...)
> + #
> + AS =A0 =A0=3D $(CROSS_COMPILE)as
> +-LD =A0 =A0=3D $(CROSS_COMPILE)ld
> ++LD =A0 =A0=3D $(call exists_bfd_ld, "$(CROSS_COMPILE)ld.bfd", "$(CROSS_=
COMPILE)ld")
> + CC =A0 =A0=3D $(CROSS_COMPILE)gcc
> + CPP =A0 =3D $(CC) -E
> + AR =A0 =A0=3D $(CROSS_COMPILE)ar
> +--
> +1.7.5.4
> +
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-=
boot_2011.09.bb
> index 74c8518..4a9d3cb 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
> @@ -1,6 +1,6 @@
> =A0require u-boot.inc
>
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0# SPL build
> =A0UBOOT_BINARY =3D "u-boot.img"
> @@ -32,6 +32,7 @@ SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=
=3Dgit \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0019-BeagleBoard-config-Really-swit=
ch-to-ttyO2.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0020-beagleboard-add-support-for-TC=
T-Beacon-board.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://2011.09/0021-beagleboard-add-support-for-sc=
anning-loop-through-ex.patch \
> + =A0 =A0 =A0 =A0 =A0 file://0001-config-Always-use-GNU-ld.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://fw_env.config \
> =A0 =A0 =A0 =A0 =A0 "
>
> --
> 1.7.5.4
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



--=20
Tom

