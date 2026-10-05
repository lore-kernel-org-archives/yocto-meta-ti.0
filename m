Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C0BCA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 12:13:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18565.1791202398121268401
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 05:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZYYlTsHj;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=LZLs+mqe;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695BSJEp3814775;
	Mon, 5 Oct 2026 07:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5aA67IoaB1Ur8dhGasNoe/WbVabtEbqMiXoYGBqQt
	Pc=; b=ZYYlTsHjOSjOVRNyZEiEUW0UM7/qgfZA93zCKx/vC4b+a4/WFyHbE9vHR
	1viSQLhZzknzHiTWcdRGdorbGTYIRMmX+wu85SOIaakzahN6MmNIR3KbvxZgffZf
	Vs5X+GX0/baSj9vCcWaL1gVO7I+WyR/KXh+aSLjiLHnFB96I/DS7Nwi7cG84ivej
	oKE9zy2BLRt2bIqZu8BvBquvmTqP96a67DqldvIC+w1zXaVb9fqI9qUNgqal4tlk
	cKVBGv8HKpHUPVI03Rex6SBjfjAeojxjqu6Kg5II26ZJP0SAgSBFR0NcGY7jeqyw
	BXcGNaswSI2McTmFJE3TFtDUUSJzw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h3jqncxdf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:13:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgiEPs2Yv8K0z0mmp0h8RuUKwg2zsdajrlBxTN24v8APs/k3J7H/x64huHLInHYPCnrfw8cihU5qY5Zb6kqb4xuhwMzuLvaQQDMdExKstwJYpPBxGjZlT3hM9RXYxrnwZ7szBPtwrmMGz9UY25EvBMa8a4aRXWGYG99pO0orQ5i7ppYdkodUViPaoVt3IYNV4pF9WFNWlvf6oCRizuUdTUQKjK36AQD2mcvipf62lN4yIAW7qsg5kh3VkROPvjT8osK30Oa/MqMpZ119JNgrwPDhfYXo38ws5aocK+lATxWtAqtn14ekXCMaji1MHcBVBgrhMP613seoaInJbodyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aA67IoaB1Ur8dhGasNoe/WbVabtEbqMiXoYGBqQtPc=;
 b=YbYam+Zu2XwcfxSeJebSBBmEKqfMJHlQgyjbliRwRdxE15s7pTIriT7PWXRursKQsqbBBhNI1LTuioFWHSk1sWsU+AC5GQ4Nk8SgHrGopf3xpMqjPuOd4Xd1K7H6dgqMKYC3Vo1y0+McwBK6o15LlWDne9IXCNRsqzlHe3H5UwRxoGGe5c9D4KGg/uB8tJK+o04iNqzXTA5yhK0z7K/6KSFY454V0XGsdb86zmtmt9BwZPRc6V8f8XycXIY2KoBpBpBsAioBt12484/MSka3+cs88J8TtuttfIm7lsRzeHl0ANI4b9lbKnoqMtqIDlmtXhXU+TctP4BD78xmJdzjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aA67IoaB1Ur8dhGasNoe/WbVabtEbqMiXoYGBqQtPc=;
 b=LZLs+mqeXExw73QgPp2G3JurNguLaCKGim627Trz43fZ3xy6QKJtRVKqxXAV9XDRLuuiDrZJx4NhQ2zfbcbmQ5yX5IF3awMe8Gmdcste9M4XJMDRcfZNrtKPFGn8zRl5yA3nPvUCVL7rKJufrTObU2heuYRAnRcXOImEGx9+2C8=
Received: from SJ0PR03CA0264.namprd03.prod.outlook.com (2603:10b6:a03:3a0::29)
 by DS0PR10MB7201.namprd10.prod.outlook.com (2603:10b6:8:f2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14; Mon, 5 Oct 2026 12:13:04 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::15) by SJ0PR03CA0264.outlook.office365.com
 (2603:10b6:a03:3a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:13:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:13:02 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:12:26 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:12:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:12:26 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CCJ9K1103986;
	Mon, 5 Oct 2026 07:12:24 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH v5 3/3] ti-core-initramfs: Extend with dm-verity support
