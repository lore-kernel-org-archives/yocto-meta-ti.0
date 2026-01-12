Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E172D232D3
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:31:42 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29511.1768210296960805353
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 01:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kZYnjY7Z;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.63, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9ZCSaACeurVJd/rWwyAKitwng5yV+uBREf9XjDL0wSmOAWYaWFcP0Hgbt9v0CmWzbQpnt94gOhKlZ7C+MZr/qWgHdp6yi61kGjMLuJFohvkqs3QDxvRcsqOPdpuc5C6pye5W1EUqEwLzEObbRFsJcQl2PA/eUvQzbPpc0xkNVHEFfn7guBwL1wpZdiqiGgdU/ahaByS8Btg8pAmULkwD9C9EBObGJH9XffOlnJ5ZMBXCHopvuvCHUJOQ0Oo9N8PdwpAaIYDBtNSFesCdWYRuecT/pKblK3c+OcvxSYw7xAGhf2WEx0IygU9YtR8Eov0we659dbeAJCrfAnTXZ1dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nV642dPPNKpqmvL5uSbK862qV+tFJ1mU17sp+xyXVe8=;
 b=Y7jM3/PKcCS7Cwmf2RTRcjX+NYZBw2Z91i/F3VzyLaQL+Jjq1IUM4s6Pb2NjdgQIkn/fHLEm8zeiEJlZ4zfmVZC+DNUQZDSsUJTxbGx6kQfOrynA+8Mvey7NyKE2KA7wNF3jk2+mhgOrGr0iKMR3gPngQ0Ud/NVllH9lf8ZIgYgBO3vYY831F6ovKuYldOrk6x+d+vLViLuc3sONff0n/NPmGTPdo5sw83EWNkNuNHS3gOQjkuE4peCSUzlZtUygFFw1+K5oq0LL1rqVfC40JGbW2L2tvZJAI1WxSyWq4rXNO3gO/rSLYFGs8D+i8Na02aJbUedFGQ/aotpv4U6BZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nV642dPPNKpqmvL5uSbK862qV+tFJ1mU17sp+xyXVe8=;
 b=kZYnjY7Z4IJmOefGv7pIrasMlO9OgQkLD0j4sm7nfjvwwBEeM6NZvKrXMcoT0iSo3DCvMqgbxCw/BJMVx/1OJp2hWz1ag/7r7XCNGxrG51mSnEYDJiIb9viYni2xu7T94+OxmFEwJAeHJc0t++R/+dRRBzHz7WaRcVRB0aBVPKc=
