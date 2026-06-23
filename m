Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E4CCDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 20:14:17 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30190.1782245654216441990
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 13:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VuGhQVDM;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=W2zKFCxL;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65NJvD3s854539;
	Tue, 23 Jun 2026 15:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nFKqVYfplKXME6qbSubE5dCHavVAP/OmllilKVysA
	Z8=; b=VuGhQVDMqBuYBtRUeIppnCX1Ud9TPdT3vcf7S+wRCa84Y7wRa1MCbMeV5
	uidBnhlRPQqg2PUAW+XFTCfP5AKDf8yQgxsFHWIQL3cQI9MQhY7gF/mmckmoYhMn
	s6ZN8CRN80KlfKSow3nmBVhrQTq4r7jkQafL2sb/q5zt8M8ScbEnmtZbuIX1KFWA
	soBbIFfqIyoDbgDtqH8VqX60V7VA4MpWWBSTR6J6MEPkhwiHZ+byijMCord5NjSH
	s1bsW1K1zKPbaXqmzKb4BlUXzhblsZXyciZ6izGymCCxOBhMYgCty5LZrjJz9Nqv
	rT8ZREkIuw5mE7JHjs/0MP8gS7EyQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	by m0384305.ppops.net (PPS) with ESMTPS id 4eypttc71t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 15:14:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F46zDeGUT2mUfr/UpSiX9HfZ68U9XtfK4eh0zpnUDv8kajhSPiOv2WRZxdicHVaVCV/lc1NF+CFcefW95otNS7Y3ypmVajDIxu2andv8pIJZ0khd/sQk6DjI/bIemZ8vqImwLAc8lvdBciy4fh9krAVNfUqKtALrn2w0M1jmIxE/fczBlagZoDCsbWK++NZEeQ1hVYBU/Uzkv2A88F0foobq8N9Ujc59hpulR1WfIVlCjJNoE3OUdUkONwZxK+mxhE3JnrAcs6ecNLcy/M55VXTPLUVWbSYGcbRztsyaZXESj9L6QOrNYZESD+RuFOrwXw1gH9pKLA3AvPwBWsSIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFKqVYfplKXME6qbSubE5dCHavVAP/OmllilKVysAZ8=;
 b=rq9iT3eFnPBRAWosnFIYthpcBMaatKCDHZF9DlT7ahgl0QFFBn6Qg0LLRcZBadqtFKEOAfoaaZvtf95zd4LIzkv1voiqcxFzz7tsXvq25Wgg+MffXfWGONRYYrLErMzj7F9/SKTPy4EMS604REUShcoh4KVVHEB5zX8A9aByYPI2twkS5gjmRWqzblOLCuhzJefQClB1OkfAVKU3X9Ihsf/Mdx+/L/v2Q/zovY+4qIgLWYYD7cHXlF7zp0jbs359BXxBQuJ6N9FJx8CgRj+syAC0eU7YKVyqPFG38sBxov34dq8Cf+wtDBtZTwByqLOWQZYSx0SDZ2j3xIOhHlkCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFKqVYfplKXME6qbSubE5dCHavVAP/OmllilKVysAZ8=;
 b=W2zKFCxLwY1DwrceZX40FdK9+lYHYqYSqfcLRWpDAEegAKceMiJt9DdZFRb6lfE1e5ij/GzI9ADe3xTBSrDZzQkBGxvltidjMZY4IihY9yMt3VBi9tgh98F67VAqaqqqZb2bTw2+3dBzFvhD4f2NZcv8ks4HTYQF6RT4sM830ao=
Received: from BN0PR10CA0023.namprd10.prod.outlook.com (2603:10b6:408:143::20)
 by CH0PR10MB5065.namprd10.prod.outlook.com (2603:10b6:610:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 20:14:03 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::87) by BN0PR10CA0023.outlook.office365.com
 (2603:10b6:408:143::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 20:14:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 20:14:03 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:14:02 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:14:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 15:14:02 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NKDlkS3021799;
	Tue, 23 Jun 2026 15:13:47 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v4 1/2] mesa-pvr: Add versioned mesa.inc copies from oe-core
