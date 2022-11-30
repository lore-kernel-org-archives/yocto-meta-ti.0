Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0277C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:38:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.27598.1669847897583649360
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 827D940ACD;
	Wed, 30 Nov 2022 22:38:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cf9F1QwIlGw3; Wed, 30 Nov 2022 22:38:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6ADAA400CF;
	Wed, 30 Nov 2022 22:38:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 99D88163689;
	Wed, 30 Nov 2022 17:38:07 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] optee: drop 3.17 versions
Date: Wed, 30 Nov 2022 22:38:11 +0000
Message-Id: <20221130223811.330397-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:38:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15379

From: Denys Dmytriyenko <denys@konsulko.com>

These bbappends were bumping versions to 3.17 when upstream only provided
3.16 version. Now that upstream meta-arm provides 3.18 versions, there's
no need for the bbappends, especially since they break in do_install.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend     | 2 --
 meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend   | 2 --
 .../recipes-security/optee/optee-os-tadevkit_%.bbappend        | 2 --
 meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend       | 3 ---
 4 files changed, 9 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-client_%.bba=
ppend
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples_%.b=
bappend
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_=
%.bbappend
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-test_%.bbapp=
end

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
deleted file mode 100644
index 109d451c..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend=
 b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
deleted file mode 100644
index 98b5bea4..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbapp=
end b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
deleted file mode 100644
index 4300c1a9..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
deleted file mode 100644
index 4fbaa4c4..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
-SRC_URI:ti-soc =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmast=
er;protocol=3Dhttps"
--=20
2.25.1


