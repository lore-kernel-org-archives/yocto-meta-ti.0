Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A90AC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:30:58 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19247.1785857447748827522
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 08:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=R89Dsuxh;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ReCONwiG;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674DSft82586630;
	Tue, 4 Aug 2026 10:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=/smNy5d0NCZJ6
	GyEklYFs9HAUKRH7+6SdaZ5n26Z0t8=; b=R89DsuxhmHs9Ur0Wj1cC06h6tDsJv
	dZpluiFXmsLvGN7c0oZcmyhbh03ipTeLAq8h+aNUCtjTXBA1p9S2Hiv6T1BKq8xQ
	ZHQAw8uJlF2JVlp4lK+Xa9JSqZXsIzZvmw2O09we/D5fnSaeCTbvUdLKjfQ4W1+i
	2c1KL/V7mY6bUP4BXXou6TnYgSVSRFCMrhsqgxSgN9qKdWcmLOBROQ1Lgvp6BR1h
	nDNQotA0CbviGYLaE3hBZkxNZIiuXEXe8JJz6Nifqo/jdyGss9uVAQyzm9t6ATRY
	m+JIiBgi7Mm4bK1EwqS3Qhh3LXvc2ep3xRivwkGdK6JYiEnx5zty//pBw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fufc6sng0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 10:30:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6zBzFBLoGYKv5thOe3YHYrhQFo1QhKQ5wFKwX5Us8zYgKp5rRTS56Jh1AfcY0vSMNaALO5F1F+ir15Z8gk7Hi4Y+B7tGPZkNBl6ErrknXXmhtQEwIlLzHdsTVGSr7qIltLSODf3QTt+/j0hzFicVJPN1lOVPaMkmJQdUVAhUA1ZBXJGHaIN6YuEk3aJYR+L8TlwNOpY2cFqUktE0OHnAr9oK5tf7Q2xaaG6ujXfC2H4Tt2iIAGZD6KHaeJSNAMMwTG4rbMTwtoEYTh0ivTKHX+1gBBFWZ6WK4mU3M05DGmo6DW827Wqm3NUAJQ6TlE17rvEhpc78uP5vpcxotPhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/smNy5d0NCZJ6GyEklYFs9HAUKRH7+6SdaZ5n26Z0t8=;
 b=W879UcHXOjlDMFlUv4JbyRgNJs7ufuwKb0L8IyLXwdG9sWBRrXyb1+hdxRF/dMI0nb+Rs401P0WjXIopspcwLKol1KjgadbXkvO9I8UYtpMysVlTke03pnGBabnly6BdoFEAoO7umydXTPbCKsmhEVvBoCgkRigrPcbB2C6pre856/4/dFYcmUtN7HA2ggkOdHdrwQkesnXTETJEm1VbzVj5lZ0gPXAfq5jTBqHr2xKfyLPK21CbiNDwJL5JPITrckAEMCtQwwz8pk1GRLGGp3g7hsIe1G9dyWX6OKbQDLp1bvliLefxBN0X3R0x1pkMjdLae4rPNx8tGD1bYJN+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/smNy5d0NCZJ6GyEklYFs9HAUKRH7+6SdaZ5n26Z0t8=;
 b=ReCONwiGBqCON2d8mOmtpRH70ZvLHshUCuXbASRgpvALy6Yqv+Kb5G2vPyfxHRRxvuFWuh+KSPFCK7fN7TLeauumeVx7M/ggSxH/+ib+DHr40HDtDwbCauXpZRl4Zt43WWAmaWj2MLdSpO7t0rv4qtozbtYtdbNGPhVrOAi8cG8=
Received: from MW4PR03CA0058.namprd03.prod.outlook.com (2603:10b6:303:8e::33)
 by IA0PR10MB7580.namprd10.prod.outlook.com (2603:10b6:208:490::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 15:30:39 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::69) by MW4PR03CA0058.outlook.office365.com
 (2603:10b6:303:8e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 15:30:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 15:30:37 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:29:56 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:29:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 10:29:56 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674FTu0W468823;
	Tue, 4 Aug 2026 10:29:56 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wrH5Y-00000008ORY-0UD3;
	Tue, 04 Aug 2026 10:29:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] kernel_legacyhs: Adapt to recent changes in oe-core
