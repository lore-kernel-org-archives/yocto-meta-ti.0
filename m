Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BC6C55172
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 22:22:39 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2758.1785536551404000049
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 15:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=D7SFr8bG;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=IPyEnio2;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0AiH916107;
	Fri, 31 Jul 2026 17:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=0SfNRinnIjKwm
	AYgq4uKvWt7WBLU9yYbGHvvBOotz6Y=; b=D7SFr8bGPkiNngO7RfP03sTRD+AKF
	phLfwKtBYiuGCVn0uINE0NXM5eoj8pYRGbcs938aJUzPQPwBwG1T8JooMUCCAkQ8
	HvLFRBRSSzUO6T5HLRO+pcDO5AVfdAdOgJkdMo1P/gxT41Vm+j1JikU68kL2ERp7
	iDAQBq9GtIfPG4oEGqzRdSF7OMt9EffJ/PbR5DB6QN0Jo5zECYYv5VXerzRmJoQ5
	PqDGK/ta+cSihcdJcOnXf9jT2AOtdjZfAJ/Ze3gOp8WjB7FyTumY0OxNFanS2MGU
	6J6twVSw1b+UYI7d3aZl9Sc8IiynUD87hA064Gj07EuPRMgELXUb8eyIA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fru8kuman-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 17:22:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCfwda98BfjVr/SW+IbVyybPx1wp9oBpd7fCDB10E+kl1kxmrcvpNwTahuqJK3pvWFZrZDr7S4DrBZlzOTen/oRaeTclCfHT2Sn66Gmv+rJK1Qg88mxFhhA03dKoqi5nlkoeiEEPu2aJvA+VaWKMAA60e7qiskFHPCGu+z3zWnIebKZmDYQRCXqadi7kjovT5JvTMJdvpzanPyL+OAELvNrQjBgzNN3MNHg91Rit/1PtlxhwgMogRRF6E71WcvWZ+8bIplhc1xBB5dDWJZbwmpXHhbTr/+shchXsCaqq64rSxRAqhYVZ5R1lSbv7+LxmoEeedjjzDTzRw0bH215diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SfNRinnIjKwmAYgq4uKvWt7WBLU9yYbGHvvBOotz6Y=;
 b=hsDqepKOpNsJv/SBu4pwlvIETj/vU2XCANXHCNqhp5ahPDqmJ7gmpLzV7ZtXxo8rYPzToka1TCgn40/W6FWrJ0OxBJxmjjeK3RWoU/kg05O8ttkcMQkvwcSpaxzVYrGEv3BhQzOTFHsgBee5M/dWAXWYUNsdDtwNJduMHm3eolN0MPaS+7VekohINFryX9U7BfyLKbm2g16MI7AoKZDsXBtO0F6nCnzyCKnDePxJxyHQY5aQ8Qp6+0opIoqmV3eWODu69DjMxkijqIB7Pj23tjXcc6lmB3Uj+EJ9Ro3rLrbq8rSzgoIJAFqln1Fyto/gxmWDPFdv97SewwVq7ZRBOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SfNRinnIjKwmAYgq4uKvWt7WBLU9yYbGHvvBOotz6Y=;
 b=IPyEnio2j40VO95i5ZIMzHLHygh7f8D+33Cb00MoQJCNQ+ZQMaS49JKyveIKMvkQovVmhVqU4FEXueOH0ZS6Cm8RyvpX+8Aezv34FQFWv+V2i4tkQhZYi/IeiHWCBenXhdz/7alz7tJtht9lJQdqDvBvZyugJDsEyAmS8W1kYAvCBqG5EEXWXp2CZa9rV4QZrWCf/ujResfRGk9Mo+QjLSOa68Vzc+1gRzWShs7EbFdiHRUdd5Dt0ELGLpAI3xX65JT7zBCfN8bk09bfxYkdBUv6Vdxn2ZkmAOwJHfhKcp7I92LmPZ4EPg1+Dt96wPvTujGqgHOWLj7migERd9CAOQ==
