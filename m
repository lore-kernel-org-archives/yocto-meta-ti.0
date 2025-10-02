Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7FDCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:28:36 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.6925.1759408112721990034
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 05:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UNoMRapq;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: bb@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592CSVSZ3335412;
	Thu, 2 Oct 2025 07:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759408111;
	bh=GF4o/MgauKiVv0uSYJTrsLrDVMgELu7zsWJaU7o5QI0=;
	h=From:Date:Subject:To:CC;
	b=UNoMRapqhOv6CMxDnBv2HpSxfh7lAZ0XHvhj/8g9w33/UmU+xjMr7iJmexWmT1p5u
	 01qHKQ0oUgIuECkdwJFmd/3Zyw2hHeMhnaKT3fkQM2suH6dIASj9I57kOlluXEGa1Q
	 Xr9PnELTtg2GehPvY84sYUDTBGXuYDChWd2gGKcw=
Received: from DLEE215.ent.ti.com (dlee215.ent.ti.com [157.170.170.118])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592CSV9P015411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 07:28:31 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 07:28:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 07:28:31 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592CSVG91827560;
	Thu, 2 Oct 2025 07:28:31 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Thu, 2 Oct 2025 07:28:27 -0500
Subject: [PATCH RFC] optee: use software PRNG for real-time kernel builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251002-rtl-optee-hack-v1-1-efe08f733059@ti.com>
X-B4-Tracking: v=1; b=H4sIAOpv3mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwMj3aKSHN38gpLUVN2MxORsXVND07TEJItUs0RzMyWgpoKi1LTMCrC
 B0UpBbs5KsbW1AFpI6UdlAAAA
X-Change-ID: 20251002-rtl-optee-hack-515fab8e6a76
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2576; i=bb@ti.com;
 h=from:subject:message-id; bh=1awu2HfUmVYgnVXrCwtC18m2lisGusYjG/R6DIhwQFk=;
 b=owNCWmg5MUFZJlNZy0Bb6QAAa////359///+Wynd7wXr+/bubxf7dY9fqtr1/02r63rVze8wA
 RsYGFAAeoHqPUAAA0AGgNAAAABo0DQ009QDQBo0AaBo0AGT1DygPU09NJ5qh0ABoNDQAAAGmgGm
 g0NGgZGgeUaNNAeo09Q9TBAG0RtQYjEaAaGj1P1RkADTIZGTJoMRoDRppiDJo0DCBoaNGQGRoGh
 hNA0GgNMEAGExDCNA0xMJhAAAgUXUk7RPfSsknahJcOOFKA9dSBKEjkWQWUhTgmOo78s7ASIVR+
 zVEriVHmA+asmQUQh+KiDeUwt30MzglxTTzmluhu1HbL8MiHZ/H/yYyZ/D7LwXXgqW15ZY8cQgE
 XQzD1nt8KwGQfl9KCdwrbq3ToO/IZk58WiIJKjIDGYlj2liIBJVo8K5uBwwGUsC3ZDtTCHb9Cjl
 QuAdGqUe57oqoo9lWmiWCTFxzy26ZG7RyEvSSR8iMWSkTPdi7SYJxSyrmOb2fCd8EkjcjDjAMuO
 MIw0/XSLTH28uj3g9RktgYyWtIWgVCYrH9ReL9SjpCR4dfaIrFJZbKpKyQE4l7UgFvGDxgl9kC+
 psQYxAjKkooMunyygzUYEyEWayC8Gepmpgy4XvN/lEup1VhwRABbNSA2YaCXoA2gT4AB+iAAn+L
 uSKcKEhloC30g==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 12:28:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19089

The 4.7.0 release of OP-TEE is causing unacceptable latency issues with
the real-time kernel. Migrate to software PRNG until they can be
resolved in a later release.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Debugging a +30us latency regression has lead us to the hardware
accelerated RNG drivers in OP-TEE. Falling back to software PRNG
restores the context switch latency back to acceptable levels.

Because this only affects real-time kernels this is more an RFC
until we can fix the firmware or find an alternative for the
builds where latency is prioritized over random number generation

Happy Hacking
~Bryan
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 61a74a069886a24fbb518cf748be198d99a02cbe..5d00b8f6f8b045e660338c4a4d74001478a41aa0 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -6,12 +6,12 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
 EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_TZDRAM_START='+ d.getVar('OPTEE_K3_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
 
-EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
-EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62lxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62axx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:am62dxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
+EXTRA_OEMAKE:append:j722s = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 
 do_compile:append:k3() {
     cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin

---
base-commit: 69aaa6f1f8f608e22353d38ec6629ded743c4dec
change-id: 20251002-rtl-optee-hack-515fab8e6a76

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


