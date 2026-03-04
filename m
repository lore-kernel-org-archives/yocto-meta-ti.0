Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416DBEFCE41
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 19:39:10 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27172.1772653143820727912
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 11:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hB0SdAzy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.9, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYKJFNzDionai/q+XbBngQGeAUkk8Dz6acKKnWOjgS2Fz3bPwXtRQ84HqB//O5eMO5ZCd/lCdCD0gQIoEx0rFqcs0UlWXUgcN7s/oboM5RMsqbfkJ57YKcuojfmu+AsHhF4kCL6Z0O344Po+0YG0V1kkcPtJEuE4w2JpdE2KjnhOg4Uz4qWHC1ACEx4JvduF9NH8VrRd4rqD1HVNjKQXMHiX2NasqOYSSAwvOskCp2ZmtZ5EKpsSY9qJnTJvDpPp/bMeq61yYOMzOMkj1bY56eOSVAdQAzy8smIVMRwAX3NN0YBDxqi/nbnVspKwfKfd40enTjXBR/kHAlntYvHT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Cct0HzdbOkp8APV2bfilgofKlq4DPVEGJocCtMuvBs=;
 b=Uweq91RT5xkFzQOSxWvi79uu8Eoy60CisvF7GnAvUxADf3Etbl0n041y9uY0MhUibEjCNpuGo9NvDNSBKvwsjqSaPSvcbB1wenFEWRpxuIAY9bZixjYkBYRK6Ik+2EnzGxlY33S01AFt9t4BXIXqVah2cJcY8Yhp+WnlRIlSRWDvCjUqH6PdKNNqP7YKaRTvWuBN4Gx3lanKfxHi4BEuxOvR1s6NbotkeNuWh2xrW28SDBhPFxA34Bzf6C6ywS0VCPCVEkuCFcuFfUIkmmfUX9LODr6IDYx1FOQ+a+z6fI+WntqXcWp1YXV337jHiN14q88ZvWdSLU39RKlwcG/mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cct0HzdbOkp8APV2bfilgofKlq4DPVEGJocCtMuvBs=;
 b=hB0SdAzylCp53V3gEXGQ/ehwvQkExn9hKFUJVKnUBd87FwVSv6IrHETwMlPG1BV1v4qwaIRZj6gWo3jJ7ftP33wpC0h86Nm1Zh14gVER2ZAt9uDIOczpa5zIXjJwL6z4y7yuc1VAistAu928x4z3RZDSvGK7rVzG50wc5XbMu98=
Received: from DS0PR17CA0015.namprd17.prod.outlook.com (2603:10b6:8:191::23)
 by SJ0PR10MB4735.namprd10.prod.outlook.com (2603:10b6:a03:2d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 19:39:01 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::ad) by DS0PR17CA0015.outlook.office365.com
 (2603:10b6:8:191::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 19:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 19:39:00 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:39:00 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:39:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 13:39:00 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624JcaZM956747;
	Wed, 4 Mar 2026 13:38:57 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v3 3/3] machine: Add encrypted boot configuration
