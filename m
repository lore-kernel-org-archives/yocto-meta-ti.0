Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4021FC4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:49:57 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9813.1784036990618522480
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 06:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VCsaD/sx;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=KOl6hxms;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBhC2C2126481;
	Tue, 14 Jul 2026 08:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=fxYNyr7B/7E6G
	snOrg2xqiMCzvG+FgiyraR5db14Uww=; b=VCsaD/sxcgW+vjRqW90M3YFpdL96w
	xPAvgbJPkcn6c+FeqkwPZ57W3tDomXaarPYq0zOPPGAWBJML21fsw26D9W6k88B1
	od0TAw1RwnaIjVCn9k8OfyebCVr3aLZMzsuvwU0H2mJlK958puOrVbZPUhDajxwr
	1uHv920EC7M4V71jFS7Dhv1bnUVM+9zwmqmH6WTVVI3g1B62z6Ohqchew7MIqsv4
	1e7WT8IovFU/lLG9+cZ9a8tl4CnOMD3GbGxukOBqTw2kDvDssYwEEIZT8+46fTNz
	BCUKdYirOXCDbGBicvpnB1/tUMLm1DnvztIqaC8CHVOdoQeMD3ctjmpHg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdmg30rj0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 08:49:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nN9re0iH5MeN4BihkaSxXS/qX5BT9iBJNBLorAs/OznrzZGVXZiaabLY3nC8sRIrxsR/+wqya6dp3ShoPOkVWpWt2S6+muqnSW+fBWeRrEcs79LgWEqhx/NeeeU8HhrNknrIbuoVCHH3/D0Mj1yH/gU4u4thRWdXXbP+wV2ab+Qmny0XycySwv596TxWVIG6FfJcuvB4bLCqWCdPrncJ2tLZX4lVWQ2VZmpSSsRueRma0iAqHxv+8BorXeje5+6a1QjIo7tM3AWRsx5lYWlCqcvSKE+g2qoxkOtn9IIU00yfqZGcfTLHOExi4+MjWvBOLNc2ALi+V5LFh69NmCHThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxYNyr7B/7E6GsnOrg2xqiMCzvG+FgiyraR5db14Uww=;
 b=ynMl1TkdCnNIkXSjFiP1m4uM1sJWpHDZkmcai/xetotKspJBv4rsmtKfi1HH42h83MOEhuEbtnpOdJ8Q9AO8ti62aqzSeWRFoa2bz6Fc5jzwdgDYOwozJ6O7bZ7PBWB8LVk5ZD07nuoLQ3CuSMe6AyFPEvtO9U86IBeP8rC2rWpz+/gFlwNR9yOG1tsIwfvfJsgQ6qijR6wjF4mSbrupCRBOvPFEwri/+Nu+iRvPxSLVhiRC30GJxt687dolYJBDFiQloadGh9U0oSUt3q74TsnPEajA2omZJ6sdTSGcqyw79WS7PHPoPLhIJT6nJ1vmnTuoAytAXShtrR9b3qZHVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxYNyr7B/7E6GsnOrg2xqiMCzvG+FgiyraR5db14Uww=;
 b=KOl6hxmsMGlQfkwtBlGxqpXUFEn/kYDwZZ38fzHlb9RO27W4hyXZkyhwZDgDUCF9mzKswcN4VZ9aaztVlF8s+wiiE2n6zvada3TB25Oc56KP7eIXjgNMfXmdNuO/LS1qKakT+TOg8Quv9cUNTuTARsgbJZJhrXFy5cuYOAoq58Q=
Received: from BY3PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:39b::31)
 by DS4PPF969223381.namprd10.prod.outlook.com (2603:10b6:f:fc00::d35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Tue, 14 Jul
 2026 13:49:41 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::32) by BY3PR05CA0056.outlook.office365.com
 (2603:10b6:a03:39b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 13:49:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 13:49:40 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 08:49:38 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 08:49:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 08:49:38 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66EDncLv638597;
	Tue, 14 Jul 2026 08:49:38 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wjdVx-0000000CTxL-44lp;
	Tue, 14 Jul 2026 08:49:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] piglit: Remove upstreamed patch
