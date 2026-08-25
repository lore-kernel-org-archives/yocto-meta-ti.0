Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF72BC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:24:08 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24257.1787671447170483683
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 08:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bZS+vLux;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MHlMJSP+;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67PEUuL01882643;
	Tue, 25 Aug 2026 10:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=uwOoGljzG/p78
	JFjbDL6pUeQmNQVDDCpAvpPNO7xzz4=; b=bZS+vLuxsSlG0IMhySAOV4St1oBEk
	Qc3TmyM2aGuZi/EwHGTGOySk2Xc2NO7cRWrzkMUs9MgBCwN5WQJwSejigG60btht
	sab19ENr5bg8ceYfxfvyqHL0ZFTtVoS2L6wu1hh1TdlkuZMeVN2UUVGvJYrdGmjK
	1GIQoTO0lbrFqrlFIfAQn6riv8bTUeaLmBM1CCcutViBcvuGii3onnNGqS/AvLW6
	hNThj4T86DhMxc5C4JJ1YiSPkSJK0LQ+drFssJQjJSFw5e0PEbY0Xz5nUGlJJdOe
	02q7S3GDZBwJ+tS1Y7lLtOZuuGvjts1MfZEfvcrPsUlLjuDbygSYrSaYg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g8xga4vnv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 10:24:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1EoFxdmbFP/9bT0PJa1ivvXxcWR76CUxhmQeqQg3SD9EowYsB+0gyEtg+tHdLF4cg9gVWMsfJ0ImvOmNpmd715rL9zjeVTNubJlGGJDeUeZFFkf6exMYYlSGCZjP7jf5HKyuURKctZKlEPMeiz0I35+OL5aH1bx3zoYjs/+K6yX9IxgJOY/+NADkDoEohD4kAzQxsSSqBmlpP9KG92pBn4I3edI3QnKbbfA1n4pyuw9a9cieliKXvvQBrfntQGNkAmGYWySnDFrCcgaBerapR1JltdiuR9LcTD+94B/+6QBFf/NMo6j4s6wxzuLpIqPQGpON2G/YhNLzELeoso6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwOoGljzG/p78JFjbDL6pUeQmNQVDDCpAvpPNO7xzz4=;
 b=wJGlLyHb+LhjJDBBN8gZJb4msuNKDcvv6JLa3CJjHZjl4h9dd0s0TpvkOqiao6RWDEHdYds0QWkHJyFRuVERs9/MpdSXKLa+tZQGRY8SeZs4wr35KFsP9x19/QYAjn+eD0KGQTqm2SEghPDwsjzzpOoalhphTJxpwYi0zTRIObBPs388j0a1m8gS906oMsHeVthcUYXBBQ9XsrMZkUqUMLWqfOmY2J1a1SjsQy3HqsrgCQpNFwo8av52GnrsEZtO+ugzWvsONj2xSDJkC3DEb5hzskd8HVvzw6zdSsM/vIEHUmjrxgPBqx+XLMEd9OCF4uNf/BUYMkbBEX5y4wsUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwOoGljzG/p78JFjbDL6pUeQmNQVDDCpAvpPNO7xzz4=;
 b=MHlMJSP+IjpTaQZgNqig4VNHr8i9b5bfFZCq71vsWxGRTqFXcVCZtff9MP+7DAWmDiUcvnBqIswE3G9gbJPpOO/WqFcXB6NQIs1/eUoSzmXmxsTvXPyVIQ1L/nLM6+9zpfhzZma/L/oM0ugJLo8Euq6HdeJofUZM3pOVGEYiv7Y=
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by PH8PR10MB6291.namprd10.prod.outlook.com (2603:10b6:510:1c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 25 Aug
 2026 15:24:00 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::aa) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 15:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 15:23:59 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:23:47 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:23:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 10:23:46 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PFNkFQ1269113;
	Tue, 25 Aug 2026 10:23:46 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wyt06-00000007W2k-3hzN;
	Tue, 25 Aug 2026 10:23:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] xdp-tools-ti: Remove recipe
