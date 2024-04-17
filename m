Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241F1C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 21:26:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.26113.1713389181408210732
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 14:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 960E640C7B;
	Wed, 17 Apr 2024 21:26:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DSrnFoLohKW; Wed, 17 Apr 2024 21:26:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7B6F140C2A;
	Wed, 17 Apr 2024 21:26:19 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0DDE7163F21;
	Wed, 17 Apr 2024 17:26:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap/kirkstone][PATCH] u-boot-ti: deploy initial-env for the main machine
Date: Wed, 17 Apr 2024 17:26:16 -0400
Message-Id: <20240417212616.133571-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 21:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17592

From: Denys Dmytriyenko <denys@konsulko.com>

It is useful to have U-boot initial environment deployed for future
reference or to initialize environment files as part of the build.

In multiconfig setup, such as TI K3 platforms, building U-boot
multiple times for Cortex-R5 and Cortex-A53 cores results in file
conflicts when deploying under the same name. To avoid that, those
initial-env files were removed at the end of the do_deploy task.

But it is better to only remove them for k3r5 multiconfig, since
that only builds SPL and saved env doesn't make much sense, but
preserve and deploy initial-env for the main machine multiconfig.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
Note: this can be applied to all 3 active branches - kirkstone,
scarthgap and master

 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 2c0d4fc4..bad8371f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -221,6 +221,13 @@ do_deploy:append:k3r5 () {
 			install -m 644 $f ${DEPLOYDIR}/
 		fi
 	done
+
+	rm ${DEPLOYDIR}/u-boot-initial-env || true
+	rm ${DEPLOYDIR}/${PN}-initial-env || true
+	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE} || true
+	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE} || true
+	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR} || true
+	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }
=20
 do_deploy:append () {
@@ -325,13 +332,6 @@ do_deploy:append () {
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
 		fi
 	fi
-
-	rm ${DEPLOYDIR}/u-boot-initial-env || true
-	rm ${DEPLOYDIR}/${PN}-initial-env || true
-	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE} || true
-	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE} || true
-	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR} || true
-	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }
=20
 do_install:append:am62xx() {
--=20
2.25.1


