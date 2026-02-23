Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F4EEEC29D
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:07:55 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6761.1771884470163554750
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gRorlFrF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.28, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgT0Vb8KOXeuUFHVzHrBSkbjrKXqjliUhNHdG0Dk0YTM2yZt23NWUISgXCa/z7QsqLziFQJjpaLupupRVcJk4Q6RFs5eW7hx/Nk2ZeoHAjz0rcx28gv5i/23H0bguvNGkXSlSV0PDeuGmNqqmTCOljm9HHqT97sxio2tsOwznbuhgZpHhmyzSyAZx4dcqGL0u0FsgHhw0aQBfS+dGHM3GpkynlMSyGt6tHge3kW5i53VS0SzSYaHrZKl+xAtfK1CfQiXQR+tGMHMMSF4gzCSnmSIk7riyk5YXgPwH2kBRxAmc0amfUqky3vCT2gw1TjY+2A+ODQJnEqtgoIaj/6yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq0q13cNdaVzUIcQBSPpPVaw+ownBKyRKVdbsbZopqQ=;
 b=i/nAqB/26GKVTRyClgMOEmEnn2OOKLC2mxfHho4UrplLgmlXpEo2CIYCq2mRHkxwgo6jyKqCuY67LZ75zZR/eUvEH7yPcNgwGW9xm36ukUrHptOqeMK2mu/TojAMu/Z346z4AZ7Y6QQ4Lg0BRHZAZ3rrAAmNftI631lo+Q0f0zHXLSGUPLp43ZFBIc2+SfRUXQRsVW1qBu0uoXI7Rd7MIDn7/CCifnTallJyCXpRf0NlGGXNXDsBnwKwGu0h3CAsHQrHV5Kk4lYylyV4bTtlMrx+8Yr/zmZpHlsZ77CZAqce5hVkhbSkJnvtA70mLONkScLL69FpMR2HV2ElgPnueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bq0q13cNdaVzUIcQBSPpPVaw+ownBKyRKVdbsbZopqQ=;
 b=gRorlFrFz2xJYGLqgbCDSy7VeCZgQ8+3rqNxEWF79bGElQk0KOfW0+qFJ8YYW5xj9zjGGclLHm788DLHoVoLf/v84RJlugdqfb9iQz0k2a8cMA9nzFhmAKROf9OVZ4h+zY82CAXmKnUAs3cmUCwzbeeyjrJAmvFKlUZ4yHRDN48=
Received: from BL1PR13CA0409.namprd13.prod.outlook.com (2603:10b6:208:2c2::24)
 by DM4PR10MB6696.namprd10.prod.outlook.com (2603:10b6:8:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:07:43 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::c9) by BL1PR13CA0409.outlook.office365.com
 (2603:10b6:208:2c2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:07:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:07:40 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:07:39 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:07:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:07:39 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NM7dqg1086504;
	Mon, 23 Feb 2026 16:07:39 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vue5b-000000058S5-13DP;
	Mon, 23 Feb 2026 16:07:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] *: Remove unused patches
