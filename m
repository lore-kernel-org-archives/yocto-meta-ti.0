Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E785103E305
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:31:28 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18598.1773415875700101293
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 08:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VBp829uR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn7f0gYmsa/Ta3+hgtj2ZTjfeKivlvAIkVmuMjv8rEGpkiw33j6/wxaEobnpO1iOv5IJtJY+Ys1LhdEhL+T4AziBWQRvuLXtzFX093eQvvaLtHay4H7DMIgp7S2LeU1SC3RdzT95FaojKnXD4oG4cSPIkVW8NfjjvMDU1MSFQ0jhmgFv1krKI8qAz/xFF5RjSkQw97mXpD94bSfbpv4Pb+45hmgrn22f3awqgV4D7aW5PwKC5/UM97HCIuxWr7+OUAWlmHMDKeEsepTVNvvDTFLjq8zKzA7K8YEuV8na4COG0dw5xyCSSF4fJyYUHbmAXES2ytt+MLeE8fL5y4RI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+a62MV8tvJ3c447R/xWd8xYzyhuVgQGrWm4WfYyI8w=;
 b=LcmxajmC3IVJJYutWgPFZgefNEHPhkfmXqsJc5slOrQpKbwIM/eVRqzq5WKcvsAIk5ai5EV7vtl5JahFAV2TeQjXBnX2eqtxsH9RGgslSswgMKedAl4dGvTAFHLXyNH0jRUNiFI+VpHSAxSKJcwxkR0V1FBvQy0s3ueEhB3wCOsgrxi522sJC+/ehBVcNrzP1VGS0nryqpU8yzC8FxrRYOtj0pemKSHUT91Nf/GSRzbPd8QBfWoed0Kq9JS3xBWSmu1GOrHqbdjdDYNmNE/6I0pSZB0yVYrRe5K5xejKKF9G03J1yIoDqddWhX7rWouKt0ep58LfT/yWo3muPIiB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+a62MV8tvJ3c447R/xWd8xYzyhuVgQGrWm4WfYyI8w=;
 b=VBp829uRadxRMs5OYxjjHxNKBVx3Hh4B5WVpc4GTJ/ro/bsrOZ8bttaHqlFNoY2TBw8G1urZohL0YmzY3hr7ErlL3oyK4FSk1c7W2/ilhPQpLsUy3nZbdv8ffXTpi+cxberTx7z5ji5dG19zlHVm0NaetVZomwL5yIvgbwlo5mA=
Received: from MN2PR11CA0025.namprd11.prod.outlook.com (2603:10b6:208:23b::30)
 by DM6PR10MB4137.namprd10.prod.outlook.com (2603:10b6:5:217::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:31:13 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::62) by MN2PR11CA0025.outlook.office365.com
 (2603:10b6:208:23b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 15:31:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 15:31:12 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:31:12 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:31:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 10:31:12 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DFVC9w260009;
	Fri, 13 Mar 2026 10:31:12 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w14To-0000000FcEq-0Dz7;
	Fri, 13 Mar 2026 10:31:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] linux: Remove unreferenced patch
