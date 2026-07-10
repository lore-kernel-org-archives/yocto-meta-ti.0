Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0006CC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:22:12 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1601.1783700532084374880
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 09:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JERdvzgq;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ekkblw4C;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66AEaZZD4154590;
	Fri, 10 Jul 2026 11:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=yidWBoymtomfU
	ztSm8/ONa87tkMNrtVqfTlHOjBLOxc=; b=JERdvzgq/p5KXLRLm3uVjDob+O+Fz
	Bkl0c+cud9GYzlOGgz5IDKZCxpm/Kmi4xemxg1J71eDhRPPXBPViWBo8DEHCSc67
	GzTl688tIKHsnIsRdV/m+r2dAxTMVzItboxbQhLXyuEQBgpe3erGwRocJTSi1KBt
	a2GsHFAXj4ScWgnbPbzmKuZ4ZA9kiC+G/+ZBjDVVkyoSPkuQG1r0bhofb/d8lhs4
	uxbejQu7c32gSPS+t18x9TX9avGP6Nzn+dGN/9XapfUBvtI9RBvniU9KBnZsbA59
	/takJ2SfMs/LKt/T8exDMJPh4CheVtrF8Gxw9Ed4OQGGOiO2Uvdjjzxdg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fax13a9pt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 11:22:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6wSSCuBMEupWwZkA0YQ9BiOfLtLstGdyGBFhYLV/t5ZAwuqmD3kTs8XGpIP0yzYhN+uLFYPgRX8XPTvMysKe/LdBi3xt6MVB+f98Tcb946bvnIjW45C2xrfzbnTwtcjfotOEtfYAhmGKQlZGT9xxrk+XZ7taEp2UQAjuLdLlIxX9WODMET1ThkfXoRbGJMdArSQvuTCwf+3BXqT7lVufr1Rm1hkxwO4SMiv5OAT1s92poJv+Cb2fywxfjELhvbyG1lZUM1Yv166uhCycH2SkFy9MOODb6I8Y7VMR6KBZaeqnzdQhiZd+UwMAW79FUoVwwlXoKI7sa4DDjD96E1vBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yidWBoymtomfUztSm8/ONa87tkMNrtVqfTlHOjBLOxc=;
 b=zRcZi12GSmP+1SJNCu890IpJfBdFEAdlqR0leALdWTXKuJs1aYgXRxMVXHtBS9KO7LFKH0CM1SGaphDoT7WavGIebGJFy5h/3MQEV2IyfF1czjgHQoitJtsJPjGyDbnRrebRojz4PnsHnsPN/GkMc99flHMT9DmLujuli1S5rgqTIDP5JI2SJUnOPCaDocLrY6vKKRCnpK8p+KH0NVOEkGjRTbTFXnvD9O/zfHiWZtVfLNlGC/4VP5z7HLymPc/xHkTmHVSFi1yk/fGMC8p3+OO4F3PQ2OOwug2rS8EiqmsdzwuUvs/umd5zGHwUqiw3l7ZBCOxnc34sfNI2ie0nuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yidWBoymtomfUztSm8/ONa87tkMNrtVqfTlHOjBLOxc=;
 b=ekkblw4C7jtmyq4Xj63hBDvQq7hdO7ud4m2Rstc/Fan1amb4rQ4f4OTE1Q+yzgYadTlHLQSDEofJz27UT9kAzSs93KRh//K+G4e00wlD7XG7wOGXJXuT7nQYmJBZmQdLPYHIOQLyGKL0VpRKPoMJvWBjzE8G9Q4NfGT+97Nav296sn6p30qLYAuZmMoDDmY1lDmJB+c1M6hrQdcfpinm0VG2KvW36Hn6gWIYF68o7oFaa1qHfBLshuxt4HoEPCzszJ7HTfACWnzuccY/Z8u632aOE0Q6fTCqAZAUqO1vX4g3b2e9zvxpQJAp84EjWTxeWB/MB05rSNUOlzfc88/7Dw==
