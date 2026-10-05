Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61647CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 12:12:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18546.1791202370825846405
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 05:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bxxCO3eB;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Qnxvfxxc;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695BSJEi3814775;
	Mon, 5 Oct 2026 07:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Gf4ifUp6Iyk5VwZkpjzvtNBRYD+DXvaQiD8F/gtO7
	04=; b=bxxCO3eBb/wETwPZBdJHp1kHSsLrRdiQolw5jsCSgOUDdZ0j2wAKTHeKH
	QRSGrwHhD3ItMJGve+Z3+aCaIt16slcJbgsglwGalJuR69dn2DRCvmjI5C4pGQbn
	GyTV1aHD1K7kMllcQe+3pNTLtlgosklfV+VyLQHGI3G8A1QXPUOkO58B0aEeb7uJ
	hXZ/txtOTiAf+8p5QMwdgd9XDZ+qzBnjyYBa4nun0zQzVbfP4jywjN1L8c1LZ/mm
	Vge61FP5wtNwzinq19Cy2yDtY0BPYR747M4ZE0V6xE3SQcknOIzGoM/VRWjS6Oed
	QawK0R184QkK84YzwyGQPiR7dQLJw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h3jqncxby-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:12:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cK1m3awjoGHkr1TUFxOFFsG3fR+93C0gufZChM0/olyEEINtJgnTClS+2HYE0E8IcO+d3vGZD5pdveiSK9y+H47ETHeHC5a4rW9IeszOdvkxt9yzP6/si2su0y6jK2OKKjN2Bj+kBj6vb+Sug9KuwMlMlUU4jcC7pCSXKholyongsusiCYd0Vg1UuAbg0HkJtxS8DWuzfgHT70rqhDa/8gQilbKK4Ki/ThUXxxOyJR+A21nVTQdduc873sQviIY3ak4FSu8o5gBK5yVwgFzL7fmPtIaqEmI3fNowcJdeuzgIvMe0cIAvrxNjgKZHkxr6IVcfkLuwSdJKqpP1LkoaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf4ifUp6Iyk5VwZkpjzvtNBRYD+DXvaQiD8F/gtO704=;
 b=pqq93JIwj5Yy5VADus+nBqU2t7tlh/XAMUAyokU2VEjHIIZYfJKfDMd4tkuaoEYT5sjM87LwhJFU3gsjU7e9Z4h/1S0uumeDRwGgdwJtSOoQ6mCBjhBhUdoBkHRSQnC1kqs7dH00F3aWG3rJ5scySgoVfhwrfyUPs+z7qqHL37Zpfe/j/yzIghwsw0wZdd3zuuohl1hZFrAwLmZc1gCI+KiVXSQheVRIjlTl56msf4jdLQjZCghsxO+3D5WhiZi+trHslozK2iXM0lJ75QMqpi3j/4ucPT0cuyjlpau2v0R5ATTgB0uQQTYCY5FJub7hAbbI6+/+3kAAiZia+l/jig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf4ifUp6Iyk5VwZkpjzvtNBRYD+DXvaQiD8F/gtO704=;
 b=QnxvfxxcfyRmwnSjRb3vfAS7sjf4BsA7FASuCVEd5Nvpk3bzkxfxwHGWuKgyBYyPS09YeOBlyUrAUDaTF7B1aqJX0fW4S4qlaiPY4zAYtrYFjc1ZQZ52UPyYkJKxSAD41nZhV8ppMQk91gO4VePp8/L6sAxPdBN6mHh2KgSdB5s=
Received: from CH2PR10CA0009.namprd10.prod.outlook.com (2603:10b6:610:4c::19)
 by DS4PPFB033C1B5C.namprd10.prod.outlook.com (2603:10b6:f:fc00::d42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 12:12:44 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::43) by CH2PR10CA0009.outlook.office365.com
 (2603:10b6:610:4c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:12:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:12:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:12:24 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:12:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:12:24 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CCJ9J1103986;
	Mon, 5 Oct 2026 07:12:22 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH v5 2/3] linux-ti-staging: Add dm-verity kernel config
