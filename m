Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD55C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:11:22 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12369.1785247878333524326
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 07:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=I6qA+5oU;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=uKvdvExs;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPccj4118775;
	Tue, 28 Jul 2026 09:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=CLnchZVKoR/2M
	/bU10jFSUgiDui3KGsUAaqGB0ZScjQ=; b=I6qA+5oUoqirlDPjlew14SuxVTEti
	fX/4yWkcGWHhEK7ffsVzkdkB2y62X3oMDLByctkf2OiHfsMYz9ZDo/ph15tjkSxT
	4WzqGT2ZB3QVzS5Kmpbr9Y+G+TNXKpXihSorgn2yzjVYs8cM/NKZMeNVKLB7hSLe
	fyDhWs6DObTALwGR69/ZwOmgZcVrvAU2IuUeTf4VuZHj0DtfF8MWxDSujv14kvpV
	PkQojLx9ves5u3H9pXmldEnIQ62erUM0roAeay/lpU272sJhEheP2+Y6zmY9/LMr
	Krj1oTBjSZge3xMnCGFfXf5Jn0fnIqvJO7K9xGnrCz6+o+oBtDUGNUrWQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb1m57-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 09:11:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLitAeHGnDFA1HCjSriBb6kswmJOpHaEEiJOm27T+YAdBZGUYwhY9buyPj4QZetFCiDAsGfuda4I4Om3tKAnz6pslYyp51hH5pDy+ZC56y6XWOPxdLEuBuXWL9HpJzWiLmtNTTDxt9O+dl87CVRO0dN0bEliiFCx0oCEj/PNKPvXYikXFtB+pQBnwmcok96spJT1zKVLAUDQo1wrEXV/jfbukXmj4nlUCmubKhnWGAQKjB9jSJgiI1mwqiJ2NSwoKgdKtMKCbjqn8i1S/W8ALrDkTmdcizt6DTd7JJ2kb6Yxo+WGTbzMNCdv6ydYo84JgUPtr/x24O40mSIZbAxrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLnchZVKoR/2M/bU10jFSUgiDui3KGsUAaqGB0ZScjQ=;
 b=kuazS+fU3Jd6IHMm18dqY0Nw3RaDJ8TUa9Sm4zqFVwBSTnnElqEaWyOynxgPC+25Rfdw9G7bBQrlm1jRhUjtZbMwSXS5h6cNQ+7IKzhmy8uLcK/7Ccm65CK1VoLmaMqgMOHdz9EtfCCrjcClxSZrsmLpJhIQGYSZ/F8cAZ/CMhJXVBx0NTvIFXqRx8Jb7TYs1R3bHDLqztLCwPnQGy/pKl7BILOSd/MHhGnL8scFXBZVJZyj1HN7qeZCTstC8w3IQ3Pn/RCk9CP1T04UTNEnrjnAHjBP+Yq9gRHwkeSgBOfYWWSMol+TkK0aMYF056ic8+9v2ZeBxAdXeTyQADXgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLnchZVKoR/2M/bU10jFSUgiDui3KGsUAaqGB0ZScjQ=;
 b=uKvdvExsYnjg7zTgwdqbJSq6cfjyJ+k7fVFYebrLHRasfhH0nuMoHhRxaJntc7uXAFtYt7hka5D5YWJoheoEQ80+Ox9nsAyNdMDxzzDcfTc4UNlNZgaZtlaPI1u4yzbI2vzExd/zUEj9Nqaz//IXON96fXZKEtri4Uxp+WJN3Nc=
Received: from BN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:e4::31)
 by PH0PR10MB997569.namprd10.prod.outlook.com (2603:10b6:510:37f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:11:14 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::6e) by BN0PR02CA0026.outlook.office365.com
 (2603:10b6:408:e4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 14:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 14:11:13 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:10:51 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:10:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 09:10:51 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SEApYL3458644;
	Tue, 28 Jul 2026 09:10:51 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1woiWB-0000000BxiC-1IDd;
	Tue, 28 Jul 2026 09:10:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH 1/2] =?UTF-8?q?packagegroup-ti-co?= =?UTF-8?q?re-initramfs:=C2=A0Move=20the=20inclusion=20of=20initramfs-modu?= =?UTF-8?q?le-netsetup?=
