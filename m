Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1199.1602274315323015991
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 13:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C9B6E40951;
	Fri,  9 Oct 2020 20:11:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-iwoXTIuZd8; Fri,  9 Oct 2020 20:11:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3B6C40C06;
	Fri,  9 Oct 2020 20:11:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 729B417448E;
	Fri,  9 Oct 2020 16:11:52 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 2/3] optee-os: add TI signing calls via TI_SECURE_DEV_PKG
Date: Fri,  9 Oct 2020 16:11:49 -0400
Message-Id: <1602274310-28284-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602274310-28284-1-git-send-email-denis@denix.org>
References: <1602274310-28284-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

It was originally residing in meta-arago due to earlier dependency on meta-optee
layer from meta-linaro. Now optee is in meta-arm and this code can move to meta-ti.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 recipes-security/optee/optee-os_%.bbappend

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
new file mode 100644
index 0000000..2846d0a
--- /dev/null
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -0,0 +1,83 @@
+do_compile_prepend_ti-soc() {
+    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+}
+
+do_compile_append_k3() {
+    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        cp tee-pager_v2.bin ${B}/bl32.bin; \
+        cp tee.elf ${B}/bl32.elf; \
+    )
+}
+
+# Signing procedure for legacy HS devices
+optee_sign_legacyhs() {
+    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
+        normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
+        mv tee.bin.signed ${B}/$normfl.optee; \
+    )
+
+    if [ "${OPTEEPAGER}" = "y" ]; then
+        rm -rf out/
+        oe_runmake all CFG_TEE_TA_LOG_LEVEL=0 CFG_WITH_PAGER=y
+        ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
+            normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
+            mv tee.bin.signed ${B}/$normfl-pager.optee; \
+        )
+    fi
+}
+
+# Signing procedure for K3 HS devices
+optee_sign_k3hs() {
+    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
+        mv tee-pager.bin.signed ${B}/bl32.bin; \
+        cp tee.elf ${B}/bl32.elf; \
+    )
+}
+
+do_compile_append_ti43x() {
+    optee_sign_legacyhs
+}
+
+do_compile_append_dra7xx() {
+    optee_sign_legacyhs
+}
+
+do_compile_append_am65xx-hs-evm() {
+    optee_sign_k3hs
+}
+
+do_compile_append_j7-hs-evm() {
+    optee_sign_k3hs
+}
+
+do_install_append_ti-soc() {
+    install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
+    install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
+    install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
+}
+
+optee_deploy_legacyhs() {
+    cd ${DEPLOYDIR}/
+    for f in optee/*.optee; do
+        ln -sf $f ${DEPLOYDIR}/
+    done
+}
+
+do_deploy_append_ti43x() {
+    optee_deploy_legacyhs
+}
+
+do_deploy_append_dra7xx() {
+    optee_deploy_legacyhs
+}
+
+do_deploy_append_k3() {
+    ln -sf optee/bl32.bin ${DEPLOYDIR}/
+    ln -sf optee/bl32.elf ${DEPLOYDIR}/
+}
+
+# This is needed for bl32.elf
+INSANE_SKIP_${PN}_append_k3 = " textrel"
-- 
2.7.4