Received: from SJ2P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::15)
 by PH0PR10MB4423.namprd10.prod.outlook.com (2603:10b6:510:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 22:22:25 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:5da:cafe::23) by SJ2P220CA0011.outlook.office365.com
 (2603:10b6:a03:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 22:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 22:22:24 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 17:22:22 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 17:22:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 17:22:21 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66VMMLsc1385723;
	Fri, 31 Jul 2026 17:22:21 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id B77D02A67; Fri, 31 Jul 2026 17:22:21 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607311122
Date: Fri, 31 Jul 2026 17:22:21 -0500
Message-ID: <20260731222221.424604-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|PH0PR10MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 657fbef9-25d1-4b25-8009-08deef523284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2QslKVsjBsJ+2apdJXmf2vY9GtvKfQG15BY9zgjIgkKINXxiNY6uMQEHw0txNQJ9RLs3B5p1TcN4I7aSc9ZxXaNzq6jsIFzD0xMJxn9Vn1PgxC47tQEYm330Gq5JlJpsO+5H3JcmZXUUGHE2gBGIW3ErPgRtygZvS4vDwtADWkjlsi8SuRutmkxKOIeg5fhdw5jcL6xQNmbaXKP+EMrNv7hZtn/lZ+KTUMA4LF437uWdKZC2FyQe+tTUWG67ZzY812/kXxQ4XxlY7raqiElZjEpCrL7nPEy9FJjnKx4WQhSxgVD+zk38guwCE2yK7OM+MbIV0ZlmjiPfCJe+TqcqXO0ooAnOD3LJTfZHtAhsYXFo6fZLK4iXPZmzDD3iFaNWvllhYEb+JEN/YJSKwGr/W7QR0x0ZJ4rt+47PH1B5mpd+hugdGeC7BFZd8zqkfGBpAyncbJBY+7uLQE6MD/xYfNIqRmU0fLZ3zbBgAIX6Pnh87z21Cc497M0cf2O/NfvXQSk/VhBL4l5Xa9VifRC4AIo8ScN6ZtWnozsSdAfcAq8psMz33Vu71UEIYEiKvLxQEYWysDPwAxh2AI5sCu6EVLEDDZGAzK+YXn6xRsvp2z0s4k02y+iHV/hrlp5pdhKWFqCUsx8BZSQWKDrx73EliK6gxi1O581EANVV4ArQDfY58weDpwGU8OKcFOJ1jkvcqYKpy3CnZ4DBpzH2Yfl1Ng==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	p2BzlSiyet32oM5zakMsVlhQx0XI3GFGTrW8kaiAKOn+qFvIt/8tD6PNwa90w8b90BNiHhDPaiIPJPaRVKf5hhml81RfeBjACiIxg4kDj9O00935m8omb7HOSzan97kCCjofkfBMkELwcsnVsH5ev2gGgImf5sPBEbjKrkz4HDwzAoyJXURMr4q80C+wAtTpB0nR1lt4thIZVdnyBYFBTAZD1m6iHyI7xI/5Pd33YKd4dFYkUmvNwxRzOUFZlOQEaf6b2/WY+E1Jj0Ay82s6pJfI4zTtbO5Vb7ohMHiS78kbpMoyp8YvegFOQL0JDT2Zdjcy0OOhRcNvDtf7E8DdTisKfm+iN1nSe5+LZoAuJKOkUGQEkUao6pnD6+e2ROgm0GJAKEwfCIKYlNWmrlJYOuRT9CAuc2Y03VHZtxDDbQel61W9uixbU4s4DWwLmP9J
X-Exchange-RoutingPolicyChecked: 
	Aml5abfWLODGWtfvietRPBQ7fIdm67pnzvxu8V77UDWmdnxFFVm9aUnDDPAN/2ZO95WyKYa9/6An3qtE8k4zy7cWZVx1NQ1rvQ/155EcGMGmmJOWMfMTUp4a/dG1rtlyCJNrZ92cl2PeV+nT/qs9HxwwWlEuC8zWfItfdCYDCQegHw6v4zdOFcMuIi+A8GjDu+QIZYznjNymcG/xDLB3mtOPJXVrcbb34XL5uYMufMdqtzWki7dYH+51nUD3JX4fG7l7uX9uP52YYtfMEp7a+/hba7NR4GOS30MwrKAIHmWQG3oJO3kQqD5psL3uXqW8MtC3MuEYKBY5jQYeEmPkqA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 22:22:24.5704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 657fbef9-25d1-4b25-8009-08deef523284
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4423
X-Proofpoint-GUID: lWBTCbxjsVJfVnsQp-Awkd6h-ltfncqq
X-Authority-Analysis: v=2.4 cv=VefH+lp9 c=1 sm=1 tr=0 ts=6a6d2025 cx=c_pps
 a=48c6PaPq82/B1OY+thwv9A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=ZqehOMwzrL1yiYL3-voA:9
X-Proofpoint-ORIG-GUID: lWBTCbxjsVJfVnsQp-Awkd6h-ltfncqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE2OCBTYWx0ZWRfX5PAvuz8ZsHJR
 DMAwqSMS1PpCCgQm9316ES6BdlBPOf29gBUmEDywsbFYmVP0HEBFht2xFeDQ9n2nlRXnKg283ZJ
 h+2ZCd0K0pmemuxunQ+uUQjIye1b9NfHVQjd9EhMLBMxj7ySaKHjTh3IU/kBb/4qEB2btNgyNEU
 qIsAiAkdexT9kXiJBRKKF/x4gGeAsJtVcC7c3xv+nvfXs5nTJ1sUhryNmnYYvRr7F95s5PUTJ9F
 0ff+QhXCw/Tgk7ss8qu4nTRwqqmBaBeS2e+hNQX8YTm4rjUHVQHucB16S/+T0ztmSV1cBPv4jCr
 Ny2ncIpAYw/lo4WwRPnyNbAeJjLIct0MK+JlSl5PqaJVqFTAOUC8QUO1tIeUQBohcI7s3j3v1EW
 0VU+jF8OYeWQqf8Qg9iy8eR450kj0i8iolFR3lsZrXwuimOeQ/eSGi7rSNSOh8YFYCOuDFZg8bY
 5ijLlvrq87eoVGbE/xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE2OCBTYWx0ZWRfX7BFrytvQTANj
 BzZC/rjDiGRflxOG8XlQNTHTeR8IpBCWXrOt9I9uFfrK7cSSjBRSRMws78CEVoQdBsiowo/BOjP
 FLrikeOeOCRaF774Ne7T4vwIP32+pz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310168
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Jul 2026 22:22:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20211

Updated the value(s) for:
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3..1c85543e02318c573c4bd190a7db9ab4f7e03906
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=5ae038766eda6647bee6dc52c88308a0a280878d..8715cc31cfe8a191ade660ff787fedbadcb187d4

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 64a5e0d1..a5b98b1d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3"
+SRCREV_ARM32 = "1c85543e02318c573c4bd190a7db9ab4f7e03906"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 0429daaf..0842176e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "5ae038766eda6647bee6dc52c88308a0a280878d"
+SRCREV ?= "8715cc31cfe8a191ade660ff787fedbadcb187d4"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


