Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710CAC61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:08:44 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1624.1787904515445832462
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 01:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BS58xV2i;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ImDXFB2R;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S65oBL931872;
	Fri, 28 Aug 2026 03:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=x0owFcBUiuB6F
	/Qk+FLD5yPXlzorfNJ0NQolGkx8DBI=; b=BS58xV2ikLbIh6dwNzc0gw9QfeDgT
	63bsjdagjmJ4qKf5B0l98ICMT+RlJAhr0EyT7aE6UylkoACHFi/hGPH+2hfWYACV
	A+z6lBajfUIDauNh1PjFoT/ib/s1+beCcV06VGk7DkF/wkNox5uaA0Aj6Z5RSCpk
	gQCeQfwa4soo6sCLLNHhbGCT3RSdpp+GnLmfh4hT0mjU4y+glnY02eZWCigsjuBA
	fuhUEtUbsDIfUYqP9XLzHzkfpRPYP1B+FSOfUssoBgVhBqB2yZeGuF1f1kAXmdOK
	ckIGmEpmK4qKihvzy6MNLBs3IKqGRKjq07CIYHnLy2Urloqs+GLT5K/Vg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24q1egq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 03:08:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnOPpcwlnnJHjdsp+CpZX3+n8JRkVST6DXsZ4vzliApH+kHuIK/3I/+sIhCBRhhTP/kRVy91QeV63mqFUk70dq7svEGv7I3cD4cW3lHeoCOSSO8G2GPO4KMDGrN114Kry0QET72jXaIR1FrTFbCitCfMrDL79PfCtjV+6TDaWxSpW9b5VpUmR8/pyxocCfYoBvNSIikUgFN0nccpPTWCt2o/HEtq8pvUADaouJ0SidkZdFy9l17K9Bjr/kDLbbepgOQ5HLFYCopDmd9AUfDeSZ6hG0GLqJztkn6SfRBJsuGQJunfTBwv4rQ6wQVJigYEBwyPxYx5/ZQk4lhqjDAlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0owFcBUiuB6F/Qk+FLD5yPXlzorfNJ0NQolGkx8DBI=;
 b=t2T3lwNCVkvmxb5zfjt87BLFmbMOuR/HNE4SMiceDR3N+L3yLxOLOxNrcfQNPlBD98+5ItbWjy6lz78g3BfDSNKDRiLI1GuDZrnI+kWsWeYy0ZZC5fNpsYh5DqVFdA7Fk8knyXICii9nxqzhKYStTAgdoCYlboG1VPtGcdenTw7jDldufqgDz7n4EI2kEf3vdBxzwOe+tHAqSnvzWR1tDp8ZZoD5M8BiJpVKuOvdFi6I7I9DroGEE5kxZeT+XCoRq7YoLJczOkAK1SFTMfiaDs8TZQ8Eo5+kIfEM7lMhzOVLsHE2pBPiFrcfbaj+zVkPstbENKs9JpTPrNMUo9+i9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0owFcBUiuB6F/Qk+FLD5yPXlzorfNJ0NQolGkx8DBI=;
 b=ImDXFB2RfbliXo2QV8WrD/LZNcZdwdUmwqVHXPJbmoLTWqtUwpSw3euqU9IJrdIvnA8UTJc1nvB6XHNMKxIC5hvfcBmICt5zhNtayzr/GF1BEY1n6vNPu9/C60csoL0RARCmDC5RMm4FJ198C2wu127urBKpv0T4ReNW6WP2msI=