Date: Tue, 23 Jun 2026 15:13:46 -0500
Message-ID: <20260623201347.1152792-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623201347.1152792-1-a-christidis@ti.com>
References: <20260623201347.1152792-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CH0PR10MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: a46116ca-bbaa-422b-a623-08ded163f855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|6133799003|3023799007|20052099010|18002099003|22082099003|56012099006|12006099003;
X-Microsoft-Antispam-Message-Info: 
	CoaOXa0XibaZS6+ldgs5xf6Sh/JOkqpHcujTPJ1v0kIFEtFhYpicbtgZO/KHVbeMVLUaaajOf3rIvgwNkL3CucJBjZ62pFOd78Z1yjTpH8Z++cIdrwC5P/GCqQ4ee+AHMRtB4UBZF8eWVCrKYuYCYLUA/UH9Rl//VNFWouRBi2C+jVrB8KIKxGM2ZVjWTlOg6vysFx3IARnmosMnIZ+jASffnOiBwoEFe5+tqJH6p5CKraNnXw2J9zu2SmSqSjOsHactfG0PULX10zfUBTUQLjfZQGDnSrE6/G0/28EtXtbIr9pV+eZ28VXF5gaw07BfijIVTYGTapsLzc3Xoj7V4GTCJOUEVeUozqU0DpoegPkmgqiyL+UZGkgV7O3VXh4QElekNnNX9aJw+D5K4+N3/PkIM1R4iCU9RsV+Ptn6vYZbmIjDbT/IyvvfLDaHexCsxJSGhe9IIG+RUR9nMqOzMU2hjULQDrfGSNsjxBrTC1WTuJZhpec6brhagWn7E6GqmMVkTEu+AYgUkDzKGRbSFESgwFS69GK69LTx4pKva2t2lxN6xCHRqA29DHYad/ryhYmPZQaJSEN0NbImOv7Zl3eHePNBknDaB1iARTkNtwqMoZEB+nto/Gi1QTCrioimqfuiJOLv6frpCwWUuATazg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(6133799003)(3023799007)(20052099010)(18002099003)(22082099003)(56012099006)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3czpoEWkU4Srh3XRt9MtGUh/3XwNsOSSAiAwV4Kx0kgXIkdqDfhgypN6fccPuKsJbpopddE1z4CYX6nLr6oLQawCBZkIrqtTEesWNzGoiw5F7v3vnrOpKKLDakYpb7Xreh+LnR+bOSm0yTh6o8wHCpYF4kcDtTlI97+AtcB8yhy8OMyA8Gxkr2sxSKV5+9GOEkLWdH+Fh97nnVJpMQghuLy16LFZTydWE4n2rrXdl+sVttYPrNbcwFEUOHruw3wQt4hSLQFU35lhSzHJL0jSHzwU7Dj+r7rfAtthHr/QyL02omZW8+xSi4PzoLMDjPqXuYQhfmqdSOnu3d4627ExbT3RMox9C0QmSrrlbpmbR396PxmZ7JKQKcLf53yCXCUbel8XqU/AfhU3wLnvaKNTW9CiLbtPc354wm0DgksK0eQROokJuj+QHnBgBrqmEFsT
X-Exchange-RoutingPolicyChecked: 
	q2Zx9XWMbykNMHFaaFEIW/yOV9amSQkiCBWKbWnaq9blFTDYZQn+9jAmGZkE4g7b4AUKS9DpRgbXPxsbI+1BTjlTOlzOtKQ3Hc2BOrMZXnc72n7cEtRECGOcVX6lDyyRar27gLnRXcFBAGeu6E26pR8D0uVQAgsJ8iigLYiWF+k2OhWLBw88UdnWC1EfxwFDkecJyG/CEjBbjJTV7l6qHkmObzy6AFdMFfsyxLEalQiTISFtuBosUEZvjDQPU58BtSVWCBpEvOGY1dsauzaDiNWBXRRsaVSR14V00C9/65UJpRA2APqQlRqT+0p8cXt3HT4xp8doDFpUtQFDos5Pnw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 20:14:03.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a46116ca-bbaa-422b-a623-08ded163f855
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5065
X-Proofpoint-GUID: X0v9mHfNQFtmGSv3qIlVky_32ZDojr6n
X-Proofpoint-ORIG-GUID: X0v9mHfNQFtmGSv3qIlVky_32ZDojr6n
X-Authority-Analysis: v=2.4 cv=EPo2FVZC c=1 sm=1 tr=0 ts=6a3ae914 cx=c_pps
 a=Ovo9riOs5JmVBBfNyWc1Cw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8
 a=aR16PxjQAAAA:8 a=9tB1Ob58-DU3yNah7bQA:9 a=5tn4MO8azEBWFjlAA-rn:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE2NiBTYWx0ZWRfXzROJu0XWD36p
 SrGJXZLcO23lccE5XWFm5s5bg9IiRHNkvkEh3LoigUp+WVWQGzUzI5uOjlVcq8NcuS6XyDFNIGH
 66qQMzpp/98R2/Jvz7lRYf2fDf5FXE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE2NiBTYWx0ZWRfX7AdrApFyrA4H
 5yHNPNDWp826p8Hsy85pcqzsIorw60njJcwW1vn89KmdrocX4ftonLvw6QUML95nAYlpHPYrDDd
 9U54tIldHv2c29inGl3B4PE1IvtEOylxQ1PaTiphnABqKAvE5VrbUQ52V3ryyC9oOYSAKDHSuRW
 Ws02yAVNdzk/JjoZbYHB/N2s8g0kkGLQpTb4F+4NAxz6yESxdR7Eck/63+G4Re6LKzUoKKEiKqg
 RX6Xd5IcShSQAg4BOKzgLFbdeFdOE2eMeCYmFXkBqzPRx5QuhqP1iadtYeGCOHPUC92FgLRS+xD
 zpP8aszaT5C8vIs4vkdDaIF2TmGcBW9iSOTDE8Tkgze9uBpCedXDJh2BWcq1pJzuVNjQPLL0W0t
 vluNHzBONIOjZxsbtUzARgvWcnQ4Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230166
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 20:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20064

