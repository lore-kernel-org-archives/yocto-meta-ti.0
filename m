Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3E2CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 20:28:08 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5356.1781036886532412725
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 13:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WjHeUiLw;
 spf=pass (domain: ti.com, ip: 40.107.200.56, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLrMfkbcK6XJcNU8whU3Gy98gwgZAe6f5eYHeo5EIlnGPYiFvYDplSGWEcjroCExxprDVxZafxRYD75BqShZwObuUsCHZuP/BPqPrfGjmGL/q6LZbxBmYlzm+5GSqX9dP7jTuIdoimqn3ST3abpQnRt333o1ZBNkcSdP6YkIthCGaFbbpwDEtHw+BP+j4n/p+6hXGsKlPuMm35+q5N/lrPn9WSl3Azdo76ulZblhQSVASJA2hLpgqF4dlcyV23qhgUY5/JAaoecV2c/PRaoBWU65O+6wDATGXEQ/DwJlZsFdh4fMeOq41knSGmVq9WudAmTaOm0DOzJbShxZOMM+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1H+rzfgdDXh3FkyhoRZi9fLPXsK6opj0m/AhuihD2c=;
 b=lnedHmwGjyWtd63ZZYsI9wxO/B+AZR+IdrV0Ly3SkbIVY4haObUe0m4V3GyNQPv+OOvZ5iyFmEN1dn+ggP8Noc9x/q9BtBVJo38VedJ0SU6Au0GV6u1EnkTTBhoFQI6MbM5m1QfNf2xIyh6vEvmWU488PulZ8I0+rT22mS96s5ucd+9ANPkN85a9qOhkfgxrxEyV0nVWaIhdCvASvuG9W4HFzbJgsp5bSUzWpw7+P4rp2gsXyMHM910+UrQTJ9DRYysNgq5XbYdrg1kwzslV+Tj66fltQ/Bpu2CTgmJTnn5uE8VLHqiObl7UdjSh15cfVX98YbhiE4+eYUkzh3mvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1H+rzfgdDXh3FkyhoRZi9fLPXsK6opj0m/AhuihD2c=;
 b=WjHeUiLwJjTk9VOQ+Gq7MYU7wXL6Q4xezMR6h86egUoM2za9dR6r7Y0LHcqIzIR3EarJfX4nImyumFrpZPZSarm8jKtgeKh+1t6v4Xba5dvkys+0IKse2piQFmTjqvguKY0B3Dg8KSUWMDFqGjUako+2GhWnTrFzfAoqQc3Hh5I=
Received: from PH7PR17CA0038.namprd17.prod.outlook.com (2603:10b6:510:323::17)
 by SA1PR10MB6519.namprd10.prod.outlook.com (2603:10b6:806:2b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 20:28:03 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::ac) by PH7PR17CA0038.outlook.office365.com
 (2603:10b6:510:323::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 20:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 20:28:02 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:28:02 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:28:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 15:28:02 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659KS1lV1811022;
	Tue, 9 Jun 2026 15:28:01 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon
	<reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
Subject: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged overlay list
Date: Tue, 9 Jun 2026 15:28:01 -0500
Message-ID: <20260609202801.18252-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SA1PR10MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bb3a8e-015e-4fb3-879e-08dec6659b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	gup1iP/UBFOfHFo3ctUzqjOzwB/Yw35hRyB8D9r+gWA87IOejKpf9kv7ArPgc1/KvqG3evNprSZ+fjJ1UD8JBOpE+iyAKniacsB/Tc6giO6i9sFaeyTstmh9VoqYlNdgC0RHP/mddQcW4Rxwvq1ZOllSeYfRTrD0dgjpZP9sGUk8yzXOvlJpdoTqUwR0qufxCsfNprGdx6J3aNR8T3Rsea7l5oHzLT47FOOImzzezgAxrjT7L0t5YZLGT9qsAFGIte+T31wKTIp/sehefKLSSXlso1TVEVQTXfeTjcHw7q++xh+W+lc+m8iKinWz9gRrwfLjlTL+grWIYixl4TWiHdY9xyi2l6fYdJSeepDW11pTyXrBcf6SXvQKL09cz1NvRX1oB2ixMX+pR3Am1ky/UDrNCFi7BZoJPH0Pfqr0A8orsds9cq4tKuqi0stc7to+kSuRyHWFVVGMfGV2lq13S+xQI4e7vNuIPosO8HpyrRFY0CoimWZDU6aaZgDEVhShAMlXrpncOLG5/8FgND4U/VgXPk9o+2oHOdPfmdEQWAeIIHZEf7APEspUo4XABlI2L23CK7jOlUIdxVDCUZqUJwE7ezRdTnEWe2MYd7PqjYXmqacgHEWNIRW2hTbA0DuQISELIvikPUlfewN2MbJojKJ7JaV6BaCF0ykJzQX0QWn08YOvuVAnR79mqLfi8v1GKUvRS8hGbqNttqDl3Hgacpu9MDe/QADvCMJ+0t3naUo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YpAWUKQlqT9xGqFMLoxdMBCNOomX1m9VhaA/1kBJp5bO+Sulub19TGBcljVJkihoJzcCOUcHFI6kHzI9t2ZoeG5p+LC9MX2jb2uByqfso+FGfqr2Q/8sQLkDHhwbpHNGRM1zkrB3vqj2okd/Dqs451nCxy5ndps2WULA8D5buMUskOTHVeUq79zbw5dOnjcC78rNjIMYCkm32RhcIzcxboM/tVt2IgB81+BQTGOwYl1A3X31Jbob5Rje8ZpSgpVImDg6zRFqG1qF/goL2hT5LwZm4wHhF1pK9+sto0sdPBlCFCVG0aNFUfMC2AuVa2eOh9In1KzCjQLhDU/sTGZROe8ByXzQdOskB6GAqJhGnXygaLHQsbETwmAOccVY4pRUtxU5PJ0KzqEHxnCfWOO4RKvAtrj06jaglBdRBUEdwqPZJJLb4bn0r6RGbBL9zThP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 20:28:02.8215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bb3a8e-015e-4fb3-879e-08dec6659b13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6519
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 20:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19993

Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
update overlay list packaged for AM62D mostly to include the new
k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index ef9df2f7..c776ffbf 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -7,7 +7,14 @@ require conf/machine/include/am62dxx.inc
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62d2 \
     ti/k3-am62a7-sk-edgeai \
-    ti/k3-am62x-sk \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-ecap-capture \
+    ti/k3-am62x-sk-eqep \
+    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk-lpm \
+    ti/k3-am62x-sk-mcspi-loopback \
+    ti/k3-am62x-sk-pwm \
+    ti/k3-am62a7-sk-mcan.dtbo \
     ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
     ti/k3-am62a7-sk-e3-max-opp \
 "
--=20
2.34.1


