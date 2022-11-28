Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27083C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 05:46:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.111034.1669614391540128433
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 27 Nov 2022 21:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g1eLxdQO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AS5kTF1113107;
	Sun, 27 Nov 2022 23:46:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669614389;
	bh=rpEcURyIyiQxSmr9R/eG3ShZwT5lOhWR0egHXq2lWOA=;
	h=From:To:CC:Subject:Date;
	b=g1eLxdQOUTMw3dJFNqKbwRKPGH2GNlu0e8NJBX5CnP9tkUu9+2W/Tzo7FjFmfpnCW
	 2YD6O3oSJUeG2GpuMawOan+V3myMzjvi4E/vs4+5dQU2H2gvNLad/vxi3DXnPfLd4N
	 /9NyriH61nDYTQEu35C5d9aIWSSZKNDij40sICCA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AS5kT5D076275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 27 Nov 2022 23:46:29 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 27
 Nov 2022 23:46:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sun, 27 Nov 2022 23:46:28 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AS5kS4S042869;
	Sun, 27 Nov 2022 23:46:28 -0600
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <kamlesh@ti.com>, <jm@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH] optee-os: Update SRCREV for OP-TEE TRNG in AM62X
Date: Mon, 28 Nov 2022 11:16:27 +0530
Message-ID: <20221128054627.131772-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Nov 2022 05:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15369

From: Kamlesh Gurudasani <kamlesh@ti.com>

Update the SRCREV to the commit when trng support was
added in upstream OP-TEE for am62x platform to access rng.

Also, enable trng support as trng support is added now in OP-TEE

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

HS-UART-logs:
http://serenity.dal.design.ti.com:7777/habajarafo.yaml

GP-DFU-logs:
http://serenity.dal.design.ti.com:7777/atejarexak.yaml

 recipes-security/optee/optee-os_%.bbappend | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 2b591d58..751dc3d0 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,14 +1,11 @@
 PV_ti-soc = "3.19.0+git${SRCPV}"
-SRCREV_ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
+SRCREV_ti-soc = "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
 SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
 
 DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
-
 do_compile_prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 }
-- 
2.25.1


