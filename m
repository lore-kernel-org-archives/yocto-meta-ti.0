Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18D2C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:59:08 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3431.1789001938742358312
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jFfMYUxa;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=U80LRv5G;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689M9scn1486130;
	Wed, 9 Sep 2026 19:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k3cFLufxfUdJ52wqRJzLYUi3SS3rHx+Ea4EUaP1Fp
	Ow=; b=jFfMYUxa+05EzZUed6mUdcmpI4Es6SPDHu5mgrERBoaPuz1qPB+EBV7/u
	Wx8SCzWeJQlTsNRcvJscodn1OzZUFcWdxwdLMDRg3mw4LcBfXSzUlmQnT2g71Eag
	4o4JSDYt3X/iRQTuGt6N6pFW4Hyb38FX9mIo8iGaVsZX9AdMQW57yxGgzPQyLllE
	TyQyR0Ky82cJ8SuSFMeicFGaW5f3GGJSo7wOtIDJmfoAC0Xr8qxrOOXaIwOA2GN+
	RFhPtDa8hYv6o9uZDaxXHtKmxdhtXd3F4V2lAV6+jFzHcEdd6EsdM5TyG/ewy1+k
	rsEkm3NleVcDeRCG1+PG8qqc/YIvA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxesype-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:58:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fp2bJGO2TFakGUBVB0gf4dm1DNXYwDc79f09F+FnYjifCNPFvpTQF7yXWiraM3/jirH2eUxm4bYRNOLRBWWAjVtILjnpePiVQvW1GaEnSXbmB+qTssoRExF0ShVQrxpgwRHB7JpZ3NGsARQnD5TiZUKxR7hkn/vrOezrXH3s1K0QAqxRnITgjfdau8+zcWB1HSDUP7EedHaApmhqisLt4GGNd+LLPuO1noI/xSGo8DS9a1gF3/exowFQiNPPybNVQgSsr+cNe5Xuv7aqgEcNFln4+SpuCG6D12P+jXN/JIErZz+EDsi3+SRRz4DVkK1lWSI4lkgbuAGmbEkL1qecVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3cFLufxfUdJ52wqRJzLYUi3SS3rHx+Ea4EUaP1FpOw=;
 b=IYqhcadysXH2mjuYqIKRTGKM7FGYLbHx/7HnzIwbibu2Sz0gy/SHLjpPbV2UkEthOcNpm1Vh66FGkI49S4umqkyVkbp7itf1YW3QGKX210IHOJXzenAZ/LgqrY/LM0u3u7gOGCNgMWvnkgs7SJFMQbNSLSBTuIzU4SPgHOsoNdtqKoJxzb/6jZS+5vNDdm3euItObokQnlnJr+9jUaCPq64Ih/HsaEZICqxDn8L43yxLLIB2fChx+KlJgWCqNf992vsxbK6PZrY7KEN1lSpTMl2r55bYTWMO/0bUq+g8rd4W06Uzn7srWcEZ3M9QYE3dcAGQXpVl8YM/CSDVaP7DmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3cFLufxfUdJ52wqRJzLYUi3SS3rHx+Ea4EUaP1FpOw=;
 b=U80LRv5GHCdKSwgOMQgJ5CDlZpPKoVSERq49Ah16iNRYSoPL8TAahllmu4zkDfAgxxKukwEVk5QVQRplMOr4Z6+0EC3VucF8iC/KzfP3dxTgqdfjbCsTS0lga9ZXTriRyUskf4qG7Ia4BF3w+FZh4YUmYzZtlUf8zoR9sFMm57U=
