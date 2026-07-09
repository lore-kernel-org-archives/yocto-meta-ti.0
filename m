Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A67C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 07:18:23 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3718.1783581496997774989
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 00:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Gb20DtkB;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=v9iSmxAo;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: danishanwar@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6696YEZa322893
	for <meta-ti@lists.yoctoproject.org>; Thu, 9 Jul 2026 02:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=8C4m1QxU86hW4
	Hl/DhcCrQm9ADciHSMx8LltJU08cZo=; b=Gb20DtkB7FPFlwItGWkZhJR5cfsR3
	oL1yDlPUM4wJ2rfMyBV1gHwZYH3Fkm698Q4NF2MBDAsRV9Au7HZsiOiUCBVEIu4/
	UyQsSyi11ejX00A0+4mGpthMbTtvPUp89GxUwlBkSHjf6SWRwlZf/dvh/NrOBjB/
	qvn08rHtNzLNKXP6IF4nONNo9Uu+tTmgfMjecVnRdTa0pjqNPQvNkKS3yiQT0nAB
	iq0PfozaBcBxm/gAm0hypTtBWrGMytmjVdRGdOh+eY8ddUYsNDu4GVZxyTXgJi4P
	HOBu5FG6I3McdwZx7TZIDWJlCXp+2XDeSIJGLERTMzVn+Mce0vTNnCM/Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fa3pe14hb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 09 Jul 2026 02:18:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXEB0JJzahV+nlpeZ5LxveSBynPvy1uUu6/pQL8T4JN5i7jNgMY5fuC7KKC+uAgRZ9su3S3qKCU4BCNvVWpGVXUAFHToENnYQlLfi05yyIbeZDt+XxYzmaoe39oBzNH0D9cGfJE/j5hLfWN1/TF7yCxSQJf5PmWuvu50ZkgGQmQOuC/l0L7412bJ288UfCQKjhJ/060X4MgzlyZIJJHU42ZMs++Q+wwuw8BstcMo2UC872FL07c7UsHNjidasulea6UwTJyg2JdhhxD3/JDLCUVpSz0SaoEiUqj5EIyFILsT5SY7VpPyVnVDbeB04DvlLh9Nmgva5NbO1qDvPBcv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8C4m1QxU86hW4Hl/DhcCrQm9ADciHSMx8LltJU08cZo=;
 b=yPlo3z59WX014EiVFnO8a/qJ1IpOah/mrYa4O4MjKQhIlSyc5IXzV7fg4lr0YBaXv8tRPCnSIIcGJjWDulEN5jaud4QTPOwVbL4nWOix5++3uyCXYJrxB4gW0tAdEihpN1M2K3nmqzNdtF0B0XgyPQRBIFWHg+NlVGUomXAVetDmKvQ3/qcSxN40OPlN3tzU7NrO2jaRhLxwCSib2XR4pe6heaeYqiJPpK3q/ZcGR8q7sFHAsqRhfmU/v0IDLKt2nGQ7gGLmBVu3NQmq8PXY7F7eYhDfDL+qxKqC5fJbCVr2vIKnF87Xhb8eYkdzkdZI5Ydgmmvb8xoyMWTlQaqWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8C4m1QxU86hW4Hl/DhcCrQm9ADciHSMx8LltJU08cZo=;
 b=v9iSmxAo7shbvA/LSb3Grhjijaojn4dba/BIDekuEcIAWPtproGtxJLOQtlUiYls2+Kn2vMScL14PVOwU9OUCKme2QcTMKCcTqEHKaVaH9BkgNJBwfykZX1SJIYW+KKv4bxOFWxQ+1SSfxytGWL9ALHvRAbCD8FhPCprkgRZ6PU=
