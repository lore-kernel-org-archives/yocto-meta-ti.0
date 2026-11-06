Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12412.1793933128174293711
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 18:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jCc+wtAh;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=wICMww1j;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NiZlX2370172;
	Thu, 5 Nov 2026 20:45:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=1YijoM7wbzXN7
	G3fGPHbXz4VxYZUm67tmMzmyXRc7E0=; b=jCc+wtAhV/U17IKz3XCdBiguzV3ZB
	ILtfKJNd277DR8GTK+OBtErky0d/O0/wbLI4t1CNyPR+auMbeGdJEsJaJaFmayAd
	cfbIUkJME9wRAfEBChcpmIYpSGQvCiv+yeiI87ok2KULoqY0HNHS/4bbsI6ehoYY
	79NcV0YY1nmWyM1wQiKEfGVNcGDkDf3lAS01WnRWYJFplKz/gEdyOUfINDLUumDJ
	LQT7TJ4TMwMK1dgJszN9uBJES285JeVP1cRuGv/FAw/Fyv1QczEaDfd+PrldiTOh
	gnhJ77OC5mVCidHi8/g1n2K43BQMEyahZSa485gu5NYex5HbUN4lCQ65w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hs3qm8vtk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 20:45:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfOmEskTs+ZHEGiJHAQBXMGVElXmK7fGytLM0cJ8kbdtzotH20sxcg55K37o+e/jR3AK74UZP81j3c8tLHkzKRD0UlGQUKLjCQ0VfFrjMqODXojso7r8++cf3+FBXG1jinbA1QggUGDCSLe0lll3VVHD9X99hwRBft1dgLxeDaxKv2Q7/sCoNlBpzyRO22WJ00rQw128TUYeKJwgY+yPOw7OoROJ/MwWAu7yFvUwcY4ta2YAoW6HOkVj87HY4Sr1b5HMf3gu/cYn2x455XcFQVFFiF2iYUidgSdudZOajvFcb3XK+OiI7/LRdV6MHEz5YVOy0Z2D3ncxWyXjZvZVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YijoM7wbzXN7G3fGPHbXz4VxYZUm67tmMzmyXRc7E0=;
 b=eXc2WdB1Y50v8pf8Y75I1mxoqNTLS1/kuw/XGdfgj2xr1X6wvlzDttDLN8XGwb/5bwCbxA6Hq3fq/ZyZPSjxqA2HzSfVNTNFmij9M3fikaiksb8jkmwacYDOI9XZ9RfcrJHuPKxPbpfUMHa8wCLhTIJdoY54kuUeC4SbyI2xxZ78zmCz7yvTyz1R4nLlJB24pQsEPgg9DvflG43/QbyKKCUzto7swJn1MtNfKqLjp8k0SzIuIiXfMj4MiNaltfPhy9oQXkjdKU1Q847biyfN0LkJYiUTOsxPs7tYs0K3OZGOGqzcjLEeYt54G/4fUYlka4q7LP9V+qGl8kj6HxHCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YijoM7wbzXN7G3fGPHbXz4VxYZUm67tmMzmyXRc7E0=;
 b=wICMww1jkz6EF50/HQTRD6uHEN+LjCNkeivUqypBpPTWYoUH01N+oUgVBEJuc3Mxhy5DHUTjuTvVH3QxTlqgNO8B8HkLsFWgkyzn3xCX5BbjlgFXKT5aini/gRTLnjLPBc//52Q6tpnpB8D99zt3XE61Doj0Ey+swgfm6gw5nLM/Ar5FVQjzlVGQL12jgWOOqTMdxzeS0tg5+h9DyLlIgO83O4Ok+mxZ+USehUvunLmwI6zjYLAlwR0dVuCoRbbnL6LhqCAZiqhO2qCVKSwZb0B3W/0oeQZeKimx64sG8rlXhYjXaIHL0eSEiFWax4jEaEGV7Ulo3zu910VL4oG4LQ==
