Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C0DC7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:11:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2504.1684779114419045977
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 May 2023 11:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFF6140C2E;
	Mon, 22 May 2023 18:11:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DP9JLAw53OPn; Mon, 22 May 2023 18:11:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8F3C40429;
	Mon, 22 May 2023 18:11:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 033D0163843;
	Mon, 22 May 2023 14:11:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] optee: couple minor changes to match with kirkstone
Date: Mon, 22 May 2023 18:11:52 +0000
Message-Id: <20230522181152.713127-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 May 2023 18:11:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16575

From: Denys Dmytriyenko <denys@konsulko.com>

Minor changes to match with Kirkstone for consistency.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc     | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti=
-bsp/recipes-security/optee/optee-os-ti.inc
index 4f052996..9140d12d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -82,7 +82,7 @@ do_compile:append:j784s4-hs-evm() {
     optee_sign_k3hs
 }
=20
-do_install:append:ti-soc() {
+do_install:append() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || =
true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ ||=
 true
     install -m 644 ${B}/bl32.bin.unsigned ${D}${nonarch_base_libdir}/fir=
mware/ || true
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 0067cdc7..08c5256b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -1,4 +1,4 @@
 OPTEE_TI =3D ""
-OPTEE_TI:ti-soc =3D "optee-os-ti.inc"
+OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
=20
 require ${OPTEE_TI}
--=20
2.25.1


