Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516BAC4708D
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 22:24:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.302.1670451842221571262
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 14:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D04E40C37
	for <meta-ti@lists.yoctoproject.org>; Wed,  7 Dec 2022 22:24:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0XYPZ4lKTb0 for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2022 22:24:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F303340A03
	for <meta-ti@lists.yoctoproject.org>; Wed,  7 Dec 2022 22:24:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E74F11636AA; Wed,  7 Dec 2022 17:23:51 -0500 (EST)
Date: Wed, 7 Dec 2022 17:23:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sci-fw: make dependency
 on meta-ti-extras soft
Message-ID: <20221207222351.GB22689@denix.org>
References: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 22:24:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15429

Ping?


On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> Replace "require" with "include" to load ti-paths.inc and not break
> parsing when meta-ti-extras is not in the BBLAYERS list.
>=20
> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
> the soft dependency will still work fine and give a build error
> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
>=20
> Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
> d.getVar() to access it ensuring it doesn't break the condition.
>=20
> Reported-by: Daniel D=EDaz <mrchapp@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-=
ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index e89a6855..c99cd660 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -1,5 +1,5 @@
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> -require recipes-ti/includes/ti-paths.inc
> +include recipes-ti/includes/ti-paths.inc
> =20
>  DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virtual/b=
ootloader"
>  DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or '${TI_K=
3_SECDEV_INSTALL_DIR}' }"
> +TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVa=
r('TI_K3_SECDEV_INSTALL_DIR') }"
>  export TI_SECURE_DEV_PKG
> =20
>  SYSFW_SOC ?=3D "unknown"
> --=20
> 2.25.1

