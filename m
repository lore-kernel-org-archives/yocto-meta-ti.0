Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A3DC61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:58:54 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2703.1787929128938123322
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 07:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Bh0wKP/O;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pysHZhzy;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SDPLYV665986;
	Fri, 28 Aug 2026 09:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=JEWqcioK7Z/0R
	kZ30ctmWl70cWMoo5w3hp3KxlCMFto=; b=Bh0wKP/OzMUEonUlxnldBqZoh9e/c
	d0kFgagIgYde4olXP5XwssozuiApw1llxof2SDdxldWFywff8sIx0FwlDHmd9PB6
	72dBNS4DJFxWPZYyVcO/4EgZy0xO17CpJNcVw2pZl0sFdwiWT9Xi7pZ9aA8ekAaO
	FNgfmcMK68Pjm/TDgYFNEGxa6k+Oa9v8/O+hJJ39THrx39muK4Ox1dfdPUWBndrj
	vh5UwQisP45LfEWmYvu6Doqk5P2G0qLhPytV0AMoUA5kiKSUf05IwnBYbXHUPVb7
	TUL5U6uiyy9XxcuAd/tiWjIPQEMpGjaZWEkqgFkawwkfvR1qKD+X4CGVw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gb24pbmcv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 09:58:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3CJabLtMl4VzuGj6HCUUCoD6q66plm6ho5RzxzH9bl5wxs2jTDMVvvgj3TNynfI3VxXrxX7BtueT7ALw9eWTggJ6i2/4IC9ahVBsGaiWaP8CvQHwSLM4OJ9pffu8m7+PrDv/MJz2W3Anb+Z8ZmAaFvz5x3y1Ksp2iGHKPQZOwW//vgGLH4dC8UeJ3RDuKDdH1q9bPCBJE3sNW5twbGdeuuqCTOpZcxYPdCaV/3TM5G0OKWwjVr/ZqDBvKxmbiIGASAJJ6y8h8nwZ54Zh1wCcL+yXCQQSbBBY7BGdAnTn5VXqRnTyZpY3wlto6zHxGk12k+QdivCoVk6lGCRGu1mzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEWqcioK7Z/0RkZ30ctmWl70cWMoo5w3hp3KxlCMFto=;
 b=VqoidnrQtAO+qFWOfXzZt/H/7mSPD4CfHZ13zcG1JB4TF5gUI7hAycS9rToOex1pmrIIQGqw9vEMW+nUfmx3UdiYBdMOsSFdtG2YbszJ1S8y1oOCPYjIFSLdlEapTgVtvmCnz7kxHX6lV4iAM9ox4bFuvnhW7ESw7y3v6SmL+5rJi7RQmigY5moeU0zcJDVxmkWR+ZI49hy+zxeUvoVil8Dp/7FFY9aQj7gO3Ykrvkj/bNZUGk+WJZIEYm7iIIoBFKQSVJFco9zj3W286vsPXem2wt70GIzn2Oo9NpMruCKkHwZZbpOvKHqYXTV0A3z+tSz4emGAfDUpocV+7mAGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEWqcioK7Z/0RkZ30ctmWl70cWMoo5w3hp3KxlCMFto=;
 b=pysHZhzy3nIrzFV9wRIRkxQI4fadci6Cs1HFM9MqwtSaPafEoZXr4tjVlhc/K5lGCLefXcrIKSRW0aM3OxIW6qsiAnM1/e6gZxmTkl05Q+Mjx9M2mWPt0F8sc1z2pwBVpcZtyrvarYS9uc6HInqiYN2rCvSwcai+rTHC9luG07Q=
