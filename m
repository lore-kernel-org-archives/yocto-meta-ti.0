Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F104C636F8
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.936.1667602019395937280
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C20540D94
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44Z8nITnWj8S for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 23A4B40D8E
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EC4281636AA
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 36/50] ti-img-rogue-driver: drop local patch as upstream is now fixed
Date: Fri,  4 Nov 2022 22:46:38 +0000
Message-Id: <20221104224653.1223044-37-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15295

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...nit.c-cast-boolean-value-to-IMG_BOOL.patch | 34 -------------------
 .../ti-img-rogue-driver_1.15.6133109.bb       |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver/0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/=
0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch b/meta-ti-bsp/recipes=
-bsp/powervr-drivers/ti-img-rogue-driver/0001-rgxinit.c-cast-boolean-valu=
e-to-IMG_BOOL.patch
deleted file mode 100644
index 8d909279..00000000
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-rg=
xinit.c-cast-boolean-value-to-IMG_BOOL.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From cc95fb4b1635bd1018d74b668430cda67731148f Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@konsulko.com>
-Date: Sat, 30 Apr 2022 18:37:46 +0000
-Subject: [PATCH] rgxinit.c: cast boolean value to IMG_BOOL
-
-Fixes this error with GCC 11:
-
-| .../services/server/devices/rogue/rgxinit.c:1345:36: error: implicit c=
onversion from 'enum <anonymous>' to 'IMG_BOOL' {aka 'enum tag_img_bool'}=
 [-Werror=3Denum-conversion]
-|  1345 |                         bEnableAPM =3D false;
-|       |                                    ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
----
- services/server/devices/rogue/rgxinit.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/services/server/devices/rogue/rgxinit.c b/services/server/d=
evices/rogue/rgxinit.c
-index ca7a1b9..fc94b73 100644
---- a/services/server/devices/rogue/rgxinit.c
-+++ b/services/server/devices/rogue/rgxinit.c
-@@ -1342,7 +1342,7 @@ PVRSRV_ERROR RGXInitDevPart2(PVRSRV_DEVICE_NODE	*p=
sDeviceNode,
- 		if (bEnableAPM && (!PVRSRV_VZ_MODE_IS(NATIVE)))
- 		{
- 			PVR_DPF((PVR_DBG_WARNING, "%s: Active Power Management disabled in v=
irtualization mode", __func__));
--			bEnableAPM =3D false;
-+			bEnableAPM =3D (IMG_BOOL)false;
- 		}
-=20
- #if defined(RGX_NUM_OS_SUPPORTED) && (RGX_NUM_OS_SUPPORTED > 1) && defi=
ned(SUPPORT_AUTOVZ)
---=20
-2.25.1
-
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.15.6133109.bb
index fd595dea..c9cb3f6b 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
@@ -22,7 +22,6 @@ BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_page=
size"
 SRC_URI =3D " \
     git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhtt=
ps;branch=3D${BRANCH} \
     file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.pat=
ch \
-    file://0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