Date: Mon, 5 Oct 2026 17:42:17 +0530
Message-ID: <20261005121218.844998-2-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005121218.844998-1-a-dubey@ti.com>
References: <20261005121218.844998-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DS4PPFB033C1B5C:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bfd1380-b843-4db9-9c58-08df22d9f600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	MyPc5u6C8/dIBD9udOdOHZ8I7/P0857CmNLzaVx4W1oIWanzWH9O8wHdmT8f6ApcM4Tzh8COX7DinW8Y5NOez0+Gq0yGq5GfvbpSPgv1Qo7/mna4Xjk7++aeQu50KfFiCJ8WKLbOB8rQnkrgXGm/v/0q9gCIXQRiVoOLD7wfFhch4fEwU4PZXSkNd74ZjttxHOOkp5j4RyI5ulLhbNA15jptDZ1bigzHsd7Ie3zKYxHQTz+b5Xw/3xuSSltj1kzhe76G4eSTbXCoD0ZJNc2f+UDkfEjKelDFvmBua201tXAb/nXObFVvBR0wzqeFZD4AMINxAncKtKe4ClvepUk0ZysCYz1a7rg+d91Vk6JJw4XSUC/RqveOrOb7rDBtqr9yci8vnLEXueSw91BMLzSQFYmXjBOm2pThUyLznqOtLgUMKKU/x2BQrky98adca5e81nV32IYSp1Lh6So1s6Y+Bfen4vWULk7b6rZnMFG7vajADEV7y8i4ZP1yEn1mYexL/iv1JLmzyjToJmqu7+ORQtNbd4Bx2iy8J+wSXJwqPmf6WJ+i1i0wQgv3qwdg5kLARTEQfdxxhHAWTd05hvzldRsZYm5FZnV2zx1/5e2cCeTiM+gsvgIIIuAICl9AC6hqMlob290RLPRtUeLavOIFxPnVT0UWv/7ayYjUSJfG2K5lSEluTUiek2ECcqfuboWA15ZmHiFkl8otkFGQj/ZQ8A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pBBDAckgGxQ0riobzUacayaAo2wMKp+gwWUJgGtFJSdCX87gJcGdmHfTwbOq3y7R/56t6JS87Poa6okjj4WL+7y71i7Uv5dq0Tiyr287ZDdgKIk7OSx+M5bV9W69qfbOdOOBSmW/SdrSTgUty7iePT2SDE8uwkBbseKyaVgzqw8U4Z/jgTkPNSffXD5utl5bY/2LhI0Vx3HdAQkVDAkIpfMXa/ZnX5TvS70wmR/e6O1qkmQCdLpS4jZAJGu8gF3iWvz12D9UcdQYQdVxqe4a0F9yROXO7PxVeAgbVC0AiSeNqg34jy/da1iT0knlomLHq0SwGeS1G5Ahf0wuJehisZ919ZX5zTBVZsNbBKcqsanaQCEP1G9i6RK64U2U6YC3pViMLVmn6ooU6ZJ8XdRvaUD3YZlbUv+sVBOb6B9WkISTfcF57xAYWQ/UnJKvyJ0s
X-Exchange-RoutingPolicyChecked: 
	PTWt/HIfvwovgJb1smnCs5mAHr8y7jLLXPFdXwZKQ3qM8OwUrbwrGDP0qXXlkha4ocm67K27H75dkq9DitA5sFkqVFo2dElm5kxIoEYAZTGN3a8bWl9LwIcXDyhIk9PWlhS3W3cIPsi6h1+5AnXMYZeIYiIZ4cS0j5EPKy4d14tOqX/QknSOceClWvBtFk2FrFliMbGdWDuHlnAxUthFPtZiS3KZ7oE+jTMERzRCGWbTlv3f+xNHv7xPTXJenlQFyh+XeRYtve8YnS+LjAyA4/M24iwn7evS9FQl0UYgk+Z5SaLwXp7ynSH5LvFJX8BjSS8qsMuQe1hmrOWUShXoCw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:12:43.9408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfd1380-b843-4db9-9c58-08df22d9f600
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFB033C1B5C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfX8K3Sp2X+XiRZ
 Yw+UAOZV1wfgU6TaaBao7rOvLZg55WK4FSiK3vK0QC7f4QP5b0S0p+nlhAR1pKoOAXmhkgPnpmo
 s9M3T0ye16UU+UJ1QxBObtcuoyqNsRU=
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ac39440 cx=c_pps
 a=Og0UtPbLppQH9mpfBaDriA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=my4mKo85e9fyUbre06AA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfX+1YGsl91j57r
 3+PgVRwy5sVxhRdVHKJYto5uILaIT5oAbwM540HQI/apgxBcPgybB5xpBI+dDHTmwpFGJGM12jS
 HcIAOwbbgOphAzB7KTSa0mR+n343HRhZb4nTaIYl8ysKdc4CoFstmfsnEH2V0Osp/5u5s8VFc2p
 aSq9RtC0CXoe3ETfRLXxdAnKwNCQu/dd3iDWh3AGCexP/SX2VgUgdP/gB3vBqIitTKO7mfwnUVX
 phZyE+VISJNzwaN8p8KyiyD/TKs8yQDxiSfbgrvMV92boTYKrgui9NaSPuXfhwJGdCmf2/h37cv
 jLKCAsb6+LStVKoGF5IXXaulLyBYDsjkhzA9FwP1oHZF9asCTT5fiS7Pw2xmPFEUOGkfaJqp1YP
 MAqRMvdFHYABRjc41625rz/G2miyhJ9PqOYZMJA8ujAADhWaotsPm6QIeFAzLJVrEJnKWYyFC6d
 p9ynilOIXKKEA7ipWyA==
X-Proofpoint-ORIG-GUID: nHw1ayORXbj0mGw24t6U8acL29qYWAxx
X-Proofpoint-GUID: nHw1ayORXbj0mGw24t6U8acL29qYWAxx
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
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Oct 2026 12:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20433

Add a kernel config fragment enabling dm-verity and its crypto
dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).
Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.inc reads
and merges directly through merge_config.sh.

Gated on DM_VERITY_IMAGE being set, matching the rest of the dm-verity
dynamic layer.

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
index 00000000..9a380cf6
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -0,0 +1,5 @@
+# Enable the dm-verity kernel config fragment via KERNEL_CONFIG_FRAGMENTS.
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "${@'file://dm-verity.cfg' if d.getVar('DM_VERITY_IMAGE') else ''}"
+KERNEL_CONFIG_FRAGMENTS += "${@'${UNPACKDIR}/dm-verity.cfg' if d.getVar('DM_VERITY_IMAGE') else ''}"
-- 
2.34.1