Received: from DS1PR02CA0012.namprd02.prod.outlook.com (2603:10b6:8:452::9) by
 PH0PR10MB997592.namprd10.prod.outlook.com (2603:10b6:510:37e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 14:58:44 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:8:452:cafe::5e) by DS1PR02CA0012.outlook.office365.com
 (2603:10b6:8:452::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:58:41 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:58:39 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:58:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:58:39 -0500
Received: from gehariprasath.dhcp.ti.com (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SEwaKZ4025561;
	Fri, 28 Aug 2026 09:58:37 -0500
From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>,
        "Hari Prasath
 Gujulan Elango" <gehariprasath@ti.com>
Subject: [meta-ti][scarthgap][PATCH v3] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 20:28:34 +0530
Message-ID: <20260828145834.1304057-1-gehariprasath@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|PH0PR10MB997592:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e18b5e-b6ac-4b0d-8bf4-08df0514d9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	G/7u/zOsi15o7pRR9UEwku5xmHfJouRbykDKia6GRdcBnze8aaqfMzdd6oaCSdDwZAl+POzABBHVekwQzWhGstcZQys/7wmM79+zUChbBCJSzyWkSThEk2Kz6av5h9/I20WY/X+AhMC6mkTljVBSLGlSnE7O/RtKADLEqpNBliiFT7U7NevxNHWoUbQ7ISGQXvzP+t6VRGIml8HufCVJcXXxUginFDDEcdVo6Syn5upxc1j67z1T5gtlAUIBhVAA7b/TtW3gRXHaLbwENrCNm5V2xHBQQuco+nQhWOPGVkriyKh78c6OFxKJRmq987K0ySMqD4Tl2PHyMbErdDYIGMQG9Z68qI4Qi0FO2JRx39PQGvSiy5jFQ8R9FmH3gfPLER3WNv9eg/TzncLwYblMNuc8Q9Aldtb89zpYxMSnYxz299HH8fex14oi7FpGxHJ29O4O8jzEA21ZvD+8C99ZIYjNqbxnPGQBzlBJzrsV8m0TxiqlfPugdlpyodWYmulFI+Br+hST7YsNNMU2FnNdFzLtCbTO5PBk9CRDglAVE5/snMiNpRuJ/bUzJhQwDHmBXl0rsEh20LkXxwgGqHNpjmeUFx443dlqlZyznQT6zC3vLBeW8pOx8KRw74tqUUPVYRCSmLPLr8fxvY5/x/bV7G0ES3wTI9TKqSA53ZPjerm1PV4kQNCC1GdTOMGShv2cAYwxlKSQj5aPtcaBahentw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rystJKJRmnm3z4wqeE9wYWBs8ltmrv86cQQiiGMm/qHAovU9pe6JmMHc27qB3nlofUzhRoTO0tsQud/YBUpv2+xbuJf6x3kfhcaoUUFCQPc/GTHacTcyun+KccRH71xBvZCsJD3BKSWc2jXxui3NonFhXqahC7M1JxNTvbLmu7C+4S8axr8o2dObgx2JMnSY3Bm6891euh8qNtz198p9s8+qFaE26Oy+w0NQ/LIegATwLz5VuR9bCrYU0vB1XgfjfMl5pvkYvUJjDDBuE2bEb8h3a64NwOBxHF4Dv6xvLH02ykBB3bQoyCq3cDS2VWW20apHX9vXULmDYOOsfB9DzMy3jD3RpJstCUaetJOzIJcqu/nrKQVhMa990140tdY9vtDPFfkOPLAZzxtISmI/QsQxY7WoyY0yW8Vfk9U6za8aSOmVvS+5R2AfqSYTcS4y
X-Exchange-RoutingPolicyChecked: 
	MQWflH9ZvK7dHCkbzXNzl4tB85pesYfmFrzCs/fKrCN+WiMqM/w4IGRpKy6QDlt/+3YPGq1ZC9v/lYrP3B9EeILumMIDuGGwJFRrjDsE422jc1XV0K6nF+zMiqyo3YUdV4iz4HXZhK6bd1Kn3GHOMvHP6fxGkkG4TPudelwp4HnvrWAKvtXNtERx4dWqAt6Mm3JYdjombIq2WNIObTDnDfJfF81X/ao/6BtWzeKbAMhGyaSOteK8domgCiBmaP55x4bpaD6Q0eU8/0c/0MikQm/axB6vFhWTO4rFGdx2n6Cgz8wH4e/bNjmU2b4mGTEx/7Yq2o4WfGf11wszVu9dCA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:58:41.9129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e18b5e-b6ac-4b0d-8bf4-08df0514d9b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997592
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyOSBTYWx0ZWRfX38bmtLZ3GBfg
 pD8DLLrMoaxVXrQklB7/sVQSa4UWCS21j+ALL0HKdYalB9lRRXKZEy2UmDQQAqsvKdegNxPHO4v
 UXwdvSA5qO0UkGdvyagMqMfKD8FwdGYNNlOJpqM3O2o7QtVu6gg8t5h2Bu5ORt6F4rL7CNCV4WL
 WYkI0IEnJrGChgORU1KmcUSjGGGG3aZ3ZmOm7OKfTlphMpjxSsGoTf581Bs7aj53sV7ZYlOn8Y8
 GkyUbhn+iQzun0ZTkpLYMxdBedZi4RJ8GHBKpDjiiBY6kdMF/WM8siEGTbPP87zYcnAi6a/+lyP
 3pZHE3zZA3NAlYfxD96UVoKigd0mSmTIMLH0kEc+H4kC6uboQvZCq9L/zRxI6mMpRC6yRpDoQkh
 OodAhw3tA+osmN/qjBZxzfFnIYyh9TdnL6GdRPjg5BC0TpFLufn6OVbfN5f7VKnn/GgaLRIH23R
 +7PX86L4Qbu7ufvNAZQ==
X-Authority-Analysis: v=2.4 cv=A7pc+aWG c=1 sm=1 tr=0 ts=6a91a227 cx=c_pps
 a=OJmONvCW+i+0F2OUQkAdQg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=T5wT6sVmLgvxjAWShZMA:9
X-Proofpoint-ORIG-GUID: 8lnG0mjA7AsaRS4HeCEsJpMHTpzaYQLo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyOSBTYWx0ZWRfXxoMmOUpfLpxb
 sK06KX2Za6Fob47Ei9eNV3aTeOoZePnEsa4qjVS8bjpa+M/CYAaiU8MYIZV95dw+tqz3lgjmGXJ
 x7X64qFh/rxkxlBaGmGDFeMzXDEkq7A=
X-Proofpoint-GUID: 8lnG0mjA7AsaRS4HeCEsJpMHTpzaYQLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 14:58:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20301

The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
downstream. The standard header provided by linux-libc-headers' wouldn't
have the custom changes.Copy it straight from the kernel's staged
source tree (STAGING_KERNEL_DIR) into a separate /usr/include/ti/linux
path instead, for userspace code that needs it.

Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
	v1->v2: Address review comments in commit message and recipe description
	v2->v3: Fix the patch subject prefix

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


