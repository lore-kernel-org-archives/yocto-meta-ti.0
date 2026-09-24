Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652C4C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:39:40 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1962.1790231971351685383
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 23:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Nlx4s1tQ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=LPtf7ovd;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: s-sadik@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68O5cEXj3989453
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 01:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=BvBDBErZZcm8p
	xJtNnXXhVfD4lzdGxdApfO6zQgDQhk=; b=Nlx4s1tQ2+l1g8hshUtV8yi5/7pcg
	JSPVQMo0vXYrZWJs7vTpTRMhOdHwgCUw96BnrXOn5lxrdafabxmCq1HH4CieSUqc
	GLgmz9YUzEkAji8CLpmM6MpXPPGndkLZOBWxJopdXtzA9ipa0nZtDlBtNK+fnFhi
	FVMmhd3L2o4hyWasQhUusJUOQl0S2e69N1Y8KPqDKiMU2z3kzljQA3gDR62YQ9HQ
	CL03D9b1pYcKqoFuHyHGU7jpbHRblYrqsKoq+IrvXA6wnoADVGPWsfQDhwECmrWG
	v+kOyd2AyrQNH7Ljc3u3H/Hm3v2PzBVVGkkK9U02Vlm2MHnhB6s/G7mHQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvq6s2c8f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 01:39:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8RTy84Y2F+QcIEr+Dm4b/y99m6b1dte7995OKO++HXSYZTHBCKfgnMltuY20Fs7Fr6jCJviyuxBinQJU9uvEQXkrHF58kS3XHRGtbccNPsZ8g2+Dg7wFSnVD1N9YIvYifvn2hzLOtqg7GXjTimCajZBeYR/ickxhvxf4liu/RuQ4ZLmenirb85mV6UMKssk50RzlDkSRompy1rqPWkHABp4BzSXahPlg75r1I8+3DkpnlHqUVJBxFKoof4ZA7TGYKTgVsWmKNNfyOr/bGV00KnuRhV4AuGrSkZLtWpJe5tAxDx6B5uum2jni2Sdbrugb7JDM2rMrFcmTxUjcBGc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvBDBErZZcm8pxJtNnXXhVfD4lzdGxdApfO6zQgDQhk=;
 b=TcpsEktsg5cinJt8dtl8Qzs7LV3PXMinfF8+xhnYgjPyME4F1bKzlQuWg6X8KS0H8FbBBH2bsXTr4p63BvCtcbT78LFfrq5FeBXaBy0GY8NyqehHNjxjyd9BfKh/BeaZCfze8cD0YgvFraoa8A8Oxh/WS/DaH6yyXn+4E2X8zT+fVmXIhNsuorVyY4jHVAZ4GdW5Yj8KdlAcIPWUi83dOtHcsps3T996aOZ+6CR5HrgJenQ5iECn369qeESIv3nXoMhOJMojx9wR5gxvhjvjmmOE5RTpwMyLsYG5gvI9EHUfrKIntMUkDNF2IhkoY2Px86p+Ybr73akuetwQXBEUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvBDBErZZcm8pxJtNnXXhVfD4lzdGxdApfO6zQgDQhk=;
 b=LPtf7ovdB4af+VhdDvZgZoNQMkif0xdMbXWQjJw8Ih8kuXP/icW50d+4FrWA62iZ1emuROQmmWZkFmCfnrFxxgcfj2Mi9KEpUQmwnZ/KzWuOqaH95e3gIZzTZW2qbbgKb66tIqGrqKbRxXfdBAh9gLdOC7NM7082HZAiulVr930=
Received: from BN0PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:141::8)
 by SN7PR10MB6569.namprd10.prod.outlook.com (2603:10b6:806:2a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:39:26 +0000
Received: from LV8PEPF0000006C.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::a9) by BN0PR07CA0009.outlook.office365.com
 (2603:10b6:408:141::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 06:39:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF0000006C.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 06:39:25 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 01:39:24 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 01:39:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 01:39:24 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [10.24.52.210])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68O6dMae3580205;
	Thu, 24 Sep 2026 01:39:23 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan eatmon <reatmon@ti.com>
