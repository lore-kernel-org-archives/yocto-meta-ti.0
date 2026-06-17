Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44481CD98F1
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:15 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12415.1781692392976798289
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 03:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EqHEsqMz;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ZmTjbKMe;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65H8VTsG1271019
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=z4x6v3H1pUymd
	y7rvEXWpVUtE0Q2YCyQSaPdl+ka/Jg=; b=EqHEsqMzmhTLz9/lNvi4ijxx2qOAp
	zN+K6G1p55f6c3ir6fdG1v6Ov2AHpSk5KkTiqD+CR1ww8kqay4kQ/R7GN8Oy8e9F
	0iy15EMz3ew5DAdxAWnyaK2YQxYQBuRcIboZCYzMZF+n1rxdQh1j0IdhjWNPC5eZ
	aEbyVmQp/gogL2y9wqrsS7O92XhtTxTClAiHuZ503Hu2MhljgS9zEPhs/0Mrwhwl
	l9vwaySqiirRs2ffYGLUV4U6vmIRTd72ROVH9lQUMt9xfZA7eia7haCMWoLkZtUZ
	mXCN7eqZpVUEZbmnp+qkyfndRZUE1VugwlEFei7PlTeSNVq2eqjPbvBRg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by m0380145.ppops.net (PPS) with ESMTPS id 4eueeu475q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:33:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYp6FEsPdQC0HzVTIq31T640lArS9gfiHsP0nBW7DSxccsCWfeUaz8hX2dc0OHdqhInndq2rpEAhEaT66MY+If7pu0wiw3SHJtB6BWZbMfeb9GQGcDPteAiP9RDXfdRVY9L0wHLkEuiOisexCyI0WTyr+9pPFO5hsuT2vOAh46xRK4AqpzZapZBx6NBPeeoknagSot0rMMy2B7ZdlUlyeWzZznDFy0Yi9gPkS4zcGnMhGjMNBHFLoIgcaxEkTpmOZRzXzVa4ESdCOobqws7x8zfsJQogXJkgexjpDQtPU5YEvHx9nkrgqhADZqvBgqbNFLjPfJw0dwr+UHgYtszIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4x6v3H1pUymdy7rvEXWpVUtE0Q2YCyQSaPdl+ka/Jg=;
 b=MuV3v5Melbl3zmz92r1/nNbGfahF35kjwQeGURSxPs4DGAyG8J2u0t62D/i4hwrqSLgnVeLa+zGrhAC2/bO+SW0jc/wHfO8Qvemhq3ovsmdKYK4KhHQUmZGyFIw+ELFPHzSBFu/Iv18mxYDiF50cJc7lpln3jXFu+i9Paz6AsHGLgmqQh3WtWwKdKwZNxPRD1uBVABy+/nnmB4pt/8kRh5tMtyVLHmw5l30mYrMB+amINMDLVmTEVEL8zyd4zYx77IgNLeq8S0pMX0IvufbVvIlxuzrmN2AsRFgeDdvE/h4C+bMZJ7AySBK9rVbVOF66dIaK1p2rXRdGIKxMesKfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4x6v3H1pUymdy7rvEXWpVUtE0Q2YCyQSaPdl+ka/Jg=;
 b=ZmTjbKMe3bFohX+zPMPIuSHdE2c9WUs9HSMFljNYjh+vAm36lxD9oLWIewOr6MWC9juf0XKDsyWfXPlX7z+sZUZ1zWpL4loBYY/+hEbfV3BExPXuxLrnYHj/xA1QyHSJzdM699/xl4hCbzsiTH7c6+UrdbDIWimTOb0IqQjM3t4=