Date: Mon, 23 Feb 2026 16:07:39 -0600
Message-ID: <20260223220739.1224122-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DM4PR10MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbb4a6d-1a90-47cd-e60d-08de7327f655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CEsLD2VSPXxpe6l2kMi6LRQJaclFZ/MTxzq1Fb1j++enc3Q8rwGrDIN2cFiU?=
 =?us-ascii?Q?7lbnbJfLQk/Dvcb6xYnBFbu2gI8eSzaDN+LroIojjwYHYp7VO7zlHbLNYjqv?=
 =?us-ascii?Q?k7v1FfKHuzwpHwAN0K6r+bZzpJ2DxtZL81eBisTkX4gOK+FX+j4oqImja5Ye?=
 =?us-ascii?Q?1HsZMHpHY/dmlVoJkxzCyPyuFgNUPU5hEH6OHRqJHaIY9IyfAEeRF4BxpdLo?=
 =?us-ascii?Q?gHPuS6K/6oZjmfNrRHKiE1TGUKu/agpgcPexptX1Yq06V6FI2hXgu2qEif5u?=
 =?us-ascii?Q?U1XV/BMMKjepbj9X/5jFlt808AXbagw9G1S8mi+Gd1GMJpmhBg+B+7xAZugM?=
 =?us-ascii?Q?wPIYPFH4piUIdIBnImqZ4LFZ4nzScrFzWSQvU1yJxxnI5I7I4gi9GGN5GV0Y?=
 =?us-ascii?Q?S0+5esxUJzmE+DVSyna2GcZVJax2uDE5DowrVhkMfF+l7wtdlaFpJG9sL822?=
 =?us-ascii?Q?bCjmJQ2V4EJLWzaIrY3YbA+iaq73WcBXnXs2C01eY4/pZQAGLYupqTHnhzmt?=
 =?us-ascii?Q?qeOlcIeMxshziCjqPs4BqYOET/75A5HKNizywraO5wml1+fAOiPz8nN3KIlF?=
 =?us-ascii?Q?E7iwTyH51vpzsXDAus6qgM+yatv/1hMhQ/BHv9PTUAHtfwNuhy2GXMMBb1Cd?=
 =?us-ascii?Q?W6pXq0FmQr+1ifCY3QWhjHsSyRIcjjleO3GM4xn53l2o1yf4h8POTYuNycGx?=
 =?us-ascii?Q?mpJaeIeH1IjGinRZcJJPnRZpkUR3X2QfzhbR+EUKTPfBtbJX+uW8Jm6yKYUV?=
 =?us-ascii?Q?w2GuzRbUPiqDKG0BUHiknzQfrfscn52F2wUCM4h9aXoakT2zsT9u2AD2Fo3f?=
 =?us-ascii?Q?+GDTfNK020rgC4KQSopAQCn5zU8E5G3oEZ2So+4HRj2EKCj2XheVyZjMFduo?=
 =?us-ascii?Q?SzROTnowFlxVvNHceo2OftnFj9Z+bIeR1V7nX6uJZjom0nK8+gvRGFsrA/f8?=
 =?us-ascii?Q?n2fyOuF3Ex6Oe3U6dNR+C+yYJUoZLGTurhcWs+a6H+pKNqyp46Zuip4bgJK/?=
 =?us-ascii?Q?Doprwyj9p0YPgqD6IQs9y/d8Rn9j1kS10MDNdGYRMGvk9TjG7n2N3zxxd/bn?=
 =?us-ascii?Q?7DRbLLA+G8GXdD+v11Al54hspTxCqRg9ZAkfOT/ge62CX2VSpa0wcgPA+Odx?=
 =?us-ascii?Q?5KOflYi//jLHdhYrO+YKIzSiM5+5eqSkj5ZmojCml+a1SVxLaY52Bd//bOYZ?=
 =?us-ascii?Q?R264RolEsWC5pEr1MhspRUeC34Y2ne9YlE7dhFXkaH0pYOJ5IQFK0IuX3zuO?=
 =?us-ascii?Q?OKNEHfIYYyoayJc523knXJoiF+5rDhnY30aPdNMN6awPwW92FxAlgFPFu0qJ?=
 =?us-ascii?Q?iZd8QzYXBQvpKZ85f4UHWCg2U2HvVbF/IQh9XWeSNQpdhPTLd/Ms71rqIcaF?=
 =?us-ascii?Q?xDra6+WGJWLXv3TeLn4YsAH3vFT/vRH77G+1UHFsVZ3EC32g6r7mKOZYVFKR?=
 =?us-ascii?Q?zDrWfXFbvXo/bpiUH6tGqe0lAUm+b/WnRHq4qBHA1lqwZJGxdoMeReirRql+?=
 =?us-ascii?Q?aL78AoOztxmZBDeMVNuvLXn6nbncblan71+ZGJJV0pSBfM2PDKexsVIoCGVJ?=
 =?us-ascii?Q?fKXWqNIaQDtukxYit02LZhdIinAV4O9tp/RJ2HO6/BHwYARoq8XvoRwTekLC?=
 =?us-ascii?Q?B+U8UBgyVOBkPh/fdCXVi5x/k7/AvpXaKpjt4B9574CxHONQ/9huskxYj8Bw?=
 =?us-ascii?Q?OAB2uA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	n/cJP8RSw/lgcLST5GQ2EJmTvfGUs8RAOZDdBntAFUhYkXivU2T+Gz13MXraMcXnZ64La1fFY/rZdpzFbuF0AbA4LYpKW+mAZTELCOZUwPqYWJ97SVwd8XcSRIoMdCAeyaXjO0jRtsDmwpBLQeNJ6bRbI9uXnOIsTz+BJ0OTXYTgIcLTwu2yry0tCIZNBFK0FgSlwnBfbJkaP1EOnj59rPzw+PYWaUGxpYmm919XhiSJCAnHUnvtQ264+B3e8ZfiU2g2zXIGbl4wdEnT/+xrmmSX1vA3lkiVW1nMA/q9j1aERH/lmcrCT5/52Ks/VAYxcXWw2RpIYByOeAKGPzINn46kvQMnySCJ0zxXADn9ZyexPNLWGPRyvo6owIqogP+7G4NybT0VMqwF5o8x+9maO+5SqVZGuowrG81RZTSINCX5SVvIX29YdYbB+faexHdI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:07:40.5704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbb4a6d-1a90-47cd-e60d-08de7327f655
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6696
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19569

