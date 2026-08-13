Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB7DC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:35:47 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27074.1786649742281975981
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 12:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kAo4AA+E;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=d+uL1oiD;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67DIewO03917473;
	Thu, 13 Aug 2026 14:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=wQihegsmcuOQu
	F21biD70kycPogFrJMGN6oZydfnBhQ=; b=kAo4AA+EXvV+SGbO8UMHg13qtsJK7
	tAV2qruQXHpti4rMFK+UULqWH2/LjwphWQhz3b77cY2yJ5HB62x3C1xn6ZOVq/2R
	w7aip2bnhRlqttLGjmgaY2gOftwWWd7lneZV8XrHqtTDImx0j6pMEY8+vjqAs4zo
	J4LGzFg/wuxL0PQrl/63oeWd27MrWOYorz4CWHc09jizVMd0HOz0N9zkigAX9tDJ
	zVVk2FIqafcbqYofbr1E1qBtklOFwxbOIcNvY9MTMLVsgpjxCc1zsTJ6zidTXKdV
	aZPbWK5bnlD3eJrNHF23gf+sc9qpT+sFNTeoSFz9C9DxL+cPVyIGa2oPA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g1a67m2s8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 14:35:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7nLIb8OwdIpr2X4kSu9x3C/WP1UouKVtVQaUPg9hYLAFy1xQKSrxGz74Xvq26JQGcwFEaoQ9YyrA8uSgXk6PRJ1OEC5dMswHjAikJxlmOaIEnHvXqivxvBflqQp1Lu1TB7l/REfjuoWyvJ32xsv2MSI5yDVO9PiiXaxmps6mYrKOmrQ9mgD4gb7yOeXeBqRUyaZ7hrUnPoOIRopcf2Kw+R7iTQJI53GVr4++oDuVXqG1pgiU3nld/DoAQhLFACv9nogcR/LDA0aABrrp+7a8QDfcbTlY9GdRXrEkpS0oEJjbVMvpc3rVMQRUuG+wX34/SaDseyu4r1Ihw4morB+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQihegsmcuOQuF21biD70kycPogFrJMGN6oZydfnBhQ=;
 b=XXa5OEh+geiXuQUitYV31Ala22EBuKLRTX5E6feXBspsSv3gmxMncTITgVDuQZwt/oh8NqEGBGSwC9suUFMTFF1tT2bX97mtpwmb+r9dOVi510MSadxuYDRMm0bSTJDZls/k1IsCL1rLeeriNaFMyV7I22mL9Ax6qWbI6GCcRtsBy9d7CIagvgyOvgvzZJPrWIa3HxYPcA4Xat0dCa/uk3qDZPwR/2kU66YVYUcpwr7L+JA7YioKe2akEOmi1CS+D1xdptKCaz2L4mdLMqSj8ACkXbFsrzBxiAmJ1030X5RoIgrTuWHDdrImSMH/t3GWeU/wDxMEeGRtm8sAbVLHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQihegsmcuOQuF21biD70kycPogFrJMGN6oZydfnBhQ=;
 b=d+uL1oiDIyfaxjEQDv9+BjYKDqHSfh9kfLaWfad40/jVw3QxhBuK2H7FLHJMLH1XkXsmIvAIwsY9IKm65Wgcvg20xJeZYrLKWqVbSnCOpga3we7pLgyKuTR4Z+hsGcn+azKCkvRxOllJV/QKvklOYSngi/w2LepoTRCwG2eY82P6Z3qWGeUUmDAA9fTWsyp+eDaC5SfdxG/kAACLjuuc9XIPoP2XEKMuiqU7gNx/VQyeEc1wlvB3LtNP92txeZZvz6O7Ms7Z7E3ABZEwKU+AGCqkDL0tDspGAeUBf5v4YC8NXNULfxM/5nboYt9oZLvFFZdkc2wjMXhgzBvwfysp7A==