Received: from SJ0PR05CA0121.namprd05.prod.outlook.com (2603:10b6:a03:33d::6)
 by CH2PR10MB4216.namprd10.prod.outlook.com (2603:10b6:610:7d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 02:45:22 +0000
Received: from MW3PEPF00001658.namprd21.prod.outlook.com
 (2603:10b6:a03:33d:cafe::3f) by SJ0PR05CA0121.outlook.office365.com
 (2603:10b6:a03:33d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Fri, 6
 Nov 2026 02:45:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW3PEPF00001658.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Fri, 6 Nov 2026 02:45:20 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:44:42 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:44:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 20:44:42 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A62ifin1368483;
	Thu, 5 Nov 2026 20:44:41 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 355C52A6C; Thu,  5 Nov 2026 20:44:41 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611051452
Date: Thu, 5 Nov 2026 20:44:41 -0600
Message-ID: <20261106024441.262042-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001658:EE_|CH2PR10MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0fb16c-50e6-42ab-0ee0-08df3bafffc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|260925021911599003|260925022911599003|260925021311599003|56012099006|261022075727099003|261009223027099003|261009221227099003|261021123027099003|261102123227099003|261021121427099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: nlRGxu1RE10BYfjli5JV2rcvhZv/k2SOPDGIvcJ9LSWmLyuvRm2ubxr23Bg+QtDm2PTDPFhI9RM49O1eRPKrw14BZATckyLUgUOj0T+T0oGAQwiEpHQgB2ZtUR1xvvDikgyd5vaSEn3B4MoIvCmuU/D5N6IseHF63AYjRdFfiBRsosacaMi917B0ilLdDFUZIvaznMB9nd4Yn50m/qXKsCZUBvjYSxPMIRqA91lY3wmI9YDvbUpOjn/Y3GwYQ0uj3MXioqwfMxwQGMVgsj09IAIt75nneanT/LLdQtZAvVlzYO1mU7MJM+8qzzTTVy53apJo0l9lK/VJN33rU3b3XryQ+alqfk908yGV4uPCXvsla4FMMhsQFASCUJyltOF0+wcwTodXsYZlhvwN2SBPBwTTnTu10i0ir3kj0CAtnzlNqoozn3GkfjOzrqP6gWqLUvWHS7vtyE3VaGfBVT9pb34LTKeD+v7PH+co4JjsUtTfN4I5pmBLSRXv/VgP2LAdY9BPKIs1cuflgy8j49up5o5YlKmZN1I3UXUnjbEh9bLTO5HrZr0hjnTMFaf0enAi8Fv4LVnFJ8UvQJIyLpXiHKBf+cjofQVdc3xFu+x8e1OfuuNNF9TCssZo/Q0S2EOOYgw0i9NI+QFG9BI4SJcZXt7RSpqE478wkAtpEoquAVGRW53JWYwMs5iA5oUWErvagkONVAQpqSW+w8/Vwm6MRw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(261022075727099003)(261009223027099003)(261009221227099003)(261021123027099003)(261102123227099003)(261021121427099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AIT7WGHZcvTZ7z1w+StfpRfnzUrTwPBi7xE93smC9232u6HSSgyvlXIptWG2TLNi6ppQT9DIqHwK77ATHwhAePvQC6szaV+7vzf7AK2MM3WugPfnY4rXfd5J/XCXlcFzqrPpb6GbSTLLQi9ksJtEoFtTCsht2fsXZnV4ps0LiaM2R72/kQqtjWMeIxzZGWNTGiWWjA9vaFWYExIbJ9rblLYTw8eJ7xPrE6M4dped0WvfZ/pUr9OyVF8ZFxaYiBXMPETXMIM51wlQCtNW+pOMBw6mLyuydHiOb0CeycotcbMehnXCKr4Q3VzSrVb/Puvy+j1mH302UAPzTaN+ekE23zk/7IfbDH3Pyo/IGMxBnDrXLbGgxkXeNaIFZ8ymvBt3RbHlvVM0pkOOQROtZUv0v6qfN0+oxhT1XG9RJrmHzurPHppQIy/sDEdlYZvDpUy7
X-Exchange-RoutingPolicyChecked: r2dR5Xjg73ReDYHzfAtAYbMT0Io2r1l1/aqKHt93LOtqSobaiOIJ2lqIJYGf4jy4jKEVp4JyIzFt2OkojoQYPgwwyaaVDuD4Hi7iRrtrwqWjWKa+h3rxhYiV8jBBPg2Abwq3/mWvGXdaCG+uZ7mNWvxbgX8aLoDNgT0cjCpvmTwbIHDKg4tXJhIwOXF44VG7O9BG8HJLtWmJBAXwO+HkxIv9H77b1SuBnUqIJwpjOrVdWOHdwl9jYEdqlxgJLTfGQ0DbQmnnYUFjYNHnuEeKyik7y0c6o8ab2AzbX9h66f6DnrXDqJ/f0PGwrLto58qy2/VdphjIU8bWbHlvATW87w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 02:45:20.5043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0fb16c-50e6-42ab-0ee0-08df3bafffc5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW3PEPF00001658.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4216
X-Authority-Analysis: v=2.4 cv=IJ2XmQvG c=1 sm=1 tr=0 ts=6aed3f46 cx=c_pps
 a=JAdTqqN4+A8LnUbrk8iLvA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=CfbWCkBmEdMbRrB6tYQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfXznDoQ/yOWUtc
 NrMH8efBNahGBzVMUOoh/kNdaO0+gOPIuUqlAT5tsIXyI/kDMIcocP+JFq7hVWaFhbiSRrs9OIN
 YGvwMhO1caqrYtId/YkFokH9xrrzHAtqiS4OUi3MY1N3QI1DPw+5xhGZPWM/JFjRjKAPiaFwiu+
 y3tKXnG1iV44zSlx3/vIDQA4FBwMNe3aeocWYyQwfgBkKr4OQSRUqPIR2qkRW8yQLxQ/1Y/MRhc
 QJBJlzfdli2gwq6T4G100ExtuZ5bZ/DIR+YWWJj2cRoErjITyOAXRkMu/kel6TDH9kBZdAOuPQ6
 fz8l61HtDsa8eYVqIIJcvb90d+Olaml53PTdRUUGK2KZVWMQ8mmZ65SnXFj6ytPn+Yuip1DDdJV
 x2LIIZiJ0TuledSbtOu8qPJaYkakIHZEXibGsS/8lCzNbe8CjxpCOGtz2yP0+JFxF/xz3o0vyF5
 HhUQRfjtXQQ4coBI1qA==
X-Proofpoint-ORIG-GUID: NUCUSGVPdgf_ZbSBzCD22yFIyPAiGR2B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX4Ff2Vsr0WTIX
 rtfGkgCHyS9/BWq7moIMcIQXt7V/Fq8Lw2JQtVDMFs962iNqpz+pM/CLEgk3nYg6K2zMOBcrSUC
 ZeM5vSo9nufYtwMi9EolZkN3WK5YQuo=
X-Proofpoint-GUID: NUCUSGVPdgf_ZbSBzCD22yFIyPAiGR2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060010
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 06 Nov 2026 02:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20510
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=1028826ea156cc6c1e9d231ec9ed871d53b91f6d..b925982b33874847866c99bc3b2709101220b19f
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=e8e50d58c24a0d2d0e5839fc8bf32ce87cb3c877..d5ed5d0765992529e310d6cd2d29aa367c2fab36
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6..1f84651ac37d934edde4e92c30741edd5349486b
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=5c0e395a2f28422a330b6db6341460879fc78454..29eb9539475463231b91007066aecd333f170a7c
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=51d57671f1f51baf253b4ed9251f6190469f885d..d09e8381cfd8ab035871464a796c1ffc080b7c0c
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=b809e9f77f5cc7ff9fca18fa48d79315323cc100..31cf1d0c9a98b9089c203c72706424cf7f02b374

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb    | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 4e1e3d1d..a9f7fc6b 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,7 +9,7 @@ INC_PR = "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.16.00"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.16.02"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "1028826ea156cc6c1e9d231ec9ed871d53b91f6d"
+TI_LINUX_FW_SRCREV ?= "b925982b33874847866c99bc3b2709101220b19f"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7fbfdbd5..ecab9ee1 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "e8e50d58c24a0d2d0e5839fc8bf32ce87cb3c877"
+SRCREV_uboot = "d5ed5d0765992529e310d6cd2d29aa367c2fab36"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index cbd0f834..43d763a5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6"
-PV_ARM32 = "6.18.57+git"
+SRCREV_ARM32 = "1f84651ac37d934edde4e92c30741edd5349486b"
+PV_ARM32 = "6.18.60+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 9eb82385..ab99b306 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "5c0e395a2f28422a330b6db6341460879fc78454"
+SRCREV ?= "29eb9539475463231b91007066aecd333f170a7c"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index b62f58df..1d53a6e2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "51d57671f1f51baf253b4ed9251f6190469f885d"
-PV = "6.18.59+git"
+SRCREV ?= "d09e8381cfd8ab035871464a796c1ffc080b7c0c"
+PV = "6.18.60+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index d166ecf4..c7e4a5a9 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "b809e9f77f5cc7ff9fca18fa48d79315323cc100"
+SRCREV = "31cf1d0c9a98b9089c203c72706424cf7f02b374"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5

