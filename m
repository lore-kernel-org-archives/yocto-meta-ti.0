Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DB5C7EE31
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6799.1679285565705104237
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED06F40CBE
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOdfLYMyp6PD for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E427940C62
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id F119E1637CA
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 17/54] optee: update optee components to 3.20 tag
Date: Mon, 20 Mar 2023 04:12:04 +0000
Message-Id: <20230320041241.1293077-18-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16127

From: Manorit Chawdhry <m-chawdhry@ti.com>

OPTEE tests is not being upgraded due to a newer python dependency for
the build

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-security/optee/optee-client_3.16%.bbappend   | 9 ++++++---
 .../recipes-security/optee/optee-examples_%.bbappend     | 5 +++--
 .../recipes-security/optee/optee-os_3.16%.bbappend       | 4 ++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappe=
nd b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
index 61760b8e..19db3827 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
@@ -1,4 +1,7 @@
-PV:ti-soc =3D "3.19.0+git${SRCPV}"
-SRCREV:ti-soc =3D "140bf463046071d3ca5ebbde3fb21ee0854e1951"
+PV:ti-soc =3D "3.20.0+git${SRCPV}"
+SRCREV:ti-soc =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
=20
-DEPENDS:append:ti-soc =3D "pkgconfig util-linux"
+inherit pkgconfig
+DEPENDS:append:ti-soc =3D " util-linux"
+
+EXTRA_OEMAKE:append:ti-soc =3D " PKG_CONFIG=3Dpkg-config"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend=
 b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
index 9c757f11..1760a6fa 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
@@ -1,2 +1,3 @@
-PV:ti-soc =3D "3.19.0+git${SRCPV}"
-SRCREV:ti-soc =3D "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
+PV:ti-soc =3D "3.20.0+git${SRCPV}"
+SRCREV:ti-soc =3D "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
+SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git;branch=3Dmas=
ter;protocol=3Dhttps"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index 8fdf6513..b29553d6 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -1,5 +1,5 @@
-PV:ti-soc =3D "3.19.0+git${SRCPV}"
-SRCREV:ti-soc =3D "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
+PV:ti-soc =3D "3.20.0+git${SRCPV}"
+SRCREV:ti-soc =3D "3bc3809afe372ca7e8216fc5d7a64e965bb4ad70"
=20
 # Use TI SECDEV for signing
 inherit ti-secdev
--=20
2.25.1