From: Antonios Christidis <a-christidis@ti.com>

Add local copies of mesa.inc from oe-core, renamed with version suffixes
to avoid conflicts:

- mesa-pvr-24.inc: verbatim copy for v24.0.1 (existing content, renamed)
- mesa-pvr-25.inc: verbatim copy for v25.2.8 (new)

With the above new naming scheme, update check_yocto_rules.json.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v4:
- Update check_yocto_rules.json.
v3:
- Split into a 2 patch series. This patch copies mesa.inc from oe-core and
  the other modifies and adds functionality on top of mesa.inc.
v2:
- Add support for master. 
- Rebase on wrynose-next.

 check_yocto_rules.json                        |   2 +-
 .../mesa/{mesa-pvr.inc => mesa-pvr-24.inc}    |   0
 .../recipes-graphics/mesa/mesa-pvr-25.inc     | 355 ++++++++++++++++++
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |   2 +-
 4 files changed, 357 insertions(+), 2 deletions(-)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc => mesa-pvr-24.inc} (100%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 9dbf6c50..aaded6db 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -8,7 +8,7 @@
             "meta-ti-bsp\\/recipes-graphics\\/mesa\\/mesa-pvr_\\S+\\.bb" : {
                 "skip_vars": [ "GALLIUMDRIVERS", "VULKAN_DRIVERS" ]
             },
-            "meta-ti-bsp\\/recipes-graphics\\/mesa\\/mesa-pvr\\.inc" : {
+            "meta-ti-bsp\\/recipes-graphics\\/mesa\\/mesa-pvr-\\S+\\.inc" : {
                 "skip_vars": [ "TOOLS", "TOOLS_DEPS", "GALLIUMDRIVERS", "VULKAN_DRIVERS" ]
             }
         }
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
new file mode 100644
index 00000000..af674c83
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -0,0 +1,355 @@
+# Verbatim copy of mesa.inc file from commit 2c0c7c3e5b71
+SUMMARY = "A free implementation of the OpenGL API"
+DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
+a system for rendering interactive 3D graphics.  \
+A variety of device drivers allows Mesa to be used in many different environments \
+ranging from software emulation to complete hardware acceleration for modern GPUs. \
+Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
+environment."
+
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11"
+
+PE = "2"
+
+SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+"
+
+SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
+PV = "25.2.8"
+
+UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
+
+S = "${UNPACKDIR}/mesa-${PV}"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install:append() {
+  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
+  # So, check if EGL/eglplatform.h exists before running sed.
+  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
+      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+  fi
+  # These are ICDs, apps are not supposed to link against them                                                                                                              
+  if ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'true', 'false', d)} ; then                                                                                             
+      rm -f ${D}${libdir}/libEGL_mesa.so ${D}${libdir}/libGLX_mesa.so                                                                                                       
+  fi
+}
+
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+EXTRANATIVEPATH += "chrpath-native"
+
+inherit meson pkgconfig python3native gettext features_check rust
+
+ANY_OF_DISTRO_FEATURES = "opencl opengl vulkan"
+
+PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
+
+# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
+# by default the upstream mesa sources build a debug release
+# here we assume the user will want a release build by default
+MESA_BUILD_TYPE ?= "release"
+def check_buildtype(d):
+    _buildtype = d.getVar('MESA_BUILD_TYPE')
+    if _buildtype not in ['release', 'debug']:
+        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
+    if _buildtype == 'debug':
+        return 'debugoptimized'
+    return 'plain'
+MESON_BUILDTYPE = "${@check_buildtype(d)}"
+
+EXTRA_OEMESON = " \
+    -Dglx-read-only-text=true \
+    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
+"
+
+def strip_comma(s):
+    return s.strip(',')
+
+# skip all Rust dependencies if we are not building OpenCL"
+INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
+
+# "egl" requires "opengl"
+PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
+
+# "gbm" requires "opengl"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
+
+# "gles" requires "opengl"
+PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
+
+PACKAGECONFIG[glvnd] = "-Dglvnd=enabled, -Dglvnd=disabled, libglvnd"
+
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+
+# "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
+# Be sure to enable them both for the target and for the native build.
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang"
+
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
+# "x11" requires "opengl"
+PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
+PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
+
+# Entries for GPU vendors.
+# Some of the drivers might have extra dependencies (libclc, gallium-llvm).
+# Check them in the individual driver settings in VULKAN_DRIVERS and
+# GALLIUMDRIVERS.
+PACKAGECONFIG[amd] = ""
+PACKAGECONFIG[asahi] = ""
+PACKAGECONFIG[broadcom] = ""
+PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
+PACKAGECONFIG[freedreno] = ""
+PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
+PACKAGECONFIG[intel] = ""
+PACKAGECONFIG[lima] = ""
+PACKAGECONFIG[nouveau] = ""
+PACKAGECONFIG[panfrost] = ""
+PACKAGECONFIG[svga] = ""
+PACKAGECONFIG[tegra] = ""
+PACKAGECONFIG[v3d] = ""
+PACKAGECONFIG[vc4] = ""
+PACKAGECONFIG[virgl] = ""
+PACKAGECONFIG[zink] = ""
+
+
+VULKAN_DRIVERS_SWRAST = ",swrast"
+# Crashes on x32
+VULKAN_DRIVERS_SWRAST:x86-x32 = ""
+
+# keep sorted by the driver name (rather than PKGCONFIG)
+VULKAN_DRIVERS = ""
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',amd', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+
+PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
+PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
+
+# mesa development and testing tools support, per driver
+
+# keep sorted by the driver name (rather than PKGCONFIG)
+TOOLS = ""
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+
+# dependencies for tools.
+TOOLS_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
+
+# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
+# treatment in addition to the usual 'freedreno tools'.
+PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
+
+PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
+PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
+
+GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
+GALLIUMDRIVERS_SOFTPIPE = ",softpipe"
+# gallium softpipe and llvmpipe was found to crash Xorg on startup in x32 qemu
+GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
+GALLIUMDRIVERS_SOFTPIPE:x86-x32 = ""
+
+# keep sorted by the driver name (rather than PKGCONFIG)
+GALLIUMDRIVERS = ""
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'nouveau gallium-llvm', ',nouveau', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
+
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
+
+MESA_CLC = "system"
+MESA_CLC:class-native = "enabled"
+INSTALL_MESA_CLC = "false"
+INSTALL_MESA_CLC:class-native = "true"
+MESA_NATIVE = "mesa-native"
+MESA_NATIVE:class-native = ""
+
+PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
+PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
+PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
+
+PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
+
+PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
+
+PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
+
+VIDEO_CODECS ?= "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'all', 'all_free', d)}"
+PACKAGECONFIG[video-codecs] = "-Dvideo-codecs=${VIDEO_CODECS}, -Dvideo-codecs=''"
+
+PACKAGECONFIG[teflon] = "-Dteflon=true, -Dteflon=false"
+
+# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
+FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
+
+CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
+CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
+
+# Remove the mesa dependency on mesa-dev, as mesa is empty
+DEV_PKG_DEPENDENCY = ""
+
+# Provide virtual names to allow selecting preferred rproviders
+RPROVIDES:mesa-vulkan-drivers += "virtual-vulkan-icd"
+RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
+
+# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
+# Add a dependency so the GLES3 dev package is associated with its implementation.
+RPROVIDES:libgles2-mesa += "libgles3-mesa"
+RPROVIDES:libgles2-mesa-dev += "libgles3-mesa-dev"
+
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc', '', d)}"
+
+PACKAGES =+ "libegl-mesa libegl-mesa-dev \
+             libgallium \
+             libgl-mesa libgl-mesa-dev \
+             libglx-mesa libglx-mesa-dev \
+             libglapi libglapi-dev \
+             libgbm libgbm-dev \
+             libgles1-mesa libgles1-mesa-dev \
+             libgles2-mesa libgles2-mesa-dev \
+             libopencl-mesa \
+             libteflon \
+             mesa-megadriver mesa-vulkan-drivers \
+             mesa-vdpau-drivers mesa-tools \
+            "
+
+# For the packages that make up the OpenGL interfaces, inject variables so that
+# they don't get Debian-renamed (which would remove the -mesa suffix), and
+# RPROVIDEs/RCONFLICTs on the generic libgl name.
+python __anonymous() {
+    pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    mlprefix = d.getVar("MLPREFIX")
+    suffix = ""
+    if "-native" in d.getVar("PN"):
+        suffix = "-native"
+
+    for p in ("libegl", "libgl", "libglx", "libgles1", "libgles2", "libgles3", "libopencl"):
+        fullp = mlprefix + p + "-mesa" + suffix
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
+
+    d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
+
+    if 'glvnd' in pkgconfig:
+        for p in ("libegl", "libglx"):
+            fullp = mlprefix + p + "-mesa" + suffix
+            d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
+    else:
+        for p in (("egl", "libegl", "libegl1"),
+                  ("opengl", "libgl", "libgl1"),
+                  ("gles", "libgles1", "libglesv1-cm1"),
+                  ("gles", "libgles2", "libglesv2-2", "libgles3")):
+            if not p[0] in pkgconfig:
+                continue
+            fullp = mlprefix + p[1] + "-mesa" + suffix
+            pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
+
+            # For -dev, the first element is both the Debian and original name
+            fullp = mlprefix + p[1] + "-mesa-dev" + suffix
+            pkgs = " " + mlprefix + p[1] + "-dev" + suffix
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
+}
+
+python mesa_populate_packages() {
+    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
+    for pkg in pkgs:
+        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+
+    import re
+    dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
+    if os.path.isdir(dri_drivers_root):
+        dri_pkgs = sorted(os.listdir(dri_drivers_root))
+        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
+        for p in dri_pkgs:
+            m = re.match(r'^(.*)_dri\.so$', p)
+            if m:
+                pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
+                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
+                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
+                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
+}
+
+PACKAGESPLITFUNCS =+ "mesa_populate_packages"
+
+PACKAGES_DYNAMIC += "^mesa-driver-.*"
+PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
+
+FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
+FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
+FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
+FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
+FILES:libgbm = "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
+FILES:libgallium = "${libdir}/libgallium-*.so"
+FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
+FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
+FILES:libgl-mesa = "${libdir}/libGL.so.*"
+FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
+FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
+FILES:libglapi = "${libdir}/libglapi.so.*"
+
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h ${includedir}/gbm_backend_abi.h"
+FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
+FILES:libglapi-dev = "${libdir}/libglapi.*"
+FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
+FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
+FILES:libteflon = "${libdir}/libteflon.so"
+# catch all to get all the tools and data
+FILES:${PN}-tools = "${bindir} ${datadir}"
+ALLOW_EMPTY:${PN}-tools = "1"
+
+# All DRI drivers are symlinks to libdril_dri.so
+INSANE_SKIP:${PN}-megadriver += "dev-so"
+
+# OpenCL ICDs package also ship correspondig .so files, there is no -dev package
+INSANE_SKIP:libopencl-mesa += "dev-so"
+
+# Fix upgrade path from mesa to mesa-megadriver
+RREPLACES:mesa-megadriver = "mesa"
+RCONFLICTS:mesa-megadriver = "mesa"
+RPROVIDES:mesa-megadriver = "mesa"
+
+# As of May 2025 it is known that LTO breaks Mesa, for example:
+# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34318
+LTO = ""
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 8ec06800..2c20a538 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -2,7 +2,7 @@
 # upstream yet. This allows us to build the shims we need without completely
 # clobbering mesa.
 
-require recipes-graphics/mesa/mesa-pvr.inc
+require recipes-graphics/mesa/mesa-pvr-24.inc
 
 SUMMARY += " (with PowerVR for TI parts)"
 
-- 
2.34.1


