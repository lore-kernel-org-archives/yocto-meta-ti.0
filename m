Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883C5C61DB4
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:35:45 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15869.1787639737282605180
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 23:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LE972V3W;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pqX8/3u7;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2Q1fi291429
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=mZqZWPzWjR1j6
	UKiJR4vUg1YJfsyi+n7+IRTs8TkV5Q=; b=LE972V3WwS9a6eeT7wcALsYKcbeCY
	wR4DO8F7Oz2+89m3t8N9ADoYfd5hfz/4cl+1y9xwnASse8qzJznAqDm8yQVCsxKV
	62gEa9zNrq/VeDkCOPjtkDp7smHOMTyQV+IsbY6PLTSsCBaXRZ9J7o5a8bVom50r
	8j6zn2p73oky1FGvK274vIDkiKBpASZYxbvjKyE3pJ5QONr7P2Acm/KOauwl3QuS
	p9J4N+TZIwJ7RSmTrF4/S0t3O+vvvtcULyzZj4GCjI3E5Wt+RcQ9dYcckBH/2kMq
	V+DbLfVguZt3UdBVt3NdQuv/QnSvPSNVcnWyJkyrnzQ2pq/uDzSuZ130w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g8xf0a2mm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:35:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUFmlve4DF1J5oFsTvvs0Fgtj6U6VsiwsMzwqgjc/nxfXPIWDlkdho/YMem99wgTQWUWH0IJRP/RmQme3nuTrr0m8xdZHriqzAgNA+6D4taKBIUe3vRuBoTqiVJ3/WqvTUvHqgoAC9XuOK86xvsjUwbOkqmJmsd59X3dYAbdGvi2Hw4HEXneSEtdg9CgwkVtEYwQ1rVlPsNcym4sajYy84d1njXU2jLzGfZLfpnkH/HZHZ9Q2knr/p6aASzisl88avY/EBHq/OSjrpx7HPOMUCp1MScpbSc69Msmnr3pvGGAoESQlFLU0OtWfdYS2D3JHDQJm9ZkhFN7O4BIqGkXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZqZWPzWjR1j6UKiJR4vUg1YJfsyi+n7+IRTs8TkV5Q=;
 b=SGrlrHnwNVh/2qJyvv3ju546HBmxCSW0Cqmy9vTlu1LtvZ2AMBLjsrZD1/jKXavo5Xhvdtv1A7KG7esRNpTccJfnjaHNUaCyjXprTX1V2J/l32TBlY7A1y58xAyq+u1juel3yZnS2DEC51QKS8MHcm1/54F8BYQ37X2PoebXUeaJB+tatd9ccbTtBTAsS7g5UBVltv1KPc8Eyha4iR7mRtKwh3LWdKepBExUVXgmjQr8vyy0MndF0FoBDJ8inEVUYFBIX05FQL8ugQNrp+W+HltaBiMVg62P1S7s+LhOuBRKzTnwUeJbKejWBFVsL+DWyfsBLVMi4WUubi3ATSFcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZqZWPzWjR1j6UKiJR4vUg1YJfsyi+n7+IRTs8TkV5Q=;
 b=pqX8/3u7lV+NWkI39bqVsBT2eopBsOMe85oj5cMw96nw7Y5UyipZdz96GCbetAEfrfWp4yM6gU2237VUFwjwW8VS3bF5m7guIB592ajDL3I9t9S89LED82uq/R8sBY9C3G55eJ9/C9Cb0qbMNbSpTJ22sYdTRZ2L6e5mZIIrV5Y=