Date: Tue, 25 Aug 2026 10:23:46 -0500
Message-ID: <20260825152346.1791356-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH8PR10MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 55dbc12f-372a-444f-4262-08df02bce340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|6133799003|10067099003|3023799007|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	s3kW7VDf1VKrMcaTc5+lTlJrZd1RDfhphgtmT6hcM+reaegtSg+EGXx05z7xLlx2AKHFqlLcf8A4laXXOJPRv0QzC+KglnsfcFrPJyqg9YrMkf33I3a4ihyXKhlgUW1ZtGlJZbwNUUO7b2iK8OOyZYyu3z5i3tOSggV//P1j1QLElDZXw0UDO9iHsJmUgOVyBB2pM1KD2fpSEW2LX7zvvzBhTVlVeia+TX/pPvPm4vWqmc4/i22RPAdhFnaADWwB0o2LPRgAaAqLa237sN6625LXsrFpLIed+VKo5EwHuoqKcBNS3xxgyfA86+Bt1TCYh97Fj9RvBsaRLKHnvfH4faae1bTvbLS771iHEvJL5YVER7KbTWKvhPsgNr/ijl7Qr+AKGgAqcVS42BFmzuMypSE8p/it6D7ZDDbb1/6WF79KW1QgWD/y0tUO7pe6ye038fUPeb1fLzfbMwEapTwIsOZyh+gnmfELDVwgAnrl332gYNylCkJrSujwUre+OGNrh6jFylxZufNYe5qGXbU+c+Vl9dUgZzjRDGc2yvv/cW839WRwt2B/BPNuCqCfcRt/R/yUOlOjOzjhbwCWIRSX1lZwknt8H2uKK3eL/2yZGURYONAVRhdWJ/6mgoXFgRgilVwV67bDXXhCdmiha5Ikqcmz3a8AWA4Z2JWYP8joVMRQjAXAXhLcBRFR2Laj31/tnxioEtcoUWmdCtCfsZyCkQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(6133799003)(10067099003)(3023799007)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L2bbuwIQtP4JgKmri81QkDSX/Rt0KtUma+ff16vmgmZeNHcjbb1YAyy5PKjnbOq61fZoKiNZ9LIKqoHVD1jciDgq4ybxPJcvz9BWZ7VYUDMwiL6KSlS/O3XX771TgOPvt+QJlw1KnhA4S3wc5ZjvyYvKURA4YeB2lr8oUKk0iKh+Xi5MfL7AADYjZP9DanDfVdG4Czen74w1zG6O46dnav4FPf/EmWc1aCzesQSq1EaXYephlu+O2xyR+ejb2B5oRu2ztRt/p+elbly7omsL4Cf9QKRzAPu1pa7w+0goW3TOgn6hrAcAEHymJhMTI5BCEiJN5xZmIZmerVi/7QMCdvIAL/30ku7b1UzMvY3zelpGw1a82wF4VwLVO9le4lKwcPYAOObCfhHupxdVlCyyQ+3Y9hwbrDvn9j2x2F3/JQ6jDyEJPNmuisuI+QqrsHnu
X-Exchange-RoutingPolicyChecked: 
	kyWzE+JhnjvSvlJzcK5mlboiYbGoEkbOI/5cxJ+f/W3QJJxvQ+ZQOlT6o+6RbWrz1a4UJdjnjlvdegSc2IRJ/YQ+RRsaPrzEayKexGI5u6SiDeTGsOyEcvqHPnJdti/KDBa+XA4+iM3SFRgL0mbm4Pr0nxKBLeHcMI+oa7frg8YYsNe3Rl1V3Vcv2syFlIOxm3zsMclbBnRobcw2YadXCdQaughqtMwKYjkPK88azqPDFEVU/yTnomJNbmo/lHe9yiXJ2Mifr7K3YIyry9xylrmCopQyNLwOlt4/34BMWMTzPrY5qyNxsXpKVrHXrAYkxGrJiBTUP5BoL8xsjhN+Bg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:23:59.8937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55dbc12f-372a-444f-4262-08df02bce340
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6291
X-Authority-Analysis: v=2.4 cv=SuygLvO0 c=1 sm=1 tr=0 ts=6a8db395 cx=c_pps
 a=qId4hgiKfVM5Ptks7FQs9w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=QyXUC8HyAAAA:8 a=4lqpZxMxlgCWQZTs_XcA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMCBTYWx0ZWRfX52icB/M2pT9/
 3E/el47Y6i3x5Yf32/8HHoKvb7+lgbqrwMQ2CRLAsUSD2HFkw0PEMtD/yqZEX9uGwWIGWYk+gM1
 SZ5IiJOFxhGCPqLTtHOLRJiO/zl/j0g=
