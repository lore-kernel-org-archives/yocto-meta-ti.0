Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B0CCA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:27:26 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2721.1791487637378693393
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Oct 2026 12:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hyMk5snq;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=ap+ftQzi;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: b-brnich@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 698HV3SE110747;
	Thu, 8 Oct 2026 14:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=h4qG1JLXuwrZi
	OH2ThMI7gJrKf7f4rDNJL0ncCrUPEM=; b=hyMk5snqJHE7ezAsI55KPXPIFXOQC
	AjyjKq1Qv6NG6AUVZNHe0bK1xj6B9wjVZ0P12C5Rba4C8bkFVN9K4/+tlEyeaSIv
	Cw5MsTDRiZS4mjnb8cImfNJ+aTIiJZRlcuuEGxZlfxPHBxzNawy2FIfC4iX9iw5e
	K8pj2z1G1pO9cj17DVzhN1mj4yIU2f4AXHEcxSn5NEDwcMDeYMY9RW9JNiNUPzpK
	gTe9RCiOAMfT0xgHV47wigvGKSYlfN/caomHQYzCTCivECjOckMb+IaDa29ffY8r
	VAaSQd9Hh5T+e9tdJwlUoRWCCEJXkYDSEWMahYyDMFfrB2dF7JAwzrSnQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h5xd7pxvy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 14:27:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZMgPh8VnhA65nCHErQk+CBBnnvQqeaCg1/0ZuC9YyC1YMTP3aWoVP5fOC1QaYLFDzI3ctmUZfuHyk4IBvypXpGwSt7vlqRoyLoN45n153xDiawf+Sj0eMHNaceBdLLEGfqLen3mwilWh5H/GXqxlJSXzfm2PKcYESx+0fpwVVWZ4ssxlvVEAM72fF3UcyUdyLFZ60a5O8bipayyZhtlSuAKXjkVfqCWYhf+lzh8/1euYPqmzDIMJGEXhZLwm9u3dgkLLEZEp7xUP3OY3m9V7ruoUWsplZc45iufEHlpPgj8uNbn5HtM6e1xw805wuIBIc3yjPww+EKnXTzEFTCohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4qG1JLXuwrZiOH2ThMI7gJrKf7f4rDNJL0ncCrUPEM=;
 b=p7CoZGKRUCDu7kMlIEZbLVtSR0vUHiolLKlsfSa7OdYLEZrvpHtPIETHLnVf8cCAyCtIm/8Uv3cBZgiGla7HW9lIWj/TIXwj9i+hUhop/uJqWVqIWdIibBU5UmHrUdAKywguqaoJwdoeQ7ExXygX+unLCAz4MBPJkjkMc9/YHBBsSk4stVR4iG+B+0bLFNOfntZ2mc5pIM4FMxkO2yzJ/B2D8VnCZ96ygltS+cp7tFnTv4PKIbJqK9RD/JqQCbuAgk6RwFLj5qp9hWNYuxvi7p9FvEwBwqN6Ylg2PK92aF4yMPgDhy1vnw3Zbxeiz2RzumPXVPKBKiFhq7BCxSQnHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4qG1JLXuwrZiOH2ThMI7gJrKf7f4rDNJL0ncCrUPEM=;
 b=ap+ftQziJGDo1FJMJlcQGdEw9ErjZzW342piqW4nd4xzhekIgQ9VPaOzLvDLdCpEq9ozaJKBrStCb0HLqKQywR5Y01Fa5C//mHJPxFnVZxLXPCQO9a4uq/yhpN+KUBiqEhdSx/Mrnvc6+f0tX4EdLeb/CEoVHg0Dwaes+UvkxwQ=