Received: from SJ0PR13CA0073.namprd13.prod.outlook.com (2603:10b6:a03:2c4::18)
 by DM3PPF1F8A3E3BF.namprd10.prod.outlook.com (2603:10b6:f:fc00::c11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:35:30 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::97) by SJ0PR13CA0073.outlook.office365.com
 (2603:10b6:a03:2c4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 06:35:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:35:29 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:35:24 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:35:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 01:35:24 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67P6ZLwG479103;
	Tue, 25 Aug 2026 01:35:22 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>
Subject: [master][PATCH 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Tue, 25 Aug 2026 12:05:19 +0530
Message-ID: <20260825063521.51101-1-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|DM3PPF1F8A3E3BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 320b9eb1-6bed-4466-6a72-08df02730e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pgLmLkQ1SNJDpu+cOy84A9AzwqsaxEeQD6zL9JaYvwgzDTUwPbTvUkC8jjKTFrs1MLrKHXZ2MHUaKbh+gQ7cioroSNCrlxrAWYq5GpKRLFIF9xhRBPlCEgvBMVhLnKuAomRtFu+QZychbevpevNFgQC+b9LkPY7a1SZbBS3rmfiU/QH08zXXvKdSk4Y+7hEPW7dvuphqLA87my0zz15i45Cp3IBNOI5JzJWMonI+WKsRzEm1h1ao5lIlAh3KnarnzQ87rmBHAWzvtmPwPxoZuUgz6qpLorIln2SVPZ52PfceBLJ7hZsrAbK1kSMPdtdGWltH6slfcKd0s3Mvtd/FiTjNKFCb73sfXznOvz/Px9P+HgeebeluL6BUuAh/qNF9IcVWIwejvd0ZY22a+BS0BaJfi9SRgV4TqoIOor8be4Q4vyrmtsv5ALF7PUnD6eiy4qGMNEc5eeTdFAsoxmsmqv1N4JfvRTUcwvDeHljCoBpO/KvrTOTcmSC+eIykI1JQvuL4pilWUuNJfaoVq5i5TBXMYk7hw6zTHFzMr2+NpmAUZKijJUnapMoMvB4qReKVE5+nHAd2d7IdBfyzF3xnJsmWXuSZZg+dktXVqJJ5uUSX+CGk0AdQlR4pG7nN1m2p3gnRMSGk716V5/i3pHZAOelwfz7qaG9b8845qK3CNF9/zniXL89xfrskD1Anb1i9FjNFgdwDgmIOUFQguBJEkA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oWqgGkFI/ipBHtaXVYGMds7dE1vJqgnPzcO6ajQ+AiDXqcuygWkSpMf9DRH9bYsS071Va+wdFH/y2RxMTYqJMTADX/ukfi8JHZIw7XE/ShzEPgAS9a1SF46UHNgf8746R/pTK9/tzQwY9zNn7RhBMzZRSKyC4Q/Umsr7FdyW7edaX1TnuGn9DVuQwUxmUeNSem07cgGslEwGZgdFE4oOIt6cUbpRXzzanZPDoS1NtdVHmtpQyiIpgdha274f5s1+3s/NDnsMlFTSCAngLZ5HUi/375YEce8EH44jmTtQnNxqyLEBQ7zNsj7kXaLXvn2n9zRR6K86ojxgNFmEfSih986aqV3cpKdw07gNOEVpUryZzZc9GnluluikrERQTRpxh/MtKLLaMGln3IgqcAID9fDY4aKTcAmOB4AR6GhwEngjKS+27FdGPl1v3VC4d6sf
X-Exchange-RoutingPolicyChecked: 
	3vv9KOZYaiNbAzSnW9XQpZY9nR1fKxCk6rZNW410VHtRnhHBUgU5V8o6Tdv/PAgGKS7O6z3p8/vYgL5wJn/G0smUkO25EORF4e3wIJ0EkBDYGdEQzXLWdxrMZDjSlKSz7BCfznb+xibHMblp5OprN5K6lBfHSPcnEhUlAM2m+NQWn8MimJPe4/LsH/xLwEz06szyzX2viMazdayF854UBDI0EwufHh0GtYwrMm4V4GMcAoLXU5XV+NRbfoEIly8tfcsu+ABk6FwAjfIxo3UCc5Wh58mFSO9GcH7VEb/2EO+RU83lVCH7J2iJJygwEDVDpdJZrB91wv+1jUc+ze1rRQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:35:29.4212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 320b9eb1-6bed-4466-6a72-08df02730e5e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1F8A3E3BF
X-Proofpoint-ORIG-GUID: lzW5Wif7UQx0WhDvT5gaoelRtqpoKAkZ
X-Authority-Analysis: v=2.4 cv=Fow1OWrq c=1 sm=1 tr=0 ts=6a8d37b7 cx=c_pps
 a=25083kmBgh9d5ln0vqlIEw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=c4mgLw7UoIgH1LjkLBIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX57s1fJHk6lf9
 bb3sOqPgX6gE7lmcQHignZ4XCPOxXBCsMP04hZ+rtPbiBtoq69IFE30HK3OhLi2hXQlk/KmlMlE
 yDOHSVrxw/hDfIauiyP1gptLfyg2LiI=
X-Proofpoint-GUID: lzW5Wif7UQx0WhDvT5gaoelRtqpoKAkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfXxv0vKqo99K5p
 F09jAKFIO/InbOSOmqkW2akvgaB7k0SSNd+hJpSsCdu4XpAEyzU3rMVq0YRX0pUI2RrJLSvyP6L
 HTbEGRw54B7CHsgrtoRszb7fEI6VYFvRWTq9Hxil8/TAcMJ3DJihQ0zsYO4vZmaG3n+YYG8PhTS
 gl1aFMf2F3OMbDPecN2BT7H5XS4s3Ffz4dwXOowILQs2UsZKS1zqV/BwG1uxT1B61Fw23ER2xCa
 c728H+ma6hZxErxlbD5XEbODjp+TADAsBIwJRAWBcYcwdSnCOrQI0j/tQowetyKPRh0dQuHs5oL
 XyulJcGLpptWKurlnUCg3y0rfb5c7Fh3ufngEkS+BTssCZsPHdwscYl9Z+7+tKY9p1BWxL29kcK
 5hY0dxV1G3VcZ2EZyKoxNXfuQTg6TtkAlD2fSaZyB/SeQPXcI3lncfl6UcFAdfyIL0whAMnArmL
 yC2ciVWPgGgtNr35Bpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250054
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 06:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20283

Add an optional dynamic layer enabling dm-verity block-level integrity
verification of the root filesystem for TI K3 platforms, using
meta-security's stock dm-verity mechanism as-is.

dm-verity hashes the rootfs at build time; at boot, a dedicated
initramfs loads the root hash and the kernel checks every block read
against it. Wires DM_VERITY_IMAGE/WKS_FILE for the K3 boot chain,
hooking do_image_wic instead of INITRAMFS_IMAGE to avoid a 3-way
circular dependency through kernel-fit-image.bbclass.

DM_VERITY_IMAGE selects which image recipe gets verity-enabled
(default arago-base-image, overridable in local.conf); all effects are
scoped to PN == DM_VERITY_IMAGE, so building any other image type is
unaffected. Only active when the "security" layer and dm-verity-upstream
feature are enabled.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/layer.conf                     |  3 +++
 meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
 .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
 .../udev/files/dm-verity.ignorelist             |  1 +
 .../recipes-core/udev/udev-extraconf_%.bbappend | 14 ++++++++++++++
 meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
 6 files changed, 50 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
 create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 3cc54aa4..aca35cd3 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
 LAYERRECOMMENDS_meta-ti-bsp = " \
     openembedded-layer \
     tpm-layer \
+    security \
 "
 
 BBFILES_DYNAMIC += " \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
+    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
+    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbappend \
 "
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 2ebbfb9e..e23e0ead 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -64,3 +64,13 @@ FALCON_INCLUDE = ""
 FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
 
 require ${FALCON_INCLUDE}
+
+# Upstream dm-verity path: meta-security's own dm-verity-img.bbclass +
+# dm-verity-image-initramfs, used as-is (build-time hashing). Only active
+# when the security layer is present and this feature is explicitly
+# requested -- see dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
+DISTRO_FEATURES[validitems] += "dm-verity-upstream"
+
+DM_VERITY_UPSTREAM_INCLUDE = "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc', '', d)}"
+
+require ${DM_VERITY_UPSTREAM_INCLUDE}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
new file mode 100644
index 00000000..4de9e2fb
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
@@ -0,0 +1,17 @@
+# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
+DM_VERITY_IMAGE ?= "arago-base-image"
+DM_VERITY_IMAGE_TYPE = "ext4"
+IMAGE_CLASSES += "dm-verity-img"
+
+DM_VERITY_INITRAMFS_IMAGE = "dm-verity-image-initramfs"
+
+python () {
+    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
+        return
+
+    d.setVar('WKS_FILE', 'k3-verity.wks.in')
+    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
+    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NAME_SUFFIX IMGDEPLOYDIR')
+    d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % d.getVar('DM_VERITY_INITRAMFS_IMAGE'))
+    d.appendVar('IMAGE_BOOT_FILES', ' %s-%s.cpio.gz' % (d.getVar('DM_VERITY_INITRAMFS_IMAGE'), d.getVar('MACHINE')))
+}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
new file mode 100644
index 00000000..5af878c9
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
@@ -0,0 +1 @@
+/dev/mmcblk1p2
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
new file mode 100644
index 00000000..3940a24d
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
@@ -0,0 +1,14 @@
+# Under dm-verity, the raw root partition looks unmounted to udev's
+# auto-mount check, so it tries to mount it a second time on its own,
+# outside of dm-verity's protection. This tells it to skip that partition.
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'file://dm-verity.ignorelist', '', d)}"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
+        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfdir}/udev/mount.ignorelist.d/dm-verity
+    fi
+}
+
+FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d"
diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
new file mode 100644
index 00000000..6ef2c57f
--- /dev/null
+++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
@@ -0,0 +1,5 @@
+# Disk layout for a board that boots with dm-verity enabled.
+
+bootloader --timeout=3 --append="rootfstype=ext4 root=/dev/mmcblk1p2 ${TI_WKS_BOOTLOADER_APPEND}"
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024
-- 
2.34.1


