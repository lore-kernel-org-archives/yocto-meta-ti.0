Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14196C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 19:41:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1976.1651693280826320885
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 12:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C40B40C24;
	Wed,  4 May 2022 19:41:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1cfS9P6P5IrX; Wed,  4 May 2022 19:41:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56F5540B13;
	Wed,  4 May 2022 19:41:18 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 194CC17491C;
	Wed,  4 May 2022 15:41:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] optee-os,
 trusted-firmware-a: add leading whitespace when using append override
Date: Wed,  4 May 2022 19:41:18 +0000
Message-Id: <20220504194118.735239-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 19:41:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14691

From: Denys Dmytriyenko <denys@konsulko.com>

As append override does not add any whitespaces, it could lead to potenti=
al
issues when two items in space-separated list get concatenated. It is alw=
ays
recommended to add a leading whitespace in such cases, like EXTRA_OEMAKE.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend            | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 35cb9c95..5a2b4510 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -8,7 +8,7 @@ TFA_BUILD_TARGET:k3 =3D "all"
 TFA_INSTALL_TARGET:k3 =3D "bl31"
 TFA_SPD:k3 =3D "opteed"
=20
-EXTRA_OEMAKE:append:k3 =3D "${@ 'K3_USART=3D' + d.getVar('TFA_K3_USART')=
 if d.getVar('TFA_K3_USART') else ''}"
+EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_USART=3D' + d.getVar('TFA_K3_USART'=
) if d.getVar('TFA_K3_USART') else ''}"
=20
 do_compile:append:am65xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 5af57e16..6097580f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -1,4 +1,4 @@
-EXTRA_OEMAKE:append:k3 =3D "${@ 'CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_K=
3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
+EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
 do_compile:prepend:ti-soc() {
     export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
--=20
2.25.1


