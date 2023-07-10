Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CB3EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 14:20:50 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.40961.1688998840686017626
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 07:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=ny76Kg3g;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688998840; x=1720534840;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eruqRWCaGd1Qus28hHlNjrKgm6RCeJd8YPrKm1ndYSk=;
  b=ny76Kg3gyF3IM5DrlJzAjuFDqgrzWUDNZ0qly4SWt+0p0R3DYy1HA5/z
   FBGY/U6iBV71pCWutYo14DAjjpDnfYXkslm8TtzQp5qP64ZnYPsLo8RKv
   W8FejaDtOp4p0M/MSFm1hb3sSP0GkYrvLj4v7M8UPLwuyzA3h1bd6msI9
   IDH/QaxzcJaEDO3//xraqeRI52GY2DupUOIxyiDpjkZjCNzhAASiSIqvK
   0jmM2m5++iwSYZ5yI6QugrO3lZ9iRejYhI/PxUtOAK7igbG1l2RrCDivu
   CS45PAsWrdb6W1htKDcV2w86l7DqPlmuAP6jkJlNUwbha/3mEMLhRA4UC
   A==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684792800"; 
   d="scan'208";a="31843573"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jul 2023 16:20:37 +0200
Received: from [192.168.2.129] (SCHIFFERM-M2.tq-net.de [10.121.49.20])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id B9826280078;
	Mon, 10 Jul 2023 16:20:37 +0200 (CEST)
Message-ID: <805ad6ac0921231338d2e29ca9cc0a4b461e004f.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] meta-ti-bsp: add mesa to
 SIGGEN_EXCLUDERECIPES_ABISAFE list
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Andrew Davis <afd@ti.com>, 
	meta-ti@lists.yoctoproject.org
Date: Mon, 10 Jul 2023 16:20:37 +0200
In-Reply-To: <20230418200217.301038-1-denis@denix.org>
References: <20230418200217.301038-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Jul 2023 14:20:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16838

On Tue, 2023-04-18 at 20:02 +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> For TI platforms with SGX and Rogue graphics we patch upstream Mesa with
> PVR support and conditionally enable features based on virtual/gpudriver
> preference. This makes Mesa package platform-specific and it contains the
> corresponding PACKAGE_ARCH =3D "${MACHINE_ARCH}" line.
>=20
> In order to get greater re-use from generic non-machine-speciofic package=
s
> down the dependency chain, such as Wayland, Weston, Qt5 modules, etc. we
> need to mark mesa recipe as still providing stable OpenGL ABIs, such as
> EGL, GLES, GBM, etc. - add it to SIGGEN_EXCLUDERECIPES_ABISAFE list.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 948db4f9..e9b7f92c 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -19,6 +19,7 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
>  "
> =20
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> +    mesa \

We found that excluding mesa (or now mesa-pvr) from signature
generation can lead to build breakage when updating meta-ti. As
previous meta-ti versions excluded "ti-sgx-ddk-um" and new version
excludes "mesa-pvr", this can result in builds of dependent packages
that differ in these specific runtime dependencies, but that have the
same sstate hash!

The build failures look like the following (we're seeing it for
multiple packages):

Problem 2: package packagegroup-testutils-1.0-r0.tqma335x_mba335x
requires glmark2, but none of the providers can be installed
   - conflicting requests
   - nothing provides ti-sgx-ddk-um >=3D 1.17.4948957 needed by glmark2-
2021.12-r0.armv7at2hf_neon

Here, Bitbake omitted to rebuild glmark2 because of the sstate
equivalence, picking up an older build that depends on ti-sgx-ddk-um,
even though ti-sgx-ddk-um is not selected anymore in the current
configuration. Rebuilding glmark2 with a clean sstate cache results in
a package that has a "libgbm1 >=3D 22.3.5" dependency instead of "ti-sgx-
ddk-um >=3D 1.17.4948957" (as shown by 'rpm -qpR'; the rest of the
dependencies are unchanged).

I think we can work around the issue this time by forcing a change of
sstate hash by other means in our TQ-Systems layer when updating for
the current meta-ti, but this whole game with
SIGGEN_EXCLUDERECIPES_ABISAFE seems very fragile to me...

Regards,
Matthias



>  "
> =20
>  HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16410): https://lists.yoctoproject.org/g/meta-ti/mess=
age/16410
> Mute This Topic: https://lists.yoctoproject.org/mt/98352641/4454427
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10992514/4454=
427/2074109644/xyzzy [matthias.schiffer@ew.tq-group.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

