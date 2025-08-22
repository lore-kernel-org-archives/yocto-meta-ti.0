Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AFBCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:32:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.11593.1755873169161053276
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 07:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PV8+OO+Y;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: bb@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MEWmB6269665;
	Fri, 22 Aug 2025 09:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755873168;
	bh=vMFC4ptT6FWXmGttUB/DoxM00q6TshfaWnb/6TpcMDI=;
	h=From:Date:Subject:To:CC;
	b=PV8+OO+YK7IOU54h0Kp1m38nevniNIs/g14lY8GK0ZCPBaRvGMxr0bnEcaS9IxF3/
	 VJtFsm8ZjQ29e8ftqQ+nPZB7Nv+yNZ6xcROHwDaAOkdUu6TmDIDEGd3iRmf+xjzrR4
	 cpA7AV6OO8D0ifuVnJ8qna8zdSNToeoYJAP9oS/c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MEWlZZ3667877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 09:32:48 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 09:32:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 09:32:47 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MEWlrX3684369;
	Fri, 22 Aug 2025 09:32:47 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Fri, 22 Aug 2025 09:32:42 -0500
Subject: [PATCH scarthgap/master] meta-ti-bsp: conf: drop BL32_BASE
 override for am62lxx-evm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-62l-tfa-cleanup-v1-1-1cb19995f083@ti.com>
X-B4-Tracking: v=1; b=H4sIAIl/qGgC/x3MQQrCQAxA0auUrA1OU6ziVaSLdEzbQB2HZBSh9
 O4OXb7F/xu4mIrDvdnA5Kuu71TRnhqIC6dZUJ/VQIEu4UaEPa1YJsa4CqdPxsBdO45X6UkC1Cq
 bTPo7jg/wyFaWmfP5xV7EYNj3P+l6W7RzAAAA
X-Change-ID: 20250822-62l-tfa-cleanup-0a31bb7e62e0
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=bb@ti.com;
 h=from:subject:message-id; bh=WllhO79oMloFtl4HWGNL7L9Zwx38fNHsYQZxUPIo/Gw=;
 b=owNCWmg5MUFZJlNZUrbyhQAAbv///r75cv/v/Tb9+vPPvt//efmvZ2+8/ee31N//43X31f+wA
 Rsxoyg0NAGh6gGgGgHqAAGgAABoeoBoAANAaDQHlANAGmhpoaDaQ0GmmT1Mjaj0iAAaGgGg00ND
 TQABoNDQyGho0ABiAYgH6oGg9TRoDEaNBpphAaAaB6gwQ0Gg7UPUZGmmmjQaNAG1AaGTINGgDQD
 QGgbUBkyaNHqAANAADQAABoAGgADym0gINm0zZj6RkmxWRbbkqgDLnJdZBeBomJDlyphvIBSTsq
 jeggkZIC4pa8KVCSRJ014tb3PjArwMIOCBxTDKlBPCcaIXcyQT1I6TAZpwQwvZkPAW0zwYrY4P1
 6Gccz3tq2tubQgs7E0QpyVawK4Z0IDNk86GUfP+qSTWZDR6K8r/9cHlhdJ4hvp2/aYcieLClszW
 O0ol6FVjcZ+NOfSjvFmEfCMq+0hqqQgkqcU7cTjEQkKBl0KUDzllihErb3CLMfyBYIrXJwjaYDw
 /cQIolIRg9xIwsQmMEJQwFJBxcZW5wGhmlcLiJYJ+hWsleDAJwC58vUGhLYyqJRYy8Ww9Ka++BS
 PYceS+fyiKjp3gNrbDH2wHNtz28DAMdUFCEAoGySQho8OjOABhqaIdQKs1hhf6jJmREArDFTsQI
 TdXudAg5eo3Wf4u5IpwoSClbeUK
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Aug 2025 14:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18962

The BL32_BASE address is properly set in TF-A to jump to OP-TEE's
entrypoint for the am62lxx SoC family, so we can safily drop this.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 5c0535c244b777bd48a5931ab14cb5259b57ee15..607092a7cfa6888edfe582d03223d6b2d4a2026a 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -5,8 +5,6 @@
 require conf/machine/include/am62lxx.inc
 require conf/machine/include/ti-extras.inc
 
-TFA_K3_BL32_BASE = "0x80200000"
-
 IMAGE_FSTYPES += "ubifs ubi"
 
 MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"

---
base-commit: 2e648fa3fdf859e4376d20a3cbed4f4545c9f937
change-id: 20250822-62l-tfa-cleanup-0a31bb7e62e0

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