Date: Tue, 14 Jul 2026 08:49:37 -0500
Message-ID: <20260714134937.2975042-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DS4PPF969223381:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5e0e13-ffdb-4a4e-ed0c-08dee1aec0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|13003099007|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Hbo2R4HmuNGg0+c5VIKfNRlg6itxUwAepU4SPjrq36USoe7lua+0oj0SHRIotekH4ZQd2hIrsXetqyZMV7+UxbOnquyoBJq1sn0hFVMbX/2L5j7dtUdz97FIWu8xPJBwM5b2xyw0l9ZDV0BBAQ10AJEMORS2nrBWk8fjI3dQfsrOieG3piKcMkIrWh6n0YrpaTQnDWtSZv+99c7Xug3lSD9IrnT/bMA/O5gjDwDpBPmnoMLbpUwrxTt36m4D5R/y4NDr7EYQ+Ei4Gnl0VJfGfP940Q8QxSz1rfAVVf95JNLITPlVUUZPtAib5RvZ/CDIjAfe6L3Lf/S9qRGbmKHSQqJx3pSvyYe/J34/CzF/b85PlXx+DttsYl+BqhoUbGIKbp7ZNk9SND5w4oiuG8sN59Xug37PT7frvcVTAg3FNlc/9Pljqzwc+gFQ03wz62V/aVsDyUKSTr1PHtZ4WlN9EmTpEOzEmDn5Da63vzH5cRr7ndEQcSXsPcQF+1mph6mdONs1IqjeC+5tLZl9+7LWaYSzs3hGmUpZkPW/dMC5eDtHcORrtn2PHsm5tRlgXxLKEY0am7iMxXmnAlKDKajycHIjpshF+XAT7XZPFUe21cX1tpj+XLs10qUXi16yvDM40eGkCR012ukBPGOJS2tRmg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4gvo3Cxo5CP6wI+cpUkmG4whqNYaZUEf63CPSAAlcFycq/xMG9JFdJuTZjL2XIwH5qnFWrEb1xI77LEUIkOySi24mKf+Hf7bkRhtrRwg3wp3IxJ3KhDzza9n1E1k7EZsC5NI3RUManW6sSJR+XH7eDw9AL3yQuzUB438e48H2lNSgdKf/+vF81XVX21h0Hgv1RZNRo/pDvQp1bEW4hRwaV+hxItJjv1QvW7Px1A7ncyPhTcnXpwtLwSUrYkUa1+rNwfooi+t89qz0W3fz7uhW5TC2eva47bRpa36xA/sF+kFTGBddFd3rVjxRdsUn/Vm9PRcqrRw7BIydAaqt0clclaaSgJDsEh5kZlS5XQlS4ykHA/6xt+3uKoNloapuZv4S8mOyWYbPAHnQvdiq5cGLxUFWAfvS2s9PrElIftCN95HxlWYeJ73LP6gMf606/R0
X-Exchange-RoutingPolicyChecked: 
	fklsn4F4Kfv0P/yjZuD7l+XEoJbTwcdNBbynPJX6yWqFdAP3owuzMtxfGfoUzWdMwaRiOoBBZPz7FY334X03fLwrbSBiCqdBBav970mOaHExy/IOoXwSfN0mPNkfW1iWovCao2h9AkXPodQs2NObSnofngjPMsw9DvxQ93LwuE5I/4AnF1ltJFNCKu1oNAC3OvtzvQt/6R90lY6r2nr8G5SY1Me1pMOgOh5mfSkBiJWUjgG4wEB7WLb0qhnaY+PEDmoTYRp3xWmPKHs8vGjpoD5zZtlqK8DNL5TCUAkTaSASg6q+Ffowukln0iCUo+lYZNQ/DTjs5ghlhpKKoBrgEw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:49:40.4983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5e0e13-ffdb-4a4e-ed0c-08dee1aec0ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF969223381