Date: Tue, 4 Aug 2026 10:29:56 -0500
Message-ID: <20260804152956.2000577-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|IA0PR10MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 235ff43f-25c6-4537-cb1f-08def23d55a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	sPeaMGqRJTnn8T7IrR/UkYItXKZa/XFrGstA0k+rj+eyrzqdWdmRLvsbC8OsX5jrOEaLWDQVHCVMqGec/Tsown5kskT4DT6WKrZAkmwUzShIDhHh5gwKrUbt0nTDs5udcNHJdoucoekT/h0thFaTmIwDBHwK+W9UxfjiFaPknMwPamsASJ1IiQ10JrH4U1hJLnWv4ZU8OS96mYRi9Lp+t4o1Kyd4R8AGZpLEBQI6YfQzisJiyblW0G3vBInjf+izrvtoTqkDLBjCTYoGtwoIPApSjLuQhn+7cNARJ1ZLHhDe/1PoTV3n7+oDocs1+dHxeukS94DriDELGyDlaf267aKQYT1tAz6RCcrRHtYIGuHKvYuyHhKtZWmppFzTrbJdp8KKack3tFc9t7SxRt9Xsgfmo91RCFEuJOkKM3x74lO3DSq8ddgtbYqM7xiHVIMdyhmsDddPViThrJRsp7cDKwT1devIr8hPXERGobC578OJ7AlN3kg8X+S/viFdjGoo5wvfKFyPo/cTXcbLTR6WyC/G+536VFA1+qG1g7gg0mkI9sxUKTBY4eBz/ArWDfkIVi++V8MqaXXTtYZf1yTfwSVSjFpAWEPZSLkgAmZBGGGVfoPx0l42mFm5QcNy5W75wqXJZHpiZ+V1QfBq7yiz/tUdG/4xV5r+ArcB13D2agiV6Z4UzsM8eEkuc/ahlZa34a8N0TZdUkbUFcZ05uUFvg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aU8/pXTogwzoyK/aUir+ziTMJDyZ1ZnNvso5/kBbGxgwx768BgCOHiWWDXgGlxqQ1hB4jC6VOzC3Lf+fO6opbqyy5BQJV9VZK9BL8YVysGjldnGet6/rUvXkSeUXYpuZC4PZAfhq9tz1GLpuUiCORjKshwmSNuqNelPXb/hZ7l6xudkqfIQMiDUg3q26t/AUqf2LSofpAkSl8gvrWFllHJKeBYl74towb2Q6RiGhssqa+7wfhReDet3VJ8rOUOiUJK+Q07B47P7FFEDg3AIT8ia2Mj+ddcnKRUnFtsWUTiQi9A98ozphpDJEZRZD1CKAP7NAgknh3tS+AhU/pEbFHRMG9CU4LCVnTGkD1wR6S8LOyZRR9Ui+IvU2BKIEbo4TyrFKbTwASTKHVdRvZKzx+4mW78j+8bs3cZay58FQKV4hGB1VOpIDt1Bcz3YXudgC
X-Exchange-RoutingPolicyChecked: 
	iD1/mfTNEF+pJdxVevfHUNdjlhP+o/PdI69VBrC4RQ0UOzD+QobIA86iUHxhzGLG4YxH8bAk0rmNOQdCwJRs1jFdkM81fIj2VzDFwtxJVZ9J/Tt7uCCY7pQS58FdaNiqHWebNsEEHwxZjQK8Eg9LXUY0ZXecnEEng5HHHkE3FXlFlsCQV39myuUFkoDBszqVSWIspcT8Gc108VPmTppl+mMqdDXbY42By29tlp++l/sOXV2jTDR9tD9g2V8TqN6SFtWDKRaaCnN9aCZLdWrq3s8Lc6Y5aruS5bC4Yy6ulDOUNc8XudRxEWuS9dQnGow1gBIXwwJFlCObL4BPt2UFUA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:30:37.5764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235ff43f-25c6-4537-cb1f-08def23d55a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7580
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyNCBTYWx0ZWRfX97yhQtGiei/O
 np3AxsIvH8a0V8otwsp9hsvUp6DocW2SAsXk+TCuB+/zV1PBAO9lK+8ZF6G7Z9Wed4bzJpUiJFX
 TbaLYSnPn0o/+rAKH6qlFDw6VPuEbcqET+7UEQVnfeLJ1GKes8Y2ZmsMNHSH73bW6z+tgfFdYpV
 WVjJ0Udgs52j0XKV9GscpMd6DwPH9Rz9Dz+TH47nE7Kz/5m9EQYKCCBUtsh6ebEDkDQ5rTxt1yE
 DbfUmj/AkN5R4vRqPvx/qGxF4wneqMAVHRoJ1kEOMGxechcF4SHu13UVgnZ/Li78d4CvLwgjnhF
 nXD9SquYcMcuL6PlH2aq1g0C9HNdrFDClXAoElOZQBmDdeeG8Zr7BPt9b/cJylJ7nhErpQS31Aq
 Y5WIypJ9sbeWr6moQEZX3oeI1LeYSvRVMqMAi1WN441m4LitbGcY4qCwsK6XSMmvgX21tOlCdcN
 BLQvLwEB2iB37gAjzZQ==
X-Proofpoint-GUID: BhiacyMVoly_w3alu_xBI1lCem1FQk-I
X-Proofpoint-ORIG-GUID: BhiacyMVoly_w3alu_xBI1lCem1FQk-I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyNCBTYWx0ZWRfX6d+VzUtYeL57
 CfnkIUMkP/x0H5rTx5MP09KW8Z+TsSElXUsYjiw7DvEEnCSL5tHRybWzjNarAYKH3m60a9zi/vR
 BYFa+jOug+q1tMRRc/t6EW38VWQKNFY=
X-Authority-Analysis: v=2.4 cv=Va3H+lp9 c=1 sm=1 tr=0 ts=6a7205a4 cx=c_pps
 a=WIVU+UPliRI2+OFOdf1Qsw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=RH12jq4L-JVRnmRTdgAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040124
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Aug 2026 15:30:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20213

Two recent changes in oe-core [1] and [2] have moved around various
things with the kernel classes.  Since we have our own copy of the old
kernel class we need to adapt to the changes.

[1] https://git.openembedded.org/openembedded-core/commit/?id=945f3faa4909b226996eff62bf55fa586a5279fa
[2] https://git.openembedded.org/openembedded-core/commit/?id=06057ac24f74ce5de74dfc7b479a1e2c796bcdcd

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/classes/kernel_legacyhs.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/classes/kernel_legacyhs.bbclass b/meta-ti-bsp/classes/kernel_legacyhs.bbclass
index f2b79b1a..7a0f913c 100644
--- a/meta-ti-bsp/classes/kernel_legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel_legacyhs.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit linux-kernel-base kernel-module-split
+inherit kernel-arch kernel-module-split
 
 COMPATIBLE_HOST = ".*-linux"
 
@@ -227,7 +227,7 @@ KERNEL_DTBVENDORED ?= "0"
 #
 # configuration
 #
-KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
+KERNEL_VERSION = "${@oe.kernel.get_version_headers('${B}')}"
 
 # kernels are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.43.0


