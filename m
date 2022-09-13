Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27016C6FD25
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.832.1663041347303975632
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E393A40D85
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTjfWWTUuSkt for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D68FE40D8B
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 76D0B1749DD
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 17/65] cnm-wave-fw: mark also compatible
 with j721s2 HS
Date: Tue, 13 Sep 2022 03:54:53 +0000
Message-Id: <20220913035541.2364351-18-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15041

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/met=
a-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 50058b97..12d21335 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR =3D "${INC_PR}.1"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "j721s2-evm"
+COMPATIBLE_MACHINE =3D "j721s2"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -21,7 +21,7 @@ S =3D "${WORKDIR}/git"
 TARGET_WAVE521C =3D "wave521c_codec_fw.bin"
=20
 SOURCE_WAVE521C =3D "wave521c_codec_fw.bin"
-SOURCE_WAVE521C:j721s2-evm =3D "wave521c_j721s2_codec_fw.bin"
+SOURCE_WAVE521C:j721s2 =3D "wave521c_j721s2_codec_fw.bin"
=20
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}/fi=
rmware/cnm/${TARGET_WAVE521C}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index bb2c1a00..8acf614d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -27,7 +27,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " ca=
dence-mhdp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vxd-dec-fw"
=20
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2-evm =3D " cnm-wave-fw=
"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wave-fw"
=20
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx-evm =3D " tifs-lpm-st=
ub"
--=20
2.25.1


