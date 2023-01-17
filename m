Return-Path: <d-gole@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ECEC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 06:13:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.190484.1673935988030303227
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 22:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yav7sXTR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: d-gole@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30H6D6G5031134
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 00:13:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673935986;
	bh=im+QYGQAc9C5g/ikX2GhNGHuuavbIrzPNWxjocR90nI=;
	h=From:To:CC:Subject:Date;
	b=yav7sXTRejZoL3gUycTp1/XRMjVJRE1WLQXsWSrO5FGNwRcvcqEuOhoCPMwewZZzf
	 IKUv0L56HL5VJD+aSTXkSC4sHKJSI963YzkDRHSP5ipeZ662lmtRpR44XZNi1UyX8u
	 ILbtLnRFdgDEegmRzCw/AYyw9kdab6EDDhsCx51U=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30H6D68P017234
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 00:13:06 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 17
 Jan 2023 00:13:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 17 Jan 2023 00:13:06 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30H6D5r2097639;
	Tue, 17 Jan 2023 00:13:05 -0600
From: Dhruva Gole <d-gole@ti.com>
To: <d-gole@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>,
        Andrew Davis
	<afd@ti.com>
Subject: [dunfell PATCH] optee-os: Enable SW PRNG for OP-TEE in AM62X
Date: Tue, 17 Jan 2023 11:42:57 +0530
Message-ID: <20230117061257.341041-1-d-gole@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 06:13:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15574

commit 98506a4a07363 ("optee-os: Update SRCREV for OP-TEE TRNG in AM62X")

Disables SW PRNG => Enabling Hardware RNG. This is breaking Suspend Resume
on AM62xx EVM variants. To fix this keep using SOFTWARE_PRNG enabled as
it was.

Cc: vibhore@ti.com
Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Dhruva Gole <d-gole@ti.com>
---

I haven't tested thoroughly using bitbake and built from scratch yet,
however locally in my OPTEE Repo the command I run is
...
make -j14 CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am62x
CFG_ARM64_core=y CFG_TEE_CORE_LOG_LEVEL=1 CFG_TEE_CORE_DEBUG=y
CFG_WITH_SOFTWARE_PRNG=y
...
and this seems to get low power mode (suspend resume) functional for
AM625 SK EVM that I am testing on.

 recipes-security/optee/optee-os_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index db9064deba27..83eb9c6a20c6 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -6,8 +6,8 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
-EXTRA_OEMAKE_append_am62xx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE_append_am62axx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile_prepend_ti-soc() {
-- 
2.25.1


