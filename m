Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5CAC79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 02:54:31 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5146.1789008867659327056
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 19:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=MhQtY3wE;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nsoKDpwk;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68A1jCRh4093850;
	Wed, 9 Sep 2026 21:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aWzZfLEATH5TGMpNrgn7uagBrz/DMVYMjZ1iZo+FB
	FM=; b=MhQtY3wEetsuVpEhX92M/a3fZDUEceENiogRrNaPGEXHqxOEHsixuCF8W
	YVHXBrQ9YYeOmRfo1zm+SCnDMSWJUtt2NCeS04J135GhA4Oz7KNswFLXEIWAqvHR
	GOBTAwaCrMqajKUWkPJdko8EmBGojNlYVq/+K+C3PafXKn61boalvh2nYYs1D2Pl
	4JZ3fBQurzCCUMF+eIvnjTNLseWVHU3A70rUgxIWe3cHAzJPPzzXiE3ZCC+C7dzi
	sgx4OXYDFIM7RIpkqIqaPapVwrfV4viaZQJ2naVHHlk1LKJrcwSVhjaEA5+z6vlW
	sCUHd3F9KeYFaykp6CTdd6aoBsQUg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011059.outbound.protection.outlook.com [40.93.194.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgaj11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:54:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+laMDEv1nGTMn+5O49dqw6k3y3I/uLydftvQOo5wPb3D5aUBP+2WL1GSl9n5xOhBd8AK5JMFiooGYWYMK7XL1OMgcq7Ve+3OjdjlgbbZXeGtEk8DU64SSo6WR4Jo2YubkvPCxTkaUyOZnO6dTNzzahGZE+g5lA7TG2bZ5IB+2xSl/YSy1cCVhnWH4ioNITI1qau3nRCrZjXFBkKY9Bn20/yWKPxmUDWCmouZnBx6ISdAx0wZyevunIkF1o9N3fJwr3Uuem5XLy5t1t/oPu2Bz6FbPoymwI2pEN5OQ0mUeRWiNPhhbNRrFWhv+SCi9Nxj0XGewnodAXioarkendxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWzZfLEATH5TGMpNrgn7uagBrz/DMVYMjZ1iZo+FBFM=;
 b=UspOLJ6qhIYc3bMAfHix0AqHUhwhlVCd22uf3EHge3zTTGnUTBIUlK+gyPT0v6atFNl4NnZgx5k0BL/EX572V1ytef61v1V+Q7GjDtN4eq5pjUjtjVTJruOs+p+LHTyuiV01lCrODGUQXgAqcIb4CY8zIsIwsUIscPktSShKX1/zny7dUCk/uf+5I9xnR9GM8Y1BR3/pPA35H2uZZVQXzO6JhREPL0qsAyPmB3SxTPpYbGBcsznepkbnr6ahutKI+4r8oHz5eC2rqv5xR+dLkU/C2sFT4737zSvBDKispgBo4v4GGspLiSKLyPDveH0tTstXIR8r4oV41hOdEGKeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWzZfLEATH5TGMpNrgn7uagBrz/DMVYMjZ1iZo+FBFM=;
 b=nsoKDpwkNaZTNjs2X5CecLL3Q3Q2F8IGK0OJj32sWy0bgduZ7iFUrO/AeF5sPP3S/TPPPToTsp4iQ4R1X9HUzfdC1zFETKuFaJWE0+yzpOAMkiJjrhvCTolnXHgIzuFrBp6lPPwhBEs1e1EvxdiXiu9Q5ex5i7NOuH/o9GbYUNE=
Received: from SJ0PR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:33f::11)
 by DS0PR10MB6749.namprd10.prod.outlook.com (2603:10b6:8:11c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 02:54:22 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::1c) by SJ0PR05CA0036.outlook.office365.com
 (2603:10b6:a03:33f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Thu, 10
 Sep 2026 02:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 02:54:22 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:54:16 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:54:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 21:54:16 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A2sGtL2463638;
	Wed, 9 Sep 2026 21:54:16 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4UvY-0000000FJ5G-1IO2;
	Wed, 09 Sep 2026 21:54:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/2] linux-bb.org_6.6: Backport OpenSSL 4.0 patches
