Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCDBC6369B
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web08.9303.1649923763409031901
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 01:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1
 header.b=YBqBoOnI;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81,
 mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649923763; x=1681459763;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uIbwWu3VrN3MVOm6eEs7zcH8qbX8yJDLcEGZzLrxuyc=;
  b=YBqBoOnIjAYjz1XJ9kE/zSDG/8Bx/k4aufbP/a4wpIEo7m9mQKTF3uhp
   BANct1YmEeepo4sXOGHH0+eg/sLRjR4GsQPCL5G2KeqxI8FlAE/jT2I2r
   BpoomeaaqSCvx9glRQkQyzXZ4H6he4LEBDwgNZkccoJlfMRQIyqjijiu1
   xAIBXKfS6hfi/9+p1n70w8W5uGh2Y1a7pCllxW8Xe2IxfKXs6VuK2b93v
   2q7DD9y1KUDwB4zo1V/tnbEmuBagF3PdXJeecPU5WoRgzNC2GRQOmdoG6
   8cLxtTSgc0JQvgUqA5SFknRaGKm7tsNhM+1XC4zUB3rxELHwCHUO0xrMo
   g==;
X-IronPort-AV: E=Sophos;i="5.90,259,1643670000";
   d="scan'208";a="23298398"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Apr 2022 10:09:21 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 14 Apr 2022 10:09:21 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 14 Apr 2022 10:09:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649923761; x=1681459761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uIbwWu3VrN3MVOm6eEs7zcH8qbX8yJDLcEGZzLrxuyc=;
  b=UQEFU6nRqiBe0WWN3IYprCNv+BIVqk0SWq+Y3SZ/7so1GpuVjvcoDDlz
   XzVrZYm2jqODwqThAS4QEuuCvMkyvhilu8eklRfIlat88XqNyPeMtCUuX
   kk4f5HLHS6mVu8QgxZZZWhjsJ+/umtBegEOeALzaBJaH8Dw85+epVNcoF
   4kaDl7fBXTme13jSFAHKZFCucxxeM6relDff0bKJphYuhzoDRTGaHy5H4
   E4J99D1GYmF1BHd5WrEFsCD5xokYTvI9KyoV6Y/eB3V+UPYhfNfzG5sxH
   3vJtnMpuwzt3wJCeXKwiK6i3/7iIXMmAMQ81peeIwEtoBj+OorxTcJSng
   g==;
X-IronPort-AV: E=Sophos;i="5.90,259,1643670000";
   d="scan'208";a="23298397"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Apr 2022 10:09:21 +0200
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 8C548280070;
	Thu, 14 Apr 2022 10:09:21 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] optee-os: fix build with OPTEEPAGER=y
Date: Thu, 14 Apr 2022 10:09:02 +0200
Message-Id: <20220414080902.21816-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14602

meta-arm commit e03b824d7824 ("arm/optee-os: cleanup recipe") changed the
recipe's do_compile(), which broke the build of the am57xx-hs-evm and
dra7xx-hs-evm machines. Adjust the .bbappend accordingly.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index f9660bfe..5af57e16 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -20,8 +20,8 @@ optee_sign_legacyhs() {
     )
 
     if [ "${OPTEEPAGER}" = "y" ]; then
-        oe_runmake clean
-        oe_runmake all CFG_TEE_TA_LOG_LEVEL=0 CFG_WITH_PAGER=y
+        oe_runmake -C ${S} clean
+        oe_runmake -C ${S} all CFG_TEE_TA_LOG_LEVEL=0 CFG_WITH_PAGER=y
         ( cd ${B}/core/; \
             ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
             normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
-- 
2.25.1