Date: Mon, 5 Oct 2026 17:42:18 +0530
Message-ID: <20261005121218.844998-3-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005121218.844998-1-a-dubey@ti.com>
References: <20261005121218.844998-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|DS0PR10MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a4d678-0d3b-4bf2-d1a0-08df22da0107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|18002099003|22082099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	qoB7C3nZUJO6mUlZ3uB9H73d8NahBN+M1pMsYsV92l3vlKrCZEwxd2wY/SyL2gOZx0qT18HjkS9xpLpqnZuo1eorozmY2Nc7DgOWcJhKSx0bcpepOQsIaf1zpPSGNTRbLFOIR2027k/6uTTrBlINojLCZrHCcPl2PsHwvkdpOP5zhl0uTB8oFPAzkVVqpiSDfB38cKT7kUFnv8tSaZDBP9gNjRIXj9MekizvbhJU5qZrCOgP0iLhRka40Q9Sfh27AcD+OnJK6vP4NZgKim6k7IKQ8gov41ltmKNdrKy3badlroJZ1KEuoqJIoy86vs8i+KAcktji2AL0UBvcjkVsBuel/uN9zRrwE9zrW+9Qug3ga2K+w0ynv9kUaQZx2rZqKTkVXK3UeED7t1naIeXJfm9763pzfAYt6q2eocC+BZuiWksgxZezp/fm9FMcMoWOocvdg4fnznMZvoRH7XXr/Nt8xg/cO3+ma7qRe1c0Y4aY8llBqb0t0ZyX3EszKS72RnNq1FJeHszagENcv/PXduA+Tj8zGadolN+3/OaLgDUdZwwz6F2UaBwtYjVB3oGhCuItdnhJz7sQe8B+1rWSjA5c0Y22k4AQKPcQduJR4oE3YRmtMSKhOYB+SNs/WmiBTjXFln+OjlpamAVxRNMgHTWs032JYTDykO7zoveP2dYO03O9bmvT0NJ8zqw3jIUCwRpFZ30WTTVLPsgRLmMq4w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hyiD2Z2R7ckqd2UTAwPddd5jZEzWKpJJ6KcKplHySHq6L4ZL5mzgccNDYK+f3ttPRwqODNdOIVig1A+4C7QYE9Ym5gxBWp5oRwOhOlkSCTa/wvdaAR3Rx1HhXY47VrincqaUZ0jzbkOVeLw5Dw0bozGiUwSxK9ywNmiTg5pChDVxG79nif0Bs/Lkqo2DOe83EH1WB67I0ED7FxIF7WyvJ+exvH8jCnN4rqqoOuiVUw9CU/W/NYloVBDSt8J3iBPb3WrRSAOTexodNA8UkqwxKsqIEX+oo6UuIoVETAMV72BHiqlp6RvH986mw0yHMUN6lL9CD5UpZLHNEpw5oiZRk8b0vO94W/sIBVFefh9keDujTuQgbqt6vfOW6YOlHIiZfurnnwWHdbWKR0YEflseje3RlczBwNjt1EUTXsThYa5J4m2CLaHg/SQdU8CKhLMe
X-Exchange-RoutingPolicyChecked: 
	W5IW6ZEV5CoUI7wWZ3XOtCMPv1VLBZGgvpOYwaXGRQwB2XrOj04r64ETqgaO/cVyjIViZ4+77PimrYF92VX0fLpbo4KlxioxILM0zdJy6IDIM3XIASX44cqJhBhNx9ZFPwP1n70E7q0KNq+fRSyllTt3aUURJUTM0POo9CXg30gmT/l1fQiqQtiFhcjqu0XpKfe1q89jMFImv42iH4CUweXp4V9TZ5MRed3vreaue1ciBs/6p8UKQSaJiv/eoNeRQuRcZNmDopE/MJi+/aA9LtrKTf6L5/b5QSvGNxSZesLMZ5HTGO3UL3UUKsuSH+smgvBL9EFay1SDkcfr23SPBQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:13:02.4095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a4d678-0d3b-4bf2-d1a0-08df22da0107
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7201
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfX+7pciEQvIqZG
 /kgiS8FpCCi0qNyjbJsv8oYp2UdU+htjgFZ0AzBR/OrySib2Dsfz+C3PjiqAhPh1TEOWbDRpXyp
 bIA0MmWw8qTmtGiY1tuKPGTVkA8Ji3Q=
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ac3945d cx=c_pps
 a=WFfob/tpvpsU+KY5JpTU8Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=NeSs6gxnhKp23kAhfuoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfX27kBjvjFsuRR
 MmFxcCOHCJws7xreBaWT9vBwsaA8BdWgCtEz27EXp0IlewriaTejXai/BK6C6RxUmvXYwxUbJpv
 yARmJKJSZXXzly22QYY8Kb546y3qs77VonKv/4cBJu9JlAPBB5q2fMDb8iFEXI6cTXPOE16NcnC
 64eNK5KCUMzReB0GOGxE2iven+3fRVo9nne35D1XkLC8/W+IGtik1b7XSQ6RYALA5y6AXtTlWqd
 7k50MYRCU5BhtrxpRkLQegeaTh2lFWRDljfvAwBiz7S3LojIF5603ZL0unoUoLNWOXctCvCEiQK
 536fTcWWSmD83azOpmUwY0vT+wFFc6lkHoa5lXujzzcDja++/UCQBjut1gcsszHm8zpyMyb5VRL
 zfquRjhCx/MFNIkdbBw1XMqAjTKdXmsCrgCKd+wmqNh0Vmjjacwea4799kuAVK4khPEsSVzVgBs
 TQ/bHHV59A+1sMrAFgg==
