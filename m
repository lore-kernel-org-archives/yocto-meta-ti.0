Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3574.1636759082715624666
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 15:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ahehP/rT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNI0dk061213;
	Fri, 12 Nov 2021 17:18:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636759081;
	bh=NaRO1qBYO+cY+s08+FSuIPcYKN0oPCrhasmWR6JpXP8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ahehP/rTstBMeFg/xy39Q5dNJcXA/58uNjcYkHNzIClEuCvhyXo5F6L8O3013W4ak
	 rmBbYuIrNkNNeKH15hhLXo8gPJrZtAZNmgYlQZkGBvKtcF+RMZ6uR/tfPJJBh51ls+
	 3L441YxKwDOn93ctiLoHbNKWQfy9HkJYTCeVrDsU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ACNI0BS050452
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Nov 2021 17:18:00 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 17:18:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 17:18:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ACNI0n5022828;
	Fri, 12 Nov 2021 17:18:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] am64xx-hs: changes to support new hs platform
Date: Fri, 12 Nov 2021 23:18:00 +0000
Message-ID: <20211112231800.64167-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112231800.64167-1-yogeshs@ti.com>
References: <20211112231800.64167-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to support new am64x hs platform in:
1) optee: sign the image
2) atf: sign the image
3) u-boot: Add u-boot-spl image for combined boot image

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend      | 8 ++++++++
 recipes-bsp/u-boot/u-boot-ti.inc                          | 6 ++++++
 recipes-security/optee/optee-os_%.bbappend                | 4 ++++
 3 files changed, 18 insertions(+)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index eb6f2fd1..90fa0333 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -16,6 +16,14 @@ do_compile_append_am65xx-hs-evm() {
 	)
 }
 
+do_compile_append_am64xx-hs-evm() {
+        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+        ( cd ${B}/${BUILD_DIR}/release/; \
+                mv bl31.bin bl31.bin.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+        )
+}
+
 do_compile_append_j7-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 	( cd ${B}/${BUILD_DIR}/release/; \
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index dc8d6b06..131c03e8 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -66,6 +66,7 @@ SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
 SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -401,4 +402,9 @@ do_deploy_append_am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy_append_am64xx-hs-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 TOOLCHAIN = "gcc"
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index c90d85ea..401ac534 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -61,6 +61,10 @@ do_compile_append_am65xx-hs-evm() {
     optee_sign_k3hs
 }
 
+do_compile_append_am64xx-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_compile_append_j7-hs-evm() {
     optee_sign_k3hs
 }
-- 
2.17.1