Received: from CH0PR03CA0369.namprd03.prod.outlook.com (2603:10b6:610:119::22)
 by IA1PR10MB6121.namprd10.prod.outlook.com (2603:10b6:208:3ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 16:22:05 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::99) by CH0PR03CA0369.outlook.office365.com
 (2603:10b6:610:119::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 16:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 16:22:05 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 11:21:53 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 11:21:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 10 Jul 2026 11:21:53 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66AGLrkH3481414;
	Fri, 10 Jul 2026 11:21:53 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id A23B52A69; Fri, 10 Jul 2026 11:21:53 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607100005
Date: Fri, 10 Jul 2026 11:21:53 -0500
Message-ID: <20260710162153.844293-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|IA1PR10MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: cde08db6-8b22-4e03-3ae8-08dede9f61e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CHbIDf/vx0ktXIngeyQJSxyH/E9JpLGKp/V5ppq08e+Po0n3jbNvFBFmULGPR9hxKEZ7zONSwulal3bqHqCJZBf/fRYHronnnFykf27hkqNY8dxHATxk2LOsAadCqx0dR2iqRxNEArJP36QBXBzBu19YGr+RRzHQ+uSo+vX0HLsxWON/UFonq3VXFfSISphrvwLYwHIEjMyfV9Ab3aDoZnHihi8bYSYR5sCRAK3dviBePPkFcM4XKLR1a6rM1n89Yb7AoIX3LrwPVWZK3hmNV8tGgkrV8/6+1Ak4w8l6WJDxMJ3mZgmPJl9nGPGkg54fJjOSL6Mxcfkkv52ZaCPBcWE01vNckTtI1MmVSnlZl7pDZMSHJ3pc6sLktQJ4p0V9Fxv1XkEobrEUJ6aDScNp9mZqVwY/K23u9sesKNhdQVenJJo4vKzIRN8gRONDtQp0hT+jlxlTAX/KEMOXqjYVMZIX4NPvft/38ClLzdpze+LkfnnX1Dl8iqQCzqzoNzItVw5JrJUeDvOKClhEFJCz1XiFoweZ+9w1ZzXWdaYFR1ZqAS7eYoh34zMUt9CAgOehqn1MyQCZq8kdxCCH3rDdEsYq/g7/WPVg8/enwVx2UtJx8PCSk7+urQTz8/pixk6IXmm0iZBEegKQdA4AB/uya4KeqGiXX2Ly6XteflEjYnmOP8uqHhKXPQR0RAMGL6ul0cXOy6rR9FLwZoDIZLpxxw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BCIbv+HgevoY/QhvAG3IM9CBVcT1NJ9VFk7fYN0keghERULxhSAUebxNTqztdqnD6/tgt/4rm9GiNA9UjUFO+1FwU7eeLaBBiZjyMbSoQ6UZcvBh0hlV3kC3npbMmQIXrymAxpAB8xJKBbOaNtF1Rt8X77Ad3vbuowEAen0BP+iuRr820xMLedxSjTRY7PJNmFSXEUoCT6lfwkxtkLp48XQCGs9pPbchv4C4lqVVfLR7VhERrImiFoj76JCKH1LKVy9dWAoHSRalhy5AwmBT3UsRcd7Sl9yxqRRrTEhGSsp+57mC61iroTBTUVnwX1zNsEN7wVM53q/U3pgg1wizkTWB+TAVaeohXztgUs4I/YxuGn+hWewqOv2yLCU1GwKCr+1qKzXRtvai9WbWBClRMR2a3+BQyqZTKpPMwC1uq/UoI/wokYlSJIFNfG4kYK/h
X-Exchange-RoutingPolicyChecked: 
	TQVWvWV6sxgSkbHBPiz2EoyO3pBitEN6S1sk3R8Gb2J66QjkUFLe8jFOI6pKKi0Y3/Yyv8WPpE1bWutBCYtEXhJd78peBA0zp8NVqROlvVZlQ9erhNyrcZZ57qwyNf9M8dccKWy9WN8RnlEcJ+aA0Yfw1DzyCwwIucEJDBOFLRex09wxNuVKluP3MsiM45Iu63qYpkZ/1N0GQ2D4nfB2V/l5ffCRzglN9pwdJ92lHwgo39a+LsY2rEc3yBwjXSc4rcoX1xfo7uCq2Jqbi82B5OwjydRwqlYi5XMIXqxq6vPA/f5dJgL8gXGVkqnD7fvB6G0e7U+JXpYTcgzGgcx/+w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:22:05.6085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde08db6-8b22-4e03-3ae8-08dede9f61e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2MyBTYWx0ZWRfX/zxcFlo0u41G
 QTiqR3XYIc7SjGgIpqtQNzuBg0SCW5rMBrRiz7FFeLVx3GaXn/DypxM8KOOVvTV1FOVxBMDAKwS
 ijLqz0aaqLCZKuaHQUP03ksOgnBfAgdDpmtsmojAcqcOTR5J/xCAMu2tpdh4mHLbg88GhkbSSyO
 s/eY5jla3AjyHXiH0pZuaGe7ZkwGfuB5Mg2ejoh+MQP+g2bl9g4hhZKiSzZY2Rmf6FeT3Atb5s8
 Q3dbjjtydS3xrbMEwnSCEuxzL4BlvzBD9kMLEyhqlKIHXLEFPPaYDNuhm47/pyumrGrhs/GQik3
 LpUqB7yVNkS2tAQM+NIfXkAt+p40dJn4rsAH63r9IF0uJD7iJhAqgN0zCWyYqHFNj/LdilnKKfI
 sB8ukV+J9H43sXkp7zc04tXKn26i7W7hFxbR2AAI4SS2DdW2dhhxytgXzm11RuKrW2QVY/ivbWg
 uloQ480SOQ80i28ioFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2MyBTYWx0ZWRfX6ttCAA4jx/QT
 pCN5MzsKVZGatOYS6tE08wUY7nKqA37+K9p0TEPnBqKFDM+TtbSVt0PYvK9e/Qlrdr4ESTz5VOX
 ZbuXqheSnwMjabo2tSRGvBgYXul/2TU=
X-Proofpoint-GUID: DE34DSHLtRWwMl18Fc1I-0xTmDagk5tE
X-Authority-Analysis: v=2.4 cv=X9Vi7mTe c=1 sm=1 tr=0 ts=6a511c32 cx=c_pps
 a=3NFNipLq04N0pvkhkOyhzw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8 a=tANave5nfcuC5ogq5WgA:9
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: DE34DSHLtRWwMl18Fc1I-0xTmDagk5tE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100163
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jul 2026 16:22:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20136

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=8f8592375a7930bcf41feff1bb26a5aae46857ae..9dffeff8264765a462d6f96b50ba12e4ad7fba70
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=901e2d14358a9fdef7c13ffd3d964cd5ee5259b2..5fb29434232110fb5a176136086d26ecb299932e
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=4615c56b34aafb8425404aaf864a925899783815..8933766be737ed2cabb9466fce497b8bc8c1ce21
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=267f219ebde0f56eff5b8d6281d4b1b823616e78..dc5516f772ff621c2d7d517e094f1a4db3a972f3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 0302a36f..c27f8ae5 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.01.00"
+TI_SYSFW_VERSION = "12.01.02"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "8f8592375a7930bcf41feff1bb26a5aae46857ae"
+TI_LINUX_FW_SRCREV ?= "9dffeff8264765a462d6f96b50ba12e4ad7fba70"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index d4d3e660..e40b6ccc 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "550f0ad2bbd033b92b7a88f52ed23cb5984db65e"
+SRCREV_tfa:am62lxx = "b54338ab6ee648bb9bef2e9dab7550a9a1d11d54"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 915b96dd..da7fc0b2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "901e2d14358a9fdef7c13ffd3d964cd5ee5259b2"
+SRCREV_uboot = "5fb29434232110fb5a176136086d26ecb299932e"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 9b12f40e..01c8485a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "4615c56b34aafb8425404aaf864a925899783815"
-PV = "6.18.32+git"
+SRCREV ?= "8933766be737ed2cabb9466fce497b8bc8c1ce21"
+PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 78d9cf2a..5dd8b52f 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "267f219ebde0f56eff5b8d6281d4b1b823616e78"
+SRCREV = "dc5516f772ff621c2d7d517e094f1a4db3a972f3"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


