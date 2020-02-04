Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.851.1580853809449246099
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 14:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YkNW5kKT;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: angelabaker@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 014M3Sen126233
	for <meta-ti@lists.yoctoproject.org>; Tue, 4 Feb 2020 16:03:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580853808;
	bh=QKyUtn3TGQ9LFHgOhkOeVPvrjMX6peSdvnT9QDY+3T8=;
	h=From:To:CC:Subject:Date;
	b=YkNW5kKTl9qz5O8B3ah85KRkAmE6g2gdRrjbHyZ7QhpeJF5gv3g50zqMCOG9QJvqj
	 0iVgox0kaSJcmZgPSzv+e6RV9Jj276sWefPTyuDWxtssGJ82dhiGZJIm0jqGAYBG1k
	 xLBgAAC/eGteeWTwXc1HtDQ9xcuaKEOCAjKTjS2Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014M3SCx010123
	for <meta-ti@lists.yoctoproject.org>; Tue, 4 Feb 2020 16:03:28 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 4 Feb
 2020 16:03:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 4 Feb 2020 16:03:28 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014M3SSx050676;
	Tue, 4 Feb 2020 16:03:28 -0600
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 014M3R306018;
	Tue, 4 Feb 2020 16:03:27 -0600 (CST)
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][master][PATCH] ipc-lld: limit BOARDS list when building for j7-evm
Date: Tue, 4 Feb 2020 16:02:08 -0600
Message-ID: <1580853728-12027-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

For now only j721e_evm is supported when building for j7-evm
MACHINE target. Limit the BOARDS list in this case to what is
supported.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
index 6a3e233..fa3ea89 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -15,6 +15,8 @@ LINUX_2_CORES_BIN_DIR = "${REMOTE_FW_DIR}/ex03_linux_bios_2core_echo_test/bin"
 
 DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc"
 
+TI_PDK_LIMIT_BOARDS_j7-evm = "j721e_evm"
+
 do_configure[noexec] = "1"
 
 do_compile() {
-- 
1.9.1

