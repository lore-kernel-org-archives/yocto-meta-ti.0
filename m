Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D6FFCB621
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 16:38:51 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73595.1772815124368186978
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 08:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=R92TgvmP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.7, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+VHhogW2doh5hpbx4QJOx+Er0rIRC4xOif8lOnIJQvGMnJVRPbC07Etr7/ScgZyD6LeEeCw2+njHQk+BjRhDdmcO4o9OpEeHlwS1KF1qWrBtGUQBvdl2nNsFebDL8ag3hZKyuMury97UKv9rjRUUUTVprWoaFJTbuVpucpH8JRBrFgjM99w/5HDLC+WHS7jrc6K0h1fQwnQ3Hrui0zFsK+9oQlJ28dmJWZW3JI82XEFWPRFNbRED5m3eLBVEa8yJgOIDudS9xqvy9zqPsts2CLiXVsG+SOCWMv/BSpFUJb/cdBmLqvPX5z8enemyWGYJ89VT7cppaMS1ODaveJVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXRVZvgCafT1XOYC/H+oxG9+lkofkqj8FrbnIrVnYtE=;
 b=UNzjbtdP2+Ghj+PMHbm1keH18KYn3BX7mMLyckaBtKY2i+tIVkba7W5R4uZEajuHzctV4zajuXt4jUIT6pq9fhoohatJtz+JoEmTqoMfoFK2sRDIWZn7QKE4Jay3oprgMvj3W4+BKykKRjaNbjwXsbm0dgRLrZpq5cGoAux5O8uMcBo2ib0Y8TDr3ykQjH1z765R6Q1+bkExa0NdNnxJv257VQxK7IHRaAp/opiLksbh7bnaF6hjz3xu1VaxUQbcD2h6ZSR6hQUUWaTpkMi/2JTrlIl6emXDofCeJWrj0nU6j5swi2qlx7b7F7Il1mAssi0kz4btWKqiUe38oQ0vJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXRVZvgCafT1XOYC/H+oxG9+lkofkqj8FrbnIrVnYtE=;
 b=R92TgvmPeOBy+IODAm2GtxxfgpJS9c/XfL/RQ8PQtVejmdo+nS3fD+XUbouG7x1FNDcWswS8STESaiD01VTTU0ab1xCHEzh8ljUl47ieI4ibCwZz4onipn3tfhEG6QMTqUaPBjXTAylgUjIShZSaOrVMwxiF3E0WevIB12RTCJk=
Received: from BLAPR03CA0101.namprd03.prod.outlook.com (2603:10b6:208:32a::16)
 by MN6PR10MB7468.namprd10.prod.outlook.com (2603:10b6:208:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 16:38:39 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::ef) by BLAPR03CA0101.outlook.office365.com
 (2603:10b6:208:32a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 16:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 6 Mar 2026 16:38:37 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:38:37 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:38:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 10:38:37 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626Gc9E74133859;
	Fri, 6 Mar 2026 10:38:34 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v5 3/3] ti-core-initramfs: Enable initramfs for LUKS encryption