Date: Tue, 28 Jul 2026 09:10:50 -0500
Message-ID: <20260728141051.2851131-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|PH0PR10MB997569:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b57ac96-23a6-4f05-ca56-08deecb214dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8ffbMx/3nzUACEaJY86+ID71D2LPFsdMQ3sGrwWsmYb0Z1H8qzI3/mggMtSOW4HoQl+zyRik9DFTLtsNZa/BigvPkGwFlcMA0YL9SNStGwKQyvlFMjM8+gRU3t5mzSLga25+UMFXHL5vL+2aHbnzGwRZz1ugZHjoy+RPyvxHbV2VhXXXMaJDQh/joewnVB7oZrcCdBhJ8T3PXuqsiMIf2mckzkstu1Z+ODuE9AAH3OjEZhcJG6O96gdu8rCxXelkgAePUcCm4SeOqosPL3li9Gzm8Za6WOkbQCKydVc7vHQCyBuJKVHw8Yn4LqGoBCAv7CDD6bHRgXDsckHvuILIOauNY/znQ2RWshZ4h2YE2PEFBXAjMaKMZIp3d+/MeHGVK0icEdd+YM3NdBbU1iAH8mOLzD7UQf40h4LljZnVMj0iOlxuxX2kCyo/Utmw/Bljhjg25tqvYor8vfQkiQoWr5Feb1isWS+8bma116cEikANEzTna6HrpJrhbYkUUmuxHIv6hyIdfktDMt9Ym1rgX/RaHgTiTWZRTQcChCJVeyaYhW8luXfEnRPR+IZnTBJDO+d5uVzNOsVMd2lBHcdjxeAE0gRzKOVw8EF6BGXi7CB2ve59dphBwl1S257N8W27oOB4Ri/z04bUVZw3zvM6OAeH5ox392GfS+AjyWX1URxngILGlPnri9qADCRdRjaCeHM0KyDuGuHo5a2o8WhPbw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5OXf/LNSKhnJ+39n283lYihnk/fTA4jJQ3c0zF3A77ya2+nZlcJvY/yyrYS7FQifbyr4lKJ269CHXPn3h7JcYTgwrivgPIeYiX2VIwWaqtGGvhHF5WW5H0Pm13fHkJDY9VaU7tX72s5XO6nw0/U9saKQiQe83x7P+OhoRSPGPLTy1tPIN2Y6YvWiPp6u1ytK/LvcGWRpxs2ytbIz0FUXKhbLd7ffyx/YLUtUZK791zx6yzJAlCbmw8/3bPZyAnUksHEdm0bEPW4y8OivDKt5H+AoFZJ+GFl7mV8JuOZpU5gczXOoTjs4aJidB5NRyoYxF4PE13z3I4HUjmQXHm6eQp9HyfzbaV1tKXK65c+hyats552VIrojCti4dr0fEkteR5ybNT4zEUzUnbHJy8YWT4foElOsXJKmZct1m5CQ1n0S+yN/0pXp+frl9t0wAFw/
X-Exchange-RoutingPolicyChecked: 
	ZW8On3sKYgyTl0HfCMbV0pcgTeF5i4QcepMkAjf2BBHDjs2efTDzDJlTq8Ly2sAr1IZnnxQock3PP0iALt5kB5J8NNRifCMm8fWuO7kL2SbKa9hFYbNPsgdyDCFw9fjcjouHgIUMOq+sM4d8ouYCXdbjTpA9bas82Z/L6bkceO8vEcyuVMXX4/xyelQ8zTntIMwMoIg9dmK9Ya5G1IHvKn/T++WDAjEE1hTk/64aA7FWP9XVjyc8wSVhAsnZMKcw+EPRavK32EkOoSsvMdMbEiDjk0XtY0dSIUHDI+kWFGo/kArasMA+gGi0wssb/G2kTP3QShmfE4PXg00Jz+Ubhg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:11:13.0388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b57ac96-23a6-4f05-ca56-08deecb214dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997569
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a68b884 cx=c_pps
 a=TQumU+mCWarTt0EIZfG+ng==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=5KLPUuaC_9wA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=X38TZnBBf72-zIk4YpgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9QfXHX_Q2Cdo4Y8WMrB8sArrwK3HLItV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX1dAMMsDcEpWe
 ZWbqlom4byCFK0mYcGc2Q/8PJFLqqF7KUx7qHjSW0rjuy4IMrI6ql5psxkCYA6YkKADeoFJvIwb
 2ZLm1LUaPfDKy5fm77byOPIXUJfktZI=
X-Proofpoint-GUID: 9QfXHX_Q2Cdo4Y8WMrB8sArrwK3HLItV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX56GxPb9HKOIE
 EZ/yjUhHfmakecB/teU8X41H2g2leRB2dWBYXiD0ydh3YKxSs3bj8Hb0BQfwREcNmHpXXEJVrWS
 E92XCqSRPv4cZXQq46S/8cWI/qxWScr7UnoDhlA1N+/vIipdYAVYohShI/O0/zSOL3n1wYQ5kky
 tfg8pcv44/Mo2jOrW/70bmbBqrmgstbOoQ6+IsoXOO/A3wmuQY+Y21jCE0U0zyozz16Uxgxnmm/
 0shzID9vxP7OBmS+ziXURUoHp8AFAj9yY0L75kkxmTPEKxGIOV8rV9ZZICk6ztV3woYFCM+s0sK
 Fkf2jjP2I+GnOd11RsrfikptxVTfBcTKiZd/8eGGgfcspASePrED+C64NrK1fh1Se8VS+Zf4pLD
 pxJlBYCf0QXHvl9qXzV2NqerHK7qyopOJY17lTTt/C6yrBPMn6L8e2A+YTidE97dl+a3XT5QGcc
 dls4RH2MUgxEqf5nXKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280126
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 14:11:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20196

The list of what modules are required for the initramfs has changed as
of 7.1.  The CPSW driver is no longer built into the kernel and is
required to be built as a module and included in the initramfs for all K3
boards.

While the existing solution for including initramfs-module-netsetup was
fine, it did not trigger the building of initramfs for all k3 platforms.
It would just include it if the ti-core-initramfs was built.

This change tells the system to build and include the needed packages
for all k3 and makes sure that the ti-core-initramfs is built for all of
them.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc                        | 3 +++
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 6833789c..2ebbfb9e 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -31,6 +31,9 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-image ti-kernel-fitimage"
 
+TI_CORE_INITRAMFS_EXTRA_INSTALL:append:bsp-mainline = " initramfs-module-netsetup"
+TI_CORE_INITRAMFS_EXTRA_INSTALL:append:bsp-next = " initramfs-module-netsetup"
+
 TFA_PLATFORM = "k3"
 
 # Use the expected value of the ubifs filesystem's volume name in the kernel
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index b4e6adff..a9eff847 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -23,5 +23,3 @@ RDEPENDS:${PN} += "\
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
 "
-
-RDEPENDS:${PN}:append:bsp-next = " initramfs-module-netsetup"
-- 
2.43.0


