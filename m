Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B4DEB64D8
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 21:18:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2704.1686691126261690423
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 14:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3F0E640AE9;
	Tue, 13 Jun 2023 21:18:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yYWCBvCRT6FE; Tue, 13 Jun 2023 21:18:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2561740C47;
	Tue, 13 Jun 2023 21:18:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AC11C163A53;
	Tue, 13 Jun 2023 17:17:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] optee: local fix for stray CFG_MAP_EXT_DT_SECURE=y in meta-arm
Date: Tue, 13 Jun 2023 21:18:42 +0000
Message-Id: <20230613211842.2897808-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613211842.2897808-1-denis@denix.org>
References: <20230613211842.2897808-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jun 2023 21:18:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16716

From: Denys Dmytriyenko <denys@konsulko.com>

Latest update in meta-arm added unconditional CFG_MAP_EXT_DT_SECURE=3Dy
that affects all platforms, but was only needed for qemu. And it also
depends on CFG_DT=3Dy, which is platform-specific. The fix was submitted
upstream[0], overlay it locally until upstream resolves it.

[0] https://patchwork.yoctoproject.org/project/arm/patch/20230613181723.1=
711212-1-denis@denix.org/

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc   | 1 +
 .../recipes-security/optee/optee-os-tadevkit_%.bbappend       | 4 ++++
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc            | 2 ++
 3 files changed, 7 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-=
ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_=
%.bbappend

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc =
b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
new file mode 100644
index 00000000..df46e243
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
@@ -0,0 +1 @@
+EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbapp=
end b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
new file mode 100644
index 00000000..08c5256b
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -0,0 +1,4 @@
+OPTEE_TI =3D ""
+OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti=
-bsp/recipes-security/optee/optee-os-ti.inc
index 20f88127..1f898a6d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -1,6 +1,8 @@
 # Use TI SECDEV for signing
 inherit ti-secdev
=20
+EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
+
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
 EXTRA_OEMAKE:append:am62xx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy CFG_TEE_CORE=
_LOG_LEVEL=3D1"
--=20
2.25.1