Subject: [PATCH] conf: am335x-evm : Bump up max_leb_cnt
Date: Thu, 24 Sep 2026 12:09:10 +0530
Message-ID: <20260924063910.789534-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006C:EE_|SN7PR10MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2257c7-626c-444d-6a7c-08df1a06937f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	mCMa1yoVAG4psVfkSZlDGzoWRWoVVDuHP9Gjc2WDcSLrDmqCOAIvops+0jw6F0z3Fpgba7OrTUaeumTa1w6tk3NLO/vZvpwP1GZhXlgh54Nw+knOWoaUA6UWreaKRKrYURFZ7SSb11QlE9/UqAMAiRU8eu4OPlpchkDDEtF7EKjldGhS3Nr+x4oSy3RqqeGIBdhjoHgeXp6LMk5v6wqPu/8gxL1Zo9OTV9dgixaNyBiytDI1cn3Cm9YnpPUftqPhtnLAAg+nse80WLVbEj5N4qgxcCQRzVWb49tYkkqumxfRQljRYOnNQYt5sZztC6tCg3iDdMTk5UgIL/BwUXee/57SIUfg7dIrxkVLK8jNVT/j7eME6S78sohTl3WnXnqbpuX4f/ahgvdyD17trYTrblxshO76nFTQfXtQ5+QDOo6HkJINDfnR3jgQ01rIoV2/3gt37LojlP1OzcCaKgIBb3DZAExcWm2VEJ7V/ZfWbqAJyBVOZrxef7xAMdHKRjoifbFYbjAgMNFhePrA2hbFLLGZpqhR4EOmtjyodaXHWdBfSBNbeJzvYU8yfl/XgmV5Y+EPL62F51LMvtIxYutRJvgDUIRSey4Q72PemIL1rqzYhMpnzLrIg2pe4xsfieV5Ktla8q1Hk4TrPijm0GNHZa1hf4YxT8bFxuRx8sa8aL6ho7qKAsfk7Nj5Z9nZ6/9mvokVmWjTc8K8VUd1bfxGKw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5dmNWKE5WN5VSoWJe6lr1/zsDcfGJsdJHUqI9wEoHTRIDsEJatj8qFcD80w+a9wvYSqwa80Je5XP6Fx3OFtSD5QLFUj7uTJowEh143KZe3arsL3SyU9mRImWXimu0rhdkXTNlgkPd8bCaIwMycNWMe3ZpSloKKV/BCitsUhyzu7kSccJu9g7RBiiCxk6Hx8cpy6+VVTUOtl7RwyC8boEqxWy3kmCoCj/03DKYIikqM/E9cAYfl/7kb8c4NnSU1Da4ZQYSBSyNp3gEOQIVGqHSQ+G79VvoAh1g+Rs75xiZOXX/WVyKVYgxdydC5S3gRyLsPHnIrJ+DYW71rWfHfnHMtznVUGejkUAwk9Ul2/t6yv72su0TIurGZUnRxR9rnGC1qzbNk6VvYy9Sqjs9SEB8FIs2B1hLeeKKlENoiLnreha4DFULpT+SI7pulKdgq4E
X-Exchange-RoutingPolicyChecked: 
	4hlekeWVwTWfMiaB33j9fVCfSwozkt6ELfZdQhZ1tvDOHklFbFWJ44roNYm3OokaI0yMCpXOFmtZMg1C95avlg13DAnFuKyUiIFdIIL+jmGXCA5inNV/vGIAJlnXg8HcrkpCubwzjDk+F4LpgwpjjuYVKA+yhLa0+H1pag8Eg+KRHAWPuBhK+bEAULg6v4iC3KPGzAE7JQoxHCXncAeCIqAooFjnPiEPGz+UocXs93zZUEQnQigU1bCL8YKf6v0dkyhx5LNYS9scUBkZmmXPmaENWnBaAWkveEFOHhEVtQ2Vd+Mw+as1nt/03kToHlTE3AilRYCgS+9EqtQebYhv5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:39:25.5409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2257c7-626c-444d-6a7c-08df1a06937f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF0000006C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6569
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyOCBTYWx0ZWRfXwEjfKMwIltm3
 qA/61aAUbrVJeScO5ayuK0d9/2DyUrEsKgf0KchFGPwEcwyDbaGrqsjmN+Pm1BuNmVohEk/dlCr
 8MsyH9nudAHLXz4WE20ZV+ExskZh2/A=
X-Authority-Analysis: v=2.4 cv=IMSXmQvG c=1 sm=1 tr=0 ts=6ab4c5a2 cx=c_pps
 a=2iQKv3wDMkjwRE6X2MvZ0A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=BFAt524beoUdfqecyIUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyOCBTYWx0ZWRfX6VXegMqz/7vp
 eyxjCgliRj5sD4Lv9538+qbCG4gzMBasb7ldlUk8hXbkS0j1yTbIeXO1DqXwEL9kY+dGAa/8C8Z
 0nM2wCiryQ+B2h07oRJbEN69rAaz8GJ07ZcQ/pKkfRJqfmRBQzcTYR2Gtjg1oH5SwyTT+kH564C
 8Ao8Bh9keIEp0cFVdT11rFI6gON5Yq3jagjAM71j+5DAqga5y9P26q0bbVAuxQFWPQs0Xaj57EE
 Jrly7GPNSqCqBdUx3rL6LHJWGYQw7zYz86gpRnsuUecEM9GSFB6dnmyKOfBCVbHaEStOt5Z/zcw
 sNdsrp31wpY+NvperZOytz0hTCZ774Y5Ntppv59CBdjAjgMQTy88YAK61DoJEkhsEsnYutVeUAs
 U+othXhV1+fnGeI2yYG3uUCDsXMfupLHrohFsiCF+w5RM5f5Pene7jIZmhV1WqkbnQlQu0n0NmA
 mRwxokCCIf55WN69mlQ==
X-Proofpoint-GUID: HE12O3QH9mGr0jgrskN4RjDhVdbOX-zM
X-Proofpoint-ORIG-GUID: HE12O3QH9mGr0jgrskN4RjDhVdbOX-zM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240028
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 06:39:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20409

New features added require another increase to max_leb_cnt

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index cc5d87d7..0dd4e7ce 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 18000"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 24000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
-- 
2.34.1


