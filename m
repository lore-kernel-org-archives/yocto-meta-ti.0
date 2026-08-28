Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D480C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:53:04 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2575.1787928782448877679
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 07:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EPj94owh;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cRWCuQdY;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDOncw1415071;
	Fri, 28 Aug 2026 09:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=AaK6JIIyOhcMv
	AtMFOEQxzYtWOefCEhrLLhnWC3Wi4c=; b=EPj94owhh8r1q/jV1ZSjVX1xGaniJ
	JYWyu0BMYEdPUcrDHBosMkDcI1RW+01hqR86nMFQqUE2T5cgaX/DxWe9YAsIsUav
	FWmlfI2E0GZnriXShlnR5iJViKsDAGu2wIPF0SfeRWvHcDHyRpZKHv7WiZraHcoG
	ckt/txe/oKPlhYbJ827Yne81vgLi9RC0tkQPp9CuWBbQIML+NYghe8aVHEVRuG1A
	SksnAZMahodkbuPh47ufcuaoC3hN5mAoWdqdf33hA0Z6Px+5ZK48TkW9mpRxS5GW
	OIx/qWxqaIU9ojPOtOMCDwI421bFxY+PhH03b/lPfETISDihhYAV5BU4A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24r3rf2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 09:53:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEV9mvD6rbX8S79BJA4CrG4T8/kBTBfbt8B/zX7Uk31aNewQxw9dE7H5+9dQSmHKb+HGoV4PUWVAmrhqQi1d+KaRlBkYqSuEFbLyQlol3chj9p8Y+SswbUzKlSEnCzYYNljcMHlIYNQ49OCryShBKpH9tSmazGnoBpS6h05Ih3IF3JTwm3zLumT1qsMCNnHU93j+o+tjHVPRbWw+EqB6lTtAZ2NfMBtO51ozFYEUaFHYDZkVY/RZFCtn8PTa8kTEG5iZRlRril69ziSsP16T4EdEKJ624A4js5RPdQVyaTNa09OyKYHA3h9TobOxAs/zAUkCiDPtntmhEnthk+NLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaK6JIIyOhcMvAtMFOEQxzYtWOefCEhrLLhnWC3Wi4c=;
 b=hgc1p81aiYAHrdIkKtgsoT7DmG4ORqlF7lVhS8zEqDe+kIfPR6TNPuM5r88LI7K5WPA4q/7MsXLRevH2xP8CWj0Sa8OtM/zv/O1O5EdCJDGLpl/y3vaWM/m5fFEUs7gxiwsXBSoV5ujHHoy3tn3x2nFvkILs34m7i6IKpktM18W4s3zJ0eKUAsSzP99oiitRRjRA/RZDTdOlvEUcZ+VberlLGOo/YuiYrfQrl8L64yXPPLkQnSS8XEd8ZOwqzzUwRpzK3WjKA54zizGVy2BmL6dB6wF1Ch0eTQv+xr+KN0N0OKAv7ZurAPg1/JKucPjUAH46A+2aiOX+JCopVxdPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaK6JIIyOhcMvAtMFOEQxzYtWOefCEhrLLhnWC3Wi4c=;
 b=cRWCuQdYtiI+FKPqHuADSd5COoiIDEOjClpxQOcXPtCTPXz8XncSHAqKSW0LUYz+CkOjmY4t7ECZERjzYZXjviMt2PWb8O/d7gUtwNJog4N3pbFizedyY/FIct+2mYxkOqM0R8+ZOtyOE4oxijkmcCJJP00OEomFNUdraxrSp3s=
