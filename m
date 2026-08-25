Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9815C61DB4
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:38:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15892.1787639901748507477
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 23:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=MpscjNFL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lQ5GQA/J;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3COgC728697
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7j
	jo=; b=MpscjNFLeK15ZhvBG4HjZ+OBCjvwN2+m7x5E8Jz2r4WbKaj+b5XRxpWlP
	njJa/z0HEQphlEwuhn8fBHLewuHeTKCS5E0oizmom3POAeU4shD/JFrA1ekCWmsr
	ORD7ulG+EXVPsO9gWBRT4kbwgIM/dyuoRy+sdql28igLunJHNG9Y8WhoMaOfvUE1
	3b7cyh472Yj3Kw3B7hGODaCNQPeKfDHB2GAV2u/FAnbIM8bLc0jnMFDL/37/LvP8
	AOK1t1SrmnIzuUuEQLFNBGvnPLCzAU3g4A7APBSWPrMyd1qM2ErMvx0Wi1TAhw0Z
	Gn1J6/vI35PTIW8pCN1U6HDH2kW1Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g92xngvdg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:38:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vO1a3d7k7uzLVX36QQTUbaTGVRztnIx/e5DU8N5BF47+uKExhZVxkV5wjzBeEiRGkSvsYK/T+e6mofXzLzRolbFLttmYFe/YfS00nps/fEagmO2ldi8QwVInHow5PSDVToY6hbaBoe7FossmvajCE4CFcLo8vM3yOZFyafmY1E6MNwNR/usFW2Z/Tnz6WOefyNF3QkgjzQq0pzrp3HXrpSPfm8eizv2fB/vx/qBtxlweQ0mW1JUGjQHImQIcwPc7aRlDzBeY+6YpiU91gWRM1T/fLVrZXEHL2AVXXIOZ6xw5JJBL19ZYImelZTu+W0QA1HJfbrxR40MW9u8q458mRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7jjo=;
 b=aaMEq7xcCl/BOdBp7IPtP1JYkhDlx57kN7mllX3xPC3fG1f9YN9nJW5s+pHB/kLuGQ4xqdGjJMaYC4oBZGhk0hxhUiMfN1uLhVQcbuq+LLtZt1BdIRu6HwarzNy9SK1UrlLwWnx6VErpll+CPzYZ+Whsh77A2X4gvkPL7okRSRb3A/WvDnM1OYKHeQJ6jo06jk34cy+RzmjlGxJRMMN618URmgoVarAeCpYZGWlMHwQF3KBCwTS95Sj6fip5uOV6mZMREDpyeO6ksKQvuryYIQFR6+nshsq3oYmz0O54VdvvTbj+nLmzosUDjBqzEgphYZP/M61bIPQ2iZIbYyIyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7jjo=;
 b=lQ5GQA/JWQP0BAM6Iw7Cx8vK/ROOirDaXvAjrKuC5zcyvgrCL/rCBUURyTyn4qEIOtgg2+3Jgk1zAnJHPrtvOcyxFRZH1F/fffkmDIt464I+sr2M2eygZ5atrvckp4lYunt9sDvO2Vt+pX/b/SrNph2SRoc+/PK6g1l1+K4VD0M=
