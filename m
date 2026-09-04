Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3734C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:46:40 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10295.1788515194039758841
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Sep 2026 02:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JsfOWHB5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OKZYVbGE;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68460jCq2945904
	for <meta-ti@lists.yoctoproject.org>; Fri, 4 Sep 2026 04:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Ns
	ag=; b=JsfOWHB54Y6JVuPhxst8fZEqFg66WaH48M0TeDzVZGQphdFixrZ9ILT8Z
	9VtlM6E8GgPoRzResttjTRU+Y2t4X+5wFcvluzWvqTa6YOBCzDMrW4dj0qluyyA1
	itH6ViuB3ReuMMBLTQoQ2Mj3D8AuTCrKIDIXax6j7UpzwBAL3+NUyAq+rja7gtA4
	iBqWidP91vsnciwVKOF/Imigs2exFXUSlwvB1FggrhxsmN4wY3dYzofHCD6245XU
	vlm060ntpyApJBf5LHDpg3QH8+HYWqEqXmM1hJrVKO0SlNijIUj7b60cz+bAFkcK
	7lTAmhgMqGxPZI5QmTimZAb9ggEmA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gfk4xtx94-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 04:46:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V74Iis7G+/z+OMjL8/YIF4Zka372cVcACOI8L4epdg4A2UOO1vGJjGsqvNOe0BqL5IZF2gevJNfpqzmtdn+3gztV2mluF1D5qeijxSUp385pYwXEwXTwvWrGV7d66xKj/m8rn8S0/gzm1OKjXrVLDR7DrKkohtlwmJfCmL7WYGDmD0Q24L+ZcjAbfQ+NUXGHzvNferi2PYbEERzo3rLJ5AcAbLKhKQmvz3Gd5Tt/ckZcHwFIwkRCG6z3u3Wm2cCwuWUawTwWCtWBLSqJiruj3b8RV/rEW/3VXcQZa2qzDhHy9Q5QFJutBdyg4OTHfE3FkDHvtiiCft5TrA2xeL2k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Nsag=;
 b=kCMsc5Dusp32vqQWn0k5x6YefscMmxxzo8QNSf1OAH9BKJ/2uNykuShwBQOLGirgE3ROhG812AwTTTvEYI8bc/GbsKZ2kUiJ7cW4zEsYZVMNKnpiu6px35cHCOInuQjYBMJP13JAfDUj7wy4bUvQhQdGrgaZ1hETyvWM9lmTbT3y2nSwnhTBdc9CT2c6ESnSqdxOnm0nzKDHG/Vh5STZjM3cjSh4Q4mgaBSVS1q/PqUKeYjZ41snTfSvcIou5pQux4SGXlmGk0En8doYSVAiQS1kGexCCEzm8TmMuQ59GTDO/1vmnXieMbtehZfhAlY4+8MYbtvjIQtpWrgE5MGyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Dumu/42LAvpnLD2m+prI5jWdX7kFstKS70b4E/Nsag=;
 b=OKZYVbGEhngRF/JxYwmMjoZb4q4y14oChNAWUt4W5TJG8z9YUuk6KMidXg54p3PzHI+y1Sm31jd+2Ztmc69Oi9//iX8RtA+u1FboggkjF7cYdOtieMiDI5vg3SaWto1eada3+H1wC/y72urhM14c2D07XyII1IQ5j76LeoBn9AA=
