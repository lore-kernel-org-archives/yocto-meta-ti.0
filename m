Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8C1C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.844.1663041353647277668
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E86F40D4B
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6Pp4evpOH_q for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 14B8840D7F
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B08CA1749E4
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 24/65] optee: Upgrade to upstream 3.17.0
Date: Tue, 13 Sep 2022 03:55:00 +0000
Message-Id: <20220913035541.2364351-25-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15086

From: Andrew Davis <afd@ti.com>

Update to the latest upstream master which is 3.17.
We do this to add HUK and AM64x/AM62x support.
With this we need to also switch OPTEEMACHINE for AM64x/AM62x.

To build against the latest OP-TEE the support recipes need updated also.
Move these here into meta-ti so that builds will still work when not usin=
g
meta-arago-distro.

The fix patches do not look to be needed anymore.

While here switch to git checkout with https.

NOTE: The latest OP-TEE requires SYSFW 8.04+

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc                  | 2 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc                  | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend   | 2 ++
 meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend | 2 ++
 .../recipes-security/optee/optee-os-tadevkit_%.bbappend      | 2 ++
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend       | 5 +++++
 meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend     | 3 +++
 7 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client_%.bba=
ppend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-examples_%.b=
bappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_=
%.bbappend
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test_%.bbapp=
end

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index fff1312f..80df1844 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -21,5 +21,5 @@ do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_depl=
oy"
 TFA_BOARD =3D "lite"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
-OPTEEMACHINE =3D "k3-am65x"
+OPTEEMACHINE =3D "k3-am62x"
 OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index c5820986..87791ef7 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -21,5 +21,5 @@ do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_depl=
oy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
-OPTEEMACHINE =3D "k3-am65x"
+OPTEEMACHINE =3D "k3-am64x"
 OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
new file mode 100644
index 00000000..109d451c
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -0,0 +1,2 @@
+PV:ti-soc =3D "3.17.0+git${SRCPV}"
+SRCREV:ti-soc =3D "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend=
 b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
new file mode 100644
index 00000000..98b5bea4
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
@@ -0,0 +1,2 @@
+PV:ti-soc =3D "3.17.0+git${SRCPV}"
+SRCREV:ti-soc =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbapp=
end b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
new file mode 100644
index 00000000..4300c1a9
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -0,0 +1,2 @@
+PV:ti-soc =3D "3.17.0+git${SRCPV}"
+SRCREV:ti-soc =3D "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index d55bbc90..60e8c391 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -1,3 +1,8 @@
+PV:ti-soc =3D "3.17.0+git${SRCPV}"
+SRCREV:ti-soc =3D "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
+
+DEPENDS:append:ti-soc =3D " python3-cryptography-native"
+
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
 do_compile:prepend:ti-soc() {
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
new file mode 100644
index 00000000..4fbaa4c4
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
@@ -0,0 +1,3 @@
+PV:ti-soc =3D "3.17.0+git${SRCPV}"
+SRCREV:ti-soc =3D "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
+SRC_URI:ti-soc =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmast=
er;protocol=3Dhttps"
--=20
2.25.1