Date: Fri, 6 Mar 2026 22:07:35 +0530
Message-ID: <20260306163735.1316257-4-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306163735.1316257-1-s-tripathi1@ti.com>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|MN6PR10MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 62988f7d-342e-46bf-81c4-08de7b9ed15e
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700016|376014;
X-Microsoft-Antispam-Message-Info: 
	byu76YqO7jHnGbbA04YzxbRcEH/3WZxAFF7rvLjd4lv5SBITWTY5mK9dvEKoF8kTXu15D7mIYLmm1UZxYCb1bWlhDdtTG7uQLDSvl0iK06+XfaZmFzK+trMPIkNDN618MGHY+8NzeTJIuqRLdD2appi8wxe0VL3RhFQP8KsLkwcyWu7UW1FSBlGNmHMN1v5SBF7pC3ega7MQI2gtGRil1vc7NVcmMKTpUzR8aWjSSG1YxPJjYJvcCFGZpyWOkyGYV1b/oX65ZfrZq8POP4WwsqwzkSvwzB2jngjsqBKkHPxhqvCamyVkhjmbiiimFU9otlpeRlMo2qnLDJ5Ff3XmUdhTukf0vYJANErAGPS36JBjjN2Ulqfn6KoxYf91gFKDVJ8PCi5EFHSmz1GH65dB+gNs/dufGJZKoJ1hcaBWP/OHdqA1akv+VhPSic/trDJMS3XyUyTZMooA8cVyqJpd51UWGkDtV99NOgeiqvYMfuh4QF5VWFA5SwPJImEBjOKAdx4VMh3NVuCDS9WlvVzDdyzP9xRa3bHpiLlYXHvMcQI5muA3+9UZRN/kn6OFdbnd80VD75a8jphqhljtDyNur2tCCmIXUND+Q/1fG2LWeugBANAVNB7CZfFj6wAjg7b6hn3kV8tlY6QkE1HJnWxmb3uayuAwKlw5AUiZAAlI5YmBbo64BxQyrWzy/AzhB0GO3XeNEhf+skcbtQQyFDXHvjLP6vcWKZ4KPK3E/VCWjcJaVrNLvtl1qi0rlt0VWT/0D4Qn4ZiRuFin8y7fMgDUIA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rVRj0MEEAq04FNjm7F2ZWxwDmfxdHiqHLcZ8Sm+Zk99w5UhYJv2bz+6J6pA20RkgOCka8FMEc+hsLXSXeinr5UKfXhRf5rd85qVskvdKekGKrPGPtd5LLziHSk9GK1fCewbY09oo+5lKYiVgcmvlujp1IxLyhD6Vhqm023p08uI8mF6R4bQmKm1zimYzvT6KvKwTJqy9UyjMy5P9kdLysjRZk5PxNeAuRnzRX7/4MT4gIZb0d1cN8Z9RtH4F2KTCgRNaHnYG26S0gKYabzaucwzErLFe/wmKUWxARBdgguR5sQBGN2OH4m1JM7hW6DXcLRps/NbRmS4RyehoVNkcQp4f1GR8SLytjWCVTSt6BoZui0zTlRXJy5BgbatW4r0K0kUQ3uY8rdY8CoZThRI2Esc1aGR3/xz3C5xDwJWcuFxSLu+symiJKAFUZvpS4Z8m
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:38:37.9744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62988f7d-342e-46bf-81c4-08de7b9ed15e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7468
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 16:38:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19672

Add DISTRO_FEATURES 'luks' check to automatically enable initramfs
generation when LUKS encryption is requested. This follows the
existing pattern for TI_CORE_INITRAMFS_KERNEL_MODULES.

Modify packagegroup-ti-core-initramfs to conditionally include the
LUKS encryption module using dual gating - the module is included
only when both 'luks' DISTRO_FEATURE and 'optee-ftpm' MACHINE_FEATURE
are enabled.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc         | 2 +-
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb     | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 9d3cc612..15c05e04 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,7 +5,7 @@
 #   TI_CORE_INITRAMFS_ENABLED =3D "0"
 #
 #-------------------------------------------------------------------------=
-----
-TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.co=
ntains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
=20
 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
 TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..12713437 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -8,6 +8,8 @@ inherit packagegroup
=20
 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
=20
+LUKS_ENCRYPTION ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm=
', 'initramfs-module-luks-ftpm', '', d)}"
+
 RDEPENDS:${PN} +=3D "\
     ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
     ${VIRTUAL-RUNTIME_base-utils} \
@@ -22,4 +24,5 @@ RDEPENDS:${PN} +=3D "\
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'luks', '${LUKS_ENCRYPTION}', =
'', d)} \
 "
--=20
2.34.1