Received: from BN0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:e8::25)
 by CO1PR10MB4706.namprd10.prod.outlook.com (2603:10b6:303:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 08:08:30 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:408:e8:cafe::74) by BN0PR04CA0050.outlook.office365.com
 (2603:10b6:408:e8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 08:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 08:08:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:08:17 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:08:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 03:08:16 -0500
Received: from gehariprasath.dhcp.ti.com (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S88DKX2423425;
	Fri, 28 Aug 2026 03:08:14 -0500
From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>,
        "Hari Prasath
 Gujulan Elango" <gehariprasath@ti.com>
Subject: [meta-ti][scarthgap][PATCH] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 13:37:57 +0530
Message-ID: <20260828080757.1160553-1-gehariprasath@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CO1PR10MB4706:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca5692f-001f-4cb0-baca-08df04db8bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lGUvbDAJDKsYVSIZc2qEG2wOtNOjP4PJLEdDhl7o+aEX4/4aPcq5mg2Ir6QbnGQGRFCu1BWmCecfWtOaSZHXOVmdjUJJvjUrfRQ19xm0VfLSMDSpM3kOJA7Z9M/bQ2rcUuafjB1L6MAQwZTReHpV3zkhw9MwiSLFSz5/V4h3DD4yTtIirsDOODoYa9Z3tdo4yw5qYh6ozFBU/l3dlnx0KUhsHHzvzZvK5mm1UkaJ+XXsbfGRLfoCsnstaO+J8qgCg2QB0cw+mr9U+GiRebcM5J1NIbXE5Ajrcdbq5Wpx+uXtXn2BCLTgPXYtXtHqiux/y1yovLQghq6iJ1xfEz9c9VdaKzyEbOaexrf7ErYh+cBNYgUmyiIFWDQIlw/irzH4pvXesZbzsK/ftF8Mo1a4Fhi9c/RhXH9PpGasIPMtWuqv+DxIzLcQ2UXHfHrFLvn3hGJeX+le0Ks9TRWAHJvjK0r7/3isEH+sNUGqKvPsDHeffXe1D13f7EVXocnLfJwh0cygMg6EloOQI68o4l4dRoiAwZk3LOU5IBPoaABJHibOAGGAvs5r0FhVGjs20JyBnWuOMDGWa5SyyLFqetm19OThLXe5VON1PkLlWwX9tF4M8J4PWCRfsxeqg0LY6A8EVCj/TrmOLthlLaFA2Tzcuswo0UuiXIVNKfa7h0DHaMd7xhvRDq6SNGfG/Z+eQa1NwjUarIPuc8lhXpUquQQVSA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/P+Ui+10q5tfixx8bnyA6+M8YmNjlXqGd1eBNNd+dRN/g4O0y+ZYzemps6C4PpFsz3akC0Fys5Z1QlOKLcfFcFpi90o0sQrYhk2TEoeugLUwC/Lfpa1ogwSYOdqDSqzUrxcj8ntfLEPE7fOWa2XUOihJXqJ3p1/yJcR9Rw3lfhFZpgQkweZHXrnccGp9T1BjxSE3tIrWbuzCGK4gdr8lQLmYZ0k9adLysKGVIDHr+FykrcwDTx/TYaVtxMg3v4m6cpjCaeg/NSVXlLhxv1tSm+B/wstvT7uUyRFOQQJs+4pY6KivxawiImfQTYTjv3tTlt3ysuYv/U4CI7JcqJUdZgxRu63lTWGvXSucWByinj5x6JC/fHLHSan5TRAG1JEgDbeQyEoTlzBqN7AcFysddyQi/TrphhQMHOBxx6qc7nLUyffEjFR1SJjX0YfKxQNX
X-Exchange-RoutingPolicyChecked: 
	s6RaNA/iKpGbXlrW1I7TUuU/Y8CcYI4CanoLcZOhILw5dbkgvF6llFNRG6a5P1Flum5aQkWjq6V1BgVIhlyJdPL1Uw5Nw8QASHEcbthqCav4i129NKvud0jHmw4p5v3GcwglO3B7PXojIfo3jLuS0wcmbt/zOuRGy0LPm1oJSryuyqOGllarpgDMjvyy2Qr8pchP3EXpevddK5UEekOsFxkMYU7jjdL2y648Eij5Yc/byQB1e2S3nUiWyNCYjxnDgORJwKOVnHWNxW2bc9cqNcgJ5wfmSG14Atv0Dn0dzRMVxROp8mhxLeewoSy0YdHAfDZ2aDE9rmYoQL6RypVM8Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:08:30.1512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca5692f-001f-4cb0-baca-08df04db8bfa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4706
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2OCBTYWx0ZWRfX3VeARuVHmR0+
 xPSo8jfmxaEvdoJaBZEUEhRvagaHqtG8dGEDLfKrtgQr9rFyXeWHicequ+BTEJYp0P2EVWuSkda
 ovoYaI9Iz2RA7hXhLsRO2LK9O4nwqz7K7WgCWfgPXFmYlzYKHL1mMNI4aJJZjDj+GtaH1YhvOLx
 09zqQk0H6r0Ju9wzg5Sfyrfli8muP0pAT6XlVrhQEZId8dOObkwKsU88ra5TQ60o8tOezQKkWf0
 r0Vry8WlJDOdbm5yg9ETZMgp+2Cbq8il5Rsfk6t6xPnNy0Nr10VaNoSx8uJZu7gl985G1tqeRH7
 L34YqW2WV4ejVubxDeJXt1ag6WDWa62L4Q9X8PlmiQ1TQHSLzhYM65WKxsZIZWfMEOyJTw1Ptd5
 JtjCaKgxePG3945lZNtueypF5f5UuGbOv/X9r6cwok7W8yrSdItgNuEeUJJw87kOghieHrNZM7d
 43J3UvNMqv6PJ6ztLzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2OCBTYWx0ZWRfX8ufj1C6VYNJr
 LYBLIFlUKUEXCiZlDkgyESekk5Enj41J7peAyFKLE16PjBwSMOcVtEreSvg6B0p7MreY7hju/+M
 azixdp4+WjjH9qvbpkM3pMY2hN1ZZNM=
X-Proofpoint-ORIG-GUID: 5wTs6g4ofGbpUx1i6Q5MeccrZKK7qxMt
X-Proofpoint-GUID: 5wTs6g4ofGbpUx1i6Q5MeccrZKK7qxMt
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6a914201 cx=c_pps
 a=1kzZLs4G264k5kMmJ/E+Xg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=T5wT6sVmLgvxjAWShZMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280068
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 08:08:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20296

The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
downstream.The standard header provided by linux-libc-headers' wouldn't
have the custom changes.Copy it straight from the kernel's staged
source tree (STAGING_KERNEL_DIR)into a separate /usr/include/ti/linux
path instead, for userspace code that needs it.

Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
 .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb

diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
new file mode 100644
index 000000000..bf7dcc3a5
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
+DESCRIPTION = "Copies select uapi headers straight from the TI vendor kernel source \
+tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
+that needs them but can't rely on linux-libc-headers carrying TI-only additions."
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_install[depends] += "virtual/kernel:do_shared_workdir"
+
+do_install() {
+    install -d ${D}${includedir}/ti/linux
+    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
+}
+
-- 
2.34.1