X-Proofpoint-ORIG-GUID: -b67uXj-bC30jqukFRBeYdCL6bu_KfRf
X-Proofpoint-GUID: -b67uXj-bC30jqukFRBeYdCL6bu_KfRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Oct 2026 12:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20434

Add dm-verity support to ti-core-initramfs by:
- Enabling dm-verity modules and tools (cryptsetup, util-linux-mount) when DM_VERITY_IMAGE is set
- Adding do_rootfs[nostamp] and do_image[nostamp] to rebuild initramfs after rootfs verity task completes
- Making deploy_verity_hash gracefully handle missing .verity.env file on first pass with bbwarn

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../machine/include/ti-core-initramfs.inc     |  2 +-
 .../initramfs/ti-core-initramfs.bbappend      | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
index c816f1dc..65d30b2c 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,7 +5,7 @@
 #   TI_CORE_INITRAMFS_ENABLED = "0"
 #
 #------------------------------------------------------------------------------
-TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) or d.getVar('DM_VERITY_IMAGE') else '0'}"
 
 TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
 TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
new file mode 100644
index 00000000..25fe775f
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
@@ -0,0 +1,25 @@
+# Install the essential utils for dm-verity in ti-core-initramfs
+TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@' initramfs-module-dmverity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''}"
+
+# Ensure dm-verity.env is updated also when rebuilding DM_VERITY_IMAGE
+do_image[nostamp] = "1"
+do_rootfs[nostamp] = "1"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+deploy_verity_hash() {
+    # The .verity.env file is created by the DM_VERITY_IMAGE build (e.g., arago-base-image).
+    # On the first pass, it won't exist yet because the initramfs is built before the rootfs
+    # (due to INITRAMFS_IMAGE dependency). The do_rootfs[nostamp] = "1" causes this task
+    # to re-run after the rootfs is built, at which point the file will exist.
+    if [ -f ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env ]; then
+        install -D -m 0644 \
+            ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env \
+            ${IMAGE_ROOTFS}${datadir}/misc/dm-verity.env
+    else
+        bbwarn "dm-verity.env not found at ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env - will retry on rebuild (nostamp)"
+    fi
+}
+
+
+IMAGE_PREPROCESS_COMMAND += "deploy_verity_hash;"
-- 
2.34.1


