Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458D8CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 16:52:32 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2064.1791391950642287968
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Oct 2026 09:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=eoxyquJv;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=NgJBVoxS;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: b-brnich@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 697F1d1K1304354
	for <meta-ti@lists.yoctoproject.org>; Wed, 7 Oct 2026 11:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=adHCkzFEbBIC9
	89h32/UCVTZaxSdIF8AnIQrZChSJsc=; b=eoxyquJvphEzMe2/4ILPPhvImklLb
	Jbdxo4/YAZIa2FwsuRvAR1rTWiuEeqVtuYuMCozdxBKgJFmQPAeE6nMLbj+Q40e8
	7yvouc3zAWTHx+CsgLRvIecS4OP6qd9j9DoyfMTLwSm7wXUN/ANvVIi1lM6E4Skj
	dlkGq2SGtiaNK/A5eDQSIQpnw6Vv7PmM/MDANhUiOyxZFvuZmMVrNSy1SIxTxlQK
	Gv1vyz0B94+P+3zsdcah2QXkeUvm9hC5ttKiCO3GO+lqXbjeRbba60dPUaavUXX/
	PWAHbLXwp/PCGul6xp6kKpxsAjo4ei10HqKK2ZSvep/vHiGkO8y8LwlmA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h5dk4v1vw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 07 Oct 2026 11:52:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsNAkgh4iIRga4g6NFPC78OE8HDYetwu5+ZPULhlGSYr4AdVwR3jNvVHKj20xBPzuU8CoTWRkekedJwQgkjHfoGj0j26WlVCZvDSsT1eM1ay03l4pzn8H+fTqCL/l0Ah/vqaLOV0zgFkt7mujCnjq92Y7kk2rv79EqqBNxbHb8CEz4a/ZU+2bM7smpzc//uZGUX+Cb5wQB8c0Bp1KSOEDlKJAR+jgAW7xwknzR8Cg9wcD26GrIcQqkWefC2/45pV20GMd4l34jNCUjQ70aSU7G5TbVv0MCj+9OMRlDtN4R4TM4M20nFfo8dSZUw73Se4yeygcxtXkd+uhr72fSDVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adHCkzFEbBIC989h32/UCVTZaxSdIF8AnIQrZChSJsc=;
 b=CNl97OdsHc/GARgwPsRO7/qNzFad6TKenG8/qt1zmDOKsHWU8Hjtpv0X13aI8eiEaAhBUcDFTALLHNxQusVUFN3qaG0E024l2R60468UNain5u0VXJfbkS+SZKnj14YIZc10d96qYxtr5GfZGkm8eXenJRJdWDhYa5jwLbNptSDqfaljvPuMM7budLGM0qcN5tSyL7Tw75+KoBmOFVzrgnvnn98sLWQOoW1ChQYS5GFyDAPbdkqKPP3kmv0t38tgKwuQAwqf6Z9HHOQsDl0OAzYe9f2q7GFdZeDA7wbCEBWYTNoLu7N3Mz7CVWgSOtZEVfaeJe5A/4SNjWvQgHVVqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adHCkzFEbBIC989h32/UCVTZaxSdIF8AnIQrZChSJsc=;
 b=NgJBVoxS4/8/dw58IJ+WF6dgAyrIEwX/8m5yfAOLrPjywbnrqV0wtkuDWCxn07e6QTDSpZzNgZmy4+ajaPuWknJvXXSmcr2cW91uYWN0vx8pRBk/zB0x8+e76+zyEYQrvLo5c5X5emm9CvaG438DkNwR51T8tWaTE1HErMJ9rug=