Received: from CH2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:610:5a::36)
 by PH0PR10MB5564.namprd10.prod.outlook.com (2603:10b6:510:f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 10:33:09 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::6) by CH2PR08CA0026.outlook.office365.com
 (2603:10b6:610:5a::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 10:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 10:33:08 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 05:33:06 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 05:33:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 17 Jun 2026 05:33:06 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65HAX4gO1533586;
	Wed, 17 Jun 2026 05:33:05 -0500
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, Yogesh Hegde <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v2] beaglebadge-ti: avoid building ubifs and ubi for beaglebadge by default
Date: Wed, 17 Jun 2026 16:00:22 +0530
Message-ID: <20260617103020.613051-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH0PR10MB5564:EE_
X-MS-Office365-Filtering-Correlation-Id: 390872f2-1f4a-4546-1adf-08decc5bd2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ZEJHvyQc6I671GBRbnJ0e2OJgRkSnm4PLH8+M61r2L19YhTT17ejIbRVRfQo3fuApYLcmOqw33enyM+xsyZ8sxOkNTpLJTGjltmLj7rAFA2aqXXioGOHkgCwC5ETbFuOR2bDYoQWm4HZ/DILaQMjT8Kj1oNS1f5YbkUUjUtO6L2m7Pf+RFOuCGYK8EYkUXxDFoUE7EDiGv5AffVc1LxDlsAdoWxfUoxAJY4cl3fc2hxJmHdpXwrF3zrWB84cqdrcv1wflqGjbFRBoRgcM41pp6dUIPNRUCkYt4xrByQOcPjC6+bKinmoaJAsyuWeHQi42fmAyvR4GECQCqTz4jgK05kEHF/aHTrgsHtEEICZGcaUKXLzmSxLFi6Wt06TMq2v3d/SVaa5q3ywABr3ukjC+bQh1bLpRKeVi9/m8ubwzPxJTSOWUt5YV88rytAOMAccfiXaDQZLM98yO2ltYCXkTi//Y+tvsXjubzg3bKw0RuFuAT1LTzoYShRe50OdGoDPqld94+HCfDu2UK2aWPL2dGiS4F65vsWT3FRsUqbI1YX7CkVQAB/gV/rh/1cDZCLjztCBFZjHwaN6NXiFsOmbbFtK1nWvBnNcu0W0ajYKMMjSamijtqVyqCJIqyMr4biz0cczVo9BJ86uBWPa+F1j73yY+ZBV/S6rIg1RqfANvyD8bD+1z/LxdJtAqx7ltnowUPzkvNaSeFkSHD8X1s2MQvz/TKKnsuqtcF2KNqR/ZD0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NAdbbVolN98e9u1TGPzax8V8PWprbz9yRkskB4gZk2kghUYWcRGTEtwyHPJY7SgrkwTrcZaazJI4yQgaJrRGKDT9bU1U+cxkuQ1BMXxq9d1FBNPLY+7r0tbwyWCyZv/lmF/SEnqyupAMsYDGHX2JyCaweU3lUkO1ltmEySRSUZhyldvQutB41DuF/obuloiU8AQDhtw9VTMAYkpLxwLn7xdUWw7baEtxw/ZCa5zNdnUgX+pXKETwpyM+QnapugAIKoJ9IrVN7LHerrOAe5HEaf1j+uu4irgTricwYQEZX6knfIPShwLuZvDvXCS80/niP/thl2HxIdvNED6sorm9P26Z9ysZE7XCWQF6FGDMzIVPMzU6SyUJ5ocxiiikF3qYmQIzcLTeTi5MjnpnI73vwk8lk+js1NbwloWre7rp0o4X4S0PtGMjnuXk/gWGa5XE
X-Exchange-RoutingPolicyChecked: 
	PYdMxu5RSTpUyKv82NDtawgOiY80rDRvsuLUv0oTW7SMymb+28cOe0p7fykN3u8U+w00jgYqKSGNejZ7dlWXrkU766IdqbXXpemhpHfhECHSkM9q4lNa8Zp4gzVvst10DQpbmhKnzthof+nDEelbcuPiufWal2juicQeTOS3CX9WbueWms+xSggr9X9hYSQsyDDHqvZsOZ9CHDufiqG7M6RnNqRRz6Xnw5EDsH3Zjc0aMYPGQuJVzpdpJC1JrCzVLP6WVuAhAnx0WVuTMwDi4d0I2RFcPQWw5i3x+W6BjECTn2kCDYZBj4zKQIDRQoHj//WICtczqKbPR3rBUJFmxw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 10:33:08.5033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 390872f2-1f4a-4546-1adf-08decc5bd2ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5564
X-Authority-Analysis: v=2.4 cv=YZONIQRf c=1 sm=1 tr=0 ts=6a3277e8 cx=c_pps
 a=jRvQvoFr2LhS1HEjeZSEyQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=d23ks3PmuhbJi7Eais0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfXxqzXPhDcIN3G
 rFVBg4LTxgO1vPO7+gWI2KUNKNRGWqCMquRofLo5nEliMXfck+i1u2c6iYVIUweUf/n9df2c6M/
 H+x7lZjNDcaF26b1jdioIuCNmNkUg6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfX+Po21Qj88+GX
 kuDU1xnwHU1aM0UNUzvXcAn+CLuIMX0XvNPT5+nBP7ypGSyY4EcmpudrVp5fvedR1I5Io+cgLCM
 4u7ElP/25KIk7yyGgoNhdaY6Zp9TrEEp6sYRPHPh6ixr56KtbQB5cLz11+opgW7oXbTdhBXv1S6
 W4AnZKweKRC0pguNmVqNH+4uqcXIFJusZHoZferecqIBTkw8ex2Decrg/sUDlpB7SDpVqVxlU9m
 Z24tUgx4nITdcyhb30uPj/+eqCVIExPj0TxSDffS4wMn+8Z3uC+KmJRwuqcdmxGxk7VtjrTG5Fr
 ElKLAguXE6XMqVmAoqi7jSqiXu8MiF6Bu13ooz6J6h9QFi57OrBh07z63oEBZoixEnblRCFHsVT
 WEFXdwFIPo1stfI5BY3r/AToarvbul5HSwegQ6qSo2kTNykH6NMvaH+OnpV3iAU66GDUOB84Pyn
 xBDFuzl/0iXAe/49Xcw==
X-Proofpoint-GUID: MIF5aZ3fKk9U-5qt-wRxzJKZPgHPcSS0
X-Proofpoint-ORIG-GUID: MIF5aZ3fKk9U-5qt-wRxzJKZPgHPcSS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170099
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 10:33:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20042

Beaglebadge has only 256Mb OSPI flash and except for
arago-bootstrap-base-image and arago-tiny-image other arago images
doesn't fit into OSPI flash. Hence remove ubifs and ubi from
IMAGE_FSTYPES to prevent unnecessary image generation and build
failures when adding packages to the arago-default-image.

Those who want to run arago-bootstrap-base-image and arago-tiny-image
on OSPI can enable UBIFS in local.conf .

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---

Changes in v2:
- Removed MKUBIFS_ARGS and UBINIZE_ARGS variables.

---
 meta-beagle/conf/machine/beaglebadge-ti.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
index 78525030..ca98aea7 100644
--- a/meta-beagle/conf/machine/beaglebadge-ti.conf
+++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
@@ -4,12 +4,6 @@
 
 require conf/machine/include/am62lxx.inc
 
-IMAGE_FSTYPES += "ubifs ubi"
-
-MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
-
-UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"
-
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62l3-badge \
 "
-- 
2.34.1