Date: Wed, 9 Sep 2026 21:54:16 -0500
Message-ID: <20260910025416.3648241-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910025416.3648241-1-reatmon@ti.com>
References: <20260910025416.3648241-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|DS0PR10MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 432e4cd6-3f60-4ba7-5629-08df0ee6d117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fpeWhqUDRKKpfLcxr1noIpxpvt2hTl/cpdtVpHTvbf6el+EmRrkphmlStmb2T2wyXeM0MQAUq7OxwSRn5sH4CKFWU5OJObZWj5RM6a0Zox+ij4NFoswGUYEMoEnpxtsL060UicKIdyDSTxofxVSRhatl65JXtLLauPeMgrdnIAELgjKGZ1QIgoG2DePYOOvIAlaLGLaHux9qBvFQoKvcL6uKz8X6Ps1/6q3PVoiyaA5etHX0/4LCjo9RVGkHmzetWLxj7LqA9U5uavr4FYiLE9sFo1x8yjKSiYQFjRpjlFayhNC8PTTte+StC8sQOzXjlQE9kP20UQeC94r+zW1jZ7SJM1K6glmWzattD+uvbqw3KR7vSelAwPUJ4npxNTrT8p0NCSAjyCKsTW3Jplv5ZK8N62koG8U4fzWpg1yedPEa8jjMh74lzFD/BZsEfRZGD7Ug7e8dR7kO3FehzVcATHJccGHxieBsRQYic2dDpfjTAcFqrKVhoPOrePWdIgjDG1c7qOsnLA0keSzVgaltxvgFkETwwtgMnR8zdRdETjIG0bCsplzt9BoDg53CP0Lj46bLYEAYoO1P5stzUwgCQORpznq/ICafyd8S6SduCcfxebC7yOXC5nyO0nUzuy6+vOjibezS09oJp0v0xSRi1TzJ6IjVYPjs/PQpll3Uno7iAwRotCpzrWPB/QXVdDFHZj5mJBORTaf6CC2HjIAE+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ybkiHKKlh32XQ8X1VK87VUJQ3Iyg/eiJd9jDPv511uOuRxTX7RDJ2dCXRkmGiX2ghzAy3fiCtCdSzDWxhjzbDXuaIqu5pr+lxGSM4EPxeMhZgFfIppn5h/UPdOqq8hZv/WyUO5CUo4JFjNAafVBV6zgxQowJT90AVfeXecj+Nh+zZD2MGPAkJ4zH7AZjSbaLaCBFlbFim0fo4O2NbSTYY1BPTXUBJiXYigceEyLbYVZhkONiSltrqBq9Ta+DatYvOwBTq7MFjJaoFNbpYD/m55tq4JAyq09N/qb4eyGStBsO310yz1UE+JuoJ2OuhRqJZvSU6f0mgr2LqCbI7p2+P/AMaPrld9zv7YfUXb9dIfWFH0T2GeG+VEXH1W4ThcGjub2HXZjvgZaEeGmcB/7MGVb6BEgTcZh9ox/6WlXatfEbxn9HZvuFeTzTFYJP8lRf
X-Exchange-RoutingPolicyChecked: 
	2FrF+4nwqEi+05jFSXl3n0npFyOt+3YdH17VAP/Z0IMsQ2dXEITjyIWJX6sDWwPnlNJ44pCK0KGLAw5kZJuUswELsRfs9Y2NxRLBgnHBEsgiaHeGMeTl5AibwoSDP7FVwygWEcjO9mBvYmXIHyJc5KDGTgyyH2TutlBheY1v/83nEyThrR0I1KWCIRtSotU8RR5mOgjZYOolnkvdQ7FNF4ZhXTVHqZOvT7gTMQpj2g/VQE54QIT6dwmK5f2r3624KrW8yVfW3XL/19RN6Ob4dDiTxDyS608H8BlnfHyTpmHH6SXqs+JQpifk/19AXEaekb0RBOktA6sytSNtwT2mNA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:54:22.1867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 432e4cd6-3f60-4ba7-5629-08df0ee6d117
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6749
X-Proofpoint-ORIG-GUID: od9ZhvS6uRxbIJXakcZu0Z8w6UGQl3AH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAzMCBTYWx0ZWRfX3RPLzpU3+mJT
 5eydTgvNiaF+seLS5EPdpgmPNXk1ImtJEQ0OOoNcgzwz+W8MABMt1mHW2vM8NhiOv8JEV4uKAKE
 XMgQCPRUtYYV+N1JzyuOXwPMlnclGac=