We have added checking for unused patches in our repo checking tool.
Remove two patch files that it found.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...sh-improve-reproducibility-for-v6.10.patch | 60 -------------------
 ...Open-TRNG-firewall-for-TIFS-on-all-k.patch | 45 --------------
 2 files changed, 105 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-vt-conmakeh=
ash-improve-reproducibility-for-v6.10.patch
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k=
3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch

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
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drive=
rs-Open-TRNG-firewall-for-TIFS-on-all-k.patch b/meta-ti-bsp/recipes-securit=
y/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.=
patch
deleted file mode 100644
index 59d7a795..00000000
--- a/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open=
-TRNG-firewall-for-TIFS-on-all-k.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 00f74ba2ab00088d51e6da3c0eefe50599ef5c82 Mon Sep 17 00:00:00 2001
-From: Prasanth Babu Mantena <p-mantena@ti.com>
-Date: Mon, 3 Nov 2025 12:42:57 +0530
-Subject: [PATCH] plat-k3: drivers: Open TRNG firewall for TIFS on all k3 d=
evs
-
-On k3 devices, TRNG is firewalled to be accessed only by OPTEE.
-
-TIFS needs this for the encryption and decryption services to support
-different low power modes. So, open firewall to TIFS as well.
-
-There is no concurrent usage of TRNG, as TIFS uses TRNG only at suspend
-when OPTEE is down and resume, when firewalls are restored but OPTEE is
-not up yet.
-
-As this is a firewall that required to be shared along with TIFS on all
-devices, making this a common change and open on all devs.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7582]
-
-Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
-Reviewed-by: Manorit Chawdhry <m-chawdhry@ti.com>
-Reviewed-by: Andrew Davis <afd@ti.com>
----
- core/arch/arm/plat-k3/drivers/sa2ul.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/core/arch/arm/plat-k3/drivers/sa2ul.c b/core/arch/arm/plat-k3=
/drivers/sa2ul.c
-index c50757b2c..e10bde131 100644
---- a/core/arch/arm/plat-k3/drivers/sa2ul.c
-+++ b/core/arch/arm/plat-k3/drivers/sa2ul.c
-@@ -121,12 +121,7 @@ static TEE_Result sa2ul_init(void)
-	start_address =3D RNG_BASE;
-	end_address =3D RNG_BASE + RNG_REG_SIZE - 1;
-	permissions[num_perm++] =3D (FW_BIG_ARM_PRIVID << 16) | FW_SECURE_ONLY;
--#if defined(PLATFORM_FLAVOR_am62x) || \
--	defined(PLATFORM_FLAVOR_am62ax) || \
--	defined(PLATFORM_FLAVOR_am62px)
--
-	permissions[num_perm++] =3D (FW_TIFS_PRIVID << 16) | FW_NON_SECURE;
--#endif
-	ret =3D ti_sci_set_fwl_region(fwl_id, rng_region, num_perm,
-				    control, permissions,
-				    start_address, end_address);
---
-2.34.1
--=20
2.43.0