X-Proofpoint-GUID: q-P1bkGMwKKHGcMptKQdxc4xoxqAOCg3
X-Proofpoint-ORIG-GUID: q-P1bkGMwKKHGcMptKQdxc4xoxqAOCg3
X-Authority-Analysis: v=2.4 cv=EMg2FVZC c=1 sm=1 tr=0 ts=6a563e7c cx=c_pps
 a=F3cLoQkZAZJ9C40TIYDoAg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8
 a=jzqHjof8zYFQDL2OH1wA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0MyBTYWx0ZWRfX3xfpwsbdsncp
 rkhR//ULdIoO36UGxfyr4Z2nXWvb2wA2k6vjYmkuahfOd/5iaaKWu2keYntEsIhmHHNevDaVPn3
 CaG8wsBRABqqhC3Jauup+FSMC1HpSyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0MyBTYWx0ZWRfX/rg5efyun1Al
 lv70lE2J2Zj74b/T7JY+iUEom7Xip0Kc6kTIF3hgg36toa6IwKEVWWAXcQP586bQUHvG/sel1om
 nMpz6o/aRIp5HwV/l7tKLORia7uaTlvYNAjIkpxmO4FY2M7uGCTtm4GAiIAVhH+PRgdSwG+cTUZ
 5zuRZX9ys0qVKZL5WeCv0CoGg39DMAOEhZp9FeQPNalORxyT6RTKkpQSmpwMHyH6U3ssQnpwpF0
 MyqzZZXfOrVWjdTr08XvD0mqJsjuJAOQgE75IVvXpwKTZz+f2aJiVzg3ryO5cSz2Qc08KHuOWoT
 PcLqpbjFPWgjm2DEerYFsF1V8ORhi3IcO9TkR9E4no4muHCNQ5n2YMZXJq1Dyb6fSeXHOmGE98A
 EIIoEPvOSPa5BZRqvTmHVVKBM4rKRyWx2Gfi3WJgNyy/t/abyyTeG5mml2dbhnzLl81aPX0fuF7
 7LRmA5jSNMtLk38n3lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140143
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jul 2026 13:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20138

The version bump to piglit in oe-core [1] has moved to a commit that
contains this upstreamed patch.

[1] https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=df0207af6eb0dcb0bf797706feef8cd5fba66510

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/piglit/piglit-ti.inc     |   2 -
 ...-add-and-use-TestPlaceholder-objects.patch | 128 ------------------
 2 files changed, 130 deletions(-)
 delete mode 100644 meta-ti-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch

diff --git a/meta-ti-test/recipes-graphics/piglit/piglit-ti.inc b/meta-ti-test/recipes-graphics/piglit/piglit-ti.inc
index 707ef6a4..73df681e 100644
--- a/meta-ti-test/recipes-graphics/piglit/piglit-ti.inc
+++ b/meta-ti-test/recipes-graphics/piglit/piglit-ti.inc
@@ -3,8 +3,6 @@
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/piglit:"
 
-SRC_URI += "file://0001-framework-add-and-use-TestPlaceholder-objects.patch"
-
 PACKAGECONFIG[deqp-gles] = ",,,opengl-es-cts"
 PACKAGECONFIG[deqp-vk] = ",,,vulkan-cts"
 