Received: from BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25)
 by MW4PR10MB5680.namprd10.prod.outlook.com (2603:10b6:303:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:46:31 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::4) by BY5PR03CA0015.outlook.office365.com
 (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Fri, 4
 Sep 2026 09:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 09:46:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:46:14 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:46:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 04:46:14 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6849k6m73272627;
	Fri, 4 Sep 2026 04:46:12 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>,
        <u-kumar1@ti.com>
Subject: [meta-ti][master][PATCH v2 3/3] tisdk-uenv: Load dm-verity initramfs from U-Boot boot script
Date: Fri, 4 Sep 2026 15:16:06 +0530
Message-ID: <20260904094606.3233160-3-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904094606.3233160-1-a-dubey@ti.com>
References: <20260904094606.3233160-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|MW4PR10MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4646c09c-6868-4f41-6308-08df0a6965c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|18002099003|22082099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	PlWZtqQTdrxGsnwR62OfQP/NR1znV/1Ee2TomLf3zGNf1fOpbjcs/B8CYRGYiiswiLInWau+ln4J09obFiXuwrQsBF5rRLkfuJjKYi67iy0lxEU/m5olk5xarSCQHiWUOZt1QBhrjVaQd4ahesPlY8KDmr/nLDD/NMtnsbh1lpd8h8eTqEpHHsFEdUkEXnfkF6ZVg1XKsW+IGkdNqZMbMpn0vA9e9yk1xZ4sj+N8FCuAypjRkoAzF+8J8ie7ERILqMx35k3G59mnkHCiD1hU431ZBVPh2UKx/Q3nrz2lvD179v0WWv5IopT0j1LjSiaH09w2ESSU69Yh4L+uyR+5E5R/Cx+SpQhVlGeWTmLzT5XWdqN5i/TbHgxSV93Ea2F9wDZ0abIsaLEpzigMh0JCuTvK+X3dtqqqPgZckTPE0rsLOQooDFdPsXWrJgKxntAnURdKffFdAOqfcJOpuvmZX47Y2jS7ETOXSC1ES4fGCisJF2X+RhNX6U6mGkiHXLRjeWFUTU5Dz8idY8w9Zp6MV6uWmQm1AIj+QzAg2A/u7kO3M3wGvpAZoULKZm/s+lF7bHQGuXnKwFjeJguSbm97IY3uGTE+OLH7LFtBOFx1wWEKlw70VIZ1gko/xUA58dQYTE22oOVKsdOKF92bkJF5tbclFPBzdlT30tkThDEdq468+Kb8GYvYMIQDwzAFq9M2N5OqrCUStXAMdXOAHD98tQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pE3OYhkYyCO/7TgxyG9EYUj3g/+m+XaZWxCY4wt729M5A4WIfwydmDAH2goJ1SKgCTQ8tyFOOidfXKQg5QF58W0SCHO4cfBcD2SMqCgyAC46WYYPkm1X2osWwa4RiPEVTVH8RnrzDFxOgwxRbQqyX4GANDO4dloLxUWrT9upicgVqmYa67kAB8KheoQ6HAJQ7yMCpbifh+pfsVtFLY/z57iQMcAT6kJUiFGNGxAGcBvhb5ANktGaea02OwNYQL6hbV1mvhPjFyJxVEBxXuIRWypD0bKrHIabhRNEHyLqw9F3F0DOpdYwjsdQQi5hIvDzhfE9KOthkdgpf+K37LF6Dl5CcBAiNNreY6uxvfwtuKI81zkwpfdzUflb308k9zSO3njjeqyFJYKuMOJ1AB70EbTGHMxT3Fq/7ewii6tmWj4E/yEGSQ3HWTGe1JpUeI8n
X-Exchange-RoutingPolicyChecked: 
	LzmYOdM4wCIKUcxL9UVDdl6hqd4xWU5wb0PtxJcEGoP4NaMGGBYJpDTjFtP+fBoDxtAw+kOKLzI9uCRnfvzaXZJcRaUHl9wmlkxoQfY+FE7vLL2sOoQN8UWtWABJXoKFIfxjLXum9wZx3o7eRk4MB06HsljZw2RvfF6NogveVGGQY37hBuvAPIGWij5dDlmgUA7N9V8c7JTeFw9RrOcAKTLIXV03yuE/9qmX/JQkymaypjduHsN0BkvddhajJKe9T8PpjQyi2gZtoUJVHTG2picTsSkEcyqSGGq9x5vzkodzyGOlYv+/pl29Jlz3LHgtH1k2y/qRhMulkph7rtnz/g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:46:30.3577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4646c09c-6868-4f41-6308-08df0a6965c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXz3vwDHd56J/B
 i54eQSsYZ+KkFGwEytqDoLpxKXgPqgcQ0X6j5WBMZUbw0uh6xE/2xW2Mp8T3zTP44eHlreFYAUP
 3XvKfIoIqwoN4GbD7cMfC1j0slBM1s8=
X-Authority-Analysis: v=2.4 cv=TKd1jVla c=1 sm=1 tr=0 ts=6a9a9379 cx=c_pps
 a=LPqnct3xGwQwGN9n+XDEZg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=SlDpWVFX6tK26vLE_2oA:9
X-Proofpoint-GUID: dZhl89-csOxkWkduZe7BGq06QTgxJJJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX1TnF4r0dTZB8
 15nZUYzEkwFOsvEKnUzzzGR1s9zHqU0AudugYUtO1wCWbMC1dQPlS5585QH2RAZDiT/LqoulhvB
 TnCWKMTQ/w/c9zvfZ4Y7H1JL0Uc/zGVHAUM6KQLv793HAWE2CzLGeRu0Nmi7734bE6WCVNyUJnB
 L8XzjXDTD7MsRY+6LvqKqhw9mTsSfn2DSDYDORMNthHg2QjihU7YZl+eAPTdopB27ETp9VA9rQW
 6qoMp9wtGb+Ax1XtbjDEWf+wtZsjCqR7JP5tQ5eFMLY5WnTKVz31bDTAD2LdjgYXJ00PsOLKhHg
 6GaaQbIHFCLe/A6Ml0O7piKtv43pb/rn2/0tQ/y45IrKODeoesxFE/xQ3e9NcRF4JnLQpfEIBrU
 Zk1zWNI2t5tCcTGvJQ+sfq9t5u7xOsmpJD1bV1UJrbwzMEQhLa8EBd8nDndanrJG5eBDIF2qqiW
 uma8A5KhqOOyZ40Dkow==
X-Proofpoint-ORIG-GUID: dZhl89-csOxkWkduZe7BGq06QTgxJJJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 09:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20327

Override name_initramfs in the deployed uEnv.txt so U-Boot loads
dm-verity-image-initramfs's cpio instead of ti-core-initramfs.
uEnv.txt is imported before bootcmd_ti_mmc runs get_initramfs_mmc,
so this override takes effect with no change to U-Boot itself.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend            | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
new file mode 100644
index 00000000..ffbd0061
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
@@ -0,0 +1,6 @@
+# Fetch the dm-verity initramfs instead of ti-core-initramfs.
+do_deploy:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
+        echo "name_initramfs=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" >> ${DEPLOYDIR}/uEnv.txt
+    fi
+}
-- 
2.34.1