Received: from BN1PR13CA0007.namprd13.prod.outlook.com (2603:10b6:408:e2::12)
 by CY8PR10MB7171.namprd10.prod.outlook.com (2603:10b6:930:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 00:58:49 +0000
Received: from BN7PEPF00000095.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::a2) by BN1PR13CA0007.outlook.office365.com
 (2603:10b6:408:e2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Thu, 10
 Sep 2026 00:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN7PEPF00000095.mail.protection.outlook.com (10.167.245.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:58:48 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wMso2306716;
	Wed, 9 Sep 2026 19:58:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7O-0000000GEw3-0TZz;
	Wed, 09 Sep 2026 19:58:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/5] linux-ti-staging_6.6: Backport OpenSSL 4.0 patches
Date: Wed, 9 Sep 2026 19:58:17 -0500
Message-ID: <20260910005822.3867633-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910005822.3867633-1-reatmon@ti.com>
References: <20260910005822.3867633-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000095:EE_|CY8PR10MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 650fe969-7f7a-4212-8c55-08df0ed6ac8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|10067099003|6133799003|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	UnYfnXsnGmX9z3ax40RShPJTBlzVwSW/tzcUf7Pzi7JxO8WcJt2ocPSAe2TAwrD2Z+nIlVg3a1R8dtbyxPTGpTNxkMgEI5YdNqBaCIJ3B/L2DQbTLALHqbaBrTbEo7gAAG/IIrueHWoN+Kv2yU3IqYzpVKpb0QV1Df3NzchdnZEZspWGSkvxZ+ofg1zsqAuUIUST1m44G4crRG6GR7PTItSTCXUfDaxGpSNfnS5DkVN7/Ct0TPrWkWkfLuvfg5qOAEIljx3zHm/vq9QXgXgI+Rw6dG7aMuRJKm/EBsS4yBKSzUrxDTQhHspHAzUj3Wp+qtXdOA1qlrhrQ5nHrVE9TceJkFyfxNK7qWsPdDE+VPtOxFyR0kn9s9NpcZqGZABkTlyAg15+30Mi9Ucz/9A0eha5UOwrsORZYHztYWuevEk4bbSDVk7AEYZp89qaop0AwOOjpA8ttCVnffXXW6n03qrdyPXPdVDhSvoJubT/Agb0nw1MgoGTPAHTkhURalnm2ek1cZXxiBgU52tW00QjM0uULS1HqDKv9kQIJfN/p1yRwSlBa/J8bz2bGbsi43YHYyO43HrRDXpyNOrfa8evkns+mDHw51M7m86mrlIrO+5Dq9QXrF3FvJvGq2IyO8378jAUmhLHuSDD25o/5cbVxNfTMErPNPgIfL1IIAg/2TpgMKgVCCgz9uO6gt8Hi9QqhjogYZ/w+mRMqFxGR2Z0zg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vPWF+CQ9GVrpJOTJdMs1tPC4puQrPye24HUDs36M7IEJqDUy0Z0B0CnzL6gOV+eOl0Ji59PooB1cFjT052DjI1e2NIYPukFVedVDOeq6hGAr1LRWwedqgecTqNi+llWIamxATuXcgZaAONBvgfI4r9s2nxU5o0tlZgBcyM/6VEYe1W/WgXRX9tAjrEEtECFLGWaj2CcuHjPhrJ2ejvqQA3MiBw8kEt2VB+zBpyjI0nO3ugr8unKkqhCs8aSr8YMF+DYwAybf+1jFOQvO/VuZLkf9ZDm9oXL1cwoc4CaGa7vxUTQlSLPYWUIfVEUtaIG5NYVoX/2mt83KsCOUie5TG7i8vOjVMlcBpqj5HPruXmq2OMkxbZwLm4Fy0aHGh7mwuEEdCPQBxWA9XOwdwgqdWpOpYXqG6lbGGHhvoYmSuDNCHyzIPMgijNSBF5FfDZtx
X-Exchange-RoutingPolicyChecked: 
	H+7U+ibDYSAA8+MPpRvLJoEm1aJUHnu1iSnOIYJTSM/ZY6gfjxHcN5oLQQf37gdfXvajmkcV5bl/S8ckJ/Bn/0px/jQ64kyFHDk4mWuaBzAOAMkGFsr+rLisKVIRT9ke6XjFzhtuN+RwBXPEMQR1DLoWNoXWkghvd3ytchTJ4cYIMbbRgAk/FfmQ2Qd6wP5pLepK1Piha+y1cm6t6quuGxqv3pvcGaFcohxUEb3iKyxrgkIZMXC3XRm+Ne878POsTcTbLzHh6MHUZEMpKjX3jnsa6xd5nnbNrp16MYf6WiHWjDPpEbco4PquvXXZ7FUMGbPkghUGiVEllC7HeTKocQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:58:48.9515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 650fe969-7f7a-4212-8c55-08df0ed6ac8d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF00000095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7171
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOCBTYWx0ZWRfX2NC5D2z60MCc
 ZrcY/hVKjMHJEjFDtfhs3s/Ex0/owApdWozrGl74L5SbaplB0Lt2ktgRuL9aZfpo9rCcRAroBWG
 C5Be6W74I6iKhGAxH6+Y4OQhg7Maep4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOCBTYWx0ZWRfX++7wB4z3+gGe
 Hcj9MAxR2sNhIr8QrRYPd8FJb5enOSoGIlJG2C3YX4xTm1nLfKgXTfv91LVUQUFQlo/n5if79r2
 /OsGmEAJhPRg9NxZvL29y/m8QO9lIEXx0J1vEmnBG83Vho37YjY0fKpzI+ZEe6rScZLsVOB+Qfa
 P37KkocIz4Ep/3oj9a4aPqaXX+l1I3W1y8+d9gKl0QvqW40ien7Ff61wIo9M5q2wGx2Ay2ql50N
 j0XT9ft2aLNx5e89U0XRH8b6nXERyfF09tLMrgRKyVjG+1kL+zbV4w2sdlM2ZUX7M089mefshEF
 zLOnE+/S+Upg5rj625dZa8wN78g023dnFvSDUCzMmRfldc0I3sTpHkaG0P5FbTeCUlquKYbRLeg
 QSVSArzF5dLbGW+KUUOyZEwnH5mvcWH/a84WBBawYfLwvTqHyl4kJuAR4YRbGsOpt9kXVEXDXYw
 jT05THBfH0GugfpzZqA==
X-Proofpoint-GUID: J8ODb8G2f5dfJ33HDTF5NlWv12UJ8CEd
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa200d1 cx=c_pps
 a=aQYToRbhQZUme44wGBfxuw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=FOZC9FOpAAAA:20 a=sozttTNsAAAA:8 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=l8scnuim6UHnXm2-afMA:9
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: J8ODb8G2f5dfJ33HDTF5NlWv12UJ8CEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:59:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20351

Backport a set of kernel patches to 6.6 to fix the OpenSSL build
failures.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...mon-SSL-helper-functions-to-a-header.patch | 203 ++++++++++++++++++
 ...-using-deprecated-ERR_get_error_line.patch | 121 +++++++++++
 ...-pkcs11-provider-for-OPENSSL-MAJOR-3.patch | 163 ++++++++++++++
 .../linux/linux-ti-staging_6.6.bb             |   6 +
 4 files changed, 493 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
new file mode 100644
index 00000000..8e8ac7be
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
@@ -0,0 +1,203 @@
+From 300e6d4116f956b035281ec94297dc4dc8d4e1d3 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Fri, 12 Jul 2024 09:11:14 +0200
+Subject: sign-file,extract-cert: move common SSL helper functions to a header
+
+Couple error handling helpers are repeated in both tools, so
+move them to a common header.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
+Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
+Reviewed-by: Neal Gompa <neal@gompa.dev>
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+---
+ MAINTAINERS          |  1 +
+ certs/Makefile       |  2 +-
+ certs/extract-cert.c | 37 ++-----------------------------------
+ scripts/sign-file.c  | 37 ++-----------------------------------
+ scripts/ssl-common.h | 39 +++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 45 insertions(+), 71 deletions(-)
+ create mode 100644 scripts/ssl-common.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 9278c30ef1d5a..23f9028848552 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -5204,6 +5204,7 @@ S:	Maintained
+ F:	Documentation/admin-guide/module-signing.rst
+ F:	certs/
+ F:	scripts/sign-file.c
++F:	scripts/ssl-common.h
+ F:	tools/certs/
+ 
+ CFAG12864B LCD DRIVER
+diff --git a/certs/Makefile b/certs/Makefile
+index 1094e3860c2a7..f6fa4d8d75e05 100644
+--- a/certs/Makefile
++++ b/certs/Makefile
+@@ -84,5 +84,5 @@ targets += x509_revocation_list
+ 
+ hostprogs := extract-cert
+ 
+-HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
++HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null) -I$(srctree)/scripts
+ HOSTLDLIBS_extract-cert = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
+diff --git a/certs/extract-cert.c b/certs/extract-cert.c
+index 70e9ec89d87d3..8e7ba9974a1fa 100644
+--- a/certs/extract-cert.c
++++ b/certs/extract-cert.c
+@@ -23,6 +23,8 @@
+ #include <openssl/err.h>
+ #include <openssl/engine.h>
+ 
++#include "ssl-common.h"
++
+ /*
+  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
+  *
+@@ -40,41 +42,6 @@ void format(void)
+ 	exit(2);
+ }
+ 
+-static void display_openssl_errors(int l)
+-{
+-	const char *file;
+-	char buf[120];
+-	int e, line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	fprintf(stderr, "At main.c:%d:\n", l);
+-
+-	while ((e = ERR_get_error_line(&file, &line))) {
+-		ERR_error_string(e, buf);
+-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+-	}
+-}
+-
+-static void drain_openssl_errors(void)
+-{
+-	const char *file;
+-	int line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	while (ERR_get_error_line(&file, &line)) {}
+-}
+-
+-#define ERR(cond, fmt, ...)				\
+-	do {						\
+-		bool __cond = (cond);			\
+-		display_openssl_errors(__LINE__);	\
+-		if (__cond) {				\
+-			err(1, fmt, ## __VA_ARGS__);	\
+-		}					\
+-	} while(0)
+-
+ static const char *key_pass;
+ static BIO *wb;
+ static char *cert_dst;
+diff --git a/scripts/sign-file.c b/scripts/sign-file.c
+index 3edb156ae52c3..39ba58db5d4ea 100644
+--- a/scripts/sign-file.c
++++ b/scripts/sign-file.c
+@@ -29,6 +29,8 @@
+ #include <openssl/err.h>
+ #include <openssl/engine.h>
+ 
++#include "ssl-common.h"
++
+ /*
+  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
+  *
+@@ -83,41 +85,6 @@ void format(void)
+ 	exit(2);
+ }
+ 
+-static void display_openssl_errors(int l)
+-{
+-	const char *file;
+-	char buf[120];
+-	int e, line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	fprintf(stderr, "At main.c:%d:\n", l);
+-
+-	while ((e = ERR_get_error_line(&file, &line))) {
+-		ERR_error_string(e, buf);
+-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+-	}
+-}
+-
+-static void drain_openssl_errors(void)
+-{
+-	const char *file;
+-	int line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	while (ERR_get_error_line(&file, &line)) {}
+-}
+-
+-#define ERR(cond, fmt, ...)				\
+-	do {						\
+-		bool __cond = (cond);			\
+-		display_openssl_errors(__LINE__);	\
+-		if (__cond) {				\
+-			errx(1, fmt, ## __VA_ARGS__);	\
+-		}					\
+-	} while(0)
+-
+ static const char *key_pass;
+ 
+ static int pem_pw_cb(char *buf, int len, int w, void *v)
+diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
+new file mode 100644
+index 0000000000000..e6711c75ed913
+--- /dev/null
++++ b/scripts/ssl-common.h
+@@ -0,0 +1,39 @@
++/* SPDX-License-Identifier: LGPL-2.1+ */
++/*
++ * SSL helper functions shared by sign-file and extract-cert.
++ */
++
++static void display_openssl_errors(int l)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_get_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++	}
++}
++
++static void drain_openssl_errors(void)
++{
++	const char *file;
++	int line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	while (ERR_get_error_line(&file, &line)) {}
++}
++
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		display_openssl_errors(__LINE__);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
+-- 
+cgit 1.3.1-korg
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch b/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
new file mode 100644
index 00000000..993f6739
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
@@ -0,0 +1,121 @@
+From 467d60eddf55588add232feda325da7215ddaf30 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Fri, 12 Jul 2024 09:11:15 +0200
+Subject: sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
+
+ERR_get_error_line() is deprecated since OpenSSL 3.0.
+
+Use ERR_peek_error_line() instead, and combine display_openssl_errors()
+and drain_openssl_errors() to a single function where parameter decides
+if it should consume errors silently.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
+Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
+Reviewed-by: Neal Gompa <neal@gompa.dev>
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+
+Upstream-Status: Inappropriate [OE-specifc]
+---
+ certs/extract-cert.c |  4 ++--
+ scripts/sign-file.c  |  6 +++---
+ scripts/ssl-common.h | 23 ++++++++---------------
+ 3 files changed, 13 insertions(+), 20 deletions(-)
+
+diff --git a/certs/extract-cert.c b/certs/extract-cert.c
+index 8e7ba9974a1fa..61bbe00856717 100644
+--- a/certs/extract-cert.c
++++ b/certs/extract-cert.c
+@@ -99,11 +99,11 @@ int main(int argc, char **argv)
+ 		parms.cert = NULL;
+ 
+ 		ENGINE_load_builtin_engines();
+-		drain_openssl_errors();
++		drain_openssl_errors(__LINE__, 1);
+ 		e = ENGINE_by_id("pkcs11");
+ 		ERR(!e, "Load PKCS#11 ENGINE");
+ 		if (ENGINE_init(e))
+-			drain_openssl_errors();
++			drain_openssl_errors(__LINE__, 1);
+ 		else
+ 			ERR(1, "ENGINE_init");
+ 		if (key_pass)
+diff --git a/scripts/sign-file.c b/scripts/sign-file.c
+index 39ba58db5d4ea..bb3fdf1a617c2 100644
+--- a/scripts/sign-file.c
++++ b/scripts/sign-file.c
+@@ -114,11 +114,11 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
+ 		ENGINE *e;
+ 
+ 		ENGINE_load_builtin_engines();
+-		drain_openssl_errors();
++		drain_openssl_errors(__LINE__, 1);
+ 		e = ENGINE_by_id("pkcs11");
+ 		ERR(!e, "Load PKCS#11 ENGINE");
+ 		if (ENGINE_init(e))
+-			drain_openssl_errors();
++			drain_openssl_errors(__LINE__, 1);
+ 		else
+ 			ERR(1, "ENGINE_init");
+ 		if (key_pass)
+@@ -273,7 +273,7 @@ int main(int argc, char **argv)
+ 
+ 		/* Digest the module data. */
+ 		OpenSSL_add_all_digests();
+-		display_openssl_errors(__LINE__);
++		drain_openssl_errors(__LINE__, 0);
+ 		digest_algo = EVP_get_digestbyname(hash_algo);
+ 		ERR(!digest_algo, "EVP_get_digestbyname");
+ 
+diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
+index e6711c75ed913..2db0e181143cf 100644
+--- a/scripts/ssl-common.h
++++ b/scripts/ssl-common.h
+@@ -3,7 +3,7 @@
+  * SSL helper functions shared by sign-file and extract-cert.
+  */
+ 
+-static void display_openssl_errors(int l)
++static void drain_openssl_errors(int l, int silent)
+ {
+ 	const char *file;
+ 	char buf[120];
+@@ -11,28 +11,21 @@ static void display_openssl_errors(int l)
+ 
+ 	if (ERR_peek_error() == 0)
+ 		return;
+-	fprintf(stderr, "At main.c:%d:\n", l);
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
+ 
+-	while ((e = ERR_get_error_line(&file, &line))) {
++	while ((e = ERR_peek_error_line(&file, &line))) {
+ 		ERR_error_string(e, buf);
+-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
+ 	}
+ }
+ 
+-static void drain_openssl_errors(void)
+-{
+-	const char *file;
+-	int line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	while (ERR_get_error_line(&file, &line)) {}
+-}
+-
+ #define ERR(cond, fmt, ...)				\
+ 	do {						\
+ 		bool __cond = (cond);			\
+-		display_openssl_errors(__LINE__);	\
++		drain_openssl_errors(__LINE__, 0);	\
+ 		if (__cond) {				\
+ 			errx(1, fmt, ## __VA_ARGS__);	\
+ 		}					\
+-- 
+cgit 1.3.1-korg
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch b/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
new file mode 100644
index 00000000..8f509895
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
@@ -0,0 +1,163 @@
+From 558bdc45dfb2669e1741384a0c80be9c82fa052c Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Fri, 20 Sep 2024 19:52:48 +0300
+Subject: sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+ENGINE API has been deprecated since OpenSSL version 3.0 [1].
+Distros have started dropping support from headers and in future
+it will likely disappear also from library.
+
+It has been superseded by the PROVIDER API, so use it instead
+for OPENSSL MAJOR >= 3.
+
+[1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
+
+[jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
+Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
+Reviewed-by: Neal Gompa <neal@gompa.dev>
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+
+Upstream-Status: Inappropriate [OE-specifc]
+---
+ certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 73 insertions(+), 30 deletions(-)
+
+(limited to 'certs/extract-cert.c')
+
+diff --git a/certs/extract-cert.c b/certs/extract-cert.c
+index 61bbe00856717..7d6d468ed6129 100644
+--- a/certs/extract-cert.c
++++ b/certs/extract-cert.c
+@@ -21,17 +21,18 @@
+ #include <openssl/bio.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
+-#include <openssl/engine.h>
+-
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
+ #include "ssl-common.h"
+ 
+-/*
+- * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
+- *
+- * Remove this if/when that API is no longer used
+- */
+-#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
+-
+ #define PKEY_ID_PKCS7 2
+ 
+ static __attribute__((noreturn))
+@@ -61,6 +62,66 @@ static void write_cert(X509 *x509)
+ 		fprintf(stderr, "Extracted cert: %s\n", buf);
+ }
+ 
++static X509 *load_cert_pkcs11(const char *cert_src)
++{
++	X509 *cert = NULL;
++#ifdef USE_PKCS11_PROVIDER
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++
++	store = OSSL_STORE_open(cert_src, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_CERT) {
++			cert = OSSL_STORE_INFO_get1_CERT(info);
++			ERR(!cert, "OSSL_STORE_INFO_get1_CERT");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (cert)
++			break;
++	}
++	OSSL_STORE_close(store);
++#elif defined(USE_PKCS11_ENGINE)
++		ENGINE *e;
++		struct {
++			const char *cert_id;
++			X509 *cert;
++		} parms;
++
++		parms.cert_id = cert_src;
++		parms.cert = NULL;
++
++		ENGINE_load_builtin_engines();
++		drain_openssl_errors(__LINE__, 1);
++		e = ENGINE_by_id("pkcs11");
++		ERR(!e, "Load PKCS#11 ENGINE");
++		if (ENGINE_init(e))
++			drain_openssl_errors(__LINE__, 1);
++		else
++			ERR(1, "ENGINE_init");
++		if (key_pass)
++			ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
++		ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
++		ERR(!parms.cert, "Get X.509 from PKCS#11");
++		cert = parms.cert;
++#else
++		fprintf(stderr, "no pkcs11 engine/provider available\n");
++		exit(1);
++#endif
++	return cert;
++}
++
+ int main(int argc, char **argv)
+ {
+ 	char *cert_src;
+@@ -89,28 +150,10 @@ int main(int argc, char **argv)
+ 		fclose(f);
+ 		exit(0);
+ 	} else if (!strncmp(cert_src, "pkcs11:", 7)) {
+-		ENGINE *e;
+-		struct {
+-			const char *cert_id;
+-			X509 *cert;
+-		} parms;
++		X509 *cert = load_cert_pkcs11(cert_src);
+ 
+-		parms.cert_id = cert_src;
+-		parms.cert = NULL;
+-
+-		ENGINE_load_builtin_engines();
+-		drain_openssl_errors(__LINE__, 1);
+-		e = ENGINE_by_id("pkcs11");
+-		ERR(!e, "Load PKCS#11 ENGINE");
+-		if (ENGINE_init(e))
+-			drain_openssl_errors(__LINE__, 1);
+-		else
+-			ERR(1, "ENGINE_init");
+-		if (key_pass)
+-			ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
+-		ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
+-		ERR(!parms.cert, "Get X.509 from PKCS#11");
+-		write_cert(parms.cert);
++		ERR(!cert, "load_cert_pkcs11 failed");
++		write_cert(cert);
+ 	} else {
+ 		BIO *b;
+ 		X509 *x509;
+-- 
+cgit 1.3.1-korg
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 9acc95c8..3d6b7007 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -28,6 +28,12 @@ KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-vt-conmakehash-improve-reproducibility.patch \
 "
 
+SRC_URI += "\
+    file://0001-move-common-SSL-helper-functions-to-a-header.patch \
+    file://0002-avoid-using-deprecated-ERR_get_error_line.patch \
+    file://0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch \
+"
+
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
-- 
2.43.0