Received: from BN9PR03CA0499.namprd03.prod.outlook.com (2603:10b6:408:130::24)
 by SN7PR10MB6524.namprd10.prod.outlook.com (2603:10b6:806:2a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 16:52:20 +0000
Received: from BN3PEPF00022BBE.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::98) by BN9PR03CA0499.outlook.office365.com
 (2603:10b6:408:130::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 16:52:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BBE.mail.protection.outlook.com (10.167.248.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 16:52:18 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:51:27 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:51:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 11:51:27 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697GpR9U584880;
	Wed, 7 Oct 2026 11:51:27 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] meta-ti-test: Add gstreamer to multimedia packagegroup
Date: Wed, 7 Oct 2026 11:51:26 -0500
Message-ID: <20261007165126.797434-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBE:EE_|SN7PR10MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: fe395e43-462a-42c2-c782-08df2493595b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	8HZTOhOWncv40Ug+rp2YcJvzmIAmb9eCEWLFZAEerwd6p4ECO+vquvH5YbRbD8jxCXakFmO2DdGfu/t/1aHqz4ueC+lajde0tTIgdRvLcgKGZkIeQ6mHBCB0l6ZTN4lzPOaubWqfgRACIJQYXcUW+bm+vY2UxzefuVDXmATUXp+wr1IzdfJ4IadE0ldyqmFzIRnB/Ht9QDrZaTrTxD0wwZ7keoOGQm+Na3Qi+vT7vA9bFVPNxlTkzZe28jd67qIctVtDlWGK7tWBJxP3Y4gL5+dGsqr1ZwWLilhpDLcaGncU+sG2vse/36LA9ijJmKad5v8Ufa8aKlwaG0XxijEHxafTYNaEsb5K0hyXEB+f7/KqRTnB+BesuXBRJuFMWyfZYQxokIm2SQtKAWB42z6ppOs0iQUhZiL3dSsPJSOdkIV/uXw4v7Sbikx54BnvNv9MIBWLEXMZUotN5q0ORJAynYI3j9894VV+g3Y0Ngopss6mBZZPaJqKC6Af4nCpndzaEuys01+7/116P5vW1dP0J2whq8odm8BR1oZdZ2qQbhvC6N5QiSTeQKQdmKFtH5i3J0AaWpoSuSivZDjo2MDKwSY0uUdjLZk3D1FhYM8hZkph1bowB44gfexwHz3wP+3b/PQKCXJBMD6WS+S3ORwj0QsiVpUPajLRSLuBUO8bJZT+gPUlPob7jv9aCPACpwZm
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qBjZbkcEgVwbWmIRNfOuuikLdp+YVeOX3igiG2QsGwxg7GVL2OiqcQBkZsrstyau1ISshCrpV2MUDrCT0EgJ6/1hVxUyQdUS7Z89mH7pSzvm3WJYyVUGhUUfZYZSddzF4VkplFk8hsQsJrJNBDiUqDQGipl4wpks8ftjyCtnGhTSVdxWjvWTICNB58FGkg8Sp0W+MSbRGq/nMwgt8Txqsrnb5WhBOEIF5qnHO8sMIBkJt26Y3LKoFR6zRC/XELMjTsh1fLw99zGgLlfSFM4KKt7qOZ++eJw5O7YuYJYXGpu0TFtdNiOxU8NNI4yU3bHC3fDRz7kdJB4ZhBpQTdjt4zcCeq33pcPAFrOq38y4CaLZ/lfWdsz/GUJHzFsRqG2eH9UXPbeHpkaqKTFrOaZZUk+v+RNPlbhDN0H2NIr6u7hamtwTtYFLF45dbQi95u1G
X-Exchange-RoutingPolicyChecked: 
	KO2GyhEUb8L38UadnB6DGuTKnid52Vjj2y7DVlXehX8xhQ/CUVC1C2oQB+1p2Vpq1mgKy8fUq0Px2RtyJaTu+Wg25Jaj+1sSalIqfnf7LNB0BsiPr6aycQbQoCvrarcVxGxhfo+i8L9pFIuxBVAHsWXVRgN2GRSYZ9r4vCeo7Yzrn4u0xSBXnWZK+2TZUf5oEcJ+x6dSqWbd0q+izlOwXJp92+Dl4NJbD/LNMxHeOMz9C6RXgrR8urMgYwDFsIAdYslYdV26Es3EQ09JBSekDVRaNj2YfXpDtHEoDWdccgI48+xX3c9yrzXNsdL6exjJ47bgEcNF4Vh3H2XDx8RH/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:52:18.6705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe395e43-462a-42c2-c782-08df2493595b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6524
X-Authority-Analysis: v=2.4 cv=TaYDJhQh c=1 sm=1 tr=0 ts=6ac678cd cx=c_pps
 a=U8qasQFE1QqC7dgCSsktzg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=_cdtj9pUxLtWDLuqq14A:9
X-Proofpoint-GUID: 3maVFNWWkzhZa0VhdThamid8zLUE6j6j
X-Proofpoint-ORIG-GUID: 3maVFNWWkzhZa0VhdThamid8zLUE6j6j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX++zUXQxmV887
 7Irx01phlLRZ/NFLHYqK1nFSpx65WH+2huzUceypT1gDJYCqt98F9t2jbrDjZOXW7o70MOuCE+Y
 6Hzf+wjlyQBgRlxpOOlsESqhLHnhsrE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX3j82Whcj4LJm
 Tia5UYeg91mHHLYBP5+4o453+zZG+3vSr0Ipq1ZBkcZSq8S/ZhxH8pOlAKhnLJ4EB8Qzdmzq5zL
 EbSbaNlT6UZyYCjT4MaLjJNccRR+4RoI3NKCx0u2czic+qNqJfTy6t473HjylJj8xqFFp8qz5S7
 CVZF9/PzlqLQAbqkwjrCK8pdGUJg1H0YMolOAzfpc3Fjh6iaE34LKEgJAp5sY1IdJVR3xAZKAR6
 mLO9bjmqKCL8IaF3hKeCcXm6NCuYJ0cMhH7M47FSVGQIcN6eBQ7uSkguRwshjB6yk09AKiVB3Ea
 T/E5fFA0LbBMB2ZC9UDi8qOIzazw81T5X2o1yLdHH0hBR7rB3ua9PHVzpc65QMADp/bn+2ckKAo
 B1UmEALe1piYGjMfaUj7591M6a7qkwocFB47vXSsFj1/t4FFjOjy7iJMRFnJVsSDQMhl8Eg2r06
 a/347FYeZ4ZEgpUBGWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070067
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Oct 2026 16:52:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20442

Any automated test for the HW accelerated video codecs require gstreamer
to build the pipelines and handle passing data to the driver. Add these
requirements to the ti-test-multimedia packagegroup.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 meta-ti-test/recipes-core/packagegroups/ti-test.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
index 8a348c26..b7474894 100644
--- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
@@ -94,6 +94,10 @@ TI_TEST_GRAPHICS = " \
 "
 
 TI_TEST_MULTIMEDIA = "\
+    gstreamer1.0 \
+    gstreamer1.0-plugins-good \
+    gstreamer1.0-plugins-base \
+    gstreamer1.0-plugins-bad \
     gst-devtools \
     v4l-utils \
     yavta \
@@ -183,7 +187,7 @@ TI_TEST_TI_TOOLS:append:am65xx   = " \
 "
 
 # Disable due to breakage
-#    viddec-test-app 
+#    viddec-test-app
 TI_TEST_TI_TOOLS:append:j721e = " \
     pru-icss \
     ufs-utils \
-- 
2.43.0