Received: from PH7P220CA0090.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::13)
 by PH5PR10MB997708.namprd10.prod.outlook.com (2603:10b6:510:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:38:18 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::9f) by PH7P220CA0090.outlook.office365.com
 (2603:10b6:510:32c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 06:38:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:38:17 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:37:19 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:37:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 01:37:18 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67P6bDV31504567;
	Tue, 25 Aug 2026 01:37:16 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>,
        <a-dubey@ti.com>
Subject: [master][PATCH 2/3] linux-ti-staging: Add dm-verity kernel config
Date: Tue, 25 Aug 2026 12:07:12 +0530
Message-ID: <20260825063713.51497-2-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825063713.51497-1-a-dubey@ti.com>
References: <20260825063713.51497-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|PH5PR10MB997708:EE_
X-MS-Office365-Filtering-Correlation-Id: e5039d27-bc5f-4265-e02d-08df027372a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	9RRVRawFn0bpBFFh9bK+oZu//4xtf4m4HkDB8jPx+SQ/DAxfDwqk8CoFdLm7hK5UJCM/ASlkokAM1laS10gqC766FhJ+tBh0NvEakC2FnYy6TE2FvBTfVqS64ZSPcjOvCIWF0BcevyEjevWioblxqS8O5AS0XD7WMluMSBRNbFbFgTh0nMN6MtPBmtSMiCL0jINXW0zS4NQSNiAUI1OB7Qh/DN9VwdIa/DO8zgglHelaZf7Oa5707Q1slos/i5c1+zLFwqIR/gq04NBc/Fi6YiHHStN7eli0hVBfJUR6PsS0uXAHHVGVnciIMi3mY0ufpcu4vSli5mL71qhX9dM9sE3bhp7tTsWg4N0GFStVQXOoNJZsbrFw4t6Z6Ae4zB736vceMZ4hNA3wDajCdVkkAbWElTcslduEfKIz5svV/ICuFVeJEkz+rmRyx1lALi7csWGF8jJ4mcr1JAloJ6RF2KZ+2fiTHrFoXQefO/RsGnG6hxeoftZ/nLQQNuP1PN9aJher6RLaVYN+Rca4vctX0KtsW2hpqcOS8aonJOgvqsFCXaLJtjeOxs7hrp6JHYRXebHBzJ2v69bOvcKJBYGZ9dhx7yviJ8MpnNuys8G/xqA6kuUDvi18L1sFGVy0uErGfjqoWiLonGWjtTK0J2nas6EWXTQZna0ImetzDyMWdz8vm72nERE0kRDgcZXRATnoDzpZdevRE9o5A1i/jh0VMQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jrP88w09gmca1hs7I/a/bq/Wyb6jV//l+l5gmWRRxbEWqfy/6WO8u3td/R6zJHCPkryZtnB+VdB+fUO2mNKpnWvV67hr2qjc1uJjZHyfrABWLbRHb4Ryfo7VqXPkJ0EqjABtE+8XPEQgRjSZYDXfFypnvXDCUItg2QmN8Xz6iUNNzYC7MH1rldLfTovJR6VqnkAUbqhtDmZAoMd0qtVeHCEJEdurILEbIcGrvfHBkpbQ5Jr5w10uBVzfqafh2RgqGLiEwPGmzrYmu+p61+ojz4PXWi+FcEdzliDYzhuEa2t9J7Eucg8m+MuCbHLgX6dovs06npQ7jL6fT+hIHTG0FUnRbbI1xF8NBo/dNcsiHVgcQZoeoOt8/CnNaoBPoPEVRnPgDhxUctEmGHdmewynhbNo5NXsUlu0Onp5b7/OeMegMmuM1EREbSFoxfdS3oYp
X-Exchange-RoutingPolicyChecked: 
	k6ZQA8e8CeuAe8cqHbo/eq1ZjJz8xDNSx8BBO0WSlBi086U6SiMY3ly7OruDN+KT9MM+tCsGb1GqW3rha6yaJibOHPIACt4bplMGIv5z1zgpG797pqqdCL8ewPV4UEbFy9zTvDwlS+JA9e/s5ned5ceGZHWxJ6PKNDafRoHmI1C7r7O2xXbh1uqkXJOduzmdSheorDx1b6HE0hc7ujSsz5PBQywQf1U8uaFbVAU6UuOsYzkIIwwmVhqb+Vyk3Vmo++TFpXjDAAFmFajojJ5EvT+n64dw5WNzgLY7gGgAnNqWxwz4y3kA5w6wLfIqDVcBrwPp+tqvewXnrrdlSwv3WQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:38:17.6796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5039d27-bc5f-4265-e02d-08df027372a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997708
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX5yfJaimwigtq
 QNZz7EjmP9J9Htb86EYFL+JdV3qXaJC3QQ8VU7MJjiojZuCOrEghSjVtg+zLr77T+adP3MYfVt8
 R8epfW59tR36qFpB5vgwV9U3ru2fSTk=
X-Proofpoint-GUID: i5MBMXNnfuGHQxSs6DnRzDw2oc_H2fgr
X-Proofpoint-ORIG-GUID: i5MBMXNnfuGHQxSs6DnRzDw2oc_H2fgr
X-Authority-Analysis: v=2.4 cv=PsijqQM3 c=1 sm=1 tr=0 ts=6a8d385c cx=c_pps
 a=sZdM9mINdKJOQAUOT6RFRA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=dVGgIH8cX6fh8FKggfkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX0i8QXjSc4ATd
 pAcWhWfAEJl9i9jBzOufSB1FLFMZC6+Z2TJGXee1KF7SW/R/s7nc1FfCmmj9a3DTNft5dEJZM5H
 rDXhMVLpC6xWwMcLvjpmxR6c+njEIirXVFRS67y+ak/fqO1C392A99DncsKyGWmvwIw4fFX0zk1
 ZPE8ZqaxII01iurVFA+LSigxhf6+9blkt7XcDZNeuH0yXwgH5w+Hmtz3+GyT8IW7nzZ+fn4WCgo
 m5S0IohNd7yal1qVN/T+D2F/uJHPYHZv/kgdBUFw6tpFr3U24HgNClOJhDZjrX5P8hpJ3Y2U6C0
 h0Nchn+S/xv2vYzx9rJNXeSqFOxv0uveTcRD89rMcfw6JV2lC6+M2+lX5DpdfwG87wuuJ4Mv4C2
 hMKzIA4jMjdnaem1fpt+soOBNfYDnhAhkx/dXgY7L7g+4Eu6cxrN8kKe5QxlNzrMXWvc3OOwlQD
 7W5YOWfrU2fh3S9i3Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250054
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 06:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20285

Add a kernel config fragment enabling dm-verity and its crypto
dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).
Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.inc reads
and merges directly through merge_config.sh.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../security-layer/recipes-kernel/linux/files/dm-verity.cfg  | 5 +++++
 .../recipes-kernel/linux/linux-ti-staging_%.bbappend         | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
new file mode 100644
index 00000000..c50ce403
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/files/dm-verity.cfg
@@ -0,0 +1,5 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_CRYPT=y
+CONFIG_DM_VERITY=y
+CONFIG_CRYPTO_SHA256=y
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
new file mode 100644
index 00000000..87bff5c2
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -0,0 +1,5 @@
+# Enable the dm-verity kernel config fragment via KERNEL_CONFIG_FRAGMENTS.
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'file://dm-verity.cfg', '', d)}"
+KERNEL_CONFIG_FRAGMENTS += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', '${UNPACKDIR}/dm-verity.cfg', '', d)}"
-- 
2.34.1