Received: from CY5PR16CA0004.namprd16.prod.outlook.com (2603:10b6:930:10::13)
 by SJ2PR10MB6992.namprd10.prod.outlook.com (2603:10b6:a03:4ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 14:52:56 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::21) by CY5PR16CA0004.outlook.office365.com
 (2603:10b6:930:10::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:52:55 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:52:26 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:52:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:52:26 -0500
Received: from gehariprasath.dhcp.ti.com (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SEqNaI2991094;
	Fri, 28 Aug 2026 09:52:23 -0500
From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>,
        "Hari Prasath
 Gujulan Elango" <gehariprasath@ti.com>
Subject: [PATCH v2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 20:22:21 +0530
Message-ID: <20260828145221.1301539-1-gehariprasath@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SJ2PR10MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9fb448-0ee7-4d3f-2a5c-08df05140b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SVISpLIVgCeaEJ7wHN8H+hAIFdMqAgPAzUXYX2fw3NY54JFyWtc3/CE/x+0jD2Kkg+8PTMA5/0tHkWqHWJrZIPpZSBkFeYjJaaV0+Mq01am+8OWYPhHQ/1GWhrHd+D+ptXd1llVCxqwvSNtXfV5MdzFGv/zdYE9CDpe8JeasBw1zPZo1A4ASgs/xTFeegVNMVK65C9NkxiNXFxbXXjNWKOHHN9eyFZ/i9t9o9Nj40DhDurYZsRWykGlqUnfNl/2iEfFC9fVjui/xQE9YszLIihP+gfhM8zBtMieyxGpQLa9Mo+HXEhnE/PqKC4DSlI9SNfz8iVK6pPKXlKkpj224JvItR4NOCX/f81jPjhjtoXVZfco4afY/0Pf0EtnLkf3ytEl5rRQ5SnNDuJBaPfKhrJmgLKh/6Pa7T1CnycbS+QEVFnWqr1f1QzV7lQvuXu2BJukqc5qj/K5EviJAxRbVGx5megjz8QKvVxWvCSsabFjzTv5vLMmO86yI6AMDPXG4xCArbMqILstVGkLdaFMyO0P8Itie7FErK9YL/X4sbjBJuiINjsCD8KHy7ep4tYucf1NKrQP95oXGu5uTWiRGnIWXwhaKtbGS6u5UlK0u7m0FwutWuC8mT61gXoJcyrBJVxq5w/724AI79FXY+byDFSEKshFto2lbBzqPUqjCYjYT+jlqOi1/53a/8ShfFIIAfotG3rSt0Njj0cog30k9zA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	18qmbd7CO0Xa8Es+JRYcSsi0cs/iXKsD5+4kl/3RxaviuDPEVS0kOvy1b7ti4wFTpfMA8pehFDw2eaaBxMgDX0N1Nrg0mZTQd78irXFpb/5h7p5GaZ0gWBhVJzNzltuSjxF0YiwhTCzDZ6Fa7STor4QXuz440HQkZC4/Vpl4n30HmlXeemd8ORiijp1kg2GwrpeqigF+sXQQQlI3vwuLdd2C8JiVtZWDRUjwLAxR0QHin7E5UdtUKNRtKkm1NcmIKeYZpv66zrgp7DXbhqYX9jF/B55e2rQ4Rpr9B4S5dTCnnGUohe7zeOBx9tiCtjIsrq0Rk3VYNVQUF7Xzubu/51lt/249PP+ptgfu5r3PnHxLSGpNBYgl+Asg0mx6snBMU53eDmQmdqqA/2X+MJRf2DBBhshLwHFIQWgrOV+BcEa9E6HSe2+jK5GRYm7dmBxu
X-Exchange-RoutingPolicyChecked: 
	AB8lQbZtLdiQhcTNsLHX7vY1kKred3nrZs5AjbVLd2ksHkanzyWDTJnbyPfhQUO14TiEhvOB7j/pkKoIj/u/2ukmayY0K4I2m+2BzTaFw7GaQeRayaDZUzDwXL0A8RBnUQiWPS/WchzJVq7x7M0UnI0DKAsRUOvvsrFoNqPWd6by10+8773Ioy1xEhn4ErURxUGPSNAhP734XoEdf9Cy9KCB3wg3jr+8FvCozW0mr1BFuZlxIJoFlnzHa031vw1jT1LFQIv/HFyPCUTffJgJCW2Knh+mOC7Omf5ONkYPFWCz11pW7cm2SM7VoggzrVl8CQQpaLsjN09NaNzm9x461g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:52:55.2652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9fb448-0ee7-4d3f-2a5c-08df05140b18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6992
X-Proofpoint-GUID: GNhafIsifEcyNHkokVmYbLqA8d22dQjS
X-Proofpoint-ORIG-GUID: GNhafIsifEcyNHkokVmYbLqA8d22dQjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyOSBTYWx0ZWRfX3IAWN7vLjwsx
 0Pvbbz0uEBr8w9Asoi60A83UeBToG++58Inezv9LhDujlBgys4ERRW0Hpfex9ydODYLQ+dEeJR/
 z+C//i2qRWlaDScejWivW25ILeRPOAHW80h1gE38attuX0CEgx9um+rEskOYnpxcpJLgu81uYvr
 0YWjbBe3JpHL1bz9uEa6+C3KQzJbN0GdlJTNWdKOpDIO48BNYNVkKJUe69dvmMzzFSBmI07f7R7
 oTcOVYCwSWs5/zAdxPQjseC6IYtLr4O2CJ9tSP7RK4UEWqNfkVZhqOwNBWvxTgyNyP++lM92Od6
 I/W+6wYBRNo7G15P8EcVPnC7Ek5agyDIuvFVSlnzGWMBhXlMvQkGG7z1GEYG+CVgLcNgZgPuqi6
 pmXgEDfItnssM3BoOpZNyfueB/rLceGSW6OxkrmuiRsclEzwKVrkEI2ovet4g2DQzqtWk/XoUw5
 sLy5k6CEfhWZjeAAPjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyOSBTYWx0ZWRfX4xhxg2pBRmvZ
 DvtpqYo+AvH5SlB8kPGksIT8dPIC3qnrjjvHrvcdmv00keTRsnnlAwBxYwh2Hf8kIAEdw9KPNbM
 A80xSy0XTd5c4DOXLhtMk5rx+ZU13Bo=
X-Authority-Analysis: v=2.4 cv=L6gtheT8 c=1 sm=1 tr=0 ts=6a91a0cc cx=c_pps
 a=mhFp5NV/8UFWlOcEKiO6Eg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=T5wT6sVmLgvxjAWShZMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 14:53:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20299

The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
downstream. The standard header provided by linux-libc-headers' wouldn't
have the custom changes.Copy it straight from the kernel's staged
source tree (STAGING_KERNEL_DIR) into a separate /usr/include/ti/linux
path instead, for userspace code that needs it.

Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
	v1->v2: Address minor review comments in commit message and
		recipe description.

 .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb

diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
new file mode 100644
index 000000000..5d570689a
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
+DESCRIPTION = "Copies select UAPI headers straight from the TI vendor kernel source \
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