Received: from BN0PR04CA0081.namprd04.prod.outlook.com (2603:10b6:408:ea::26)
 by DM6PR10MB4283.namprd10.prod.outlook.com (2603:10b6:5:219::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Thu, 8 Oct
 2026 19:27:10 +0000
Received: from BN2PEPF0000A7FE.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::61) by BN0PR04CA0081.outlook.office365.com
 (2603:10b6:408:ea::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 19:27:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A7FE.mail.protection.outlook.com (10.167.245.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 8 Oct 2026 19:27:08 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:26:22 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:26:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 8 Oct 2026 14:26:22 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 698JQMYc2922574;
	Thu, 8 Oct 2026 14:26:22 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH v2] meta-ti-test: Add gstreamer to multimedia packagegroup
Date: Thu, 8 Oct 2026 14:26:22 -0500
Message-ID: <20261008192622.1944375-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FE:EE_|DM6PR10MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a3d824-10f6-4a0e-9bd7-08df25722508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4WPlqg5yIx+CRI6ORcpNGjqO1DSHPqkjp7PGqBOFVWimOZ7pXofP8lhYj+DauUo9Y6qbh1cduxpS2i9Q+jFXlP0CuzwfNG46qTBjdpv3k7dSI0/ggTmR8ZNwLFN/VJsJtjEszzOxsMcC1Q8V5YPfw5vcJpUfQa/aNJGL98Udk2Xr1z4SgOOEXy+kHTjAamHlPSWNB0hMWDgt5EbODpUuPixBUUfdY5QdsgVNeUh40QNs0HWhBDDJ6/fEx7htSLantyr+7GAwhiQN96zBReLYM9h3eTHDGCdBdzEFNyFx1jim73fIGUueOp/R0/J3OaDHpAICSHawA0E1CaeG86dP9tDNaciaLUrswrxHHRX2k0AgePk6ZePZ6h3RPzYPjybWeuMNOoAFh4yD7IaOjdKe5xbzdPsspC6PhdlEdsBKUd3rcTQ0HckAa7hnVep4coGIt19skDxU6FHefi/1SemOAdAGVkVoZ971Ge7syEKtXGhtVPNn1byBNJyjyvbdM8SNEf2gOlMarR2GcLhyYtwJf9tV1KNpXzDdSgK6KMBoIWrBce6hS7f0j5D6fPSExhTXgj/p62Lv5d6Eb+E1lQHjTTuy8Z4RqU4YJO+IC8P00+eLtMxqb3WBPOobRWk0EdwV4pry1P/XijMCpgsTTiSzpF3nHkbbHE5Zz3dtJfMnpbHVyKz7SpZrTmFHhVt4w3tpyj6RfAWN72L7cZ6TcDFeNQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NY+WMmRNHCveA8+kNaU6k5kQpz3y+G83KGa0ZLo/W/p/iHuTAUJMX8jRcwjATEccqSs+qyVYdHxOf7shKIikvGc5MKhzNGUyyrcmoLfJNgBv0BAvqu45IXWxAdIuE0V6+/XatXcUuJh4uebr+1RvWyhObHcJj+xH0775rPgl2BgG5CC0vNfZ+OiSam0HDUHM4TKwuJ7ScIDvMEHD+eESaHeqnEy9Q3gZWClKqxXWcAtUj8IIKZQgqAbcN5kgwPnOxmA6hZSKMvNQ5fQ8ygCbxavhExacy55kArNrGN9WclRZNVAJBze+QXLizKBrLSSPUHKwt4JygRocqy00tlnTi1nKUfhwxsD3dOzEort+JAZ/IWH4UFHlBoeLvXy+acntHWIsBoMCRby0wQDWIOmvPNCPHFkfJFu3bydTNEu+V0wupCHZFPqRiuToexWNcmbu
X-Exchange-RoutingPolicyChecked: 
	BrA7tqAYtNRYXMdOguXRAaYmabcEOwyj3ePXwN/szy1zS6PlqK+0Re2jfGko1IqsxXYyMXP/eEdcMivw5oOFlZPxS1c/uH6TU/SEFY6QhAstP44x3almJ4ujJXK0q1w/ed0c3Dhn7sSlUIa/J8yRsjm5H+s1m7zl/H4o9DJe2PEfsSkPBa96GHYRldInqNmu22RZXaX8NgWy4zWKDqL2xueB390xJmMRlblo93nuVCMYGAutkoHwbqYsFeVQOUmUSVCWaN54klVdZfsCJEGPKTV79fupotiZr2tSi148koJvs0F6Azoq1qxwEaJextk7FQWtQ9xAwnCDvSvGicbS0g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:27:08.6564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a3d824-10f6-4a0e-9bd7-08df25722508
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A7FE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4283
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3NyBTYWx0ZWRfX4OzyIXDzw6+f
 06zxmJ4obslMJ4Iku0bkZhIWW0+qqCR+Bq6rpZOHZb/yuGex+fB2JPloDlG3R3FOf3tHuZ3AW/r
 k3tFRB967LQQyiE7Z3QSrXB8FhOpHvoCh/FrTt7/TM7cErkIYe4AJBYKlDt9hLORC0Sz7sVI1Gn
 7MDF1Xu3TIbLf9Xw4uNomZRu4vakioHJBo6OMmoM5ZZ4b5pPsGbok6TGr2Pdbew/ppNVx1et/SW
 kcQ4p6fRgrsEy9SGTf4KsXsPXTQZ3z8uQDeQIcPX8EjPPJsGUSIjczJmJeCs7h4jAXaqIOgXMa9
 N8Talra11+Te5s8uGpJlL9mkZGKvVEwd9huhzzn35EwkfVKLxOQ1SNwPEWofbhLjGyihNnCwkJ1
 d1hERA8y1n7Lx1MtCC48sL14Q8+2Y6zY9pKiMuV4ub2SYpkvm0O9UykNhJZtci/ZALLUv8b21Tl
 bhJHRV4kpCKIvqOh0fA==
X-Proofpoint-GUID: UW6W-DdIZsdfc-g7ZUhEtwVIgRdsTzBu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3NyBTYWx0ZWRfX6yKAfXczs4nC
 6PEGrFcQ8FhYwSn9gxp71k2y2nATbveOpFiqs3ARs9krT9G7LXdP0yZEvMytjCLb0pLgaBDcf5J
 CapugNh8ajPcd/056LmLQ0Wj9LJT9XM=
X-Proofpoint-ORIG-GUID: UW6W-DdIZsdfc-g7ZUhEtwVIgRdsTzBu
X-Authority-Analysis: v=2.4 cv=MuPHeGae c=1 sm=1 tr=0 ts=6ac7ee93 cx=c_pps
 a=zLftBE+EtYxwi/BgDV84wA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=Wk16SPK54r8E_ucckqQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080077
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Oct 2026 19:27:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20447

Any automated test for the HW accelerated video codecs require gstreamer
to build the pipelines and handle passing data to the driver. Add these
requirements to the ti-test-multimedia packagegroup.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 meta-ti-test/recipes-core/packagegroups/ti-test.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
index ecfc46e7..b266a2dd 100644
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
-- 
2.43.0