Date: Thu, 5 Mar 2026 01:08:24 +0530
Message-ID: <20260304193824.2495898-4-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304193824.2495898-1-s-tripathi1@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ0PR10MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 4564631f-21ee-4eea-8cea-08de7a25af80
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|34020700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	2nMln0hr15jLLVpxVHeXqFoxG2iFbe8vdlH7x20v2UTxowYb/zsH+UbB70lLtoWEuorSugO8SpuyDkr2pK/7muovmijFHl+ItPaK7Rz246Qr0ranslXJzXV0nc2gUzWgF9KtAIIpTZI42Vt2okVRMqLeHUCgOhE5P+4q/dbN5KBpWaSr8ErC4CtWDs8RIRjawabpUBqHauM2lCLMz1OxN98ZluDF0K2vJ3ZEvfdqqQSN48iw3naV+gbpsSkz69o1F+79+66xVpx64QnB+YDhx6XK4jYtM+MyOiXa1pdwubZTAUYTz6KNNJvcRe2wwN4ivKJB5UVvayS0D5dmIKGpRA+t9Efc+cPx2r3T/5GhZ9/L50jjr3fBIO09OHDmHYEX7+MFLd/0xeGMFIfPgYjLo3Ss038Q12EGrj7oRqZ3TginhEdsPx4uuPYJ8vMJzWQo5CTpovtZ1oYt3rYZHTvjXahK+JVv5Q4Z5l9xOKnQVS7Mghgb2l8qOOGaFt63xtFM7MMfsYiOgnVV/gUbEXPLZUO62rYreo/QgWd/70bzELi0NBcQADudtL2f0B0/vm92MVKsdSovT5+xmnqzdjTYcPJXDBSRkhU1D7DolDtsYy2/3UQ2lQLf2cok0auEArcCRQ+LogMwr62znIJe0f3BWl/JpqGlMrQJlx2WoMekF2CSo2BDo1rbb3KGaLj2vj3E25xQ3GOtQtQ8Iv+NPUVq5GhpyIiudSpMwx1p2hA1VwV9Y48AnR5MlE7UM9X0ZzGkTP85vC/lSsfHDGvRKIgDDA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(34020700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	36/DLVx8sjfEiTQQW5QsttRoDHkpj7QMBdKp2spP3+49K2g/3pQCXwFHXGmvubsrVrzCE9kK/eg+6GZEjEdYZX/CJzZTLTMLH02QfaLm7E4qdw5HCi/4+1FGuWEfuflASnTUvlKzqQINyj8CU89CFZWjYtEuX1Us0HKDeKumobosSO9m/FUBGnhRyQLFktrSpy0Zb6K+6s84viUA6zhAvQKyzqrSQ3zk+ovJLeUR6VJ2PHw8m/zNb98lda9A2Ti2TCHxFLwt2qk3HLAvS5ng9XYF7J8H3CKGzd/Lmgt3yWyJlPwDA0Ku5gT6BqddmJayY5mnB07Zds9azras8Hg2y01VDYq7TmXU/gebtfcDzRvuVSff2J+tmlaU0ABIwt54S/eOlI2UFWJuDJPxReMv7fFtmeZjuGyHTXkYQ2Phwmimq+41lUYmy2ZXpsA5JyDd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:39:00.8947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4564631f-21ee-4eea-8cea-08de7a25af80
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4735
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Mar 2026 19:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19644

Add encrypted-boot-common.inc for machines supporting LUKS encryption
with fTPM. Triggers ti-core-initramfs build and overrides IMAGE_FILE
to use uncompressed cpio.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../machine/include/encrypted-boot-common.inc    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.=
inc

diff --git a/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc b/m=
eta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
new file mode 100644
index 00000000..10a5cb86
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
@@ -0,0 +1,16 @@
+# Common logic for encrypted boot with TPM-sealed LUKS keys
+#
+# This include file enables ti-core-initramfs with LUKS encryption support
+# via the initramfs-module-luks-ftpm hook module.
+#
+# To use this in custom image, add to your image bbappend:
+#   require conf/machine/include/encrypted-boot-common.inc
+#
+# This will activate when MACHINE_FEATURES contains 'luks-encryption'
+
+TI_CORE_INITRAMFS_EXTRA_INSTALL:append =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'luks-encryption', ' ', '', d)}"
+
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.co=
ntains('MACHINE_FEATURES', 'luks-encryption', 'true', 'false', d) else '0'}=
"
+
+# Override to use uncompressed cpio (U-Boot can't decompress XZ format)
+TI_CORE_INITRAMFS_IMAGE_FILE =3D "${TI_CORE_INITRAMFS_IMAGE}.cpio;initramf=
s.cpio"
--=20
2.34.1


