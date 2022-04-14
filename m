Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD02C63684
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web12.9062.1649923155384464672
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 00:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1
 header.b=GvmHuID6;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81,
 mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649923155; x=1681459155;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IFpLy9d9N/waPwRSsUCa5/keGG5z6uE57etoSk3Utd8=;
  b=GvmHuID6+FHQxGf9yENDiVcvK3SVYl0reUrE45Aw7wLzVPenv5JCf9/s
   0tcrO2yhdgZ4+UfgSa/dKjNDDna7gc9jS1iGNTuP37AMj6OaaK/zheVcz
   SiJjZmW3eHTPCuUSEtyoz9YXFTSiwdtsl1BLCnrVA2lJR5zi/Ol6Uk+5j
   M+1m0InULdFz8qBq53nj3E1tHx4Ej08sAQlZHACSoQc8knYpKLgkwRwwx
   lX1GIzYFJPmnRWeIALc9+GNiFno494FLkjnryja7Kn+bF/FS6k1f63cB/
   /RUs81KICp2AkqT+NN3gCz+b8ETnO9IW+XkI7ZebNcUUyoBRRPxKgNoAn
   A==;
X-IronPort-AV: E=Sophos;i="5.90,259,1643670000";
   d="scan'208";a="23297851"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Apr 2022 09:59:12 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 14 Apr 2022 09:59:12 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 14 Apr 2022 09:59:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649923152; x=1681459152;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IFpLy9d9N/waPwRSsUCa5/keGG5z6uE57etoSk3Utd8=;
  b=XLNuFT+lVBCEhcEjH7kQsUqEmp9DGZXD+sOYAX2dAc78i8Z6iWoDDJRO
   ysXT8qB9FmIoDOKH+tWI4RKNgbRKetXPik5QDYY+uKJQfZhkhzrBZxONW
   g/rNScCbPLQGAv43ntzOrmZ6JlD/yTnudUaPwLQPu2d5X6H5GzGG9Pnkt
   iE5cozPznqh+hCY6CDcZ/FcTIXSl0oDj6Im5LnRNgH8oCMUKdn11PAuz8
   xswUY4LaZGiaEVhpkCMqvxcFwdoWrShNcRGd0yp399hebUSsH620Bz6ob
   HqvahiHsuvAmpJoxaLhxBVap7e17PwEnDj0jcChbkXJ8YI+Bpan4tBzEc
   g==;
X-IronPort-AV: E=Sophos;i="5.90,259,1643670000";
   d="scan'208";a="23297850"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Apr 2022 09:59:12 +0200
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 2F5F4280070;
	Thu, 14 Apr 2022 09:59:12 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: Michael.Krummsdorf@tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v2] ti-sgx-ddk-um: avoid unnecessary dependency on -dev
 package
Date: Thu, 14 Apr 2022 09:58:14 +0200
Message-Id: <20220414075814.21241-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14601

ti-sgx-ddk-um's do_install creates a symlink libGLESv2.so.1 to
libGLESv2.so. As this symlink will be installed to ti-sgx-ddk-um, but
its target libGLESv2.so is in ti-sgx-ddk-um-dev, the automated
dependency analysis will add ti-sgx-ddk-um-dev to ti-sgx-ddk-um's
RDEPENDS. This will pull in a large number of other -dev packages
through RDEPENDS and RRECOMMENDS in turn.

Avoid this by having libGLESv2.so.1 point to libGLESv2.so.2 instead of
libGLESv2.so, so the symlink's target is in ti-sgx-ddk-um as well.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---

v2: rebased to adjust recipe path


 .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index f4c71d25..d0edf1fe 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -54,7 +54,7 @@ S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
+    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
 
     chown -R root:root ${D}
 }
-- 
2.25.1