Received: from BYAPR03CA0035.namprd03.prod.outlook.com (2603:10b6:a02:a8::48)
 by CH0PR10MB5164.namprd10.prod.outlook.com (2603:10b6:610:da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 12 Jan
 2026 09:31:33 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::f8) by BYAPR03CA0035.outlook.office365.com
 (2603:10b6:a02:a8::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 09:31:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 09:31:31 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 03:31:30 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 03:31:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 03:31:30 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C9VQKU148191;
	Mon, 12 Jan 2026 03:31:27 -0600
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-limaye@ti.com>, <m-shah@ti.com>,
	<gehariprasath@ti.com>, <nm@ti.com>, <denys@konsulko.com>
Subject: [PATCH] initramfs: Add dt_to_config script to initramfs
Date: Mon, 12 Jan 2026 15:01:25 +0530
Message-ID: <20260112093125.73038-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|CH0PR10MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be7d0ff-8abf-49e5-6000-08de51bd5eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D/sM1l94xSjYqwQYSkBmnvIVII9k9T5c1kfC7PDVfoydIznFp13KNRbs13a8?=
 =?us-ascii?Q?cWILMUrKf2YP9hTMueyEniy7KI5ai4DwKh+MFEyi9FSsLhskQP8BcgJ5fNXN?=
 =?us-ascii?Q?FVwugs8VLmCxIEMnTqwP6w3UH0o/O/e+10Ts2LXcglvrubtLXLryXkSgaIvC?=
 =?us-ascii?Q?3W2BXg6HwTnPmvAQX4H4NGyeuKJAvqQmTuNUTlaqt3cQMX0aDSxtuMlrgYe5?=
 =?us-ascii?Q?Vvq/VhAjfTt1OsjMv/Nwzf2ZtP9NYyI3BdibN2uhd8w3qLyzdfs6SoUFFPDa?=
 =?us-ascii?Q?gFHg0I2zAMrmkk9gtwCi3mbKxpbGOFz9U8n1ViZ5ju8wFxdUOv06PYpPq6wy?=
 =?us-ascii?Q?ekUlIuQTJzN+7wgLOONZsnSmRfy896HEFgJRLHlTEHtvvVxdxwDCp6lGgAVY?=
 =?us-ascii?Q?2+3Wo10dCUIWiU2nh6C9Kr0ICPAMEvcp7nu1GCRsgub+kelquAwRdm9sMede?=
 =?us-ascii?Q?YPh5wUH2IV1DUyP8NgQXqt4cHuGIyC8Ubq53b6ntsChbY1gLMcnXObKHaaRG?=
 =?us-ascii?Q?4/IVtBnRb5GT/Eu2bZ+JWoLXqvOy0TGjhZ/o71LAQje7ZKnNxVXQdYO3zJTu?=
 =?us-ascii?Q?9q1IGSK+4G8wWZZWHGcCZVtDgKf06KZBW/OwINg4ztcpsxsCUfZeO80PBj7m?=
 =?us-ascii?Q?BSSwUIcJAtFfGLUcd19EDXUzhIXH0d/hCi7rOKLJilwVhagzviurkfyEuiS/?=
 =?us-ascii?Q?/WS/yn+qBDGnaMcdNqEEllwwzqlXi0FqPhLCtHlyIb+Y1tV93VMxuCaJINNH?=
 =?us-ascii?Q?3NMUfZw3jdrLQsj08WCAm9SOnaq36G91kovUydm6sSkxD1+wcaumWh9wBJ0n?=
 =?us-ascii?Q?bZjv3RSFfGFVqidqNj7lXd2PjPG8ufufcyg0q2PKvYN6ydF1Q4nQrcVC8NQJ?=
 =?us-ascii?Q?41V9e9rhB03jxogso7DD11rr4tazKjySVn+koAb1PXlNjd7RqXmznkPD0S9E?=
 =?us-ascii?Q?P5Vy5Ov7R3t2pbdYzY8j4kVi/WugVrTZZFsIXtHdZ89c08Ud2//ubDaW9270?=
 =?us-ascii?Q?qM23QyeTFEI0+WeWxVRHSdpTrfo5lYrsEpXpMEbrXqOF7iVnZ24S2ZV9xCW2?=
 =?us-ascii?Q?kbAdlGNT9YQ7hmWE4St/GMDo50IGOOeeJoDd943TIBcwiMxnpDprDv4L8JS0?=
 =?us-ascii?Q?fSzQQrLJhrb1DSzX+eOHTc3wUcFZ+NasOXYCOSHcb0WiCjJrTRApNW6b+BWd?=
 =?us-ascii?Q?XSf7sRftcguFc0k+xTujvCrESWHB+OaTuKs7ruzqziHMjusXa+SAATsN0oBF?=
 =?us-ascii?Q?sE/fl7tny8etsGwt5TEC+GpqGX1NUDliS+UFc1xGmzo8DvNXhmI4ZR46yzfZ?=
 =?us-ascii?Q?0OQG3CEBzrWZC/klxWBxcRPI43TKLpQO7Bcgh7QA/h43OTm8yU9cTxTaAoQ0?=
 =?us-ascii?Q?BLpntrC+qbYQlFoSkfft1Ul8w1eNVcp4GirPG1d5Xtzlm0LkKA6LyHXhe50E?=
 =?us-ascii?Q?3obBdT0XW4152W0BqJri7oRhO10SOObvL5n8IVklMZGt6P1yZHc9LiLPCivD?=
 =?us-ascii?Q?kD3SY6nKZ71qRsJmQhzxt+y9admyHvtqrPHXwz16IVlWbJP45AfInCCXL+UN?=
 =?us-ascii?Q?q6UBRPKMRsgKEXtj4F0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:31:31.3930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be7d0ff-8abf-49e5-6000-08de51bd5eda
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Jan 2026 09:31:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19404

Install the dt_to_config script to initramfs image from
the linux kernel tree.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../recipes-ti/initramfs/ti-core-initramfs.bb  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-t=
i-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index 1a102d82..44574377 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -29,7 +29,23 @@ IMAGE_OVERHEAD_FACTOR =3D "1.1"
 # the final image this is usually done by adding RDEPENDS_kernel-base =3D =
""
 # in the configuration file. In our case we can't use this method. Instead=
 we
 # just wipe out the content of "/boot" before creating the image.
-ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
+ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; install_dt_to_config; "
+
 empty_boot_dir () {
 	rm -rf ${IMAGE_ROOTFS}/boot/*
 }
+
+install_dt_to_config () {
+	# Install dt_to_config script from kernel source to kernel build tree loc=
ation
+	if [ -f ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ]; then
+		KERNEL_VER=3D$(ls ${IMAGE_ROOTFS}/lib/modules/ 2>/dev/null | head -n1)
+		if [ -n "$KERNEL_VER" ]; then
+			install -d ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc
+			install -m 0755 ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ${IMAGE_=
ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc/dt_to_config
+		else
+			bbwarn "No kernel modules directory found in initramfs, cannot install =
dt_to_config"
+		fi
+	else
+		bbwarn "dt_to_config script not found in kernel source"
+	fi
+}
--=20
2.34.1


