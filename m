Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB3CC44511
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 17:02:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17971.1784221333399686785
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 10:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VJRhzPlt;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MKV00c+c;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGWpTe111506;
	Thu, 16 Jul 2026 12:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=cq9nz6Bnst4M4
	Gt5XwDMCMC7d1Rucc7uduuoN1mrgsM=; b=VJRhzPltncvOuOhWM90N1KYRpqSt+
	TORlhDjzykowLYwCoLUe9PscUVCkF/2vR8BPnLUQpgkcohEx1gxu+2aGkca+1lWu
	b7opA0YY/EECjOZNtgvcFwMwfeZfY9YZ487tmrFCDpVo8bhLk+zY3MYCFtrEbShK
	/ItM+jQlwfmBBbsZsBeF/ityNddlNuOAmKAf6H43U8xPDxPYWiNVk/AJfule+alH
	JhwBOqzSBztpx0UEfJlG9zh9mdgKQjYK7wNGSU2SqrAEgJZNw0ofz5iEhek0BDwz
	99Fc9wb6vq8wgDA/5CcBtFQ92d5g4YgB7EK0n1wuqgtVya+4f3NPN8Z9w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ff2ccrbty-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 12:02:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbF2ND6OKu1jrZC7hOpT0JZ0IlWKCBbe/d39EaXUuS5YIWovh+1LO3MZYhMgrpjY7DYIscuUXVUEkzA/v0G0CJ7SpRVPGBw/+M+hsVp2wG7LrTDhMltLUxJbYxTt85b+Z3EuQiQl/RGMcSMxF+1OrrgZvKwt0/cIdcnUgt/vxt7rhatF7N8pTTonwtx00DxyYOe+QIeQNgwrUhX7/mBsSb/ngpBzjvfh3kGdCJIUWomPWlBE2xCNAmlhU6zQTShXZQsRVZa+OpXK19BzndlcKhIHaAcNx0lxt+lh9NaXhZfl5TyDN+L2cs+v7igR0sH/SW8//IL5QI+Cz7QYylwXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq9nz6Bnst4M4Gt5XwDMCMC7d1Rucc7uduuoN1mrgsM=;
 b=RKzhwZQwX1eDY23yCLmBmuS8uA/KdPxIl/dIve9LaTjaZnypT+Kgl5TiYHzxJ3hoKHA05bspokn2HiRkHEqcYwP5kUStFMtsEBrdNoTlhgMxFI93p8TrqwNFiSqAKlmJjnJgsOkSNjB1VrZTfHvEnZLT6Jf2k+gm7LlDFewslVbvbxcLUQ5TBtHMlt2b3Mh2UwMxH6yGVvXspp4x6WYtPIuyM1JfsC+JdqIvE7dj/i9e0xZJCQQYI10zb+FyiN9pCI4CGQ8+nQMfJwQtecwA7DWOz2lDAKtIrUCt6qBEEuDOqLVjzM90kmCyLW/PZqxQgf2j2SLh57nzesDezcK98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq9nz6Bnst4M4Gt5XwDMCMC7d1Rucc7uduuoN1mrgsM=;
 b=MKV00c+c4q1V0A331tOfKJi0Z0Si+tq/OnkrKaiRuUQBe75DEK+XhcesJcPuIwPERyL/EU3q1D/60wYEZyjAhtKCVbUhGU7aMSzVsT5xmEMmG1k3ifwqC4i9bpJPxhmZAsnHE1BfHRktjvZSpvpJ7kwT9WpSG+fJDXhilBt3QNo=
Received: from DS7P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::13) by
 DM3PPF0275307EB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 17:02:08 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::12) by DS7P220CA0009.outlook.office365.com
 (2603:10b6:8:1ca::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 17:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 17:02:06 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 12:01:24 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 12:01:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 12:01:24 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66GH1OZH1219357;
	Thu, 16 Jul 2026 12:01:24 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <a-christidis@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] ti-img-rogue-umlibs: rprovide virtual-opencl-icd
