Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA69C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 14:58:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47474.1681138710266310981
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 07:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1181340C2E;
	Mon, 10 Apr 2023 14:58:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v44RT59F6mfH; Mon, 10 Apr 2023 14:58:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6BB940301;
	Mon, 10 Apr 2023 14:58:27 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EA3071637E6;
	Mon, 10 Apr 2023 10:57:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] optee: remove bbappends with version bumps
Date: Mon, 10 Apr 2023 14:58:26 +0000
Message-Id: <20230410145826.3982951-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 14:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16337

From: Denys Dmytriyenko <denys@konsulko.com>

meta-arm now has all optee components updated to the latest 3.20 version

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../optee/optee-client_%.bbappend             |  7 ------
 .../optee/optee-examples_%.bbappend           |  2 --
 .../optee/optee-os-tadevkit_3.20.0.bb         | 24 -------------------
 .../optee/optee-test_%.bbappend               |  2 --
 4 files changed, 35 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-client_%.bba=
ppend
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples_%.b=
bappend
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_=
3.20.0.bb
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-test_%.bbapp=
end

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
deleted file mode 100644
index 19db3827..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PV:ti-soc =3D "3.20.0+git${SRCPV}"
-SRCREV:ti-soc =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
-
-inherit pkgconfig
-DEPENDS:append:ti-soc =3D " util-linux"
-
-EXTRA_OEMAKE:append:ti-soc =3D " PKG_CONFIG=3Dpkg-config"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend=
 b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
deleted file mode 100644
index 9c757f11..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PV:ti-soc =3D "3.19.0+git${SRCPV}"
-SRCREV:ti-soc =3D "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.=
bb b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
deleted file mode 100644
index f2cc06d8..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require recipes-security/optee/optee-os_3.20.0.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
-
-do_install() {
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-	echo "Do not inherit do_deploy from optee-os."
-}
-
-FILES:${PN} =3D "${includedir}/optee/"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
deleted file mode 100644
index 361a9115..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PV:ti-soc =3D "3.19.0+git${SRCPV}"
-SRCREV:ti-soc =3D "ab9863cc187724e54c032b738c28bd6e9460a4db"
--=20
2.25.1


