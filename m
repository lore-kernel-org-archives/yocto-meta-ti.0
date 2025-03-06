Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31771C28B23
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 14:13:03 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.14326.1741270378887491676
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 06:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=cdapbbFz;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=oXz0n8nG;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741270379; x=1772806379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5IyOAkVCerhobSSX2kFiFTJM9KZdQqsywRllYdfg2Yw=;
  b=cdapbbFziTUlwmu0MWLrf9TcQZAHCOWVVjmr2JOophqchfqyTTlA6Gzc
   BUe6FyoH/m6tlWQ+zXVHfiIBMqwl7bf+MXNH6ki7Ra/uhTKXA5DTavMqY
   OrwfV3gfpbsIudFTcL7WTsdGA5+Mv5yuJTANMDateR+h+ONzMpEu6T3yS
   BjHPiM+1C8a9QKV/65ttQWOhrj56DmLU31dFkRvoG5WAfH0fALUlC5crh
   cNOibso+Q8rKPRZ7mxnkxcpA3Ss9mIdicnF1j4WouCvYIDNmlzAcVH8bY
   ktpXPPqCVTZ2VL/ax8ilQTsoTEkAYn+tRnyiRKxt8rSBgZ+aDn99OdnUs
   g==;
X-CSE-ConnectionGUID: hWTI18I8Q92SlXLL7kTw6g==
X-CSE-MsgGUID: f//ZAHXGRL+53C+vsr2lJg==
X-IronPort-AV: E=Sophos;i="6.14,226,1736809200"; 
   d="scan'208";a="42369756"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Mar 2025 15:12:56 +0100
X-CheckPoint: {67C9AD68-A-903EAEAC-E04C76C8}
X-MAIL-CPID: 78F4C2720DB335309D605B059752115A_5
X-Control-Analysis: str=0001.0A006369.67C9AD6C.00A3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0450166244;
	Thu,  6 Mar 2025 15:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741270372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5IyOAkVCerhobSSX2kFiFTJM9KZdQqsywRllYdfg2Yw=;
	b=oXz0n8nGOpXhyolxo9vllHut8LRCmofJ7xqOulJ5ZPQAeEkqXGtAsJsG5ZMVqAGYPmOiNy
	NZwqjDuoaKeQA9IJY3xuh30wwjMQoJrgPt8yp3ltBHNWygHGMnRZyQjJo60kObN8OZzgF8
	4NhO+aFLXesQJZbyGMVFUpOudmCx4n/fe/zsVKnY5RlNBZ/lBb3YWEi23g3npy+7p5NKEd
	0eNVjDJz9QPYf0UErKwr3YS6CGqZvcmUzI8ug1svOEA7bsdd92PnjQ8A+BA1tX9SZSAsbc
	GgkF4VkldUrC8oQfQFUMCqMVHPl7fljxj013C61rWCwJ2owvpdT8+C2YcPE+2w==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: oss@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [scarthgap/master][PATCH] ti-sgx-ddk-km: work around incorrect target name selection
Date: Thu,  6 Mar 2025 15:12:17 +0100
Message-ID: <20250306141217.346689-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Mar 2025 14:13:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18359

The omap5-sgx-ddk-linux Makefiles contain a list of target triple
patterns that are detected as "Yocto" to deal with arm vs. armhf target
selection. This breaks for Yocto distros that override TARGET_VENDOR,
requiring patches like [1]; similar patches can also be found in other
vendors' machine layers.

Work around the incorrect target selection by passing TARGET_PRIMARY_ARCH
via EXTRA_OEMAKE.

[1] https://github.com/tq-systems/meta-tq/blob/scarthgap.TQ.ARM.BSP.0003/meta-tq/dynamic-layers/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/linux-5.10/0001-ti-sgx-ddk-km-properly-handle-more-OE-YP-compiler-pr.patch

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

Tested with meta-tq + meta-ti scarthgap for am335x.

 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb     | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 49376221..aaeee1d2 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -28,8 +28,11 @@ TARGET_PRODUCT:am65xx = "ti654x_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
+TARGET_PRIMARY_ARCH = "target_armhf"
+TARGET_PRIMARY_ARCH:aarch64 = "target_aarch64"
+
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} \
-WINDOW_SYSTEM=${PVR_WS} PVR_BUILD_DIR=${TARGET_PRODUCT}'
+WINDOW_SYSTEM=${PVR_WS} PVR_BUILD_DIR=${TARGET_PRODUCT} TARGET_PRIMARY_ARCH=${TARGET_PRIMARY_ARCH}'
 
 # There are useful flags here that are interpreted by the final kbuild pass
 # These variables are not necessary when compiling outside of Yocto
@@ -40,11 +43,7 @@ export KERNEL_OBJCOPY
 export KERNEL_STRIP
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
-}
-
-do_install:am65xx() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/${TARGET_PRIMARY_ARCH}/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
 RRECOMMENDS:${PN} += "ti-sgx-ddk-um"
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


