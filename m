Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA809C83005
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6706.1679285563347936764
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB0F740CA8
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMfFLOphS4YJ for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F80640C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 85E4A1637CC
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 08/54] optee: update optee-client, optee-test, optee-examples to 3.19 tag
Date: Mon, 20 Mar 2023 04:11:55 +0000
Message-Id: <20230320041241.1293077-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16110

From: Manorit Chawdhry <m-chawdhry@ti.com>

optee-os was updated to 3.19 tag but the others were still outdated.

Updates other optee components to 3.19 tag

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-security/optee/optee-client_3.16%.bbappend      | 6 ++++--
 .../recipes-security/optee/optee-examples_%.bbappend        | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend    | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappe=
nd b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
index 109d451c..61760b8e 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
@@ -1,2 +1,4 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
+PV:ti-soc =3D "3.19.0+git${SRCPV}"
+SRCREV:ti-soc =3D "140bf463046071d3ca5ebbde3fb21ee0854e1951"
+
+DEPENDS:append:ti-soc =3D "pkgconfig util-linux"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend=
 b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
index 98b5bea4..9c757f11 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
@@ -1,2 +1,2 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
+PV:ti-soc =3D "3.19.0+git${SRCPV}"
+SRCREV:ti-soc =3D "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
index 4fbaa4c4..b9e803c5 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
@@ -1,3 +1,3 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
+PV:ti-soc =3D "3.19.0+git${SRCPV}"
+SRCREV:ti-soc =3D "ab9863cc187724e54c032b738c28bd6e9460a4db"
 SRC_URI:ti-soc =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmast=
er;protocol=3Dhttps"
--=20
2.25.1


