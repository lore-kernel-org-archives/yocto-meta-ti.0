Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1320.1603317323034581890
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 14:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 24CD940BD0;
	Wed, 21 Oct 2020 21:55:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvcaKQw-6xZG; Wed, 21 Oct 2020 21:55:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0A4B940BD6;
	Wed, 21 Oct 2020 21:55:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BD1B61744AB;
	Wed, 21 Oct 2020 17:55:20 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 2/3] optee-os: adjust for out-of-tree builds in meta-arm/master
Date: Wed, 21 Oct 2020 17:55:08 -0400
Message-Id: <1603317309-52625-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603317309-52625-1-git-send-email-denis@denix.org>
References: <1603317309-52625-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

As meta-arm/master now builds optee out of tree, hence use ${B} instead of
out/arm-plat-${OPTEEOUTPUTMACHINE}

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 2846d0a..d7e81c5 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -3,7 +3,7 @@ do_compile_prepend_ti-soc() {
 }
 
 do_compile_append_k3() {
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+    ( cd ${B}/core/; \
         cp tee-pager_v2.bin ${B}/bl32.bin; \
         cp tee.elf ${B}/bl32.elf; \
     )
@@ -11,16 +11,16 @@ do_compile_append_k3() {
 
 # Signing procedure for legacy HS devices
 optee_sign_legacyhs() {
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+    ( cd ${B}/core/; \
         ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
         normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
         mv tee.bin.signed ${B}/$normfl.optee; \
     )
 
     if [ "${OPTEEPAGER}" = "y" ]; then
-        rm -rf out/
+        oe_runmake clean
         oe_runmake all CFG_TEE_TA_LOG_LEVEL=0 CFG_WITH_PAGER=y
-        ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        ( cd ${B}/core/; \
             ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
             normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
             mv tee.bin.signed ${B}/$normfl-pager.optee; \
@@ -30,7 +30,7 @@ optee_sign_legacyhs() {
 
 # Signing procedure for K3 HS devices
 optee_sign_k3hs() {
-    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+    ( cd ${B}/core/; \
         ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
         mv tee-pager.bin.signed ${B}/bl32.bin; \
         cp tee.elf ${B}/bl32.elf; \
-- 
2.7.4

