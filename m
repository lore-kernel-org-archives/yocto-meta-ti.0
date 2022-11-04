Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3BCC4321E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.810.1667602020725261796
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D21540D89
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:47:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18mg5bXwzr6y for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:47:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7F31540D88
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 11B53163681
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 08/50] ti-sci-fw: Only deploy the raw SYSFW images for one machine target
Date: Fri,  4 Nov 2022 22:46:10 +0000
Message-Id: <20221104224653.1223044-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15320

From: Andrew Davis <afd@ti.com>

This recipe deploys the raw SYSFW unconditionally which causes issues
when doing multiconfig builds. What should happen is only one deploys
these, select that the same way we select which one deploys the default
SYSFW symlink. Move the deploy step there.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 506052ca..ae90e877 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -99,6 +99,7 @@ do_deploy () {
 		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
 		if [ ! -z "${SYSFW_SYMLINK}" ]; then
 			ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
+			install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 		fi
 	fi
=20
@@ -106,10 +107,9 @@ do_deploy () {
 		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW=
_TIBOOT3}
 		if [ ! -z "${SYSFW_TIBOOT3_SYMLINK}" ]; then
 			ln -sf ${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW_TIBOOT3_SYMLINK}
+			install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 		fi
 	fi
-
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
=20
 addtask deploy before do_build after do_compile
--=20
2.25.1