Date: Thu, 16 Jul 2026 12:01:19 -0500
Message-ID: <20260716170119.396983-1-rs@ti.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DM3PPF0275307EB:EE_
X-MS-Office365-Filtering-Correlation-Id: f97118ac-7b57-4d3d-b42d-08dee35bf788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|18002099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zD6Jfg6tEa4po2GqOKc1A6FwqcSXfS0M/Pu5+OLRdJ+9NAOH5w7mANgrRNUIHms2r+cLecEaAsw5MX3nl91Qr72a+VW4b/HW6rrJ8tUYn3pqJMogcSX15d78Z2zdjQJ7LBa7ba6Hjnnnw+h09UAoFE3KX5R0Q1IevtjmxLvYmDCDxZw3KYa9eai4n5Nnc/kUp2uvy0b01wK7LqjlEL1adEpiuijzymOaR/yYoIy2Xy3kZcTrnA2tUypNAUhzIQT4hbf41ohPkgZ+qZ+lImqGAIEELiEmOwyHNmCvMcus2uRHGeGk5bObiwKHmheUod+GHbMqs8JTq9epdZuYaiUSvxH74rl/MvK+DfRtUnMd2GQELIaaJOxwFeh4RF1d2/Qv0yYb9SAZ+WIDbpnz2e/GQMB0+YWs9yzfUHeFz3vOBVjJKgBlLQbhR7/jmXTbnZrPHGwMPkVtOnu3OUqerK3IARd2c+gdIygMfBsx8RZMV9tK0MCSfRnfCb33vyBEMBBSs8LBKSqU4Wda0ZJkE9AQ+kbeL/LQFqwLV+eo9eOSeQXu6a8+mXvp0yFdrdXuEtALnjgpRph1WGcOLDkCh8n/lFoDOMWIe0IMQ9xdrhGvhg1kjniQVJpz1yNe3HiZ8dy+Ue1RTU5/+aGl8eutT/oI1FqBCTffzPUDmh8VyrmLWQlmblvJehWj3qcT++12Pr0bxhubB2K2zAjIczf/WwgNJA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(18002099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8M2QjryPY28NyuNTYNxtkzRNORHPP058HrE+1C2TQ4YKe+lzslElkYf73CKKVkxgPeAMoySSrKnB+jqE0LJshFVDYzMiy9mZ11t97y3SXXXlW5QFVgu5isaTBInKU7GcosIwz6BpF0xYU8rqaHOjhu0eyuHxabQC++904e/CjbHmQC2yOtG86kVNbB3AWVD8EJspoX+bPNzwaQuHKnpeq29A3y6i2fMsUjgxfbXiRb/AesmKqqzPqTWN9A3jok7iv/EEVsL1exNrQLLkxru2ohGdOg2NRgU4ZxixXb1s1rjUCdHc8JVZdUJ9rpOKLKoGVcJryM5kSP+J1nUaSGetVSa3zUhimOYCAzmEd+YKD+VRGdzeuZQ+JomYNFJDLuS8pD9CuN4aIoL5HldDYDipHEn0DGmw8DWw3wygFRRQqcHCZ0ScE8OLpGzBAuJQd8+Q
X-Exchange-RoutingPolicyChecked: 
	r7BE6kQ8GTiOabaC950WHyGJ7DoNDGs56T9beL7QThWXy02z978/m3/lnYKBwWiubmGtEtg/El/V+OdN6pn7+0hJ3glp9mZh8l7YvMXD0PZBUelL8e5Bq4qjoZNrOxTYln2a3co/4DWYcW4FpwvPo9egQxL5YfK6bjth98gSNlkyJbkj0ZUmJdT/F/i47XuKd8lzYXdeb83Mupz0uMtxDl/vUYGRjg6nSrAiswdiCl9NmMti0Ff3D+Rq2Xe2MjpzrGSpESCTkPSx7y9GwJyNnXjdseeypwPGxfgsFvyg2iSbT91uDcikRq8yN6sTkDOZEugf1B/kCItISzBrYvbzwg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 17:02:06.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f97118ac-7b57-4d3d-b42d-08dee35bf788
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0275307EB
X-Authority-Analysis: v=2.4 cv=NtvhtcdJ c=1 sm=1 tr=0 ts=6a590e92 cx=c_pps
 a=IyT5loBvHZYA5YPQi3EYsQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=gbI9bDuWXlta7OHM1KIA:9
X-Proofpoint-ORIG-GUID: cSkHGnSFe9APHJsZJ-6XxF71lhlZy3IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3NCBTYWx0ZWRfX0A4mUhOVRhCk
 biALfzkRmUzhPgYIWreijiY/cNGnakS9ifEwVjjlCLYMb2tRxlV10sLuBav+GZ7uiMk+JQca7+O
 N2ABKpUoRq7hwg1KjmQ1mDcbDkQiDM6Jrsc7jsULWINzTsgjDTyXFb8ynct5lyygfi88TBOli65
 z3hpEKDGfOQZ/8Fgx5/jgxEfpk5efKmppyNXAwqV4sJ456BcO7163TEly8c5Q9Nr6kp1Abt3BI/
 /SrEZeDbDTh7mXzInVl4MI1Ud/knTjgbq7vNvp2MiysJLqrQ+B/kAxqCEE9zvsR2q3P4siy8HSZ
 jeFM8D0h7F5QhcFsxqzfVuqmLOMPhF54TXJZ+rBY9M9AnuuUkAyPLtCfHr7kvQ3cD0K+PlMXiFw
 CwFFdnoJYdm9sQHMtRhmi7xrxt2FVjNnsPgvc6dxWdvlLqdtzGfEiihA0loWGceUNxJdv44Utmc
 m8HhdFwXg5hV8Grp5Lg==
X-Proofpoint-GUID: cSkHGnSFe9APHJsZJ-6XxF71lhlZy3IZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3NCBTYWx0ZWRfX1fBTVXEksLLS
 gi0rza5JApInrbX0IfUbpERgnDzJubbWhkaLCq0d9o0DfOOisHs7FDn9f3iZLoYUU3EJuTOTtxE
 /LLg/CJmLWWo683/VvW1zZCA1s1Gh4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160174
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jul 2026 17:02:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20151

From: Randolph Sapp <rs@ti.com>

As this provides a valid icd interface we can mark this as RPROVIDES
virtual-opencl-icd. This prevents us from unnecessarily installing
rusticl due to an RRECOMMENDS chain.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb           | 1 +
 .../powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
index 5246f5880d29..fad296915c25 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.6908880.bb
@@ -129,6 +129,7 @@ RDEPENDS:libvk-rogue += "vulkan-loader wayland libdrm"
 FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
 RDEPENDS:libopencl-rogue += "opencl-icd-loader"
 RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
+RPROVIDES:libopencl-rogue += "virtual-opencl-icd"
 FILES:libopencl-rogue-tools += "${bindir}/ocl*"
 DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
 INSANE_SKIP:libopencl-rogue-tools = "ldflags"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
index ff631c2d3cdf..29c5154fb51a 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
@@ -129,6 +129,7 @@ RDEPENDS:libvk-rogue += "vulkan-loader wayland libdrm"
 FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
 RDEPENDS:libopencl-rogue += "opencl-icd-loader"
 RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
+RPROVIDES:libopencl-rogue += "virtual-opencl-icd"
 FILES:libopencl-rogue-tools += "${bindir}/ocl*"
 DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
 INSANE_SKIP:libopencl-rogue-tools = "ldflags"
-- 
2.55.0