Received: from SJ0PR03CA0046.namprd03.prod.outlook.com (2603:10b6:a03:33e::21)
 by PH7PR10MB6058.namprd10.prod.outlook.com (2603:10b6:510:1fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 07:18:08 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::6a) by SJ0PR03CA0046.outlook.office365.com
 (2603:10b6:a03:33e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 07:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 07:18:07 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 02:18:03 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 02:18:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 02:18:03 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6697I3BE3061497;
	Thu, 9 Jul 2026 02:18:03 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 6697I2rr011211;
	Thu, 9 Jul 2026 02:18:03 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <j-rameshbabu@ti.com>, <reatmon@ti.com>,
        MD Danish Anwar
	<danishanwar@ti.com>
Subject: [meta-ti][wrynose][PATCH v2] ti33x/ti43x: Add prusw-fw for switch mode
Date: Thu, 9 Jul 2026 12:47:59 +0530
Message-ID: <20260709071759.1470961-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH7PR10MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b88a6f-a156-464d-9e03-08dedd8a39c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	kHKE+wL4mVbKdbIGJT76oWrtHEpnrxsA62eapOtHWJ0GGdMWM1nYa2oVLs6SOa6d6HIbwzSUdUK+hvx/CA6OPt5+ckHM4EsX1xKwZwd/dQnSf1ZEtmsqrpWwYQSkUhH4meAejnlVPMKGz0d2zhlTPit44fEcscD+1OiauTAGBr9eytxKlIsUdeSU6UBGmXIu3MHn+md8aH6ZaHEckQGHUa6KxTiTTxSxjpG7Jo+Wv0I9p3H1LUcqbaKU55xmNeXd1m2CoSsMjCJpehvJk7T+RGg30AbMygNr+FTD4s4hXxGVC12i4IPTuDFQV4QH9gOrM0jXUmDIGHiEqcClSoibn3TeweYwRbu66zttyron5rggAULhLFYzIKHIJ4mY/Coms/DuthteWDJTihLgbdPY8otlGNXkjSUuaduQqGV4dibuXgeN9Cmvee8i4KivtrMLGbsyw4MUFwZNktuNWDQQa1jMpgR0NjwCUnwQjF815Pj5OaMYobIoCvbqgRuHA0W8BzSO9ACM47T43xUiSuOTpRnlnK79sn2vvP8FruLPMLPghyPXDK+6VpRKW0xmBCarGu/jEjUP4fWWHvU63PQgnF7p3qVrA7892HUWqBgfkdFRy8pA1HsXV/F60wb27GiPa0d+V/VmpMMKRdGdJ4FNV84KENgDO9EI5bYtjZImHqKVDYzFr4m5q7DJpC014CFNzqG38kWJyscAQPiGhTeKLA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1lXI9dUqDUDpNJS6YEInsuzKbNy86Lm97Dvwr/9pK1lT1xgF6O6WPv26PTjJ1vbMbVno+l3YKJsM/ARR9WYaKfJWAfyEiMmFv3FFDnZGLmHXJJFKLMLrDx0sv5SKUVTtWY2wQEtx8sXOWIhUZHR/Qn6S911mM27ICiM/061VSyBu/Ehxp/HJLJv3chpFqDEsPGhBsc3w6jvZ3a4I5r5/vdmsMsmgrzPShte2KgThL1Gpnf6173VSALw6fl0Ycjq5V2X54A2nFsG/Sb6mr8RLaa3wL3hmGFxGh+y/UKUxtiTwK4hRwolpkHH/ptd5MhFVmLlaQx5JpqwPRKR8DBvRTPKzAxbDIuXE/kraLOTZBPjW+G7b4ywaKoFReH/vv36TsIPMNkaVzDPN0pVeKrZSDM7dJbIONn1ndpMZvQ7ugcOUabeFoncLqNhtRwMKrw3p
X-Exchange-RoutingPolicyChecked: 
	cMZKHd99qRWFVJ2Tsv+wuh2f2IxV3ZpXRZKoBb9yRJGckVkQKai7Xzx9Dy9HxM7JLu2rp0apRMRJvBM92yryHzsSgnmvwIX9ZPpd0myKA/hffjOA3SfXulY3zzbUan75bfDxdII0wVpteD618IH8syBwt7UltYNoqvIz+p/cKHPHMxkYzyNJzLaIp9AhK8mVy6tmUxu/RxxbC+98HNrRh7XMeTlOvT19nBrdUgazZZSEehVWOpkfpE6cbSnX7BQhpGiL/c68Vxz3PfZ72JkwmX8ZxHIdQ58etd42aWq4RYVXC/Lkg11XCmLZPUPmkDQeelkJ1G5jN2psdVPR5rCVDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 07:18:07.5951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b88a6f-a156-464d-9e03-08dedd8a39c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6058
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfXwFXzJo7DAMV7
 siqrLHhSSIquRU3gYFjN3JcQ5jTMmkcu0wpZVtp3ikTmHgKXJzuqBUKT29ZPa8+9TX/8BfSI/xT
 HgvKAzUS8nDpIDXBqPsVhXzzeCO783o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NyBTYWx0ZWRfX3vXhJwHJ6GSl
 kjcqYRuP6kjChJz0gPA6+DaAorEaOaInCSIHMZkRV4wGSyYJ28LY+O3rbPTOELYho/aWf34QV+V
 W90tpjujxUaVVcmCj8NNOjAGXUjyzbsl6DtnLKJRIOnlJNJvIAoDh50MatCTTmx4h3EUk2EB8rU
 HMe+Ntkl6q+V3xHNhLreGF3zNtMMLa3oHfAAhNM+8JpYM6BlvyxYwxoij3oc96OADlvz/SpuTJb
 e4bC3a1APmyHhV17M3isYbhRY1ldAlx2H2YHVR+HUiQt1zNwLzM6wrWZFBI3uOqBwFswnc6K5D3
 jEi1hRRV7UVeVtPnz3BDxKTa/8t5FpVbWZ6vSM2tM11MuqK078PETpUO6qbxPw6aU0gEZXAtovK
 SX9M49RwGnfTML+FkZ2q0UWrqUFHomIzG0UNW70Uw/ljVGhSHfVRIhXyTRdR5xd0017r1/dQW0c
 jnt0TUu6y0gb/NYlC2Q==
X-Proofpoint-ORIG-GUID: ju6dBmcxapiXWE7i2u43dhdJl75pMMXd
X-Proofpoint-GUID: ju6dBmcxapiXWE7i2u43dhdJl75pMMXd
X-Authority-Analysis: v=2.4 cv=VYnH+lp9 c=1 sm=1 tr=0 ts=6a4f4b38 cx=c_pps
 a=tYxZZT+6B+k9mAKHHpnGSQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=8D3xaIqswDKw4339Iz4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090067
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jul 2026 07:18:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20134

ti33x and ti43x support switch mode. Add prusw-fw to ti33x and ti43x
so that switch firmware can be packaged for ti33x and ti43x.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
v1 - v2:
Updated commit message based on PRC warning on v1

There was one more PRC warning on v1 "WARN: .bbappend files might need a guard
to make them check-layer compliant. (GUARD-1)
meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend"

This is unrelated to this patch. This seems to be pre existing warning. v2 is
not fixing this.

v1 https://lore.kernel.org/all/20260708104058.1287917-1-danishanwar@ti.com/

 meta-ti-bsp/conf/machine/include/ti33x.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 2b5ee53b..05e4bd80 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -84,7 +84,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw prusw-fw"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 0c37871a..f20a34b5 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -56,7 +56,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw prusw-fw"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa"

base-commit: 46deb02b60023b967f71c7db610883c19ab0d184
-- 
2.34.1


