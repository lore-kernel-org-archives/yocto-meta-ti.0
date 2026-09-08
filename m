Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBE5C79FAB
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:28:11 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3269.1788859682142981779
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 02:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DH9BCZmR;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=iTiMZtb/;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886PQYG853697
	for <meta-ti@lists.yoctoproject.org>; Tue, 8 Sep 2026 04:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7j
	jo=; b=DH9BCZmRdIoCxXfxxNSOUw4YoMFCSpoFlxBtiu0Bj3BS5E65eAt4baPqb
	NcKWZybPrY8EHj+MvMVhRUJ3Egq8q6kYxTzbh4tL6Oc0W0TFWjLVEL4B//7htTCG
	9OojctlOajd0EY1btOecV/ZomgpxJs2CBgy6Nzz8i7IjCZiULiTKybL+jM318D2V
	SzBqDSA2CkzTLFK+Lbfb9z5mcGPj0MK0h559o4QaO85p08sEyJJfCZ8yI6r6LDNN
	Z/c4l2DtzZpiwCzX5HE261ru6fJX9se/Uap7sY2y/TvgvBj/ae3O5OZidP1oFq2w
	Nqm7Bio8J2Om4aqZ+lR4iPZdhIH0Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj940j2td-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 04:28:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izP5HRYylHISxCT3u1KDFJH4x81c9W42PW4MvQ3v9FV8vjjrhZGU+obgENI7nzyVLETcywIYHgWzKDIREYRNw+cYxfT6Bhl/U9I6yBzJ44dR2vzADQTsMfqwWw/ya6dYGrombQfUOLNWGwzsYYRyzYsAbUk1XJhEHZZZ8C+rfzgEL9YCmywJbCQCZ4FI2rF1gx22mPW10Oq91+R4RkYlukYyFNvISxOATyX6tzm0ZLCq5F3YFCHYowji84Y8pQIhLhmnBBqlipC53g+Mgsp/AWzq1H5bgSt3qUQBylUTceSFt6UUpyR1B6hbA4wd8cAu+vs/3Eqyu0lFS/j6wgmSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7jjo=;
 b=ubZ568L5cm7p5vhIxE5d7Abqb1bG4uou2/D4fTZZeOGylvCAVtVMonbJzsNAQnnKfjp6qW+WcbUcY5Io/VtAGnyCN2hoXbcnI4EhuBOwfUXzYOiEByGan1kcF0HNNPRy3QcHOa20pQXWYV2sqz1bk5e3kXaWyFNlnL0EvSTxIVgAaNAVoQ1qU7q3DYmNPIxIQH3PSMaQVoEYpYjvnNIJuFdiLJKivFWF8SH+fD7Sf/UU2A4sGJhHRDuX1ghByz83XxgZejGUr2G4wIBKDU79MkKafQNL1O35OdLeBCylO1Jdy3Z+ohJLbpg/VE137t21D+ZP9LyPIrWxl8YughfyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0LwMBGL9A7DfXspWMoF9aJo8zPkgviK/vxVY7c7jjo=;
 b=iTiMZtb/SidkAW/klsDRasclIPHrj4+dKmpz8TzL8SaScbqOxQNQjayuO3zDyIuUNJrW0lX+Km8R7N7HzRD+7rTNVBOiXT8KjI2XfCsMDMGXRlT8V6PW69Ib1n/rJnItfNAzgRo09dRVq/IUgNw26C3ToEVm0FoVrO5PMP4GEWY=