X-Proofpoint-ORIG-GUID: HSpLHC28H_mYQqz8pfY6jbTXXuUWqlbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMCBTYWx0ZWRfX7TirdEhFC6ho
 TE7ztBAnkf4hHBOz7woWiK4aedGWCcI09VZJ8FfCVJvP1/0Rhd1cavTsQlVkPefTKg7Fms5Dplq
 am+KemgjyECSA1EP/44c06O+Z3oKjJg0xzEok7Sk84eXchL7T08ZQWm2IEc70BduCl8HCfRiqb6
 //+CeqSHyDZj3we/+qxi7T+IyLJUikdrwtsHZBoJ+TYw72jwvEwCWhm3XxGFvsrGV+wZEtXVU0s
 0MTez4o6LpWJNHVwiCNJ7U3HW5Cz0kNQgrDtJ3ctMmC++k0wmGFZPssPcQzXbDolNdrBeg8SRKo
 Y7UCAKQwoJqp5HsxpH+/PpqLEmwMc/QIdqTGtbYf67OeRWhSnJvD0axMXd3rcBXNCZFqAehHdzn
 KAKNRqHT+AGZBMpdzZec4ie9nrDO07e8uFZhSsLRgNqbwkCw5ywVhjDyJLvB9egjxVEufFFGKMy
 l2xGBPipR+KHAC+g5Sg==
X-Proofpoint-GUID: HSpLHC28H_mYQqz8pfY6jbTXXuUWqlbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250130
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 15:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20288

meta-openembedded added an xdp-tools recipe [1][2], so ours is no longer
needed.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=cdd53d4d0d802cbce05b716df3c72aad9334d808
[2] https://git.openembedded.org/meta-openembedded/commit/?id=b1f98d1a7aeae2fb86dd540bf5f5f26203f22a66

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     |  2 +-
 ...0001-configure-skip-toolchain-checks.patch | 44 ----------------
 ...issing-prefix-map-settings-for-OE-bu.patch | 40 ---------------
 ...0001-xdpsock-Fix-32bit-compile-error.patch | 42 ---------------
 ...-not-detect-libbpf-header-from-sysro.patch | 44 ----------------
 .../0003-Makefile-fix-KeyError-failure.patch  | 31 -----------
 .../0004-Makefile-fix-libxdp.pc-error.patch   | 34 -------------
 .../xdp-tools/xdp-tools-ti_1.6.1.bb           | 51 -------------------
 8 files changed, 1 insertion(+), 287 deletions(-)
 delete mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-configure-skip-toolchain-checks.patch
 delete mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
 delete mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-xdpsock-Fix-32bit-compile-error.patch
 delete mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
 delete mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0003-Makefile-fix-KeyError-failure.patch
 delete mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0004-Makefile-fix-libxdp.pc-error.patch
 delete mode 100644 meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb

diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
index 8a348c26..ecfc46e7 100644
--- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
@@ -116,7 +116,7 @@ TI_TEST_NETWORKING = "\
     netperf \
     strongswan \
     tcpdump \
-    xdp-tools-ti \
+    xdp-tools \
 "
 
 TI_TEST_STORAGE = "\
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-configure-skip-toolchain-checks.patch b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-configure-skip-toolchain-checks.patch
deleted file mode 100644
index b5f2780e..00000000
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-configure-skip-toolchain-checks.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9c9dce2e5f04de65b7b00321f96fff6071546ea1 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 15:44:16 +0800
-Subject: [PATCH] configure: skip toolchain checks
-
-Current logic fetch full command line along with the tool. i.e
-gcc -m64 -march=skylake -mtune=generic ...
-
-Which throws ERROR: Cannot find tool -m64
-
-So need to re-write for loop, so it can work in cross-compilation
-environment too.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-
----
- configure | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index b4e824f..10618fc 100755
---- a/configure
-+++ b/configure
-@@ -70,12 +70,12 @@ check_toolchain()
-
-     CLANG=$(find_tool clang "$CLANG")
- 
--    for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
--        if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
--            echo "*** ERROR: Cannot find tool ${TOOL}" ;
--            exit 1;
--        fi;
--    done
-+    #for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
-+    #    if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
-+    #        echo "*** ERROR: Cannot find tool ${TOOL}" ;
-+    #        exit 1;
-+    #    fi;
-+    #done
- 
-     ARCH_NAME=$($CC -print-multiarch 2>/dev/null)
- 
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
deleted file mode 100644
index faaf6bc2..00000000
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a7698c7172a8a178efd73bdc0ce31d4aa3646f6e Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 5 May 2025 14:30:10 -0500
-Subject: [PATCH] defines.mk: Add missing prefix-map settings for OE builds
-
-The defines was only pulling in one of the four *-prefix-map options
-from CFLAGS.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- lib/defines.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/defines.mk b/lib/defines.mk
-index 411a97e..6061e81 100644
---- a/lib/defines.mk
-+++ b/lib/defines.mk
-@@ -26,7 +26,7 @@ TEST_DIR = $(LIB_DIR)/testing
- LIBXDP_DIR := $(LIB_DIR)/libxdp
- LIBBPF_DIR := $(LIB_DIR)/libbpf
- 
--DEFINES := -DBPF_DIR_MNT=\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=\"$(BPF_OBJECT_DIR)\" \
-+DEFINES := -DBPF_DIR_MNT=\"$(BPF_DIR_MNT)\" -DBPF_OBJECT_PATH=\"$(OE_BPF_OBJECT_DIR)\" \
- 	-DMAX_DISPATCHER_ACTIONS=$(MAX_DISPATCHER_ACTIONS) -DTOOLS_VERSION=\"$(TOOLS_VERSION)\" \
- 	-DLIBBPF_VERSION=\"$(LIBBPF_VERSION)\" -DRUNDIR=\"$(RUNDIR)\"
- 
-@@ -43,7 +43,7 @@ endif
- DEFINES += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
- 
- CFLAGS += -std=gnu11 -Wextra -Werror $(DEFINES) $(ARCH_INCLUDES)
--BPF_CFLAGS += $(DEFINES) $(filter -ffile-prefix-map=%,$(CFLAGS)) $(filter -I%,$(CFLAGS)) $(ARCH_INCLUDES)
-+BPF_CFLAGS += $(DEFINES) $(filter -fcoverage-prefix-map=%,$(CFLAGS)) $(filter -fdebug-prefix-map=%,$(CFLAGS)) $(filter -ffile-prefix-map=%,$(CFLAGS)) $(filter -fmacro-prefix-map=%,$(CFLAGS)) $(filter -I%,$(CFLAGS)) $(ARCH_INCLUDES)
- 
- CONFIGMK := $(LIB_DIR)/../config.mk
- LIBMK := Makefile $(CONFIGMK) $(LIB_DIR)/defines.mk $(LIB_DIR)/common.mk $(LIB_DIR)/../version.mk
--- 
-2.17.1
-
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-xdpsock-Fix-32bit-compile-error.patch b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-xdpsock-Fix-32bit-compile-error.patch
deleted file mode 100644
index da439bf1..00000000
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0001-xdpsock-Fix-32bit-compile-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9b649be4876a3e42c44e57013840904006530e52 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Tue, 17 Feb 2026 15:11:18 -0600
-Subject: [PATCH] xdpsock: Fix 32bit compile error
-
-Using UINT64_MAX on a 32bit machine results in a compile error where
-unsigned long cannot be cast to an unsigned long long.  Since this is
-trying to handle an error case and return a big number, switch to
-ULONG_MAX to match the type being returned regardless of the compiler
-bits (32/64).
-
-Upstream-Status: Submitted [https://github.com/xdp-project/xdp-tools/pull/553]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- lib/util/xdpsock.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/util/xdpsock.c b/lib/util/xdpsock.c
-index 5d71e6a..899c3a3 100644
---- a/lib/util/xdpsock.c
-+++ b/lib/util/xdpsock.c
-@@ -35,6 +35,7 @@
- #include <time.h>
- #include <unistd.h>
- #include <sched.h>
-+#include <limits.h>
- 
- #include <xdp/xsk.h>
- #include <xdp/libxdp.h>
-@@ -171,7 +172,7 @@ static unsigned long get_nsecs(clockid_t clock)
- 	res = clock_gettime(clock, &ts);
- 	if (res < 0) {
- 		pr_warn("Error with gettimeofday! (%i)\n", res);
--		return UINT64_MAX;
-+		return ULONG_MAX;
- 	}
- 	return ts.tv_sec * 1000000000UL + ts.tv_nsec;
- }
--- 
-2.43.0
-
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
deleted file mode 100644
index df1543c7..00000000
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 2840cf0b89497f545fae2eed7ece3f3c5fc558e3 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 15:50:34 +0800
-Subject: [PATCH 2/4] Makefile: It does not detect libbpf header from sysroot
-
-So adding sysroot headers path.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/common.mk       | 2 +-
- lib/libxdp/Makefile | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/common.mk b/lib/common.mk
-index 56c0406..ab0bad8 100644
---- a/lib/common.mk
-+++ b/lib/common.mk
-@@ -55,7 +55,7 @@ LIBXDP_SOURCES := $(wildcard $(LIBXDP_DIR)/*.[ch] $(LIBXDP_DIR)/*.in)
- KERN_USER_H ?= $(wildcard common_kern_user.h)
- 
- CFLAGS += -I$(HEADER_DIR) -I$(LIB_DIR)/util $(ARCH_INCLUDES)
--BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES)
-+BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
- 
- BPF_HEADERS := $(wildcard $(HEADER_DIR)/bpf/*.h) $(wildcard $(HEADER_DIR)/xdp/*.h)
- 
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 358b751..8f459d8 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -28,7 +28,7 @@ PC_FILE := $(OBJDIR)/libxdp.pc
- TEMPLATED_SOURCES := xdp-dispatcher.c
- 
- CFLAGS += -I$(HEADER_DIR)
--BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES)
-+BPF_CFLAGS += -I$(HEADER_DIR) $(ARCH_INCLUDES) -I${STAGING_INCDIR}/
- 
- 
- ifndef BUILD_STATIC_ONLY
--- 
-2.25.1
-
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0003-Makefile-fix-KeyError-failure.patch b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0003-Makefile-fix-KeyError-failure.patch
deleted file mode 100644
index d0133bcb..00000000
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0003-Makefile-fix-KeyError-failure.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 157546fbc4f18751c52b3c8788879c05cf253331 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 16:02:46 +0800
-Subject: [PATCH 3/4] Makefile: fix KeyError failure
-
-Error:
-Exception: KeyError: 'getpwuid(): uid not found: 11857215'
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/libxdp/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 8f459d8..9a340a3 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -54,7 +54,7 @@ install: all
- 	$(Q)install -d -m 0755 $(DESTDIR)$(BPF_OBJECT_DIR)
- 	$(Q)install -m 0644 $(LIB_HEADERS) $(DESTDIR)$(HDRDIR)/
- 	$(Q)install -m 0644 $(PC_FILE) $(DESTDIR)$(LIBDIR)/pkgconfig/
--	$(Q)cp -fpR $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
-+	$(Q)cp -fpR --no-preserve=ownership $(SHARED_LIBS) $(STATIC_LIBS) $(DESTDIR)$(LIBDIR)
- 	$(Q)install -m 0644 $(XDP_OBJS) $(DESTDIR)$(BPF_OBJECT_DIR)
- 	$(if $(MAN_FILES),$(Q)install -m 0755 -d $(DESTDIR)$(MANDIR)/man3)
- 	$(if $(MAN_FILES),$(Q)install -m 0644 $(MAN_FILES) $(DESTDIR)$(MANDIR)/man3)
--- 
-2.25.1
-
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0004-Makefile-fix-libxdp.pc-error.patch b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0004-Makefile-fix-libxdp.pc-error.patch
deleted file mode 100644
index b1e15e52..00000000
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti/0004-Makefile-fix-libxdp.pc-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 46b3ff797135574aa0ee42f633a281d44f48da95 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Mon, 17 Oct 2022 16:05:15 +0800
-Subject: [PATCH 4/4] Makefile: fix libxdp.pc error
-
-Error:
-do_populate_sysroot: QA Issue: libxdp.pc failed sanity test (tmpdir) in
-path ... xdp-tools/1.2.8-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- lib/libxdp/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
-index 9a340a3..bc39177 100644
---- a/lib/libxdp/Makefile
-+++ b/lib/libxdp/Makefile
-@@ -76,8 +76,8 @@ $(OBJDIR)/libxdp.so.$(LIBXDP_VERSION): $(SHARED_OBJS)
- 		      $^ $(LDFLAGS) $(LDLIBS) -o $@
- 
- $(OBJDIR)/libxdp.pc:
--	$(Q)sed -e "s|@PREFIX@|$(PREFIX)|" \
--			-e "s|@LIBDIR@|$(LIBDIR)|" \
-+	$(Q)sed -e "s|@PREFIX@|$(prefix)|" \
-+			-e "s|@LIBDIR@|$(libdir)|" \
- 			-e "s|@VERSION@|$(TOOLS_VERSION)|" \
- 			< libxdp.pc.template > $@
- 
--- 
-2.25.1
-
diff --git a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb b/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
deleted file mode 100644
index a3ffc52f..00000000
--- a/meta-ti-test/recipes-support/xdp-tools/xdp-tools-ti_1.6.1.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "Utilities and example programs for use with XDP"
-HOMEPAGE = "https://github.com/xdp-project/xdp-tools"
-LICENSE = "BSD-2-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9ee53f8d06bbdb4c11b1557ecc4f8cd5 \
-                    file://LICENSES/GPL-2.0;md5=994331978b428511800bfbd17eea3001 \
-                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
-                    file://LICENSES/BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
-
-DEPENDS += " libbpf zlib elfutils libpcap"
-DEPENDS += " clang-cross-${TARGET_ARCH} bpftool-native"
-
-SRC_URI = "git://github.com/xdp-project/xdp-tools.git;protocol=https;branch=main \
-            file://0001-configure-skip-toolchain-checks.patch \
-            file://0002-Makefile-It-does-not-detect-libbpf-header-from-sysro.patch \
-            file://0003-Makefile-fix-KeyError-failure.patch \
-            file://0004-Makefile-fix-libxdp.pc-error.patch \
-            file://0001-defines.mk-Add-missing-prefix-map-settings-for-OE-bu.patch \
-            file://0001-xdpsock-Fix-32bit-compile-error.patch \
-          "
-
-SRCREV = "84906a0fe98cbb5e5eaa2c888c50a1ab32d5d0b7"
-
-inherit pkgconfig
-
-EXTRA_OEMAKE += " PREFIX=${D}${prefix} LIBDIR=${D}${libdir} BUILD_STATIC_ONLY=1 PRODUCTION=1 V=1"
-EXTRA_OEMAKE += " OE_BPF_OBJECT_DIR=${libdir}/bpf"
-EXTRA_OEMAKE += " CLANG="${TARGET_PREFIX}clang --sysroot=${RECIPE_SYSROOT}""
-
-CFLAGS += "-fPIC"
-
-export STAGING_INCDIR
-
-do_compile:prepend:aarch64 () {
-    mkdir -p ${S}/headers/asm
-    cp ${RECIPE_SYSROOT}/usr/include/asm/bitsperlong-64.h ${S}/headers/asm/bitsperlong-32.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/byteorder-64.h ${S}/headers/asm/byteorder-32.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/posix_types-64.h ${S}/headers/asm/posix_types-32.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/swab-64.h ${S}/headers/asm/swab-32.h
-    cp ${RECIPE_SYSROOT}/usr/include/asm/types-64.h ${S}/headers/asm/types-32.h
-}
-
-do_install() {
-    oe_runmake install
-}
-
-FILES:${PN} += "${datadir}/xdp-tools/* \
-                ${nonarch_base_libdir}/bpf/* \
-               "
-
-RDEPENDS:${PN} += "bash"
-
-- 
2.43.0


