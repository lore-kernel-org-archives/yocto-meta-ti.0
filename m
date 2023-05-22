Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6984C77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:11:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2401.1684779106449124415
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 May 2023 11:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A547840C2E;
	Mon, 22 May 2023 18:11:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZJO5VjSdqJt; Mon, 22 May 2023 18:11:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8182840429;
	Mon, 22 May 2023 18:11:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CBC20163843;
	Mon, 22 May 2023 14:10:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH] optee: redo bbappends for yocto compliance and flexibility
Date: Mon, 22 May 2023 18:11:43 +0000
Message-Id: <20230522181143.713064-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 May 2023 18:11:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16574

From: Denys Dmytriyenko <denys@konsulko.com>

Like with master, move the actual TI-specific changes into corresponding
include files that are only activated for ti-soc derived platforms.

Since include files are already guarded and only activated for ti-soc
platforms, no need to use such override again.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti.inc   | 7 +++++++
 .../recipes-security/optee/optee-client_3.16%.bbappend   | 9 +++------
 meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc | 3 +++
 .../recipes-security/optee/optee-examples_%.bbappend     | 7 ++++---
 .../recipes-security/optee/optee-os-tadevkit-ti.inc      | 2 ++
 .../recipes-security/optee/optee-os-tadevkit_%.bbappend  | 6 ++++--
 meta-ti-bsp/recipes-security/optee/optee-os-ti.inc       | 5 ++++-
 .../recipes-security/optee/optee-os_3.16%.bbappend       | 5 +----
 meta-ti-bsp/recipes-security/optee/optee-test-ti.inc     | 2 ++
 meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend | 7 ++++---
 10 files changed, 34 insertions(+), 19 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti.in=
c
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples-ti.=
inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-=
ti.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test-ti.inc

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/met=
a-ti-bsp/recipes-security/optee/optee-client-ti.inc
new file mode 100644
index 00000000..fef87d30
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
@@ -0,0 +1,7 @@
+PV =3D "3.20.0+git${SRCPV}"
+SRCREV =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
+
+inherit pkgconfig
+DEPENDS +=3D "util-linux"
+
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappe=
nd b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
index 19db3827..08c5256b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
@@ -1,7 +1,4 @@
-PV:ti-soc =3D "3.20.0+git${SRCPV}"
-SRCREV:ti-soc =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
+OPTEE_TI =3D ""
+OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
=20
-inherit pkgconfig
-DEPENDS:append:ti-soc =3D " util-linux"
-
-EXTRA_OEMAKE:append:ti-soc =3D " PKG_CONFIG=3Dpkg-config"
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/m=
eta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
new file mode 100644
index 00000000..7d119f0d
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
@@ -0,0 +1,3 @@
+PV =3D "3.20.0+git${SRCPV}"
+SRCREV =3D "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
+SRC_URI:remove =3D "file://0001-Makefile-Fix-non-portable-sh-check-for-p=
lugins.patch"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend=
 b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
index 1760a6fa..08c5256b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
@@ -1,3 +1,4 @@
-PV:ti-soc =3D "3.20.0+git${SRCPV}"
-SRCREV:ti-soc =3D "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
-SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git;branch=3Dmas=
ter;protocol=3Dhttps"
+OPTEE_TI =3D ""
+OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc =
b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
new file mode 100644
index 00000000..18820af1
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
@@ -0,0 +1,2 @@
+PV =3D "3.20.0+git${SRCPV}"
+SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbapp=
end b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
index 7109c342..08c5256b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -1,2 +1,4 @@
-PV:ti-soc =3D "3.20.0+git${SRCPV}"
-SRCREV:ti-soc =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
+OPTEE_TI =3D ""
+OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti=
-bsp/recipes-security/optee/optee-os-ti.inc
index 4f052996..e57ce4c7 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
@@ -1,3 +1,6 @@
+PV =3D "3.20.0+git${SRCPV}"
+SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
+
 # Use TI SECDEV for signing
 inherit ti-secdev
=20
@@ -82,7 +85,7 @@ do_compile:append:j784s4-hs-evm() {
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
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index 1ed8e26e..08c5256b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -1,7 +1,4 @@
 OPTEE_TI =3D ""
-OPTEE_TI:ti-soc =3D "optee-os-ti.inc"
+OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
=20
 require ${OPTEE_TI}
-
-PV:ti-soc =3D "3.20.0+git${SRCPV}"
-SRCREV:ti-soc =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-=
ti-bsp/recipes-security/optee/optee-test-ti.inc
new file mode 100644
index 00000000..43e0172d
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
@@ -0,0 +1,2 @@
+PV =3D "3.19.0+git${SRCPV}"
+SRCREV =3D "ab9863cc187724e54c032b738c28bd6e9460a4db"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
index b9e803c5..08c5256b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
@@ -1,3 +1,4 @@
-PV:ti-soc =3D "3.19.0+git${SRCPV}"
-SRCREV:ti-soc =3D "ab9863cc187724e54c032b738c28bd6e9460a4db"
-SRC_URI:ti-soc =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmast=
er;protocol=3Dhttps"
+OPTEE_TI =3D ""
+OPTEE_TI:ti-soc =3D "${BPN}-ti.inc"
+
+require ${OPTEE_TI}
--=20
2.25.1