Received: from BN9PR03CA0119.namprd03.prod.outlook.com (2603:10b6:408:fd::34)
 by IA3PR10MB8515.namprd10.prod.outlook.com (2603:10b6:208:572::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 09:27:58 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::2c) by BN9PR03CA0119.outlook.office365.com
 (2603:10b6:408:fd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 09:27:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 09:27:57 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:27:53 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:27:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 04:27:53 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6889Rmws2200400;
	Tue, 8 Sep 2026 04:27:51 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <a-dubey@ti.com>
Subject: [meta-ti][master][PATCH v3 2/3] linux-ti-staging: Add dm-verity kernel config
Date: Tue, 8 Sep 2026 14:57:46 +0530
Message-ID: <20260908092747.4047556-2-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908092747.4047556-1-a-dubey@ti.com>
References: <20260908092747.4047556-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|IA3PR10MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 1419e88e-3439-47e5-c5aa-08df0d8b784a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	vzLMvCH6gEooky3B6T9oDol0RHTdyfKOXz20X98oZDabdKxIswihm3rwCzd4GG4uL2jRK8HO6BxkY2C0bUtywRbvSH0s+KIf8ESxUyyYl7nKbjRWKbqD0VM/NNhCtENDam9WWqXIQjogmT3ZmsL0LyQHKxhsjZaTXQiw+M72AOF9f2eAFRvq/vVeHXBRVnqFR4r/OryJpFKKENKcX56KuuH5vbJVfun26qx2ZKTwv65bVDQeExH1JrE0kNTpInRu6ivpAnJE2yrRAUrH5TKIJ5p9REjd/mJ4srMUsL+o/4zM6h9BHYb5GMiZYJaeMJlMtkmWj3r4m8R8CmfqS7YG7qV5Eo1bkyx4D9pLozI0v9M4QvV/X1EUzPieGxFjqjDQbEFdhqefuaZXZvrofIa4uqpGt1G4MBSpfBbQQheymGkHK0xog0dnWnDK4pjiyQANM88Jqrqy8l1dfg7t02nKClpclilTHWPwT1K+J42DpRQyoBNntE+OxRtLvzs8O6KHvp+CiFkuWw6KIofMVukzXkVvGrK+zKq19S/lWRH23SVXJqG9MInGueJ7H7yTuHkhwEiAZDORND7dOpe+9W4iDnMeqC8X8aIur7z9tQTVxeqYrM0zl/KIFEis8gi6SQJTk5ZvK6WqTZbDwlVprIhN3WT3o6ts5Clr8gtsl2Hwjy+iKL6TqcL6ZovCwrthkdc8YlUFXsC8EqOKQQJ0LEThFA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6kodc07b2cEb8JUgPuhCci8bWURUipY1hSf/Wt34hcTHiOm95Uj+t9C6pS5dQCbM70J87y3XlMfhL0iMquML1K88n4WHzZpmNwR+Axc0vxOgDsxTU0yhk1swhpE0Q8SGa0Spo9dhjixhOlD2bXqhGWAM4d+9MG9dM3pqJmtuxuVisdDySXYig1gxmKPa/o2KOGcYTCDcI3NlvPi1+mHNcRcLUndBxCEIJgVeYaiOkzQqf2i7S5aO3v08/pZATBMyjCDfB8vOP3AMwnWQKbfk9p/NPc7ymxfLFjHwAtxSLjVLO2r0Iw6hW1Qq0q5eOReIZcS1BOgQX6J0saTXrNXbkuwFST0012x4IOOFUotLj3z/J3IOKo58a3qVUDj9r+57SXkFHLgx2bpx31YAX21hj42Mv8p5MWa+idG6fkVUesAmEBM+8ZdeQdPcp58d2W6n
X-Exchange-RoutingPolicyChecked: 
	fNlsH0u/R0cXC0WesfZvl5LfXF1moSdZ7WRu4SJWwJsmk3Lox0oYKXdE30pvT/QjU4f45dONEBVUt5yU5RAys1lyimB8RVoY22LMALaVi/Jd/VAtIoaW1qpa7G/PHjHTOeAKu6zTg6XkKWbKepzOh4B0OclfMA9mpIHxO84d1aKbm33x4FoLdjf80e2JOXgYyeOyIAPPKm9LYiMwk/J/L2l5j9Onic/DeW6d0Ac4X6CWH04Gh0C6lzcgiQViKtiqdiwcH3+/dLcU7+XQU2jtSMyquLuHhzOuKHsM+nR2VQ5yZ7/pDjOhpj7VJXEqzhfpFbZ9TS0323kJZmY604cw7w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:27:57.8465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1419e88e-3439-47e5-c5aa-08df0d8b784a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8515
X-Proofpoint-ORIG-GUID: jgYe8aMKtMyYDxvMkzO0bwe27qJwSsK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfXxZ0JLHYcD9RR
 cbHGq4dBuYzpQtvt+XVfdEHov8lOVD4mX526gmG7POjxYUbLpUZizI1exFlXlhxWoBQwzLetiMB
 NXZdQf/I6AI8sXJKAZ9+NZn/z9tpOJirg/0RuWwShGaeyMs84aNbd/rO2YqDeh0KGqEq7lEKl3R
 1YYfnDKw2UFJk9HFk0zjlkpChDtTbfHIdUnI9/ecFBkc70Uv4noMnF+RjZquCeZVoT/V36JxjUV
 mNjY8HkqNl8O9m/HH+qZNWG2PdoVqCmkAULBEV9oXOGQFBDT6PNOKhHwBHUY1llt5NQvjmfhVY8
 b9BhiWcUldNKcanbFLQ8vB6JEYnl7Y+G/cIshHFGcssfleNVbgkgQAVAOEVbHaYiDM2nriyrJ5X
 nVYz29uV7UmWSxGmmXJiHUgSz178wGJtjS6wSeV+niXyDFRkshOHeeuqoSjJy+qzYnXstkr5ru0
 0MumVdJ9gjw5/8PRMcg==
X-Authority-Analysis: v=2.4 cv=UrNT8ewB c=1 sm=1 tr=0 ts=6a9fd520 cx=c_pps
 a=gDBu5PZszbgJPyH+JdeeiQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=dVGgIH8cX6fh8FKggfkA:9
X-Proofpoint-GUID: jgYe8aMKtMyYDxvMkzO0bwe27qJwSsK7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX/rSvCRRbDGRm
 1zh2DTdPq9Cryl5lkVBw6Yg6B/441feHqhJzZ/3qhNWtpZhnQIo90SmH011TL9yaa0p5BBUP+f8
 NVS0Gf+yw6blQXTzogqfXG2zup/gxKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080099
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 09:28:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20344

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