diff --git a/meta-ti-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch b/meta-ti-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch
deleted file mode 100644
index 26e0b21e..00000000
--- a/meta-ti-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 2803263ccf460ced705fd4da589e2f09e3ec89d7 Mon Sep 17 00:00:00 2001
-From: Randolph Sapp <rs@ti.com>
-Date: Wed, 13 Aug 2025 17:52:42 -0500
-Subject: [PATCH] framework: add and use TestPlaceholder objects
-
-The actual Test classes are not that big, but with deqp-vk creating
-around 2800 instances currently, we quickly consume around 3GB of ram
-before beginning any tests. Given that a lot of these objects may not
-even be used, we can reduce memory overhead by using a placeholder
-namedtuple that is expanded to a full Test instance when requested from
-the TestDict class. This cuts the initial memory usage back to 1.6 GB.
-
-This does add a small lookup penalty, but given the lookup penalty is
-still smaller that the time it takes to create an instance of a Test, it
-results in a net improvement for most subsets of deqp tests. Not to
-mention this penalty can be split between threads, unlike previously
-when it was occurring in the single-threadded profile creation step.
-
-The following data was collected using a subset of 3151 deqp-vk tests:
-
-Threads   Test Execution Time (s)   TestPlaceholder Execution Time (s)
--------   -----------------------   ----------------------------------
-1         2613.93                   2599.95
-8          413.31                    400.01
-32         299.75                    286.73
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1032]
-Signed-off-by: Randolph Sapp <rs@ti.com>
----
- framework/profile.py   | 23 ++++++++++++++++++-----
- framework/test/base.py |  3 +++
- framework/test/deqp.py |  4 ++--
- 3 files changed, 23 insertions(+), 7 deletions(-)
-
-diff --git a/framework/profile.py b/framework/profile.py
-index 678e9d87c..969e0032e 100644
---- a/framework/profile.py
-+++ b/framework/profile.py
-@@ -45,7 +45,7 @@ from framework import grouptools, exceptions, status
- from framework.dmesg import get_dmesg
- from framework.log import LogManager
- from framework.monitoring import Monitoring
--from framework.test.base import Test, DummyTest
-+from framework.test.base import Test, DummyTest, TestPlaceholder
- from framework.test.piglit_test import (
-     PiglitCLTest, PiglitGLTest, ASMParserTest, BuiltInConstantsTest,
-     CLProgramTester, VkRunnerTest, ROOT_DIR,
-@@ -135,9 +135,9 @@ class TestDict(collections.abc.MutableMapping):
-                 "TestDict keys must be strings, but was {}".format(type(key)))
-
-         # Values should either be more Tests
--        if not isinstance(value, Test):
-+        if not (isinstance(value, Test) or isinstance(value, TestPlaceholder)):
-             raise exceptions.PiglitFatalError(
--                "TestDict values must be a Test, but was a {}".format(
-+                "TestDict values must be a Test or TestPlaceholder, but was a {}".format(
-                     type(value)))
-
-         # This must be lowered before the following test, or the test can pass
-@@ -164,8 +164,21 @@ class TestDict(collections.abc.MutableMapping):
-         self.__container[key] = value
-
-     def __getitem__(self, key):
--        """Lower the value before returning."""
--        return self.__container[key.lower()]
-+        """Lower the value before returning. Remove placeholders as needed."""
-+        item = self.__container[key.lower()]
-+        if isinstance(item, TestPlaceholder):
-+            try:
-+                real_item = item.test_class(item.test_name)
-+            except TypeError:
-+                raise exceptions.PiglitFatalError(
-+                    "Unable to expand the TestPlaceholder for the class: {}\n"
-+                    "This was associated with the following key: {}".format(
-+                        type(item), key
-+                    )
-+                )
-+            self.__container[key.lower()] = real_item
-+            return real_item
-+        return item
-
-     def __delitem__(self, key):
-         """Lower the value before returning."""
-diff --git a/framework/test/base.py b/framework/test/base.py
-index 430064b9b..0efa38336 100644
---- a/framework/test/base.py
-+++ b/framework/test/base.py
-@@ -24,6 +24,7 @@
- """ Module provides a base class for Tests """
-
- import abc
-+import collections
- import copy
- import errno
- import itertools
-@@ -97,6 +98,8 @@ def is_crash_returncode(returncode):
-         return returncode < 0
-
-
-+TestPlaceholder = collections.namedtuple('TestPlaceholder', ['test_class', 'test_name'])
-+
- class Test(metaclass=abc.ABCMeta):
-     """ Abstract base class for Test classes
-
-diff --git a/framework/test/deqp.py b/framework/test/deqp.py
-index 849ffbd96..ccfeaeff2 100644
---- a/framework/test/deqp.py
-+++ b/framework/test/deqp.py
-@@ -26,7 +26,7 @@ import subprocess
- from framework import core, grouptools, exceptions
- from framework import options
- from framework.profile import TestProfile
--from framework.test.base import Test, is_crash_returncode, TestRunError
-+from framework.test.base import Test, is_crash_returncode, TestRunError, TestPlaceholder
-
- __all__ = [
-     'DEQPBaseTest',
-@@ -56,7 +56,7 @@ def make_profile(test_list, test_class):
-     for testname in test_list:
-         # deqp uses '.' as the testgroup separator.
-         piglit_name = testname.replace('.', grouptools.SEPARATOR)
--        profile.test_list[piglit_name] = test_class(testname)
-+        profile.test_list[piglit_name] = TestPlaceholder(test_class, testname)
-
-     return profile
-
---
-2.50.1
-- 
2.43.0