X-Proofpoint-GUID: od9ZhvS6uRxbIJXakcZu0Z8w6UGQl3AH
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa21be1 cx=c_pps
 a=jMLRuqkCa9WS4sFRI2wrKA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=NEAV23lmAAAA:8 a=BCplEXKlVN96cb3_cC0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAzMCBTYWx0ZWRfX35x0u8VMHKFs
 VHRAkub81XpHU98ydWCv5yPl6ggL4dOpQya+3qACMlQWUpJ6v4EO+ptoaMylUEMahMV4MlgsGQk
 32LcoBmLx3LURaAwCGwxASpw0b49x6pLHjQyW3XWsfAliHO/ECqKF8bctMKksgh8PZCkKdGL94S
 GjqxpzLqWISq5n6+EuBwyrxICA9yRoW2XU1Z41h1Y3BrYcqX9jSB8A+6BDyh2tu6CtRebNzhsEJ
 +ruVpPLnXLSh03rHLfSgIyCph1o89FHgd6CHMr5ZYu8CBNJIsSqlQ8Wr9oD5YNp+O/fJR79nJmv
 VOc+ppl1Yzh0SDeJ8dawwBOl9qFeLBVjNNAUDsGzJaWB8vCKrN31bDG1XQsMnAOaw7QpWfejiuH
 ZRa604SYvPnYU3wI2g1Zv2y/fGF8yiGtogG3is4LpOtVZYEo08VbuNjBrGu15ezNMogLac5XQrH
 wtXnxrxN+1oCCsW5XGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100030
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 02:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20362

Backport a set of kernel patches to 6.6 to fix the OpenSSL build
failures.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-move-common-SSL-helper-functions-to-a-header.patch | 2 ++
 .../0002-avoid-using-deprecated-ERR_get_error_line.patch    | 0
 .../0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch      | 0
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb        | 6 ++++++
 4 files changed, 8 insertions(+)
 copy {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch (99%)
 copy {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch (100%)
 copy {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch (100%)

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch b/meta-beagle/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
similarity index 99%
copy from meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
copy to meta-beagle/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
index 8e8ac7be..6a58b5eb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
+++ b/meta-beagle/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
@@ -11,6 +11,8 @@ Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
 Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
 Reviewed-by: Neal Gompa <neal@gompa.dev>
 Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+
+Upstream-Status: Inappropriate [OE specific]
 ---
  MAINTAINERS          |  1 +
  certs/Makefile       |  2 +-
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch b/meta-beagle/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
copy to meta-beagle/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch b/meta-beagle/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
copy to meta-beagle/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index 37626a1d..86af17d3 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -69,3 +69,9 @@ KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
 
 SRC_URI += "file://no-fortify.cfg"
 KERNEL_CONFIG_FRAGMENTS += "${UNPACKDIR}/no-fortify.cfg"
+
+SRC_URI += "\
+    file://0001-move-common-SSL-helper-functions-to-a-header.patch \
+    file://0002-avoid-using-deprecated-ERR_get_error_line.patch \
+    file://0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch \
+"
-- 
2.43.0