Date: Fri, 13 Mar 2026 10:31:11 -0500
Message-ID: <20260313153112.3721901-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DM6PR10MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdabb4c-31e4-4de9-46df-08de81158f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	opPz72+A6DF4h589C4SzWyhT+ug2P1foEsEkX7X7iQiyvUhQclx/ieeKsFahCAXYq3xMMnv4RvoMmQeGmhm8luA7F9QVHV9YvGXkhp6TtxrQ0mgmXvTCmd01YXhGE1zkNW2/aqJyhUQZXUPr6dZCw+i4vKTtTIMN78kuK0heL4cRPR3hlMMb2K9Xye99JfrqNbFPLpt+h13CwuZfIyYyvQda1P51ZcXTYvKURJvfF36Z5by7VUXPp5SJfFFjZ7CUaXwX9B3AF25Jgg7iyKqLl0ftRglTK+AOpArdVZ1sZxYXRR6i8D28rYkpSVMpIe0wjicMWrMpZnB3ERmtGGMpdYs4uxB21O/TIIbRZQdCekd4mndCqPElLnk4PPGx2Gw9cFSD2wX5zWET8y/oV4GRHXFs52soSTG6oh66mdj2dRDhahhMIxHzehOd+uNqkfPp5vMfbCxMcUyrydN8iNQ/SkaIkJOZYRhs2/lfmRApukVQkbIhK6evJzRErdOONLOhuVrJERE9UOVYdqtXB6hA4zqOdxq764WgJAOPNcOyihf/BDnY/Fp4n4M/PBTdrFaYisuhgGNIrNbIT99J6gpSU5KU0nqp4D1CK8q5dSQyHF0kwoYSYedvCccah81wzClGUpAcO6jksL0KnJzkpMTAiKOZHtxOiTU4d1Y6i/BQ069+rb2bVYqj1JG0HLxyofRjCUi8rLU5DHGkAzI89gJj+YYIA4y+aRKmgfCFxoPfk6w2Q3AZlD1sjz36U2lZw7gwkc21UhXS/ZFr6Kzq5g+zYw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2qv5SIh09Rw/zMmuOm19npV1u10HqTf0QNSchC95gnQFoGlZuA8P/9nISVo2yVepdCHhp+0DB66VbGvLzbiAk0olffyF5mnyLMYyZbsyoRsOJudF/POgXr34Bif0dolmlRC1nBfDnNApvba/F8zUD2wnmVySuZFzDnUWWvC7y2mFIguIhPOo+mAHXr2MmdjGAIWHiUpAPyqE9S8hhMgFMuimeTSbZwADMIL+kOfAHsb/uPjf6sIpyQql3F+4hfstcE9Z9HfO+HCiEqGRWYwDulirLO7Rbrq8R1T+y0kXULfQ6An6XXE1gg4wik+NuZuvM8iVGo/JMaXktCg1M601jCDBPn//a2Y2R5Gwucq6thRs545CUAATPhGQBYsue4flbhL9kNEezUm0cQlbwydJnFoZ7D59xJQn1raAQSeabna8XDt0m31T3I8utk5iz3p9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:31:12.7697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdabb4c-31e4-4de9-46df-08de81158f21
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4137
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Mar 2026 15:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19714

Remove old patch that is no longer referred to anywhere.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...sh-improve-reproducibility-for-v6.10.patch | 60 -------------------
 1 file changed, 60 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-vt-conmakeh=
ash-improve-reproducibility-for-v6.10.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-vt-conmakehash-imp=
rove-reproducibility-for-v6.10.patch b/meta-ti-bsp/recipes-kernel/linux/fil=
es/0001-vt-conmakehash-improve-reproducibility-for-v6.10.patch
deleted file mode 100644
index f9fdece8..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/0001-vt-conmakehash-improve-re=
producibility-for-v6.10.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 4907fa9ff1dbdd72ce9fa7855091fb604a35a62d Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Wed, 17 Jul 2024 14:55:10 -0500
-Subject: [PATCH] vt/conmakehash: improve reproducibility for v6.10
-
-The file generated by conmakehash capture the application
-path used to generate the file. While that can be informative,
-it varies based on where the kernel was built, as the full
-path is captured.
-
-We tweak the application to use a second input as the "capture
-name", and then modify the Makefile to pass the basename of
-the source, making it reproducible.
-
-This could be improved by using some sort of path mapping,
-or the application manipualing argv[1] itself, but for now
-this solves the reprodicibility issue.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
-
-This is a minior rework of Bruce's original patch for the v6.10 kernel.
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- drivers/tty/vt/Makefile      | 2 +-
- drivers/tty/vt/conmakehash.c | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
-index 2c8ce8b592ed..8532077ed3bb 100644
---- a/drivers/tty/vt/Makefile
-+++ b/drivers/tty/vt/Makefile
-@@ -15,7 +15,7 @@ clean-files :=3D consolemap_deftbl.c defkeymap.c
- hostprogs +=3D conmakehash
-
- quiet_cmd_conmk =3D CONMK   $@
--      cmd_conmk =3D $(obj)/conmakehash $< > $@
-+      cmd_conmk =3D $(obj)/conmakehash $< $(shell basename $<) > $@
-
- $(obj)/consolemap_deftbl.c: $(src)/$(FONTMAPFILE) $(obj)/conmakehash
-	$(call cmd,conmk)
-diff --git a/drivers/tty/vt/conmakehash.c b/drivers/tty/vt/conmakehash.c
-index dc2177fec715..9cd4096a8ffa 100644
---- a/drivers/tty/vt/conmakehash.c
-+++ b/drivers/tty/vt/conmakehash.c
-@@ -112,6 +112,8 @@ int main(int argc, char *argv[])
-   else
-     rel_tblname =3D tblname;
-
-+  rel_tblname =3D argv[2];
-+
-   /* For now we assume the default font is always 256 characters. */
-   fontlen =3D 256;
-
---
-2.17.1
--=20
2.43.0