Received: from MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 19:35:31 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::91) by MW3PR05CA0012.outlook.office365.com
 (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Thu, 13
 Aug 2026 19:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 19:35:27 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 14:35:24 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 14:35:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 14:35:24 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DJZOD51410729;
	Thu, 13 Aug 2026 14:35:24 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 371ED2A61; Thu, 13 Aug 2026 14:35:24 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608130935
Date: Thu, 13 Aug 2026 14:35:24 -0500
Message-ID: <20260813193524.1893813-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: e049a102-c69e-4c59-293c-08def9720788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	C5l4ngEiZXK95vC6Ti70KW3JI18sSLVsggovdSowm0nVFVH/4zXQv2PSnGveVpAXuyy+Gzi8vszsJFvphQ+BRTCPkbM8hwcOOZB7AJCDW/ifQ88CogoQhk00Jvcofdct8tiHzwPulHN6TALKpFOf6Z+Dln9of7R2VHgRjj+xLdqS8e2QyXkv44FbN8ag+hVEkPcHzbyhAlKQt9VOdVHq0RLtM/5Eq8YjjLtw/wwUSrnsEBjL/VLXJGFIoF72Rw9WhRMqCvn6GuTvC76JJwNmR+vbGF8+KW7DUv0D2kWGgSFEWZfGeqiEhrntfBwTa1+ZsjGV+C0+2rGvfub39i6BgCokUnrrIWJCMUO18cABectXdVFixJwjzWzhYj0vSs8hFI5AY0swthwd3zKTpjiWaPsHzJGq2SlWrZP0fKkbnqswzR3qGvl1fvMWkzpL27iTb+n+YEFNmM1sHt3DU1wKOvxq2Cu6CNHVrs7vAcaaH5UPbD4uTnrQzhZCOiSh44WwZ9j8YAXgz2jVM+NAPns9TZ2ySWjdjokSXJKzRT9TYGNwB4rRT4btDLr0fN7YGxT9YbtTbz530vcKCYt9H70QDXdAtNhvRWeOYBsap0mLUXCqz3RMs3Jgb7YB0OCfTPX5SF7zmHWRjENAWLmHn72YZWLe+aT/mKz7+Nimy9FPMM2xNsv5T3+sZrVH5HEUZ+UC4rJsyl+Z4i0v8QznCbzykQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vBXtTp7m91+uLWqid9Cf8Ly7/FRQDAZgfjPBbezDH14L3CMjQDJw10plKZf6gQDYelev2t2pUdT98uoxhwBKlqSRBdLyxYl3mhBKjlXYe/RBrsJ+QE7O5KfGdwAztdrdXrOLQGHlkWhn93uFXDBvK/e5JTbSekwXGds0QcMtHE7NI+45/op0D0bWF9unqOgfLsSS4mOoJdKPvwm4AXlrCEcZ9lke0qJ+hZ2jXEuyHwVjmBLvUPWNNjbk5tYWvwAGVOr1E7uZeGPnb+wrbJkkrWk2/U/NLzG1xhV7xDIqZjXLkclldWf3vsDFJGEjQVlgLX+uL2dyTifzsZS+Pd5lZQ93ZoGn/B+yu7bJi/py8qcTn4Q747uCqa3NQn1dMRkcmH7U+0yYjM9vFFhhwk/A3fzAQXkyXlfkT4jyus1kBXMz8zLsCHhqGrynIWb5ffj4
X-Exchange-RoutingPolicyChecked: 
	eou0WXM6eYaYduaiS06cTR3zwlHauZEYcextPuDitBQR1nk+SwQ5/rZNkHdxrqBDDgQ9aKFNRoI6UVJF4KFMBMbFiekrEIeP+k6FQ9yruin12U3AZt9lJUZUjrRDd9pGmQuNHluWsaARPvuBCBw9oFcL7aQdfZFYwErdl2dUXtQ6EJL5QOMv4d3YlEh86Pd5viqgJf0eXh8wxUTEfKtxKWq3UFLH4p+fSTDjTbxFEyz3gQyXP1LtxJ9I5LLvDeXxtHX6zr5GxwxbMBk5fjr1rTdCTGxohvSZmHOC5CI4bEBzECQF9Z+8aYUEfJaRF/OpCZXPLu5bU0Fztisot9YE3A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:35:27.9938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e049a102-c69e-4c59-293c-08def9720788
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDE0MiBTYWx0ZWRfX5QGhP9930ixS
 +5BBQt+qNASZHxuizMI85sJb8dZOfIniVUoKUZjXtxxYfLCf9ZU6Y8p+d4OK+YHmJsGSbgdeTeI
 P2rWxNmm3FQ9Fg6kMYcs3g5/JD8f/dU+sMt5wrCIAVsBL0pxGKziI9STDi75ldFMMmDEdiXOy3d
 wdQa+c/2pIAhXVI12Nw1h5f1zXJk3DLVAC6nIbHjTREZik/BNRjs4Q54y2zC7nCw+iKKnvGb35L
 5mtF6k8Bb82DK3oA/aEVYJoKdUIbnssp4YY4IgnZ8AtRkwL4HfkbxFTvf9efIfzG5Vy5Dv03Ars
 zGm4FHBbZJPNzB1/kewI3H6Ji4tJCcQj+qxlVwjwFyhLy4YWgCfcwUMvtpdb4BWa8vTiuXEPW+s
 BBdP7zIc01Y9Njvfm+Wiu4XMJmSprq4pNP0+WAwoq//3JyemU6IQmMSNXLjXOuu4C0tS0qubFqF
 UY4FHpHmqC6X3u1CheA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDE0MiBTYWx0ZWRfXw496YP9Vk1p7
 R3vDsqnLmUzmj3HAk8utf+vgyt0Bd55ctUomc4rUDTGlXFPUfoq/R9RgkUXU7tHFWieTBaCwZIR
 3tvdyWQ+XAyqmVtESmh6sGTqdXRDiM4=
X-Proofpoint-ORIG-GUID: tkrEDUTNZGRFZ1-nntvnokPAMN1Mlm6N
X-Authority-Analysis: v=2.4 cv=D/J37PRj c=1 sm=1 tr=0 ts=6a7e1c8c cx=c_pps
 a=ynjcjXHaqbEn4NYQb+mZsg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=cNuy3d2XXKvVQjFnGCQA:9
X-Proofpoint-GUID: tkrEDUTNZGRFZ1-nntvnokPAMN1Mlm6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Aug 2026 19:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20264

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=a69c2feb11f85c8678a09eecef5d05677efc3946..98d73c5cc3a1b001f95c6e35194d2918bc0605bd
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=13f4e50ff203b9581dec599a620b57bb9ff1ed9d..4ca322ca563a21cccad8c9ba65e386b9fd34dd16
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=43493bcb9d02b98e4e52e0fa6639c25d97eaab78..f8d2733e4654420b73fe3e17cb83a30a4763862c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c..ca77f7291a4f1c5f6927fee4e47282b03a39ebfd

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 7e2227fd..f115425b 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,7 +14,7 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
-TI_DM_FW_VERSION = "11.02.14"
+TI_DM_FW_VERSION = "11.02.15"
 TI_SYSFW_VERSION = "11.02.05"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "a69c2feb11f85c8678a09eecef5d05677efc3946"
+TI_LINUX_FW_SRCREV ?= "98d73c5cc3a1b001f95c6e35194d2918bc0605bd"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware-6.12.y"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index deac7772..d9f419bb 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "13f4e50ff203b9581dec599a620b57bb9ff1ed9d"
+SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index eff4c1f5..90811c9f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "43493bcb9d02b98e4e52e0fa6639c25d97eaab78"
+SRCREV_ARM32 = "f8d2733e4654420b73fe3e17cb83a30a4763862c"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 142e2f0e..b4d7c122 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c"
+SRCREV ?= "ca77f7291a4f1c5f6927fee4e47282b03a39ebfd"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


