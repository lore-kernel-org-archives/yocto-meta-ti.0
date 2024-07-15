Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DD4C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 18:49:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.573.1721069360435262841
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 11:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7030440C67;
	Mon, 15 Jul 2024 18:49:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjgDgw5N4YfD; Mon, 15 Jul 2024 18:49:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 545F4407DA;
	Mon, 15 Jul 2024 18:49:18 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 4A90E163FEB;
	Mon, 15 Jul 2024 14:49:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] ti-cgt-pru: UNPACKDIR cleanup
Date: Mon, 15 Jul 2024 14:49:14 -0400
Message-Id: <20240715184914.15472-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Jul 2024 18:49:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17861

From: Denys Dmytriyenko <denys@konsulko.com>

Fix warning that S does not exist, since it defaults to ${WORKDIR}/${BP}

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/met=
a-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index 47bd6a51..75bb7262 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -24,14 +24,17 @@ SRC_URI[cgt-pru-x86.sha256sum] =3D "1f1405167214f2c0e=
f848591b17a7799fdcd9f55f11bc9
 SRC_URI[cgt-pru-arm.md5sum] =3D "648a6d7d8162fd6a89f381c7b974e6b0"
 SRC_URI[cgt-pru-arm.sha256sum] =3D "8390cb77b46b728ce2940595b81406f76d86=
dfed58c21258e3206a7c1232ccf2"
=20
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
+
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
-    cp -r ${UNPACKDIR}/ti-cgt-pru_${PV}/. \
+    cp -r ${S}/ti-cgt-pru_${PV}/. \
           ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
 }
=20
 do_install:class-target() {
-    ${UNPACKDIR}/${BINFILE} --prefix ${D}
+    ${S}/${BINFILE} --prefix ${D}
 }
=20
 FILES:${PN} +=3D "${datadir}/ti/*"
--=20
2.35.3


