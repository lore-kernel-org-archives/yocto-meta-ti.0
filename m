Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC69C79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:11:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30025.1788768656447149989
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cqsOlNvK;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OSGtaP3I;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68776CEr2796084
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cckr0Z08Uih2Lyv/jrI6CYgqQLfO4pJc5sqGgehGV
	KM=; b=cqsOlNvKV0By/xnN+RJc847m+dyHCqQLxHTPxPvc1Py9Wf/8MbcHOg96L
	wYohOet5Qy7z1vsGWPJ8yJo2B00ikin+ohVp5TGrWTc7PGGIDQ5V9rMBrb6fsVlN
	6pLXZGuO7f7XSejJST55zb19Oh38E3GF4vs9Ss9wBztvr0dCHhg1jdDPQjm/ALLw
	K1YWhRFS5vvQbNynKiLAsIP3PcAF6H1ChIUb+FdNfLLktQjI71ruVltVBiE44plH
	wtIkU0u3qOllJGzZHAIsGUTCx/v98mqyk+w/MwiFXA0nXBUKzyk8ZDW7a6VRh5LE
	aDoutZl1lHqTBTHqZfD6SAKzo5ytw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh2f6crns-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:10:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fN3aOPK4HNi6NEuS2s8u2gLELjnMSLB6ar8+gLAw0tkcUpbNs0Jrw6eLDOZN7Zwq0Zni82dUJKVgtCdA2P7G/TGc8aApB/ivjUpDrz1gSaxOawduBbDtPCb0UhxbdIBQK7OMgSfCaaslEcBOU4oNA0CMZkUyKiBNqSqXCMsEvEdbOq+p3xFS4x5mtoQCpiYjQd81G8mv9r5uxaAxQ2pJ5f+kjGLLHguBHd2tNPXJbDsL6k+b9rbQosBLyvCTGIP2b8bt0fYwdnqC4m9DDJv2qujWd7CfWf27KRjAdsrdvP3ZcQ4imRS0orRR7WFV1xoP6y/1zW1K6mULh9MLPtd6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cckr0Z08Uih2Lyv/jrI6CYgqQLfO4pJc5sqGgehGVKM=;
 b=v9Kc/DOmUAZ6dHG5t7cV0msUv/grJO3klcSBPGQJHBAkwzLSGN84KawnvE6I3PU97PPEJr/oTQNICgJJxxZepH6Yuvnm1kJdL1Hd8KwYR8iA0JUm5NqrQ0R2d7GbU/RNZImKGzqpvDe/OavLpPRTFBgZ9SZDUS0oo3s8VHiSgliABZkbg2aInRfKVWq/d35rOdkq0dBFwWOhN8h4zv71LR8y40FmH+ZE/onm1oVJ25rSIvv1m2V5lZBpC9brNTACYZBxMHGEtX3ecfMIk0G/wvvL1NbxW7cu+AqdK0086afjhtShP7DHuO0tYqqGbjtPORv9MYSzX02PJoI0enDwhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cckr0Z08Uih2Lyv/jrI6CYgqQLfO4pJc5sqGgehGVKM=;
 b=OSGtaP3I+9+EcnRjxif7BtwEo5XI1iNnetru85Rle1t+v9wDmiIdwz+LqM0pDUreXHn3qDyf2ESdPtdRIUa8AmYIni+OD4eqi6EKdKtVzKxP8gs8ETSGfFQXk4JoUile1k5i+invy3u77tufiPhwGRKF8K39b2dMJ+DPpt5/EwY=
Received: from MN0P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::14)
 by SJ5PPF1EC0B6C27.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::793) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 08:10:50 +0000
Received: from BN1PEPF0001854A.namprd05.prod.outlook.com
 (2603:10b6:208:52a:cafe::25) by MN0P221CA0026.outlook.office365.com
 (2603:10b6:208:52a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001854A.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:10:49 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:35 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:35 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMR132583;
	Mon, 7 Sep 2026 03:10:33 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 6/9] conf: machine: j721e-evm: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:18 +0530
Message-ID: <20260907081021.3876876-6-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854A:EE_|SJ5PPF1EC0B6C27:EE_
X-MS-Office365-Filtering-Correlation-Id: b59bbc20-be8c-45bd-ec45-08df0cb78720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	fMKYpDod9lkGZqt7R9wo0+3/HduILqU/T5liiT7yl5pP+ZO2M41s5EnzxdLUp0bHtHx5JzvbQxGTq0ytrA2VpvjQ5vpd+Jm/2RfuYCvD5fPibhkkM2XEUDRAOecmD9yHWC/OlXbY7Ngo76W5CNch5anAya8oSzglMliBGiMTiU5L5nhGqdmKN+BCIILswJ0Kj6X07zTKvlV+14eDZpq9Y/YcWh+B6euBuoQYVPsHdFLftv40N6jM37bZgGK3D0BSLGtpSWMSfPlolTuLqk7haYO3OdEH1Di+7iqoR5ktAFhz/mXTO+CA4RivJCWAZYu/0QzjsmURg7IQQee25cLf0NQ9qo5S85YxhI/0cLh4kblANem2sTYvEff5Hh4k/2TLzSOzljHk2ulOKtzzxF5kw6fvgUk641Kmgu+uorAmlxjqFx9r4EuzgU5VYxmiSTsakAYKWM55DZC57pVfWd2CrNP8nH0zIciLcb+w27nF8OmU+YO3O7lrGsA8SJosCsR9E3YFzSaARy/9E/rVk6XisXuzC1l2IMg3y0uxC3xrGxDJMjR6/xOZvB2/QJ2s0ebyIBahslGOYrMD7NTf3yc1Izm1dExJBrYAu/S2VLnvEPt3v2wmcfTjYlHYAYTLShQ0tx5kDGSnNMRXcbjAc5eJG2ICXtjBFrO41Yo7EundJt6YPDmReUia/iTqnK1cODFzuNohcLkvOE3apSX2vUQHCA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NoFLFjzFxnM9dikB2NKBgaZ7NegQ0S9o/cZiXVp6BB51QvMvCDSQb+NHAiStccKmmbgsZ474K6k0KbVRRdXOFFPW3KQE1HIv8cZulN+XnOU+0GjaDsc8a0kShLh6TJm38/igaFF8PC30gcoQVP96Sq6/izsjztRjvxzEn3W4qTYskiR2ZBGF7u3xKbs01YnxFy7YUfKirzTpE2YF+SkZFRhLHbQuSk3nv/GTKB928FTxe7I4KV+fc8J/1OvgE42J2xwbyAd1Dj3vQzZVvQsXhERowkoyW/0xQ9NOmYjRsVvswkTNGZKAD82bZRZEDIxab8iMMNkiGYQ6aErpUh8UJ0FopLRCY586priE7vjd44hfbtjI8BqXDIavzNuQE0ehK8/IY4EfUdVKvVeZOxYQMqYw6X+Qp8etM4UsUBZiUgcfhBTlRxrcD6Xyz7Hri3Zu
X-Exchange-RoutingPolicyChecked: 
	oF1ZQTf7xLYtkuyTBd9oWYm0nKSFCibOdIFg0/uXTbh7RrszZ4OLe8I3E21X2pG3DZqZbavt+uoteH4bpVpikAZKMhnXmJr1CYCGPRV/ZcewcQehJKX+XUmHgWYKgXUrzjJ9cYqR5xtq6upZHnsHIhWPcnep3xl/WvCZWoGDPzb/SdE366nn9CBHzwO3IsUhoW0FwtEWaMpH3/fuZvLHWipcLFrAMuOdk+rS609pIc9rvKQXDFAOWAKU1EFHXzbpJr/N6qw6hE+umKEPt4YnymitcPgrUI/xwvNrzi6SnJvRDK3cptFJZCGVRSExp4zOpz9wizRGOQM2uMQzgNPohA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:10:49.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59bbc20-be8c-45bd-ec45-08df0cb78720
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0001854A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1EC0B6C27
X-Proofpoint-GUID: rFbZo_knIYxJeB9ZfzTM0lOfAKHWe4BL
X-Authority-Analysis: v=2.4 cv=Wqkb99fv c=1 sm=1 tr=0 ts=6a9e718f cx=c_pps
 a=9FhzUGQqNQs6ZJfz/MkW+g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=7HzMEOKdCdbkIZVfo5MA:9
X-Proofpoint-ORIG-GUID: rFbZo_knIYxJeB9ZfzTM0lOfAKHWe4BL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX+FqNH/4ueTSS
 O8+N+krK+CuFv10tKLkrJUFRyy6F3C8xyJ0YT91FXHidxrTD0e4BGmiw9egxpW1ItiBdP3+yovj
 Mom5kT1wMvBttcx66KcJ4dcJww6RxcTNSeYoMZjB/okUiF4FnR1+jXPKkJSETSP30r/TzfVinRJ
 IC0TI5YV/Y6gRV/TKC2JbCF5BD6+OHb5E/0rVs4IBdBfvK5rUEavffyTIBYZHWIDEX6CgPTAUNc
 lWsIobzIoyJoSqH4jgPPGO85L8PEm8nO1EMGl6etEc7kL9TMxHR8OicYQSFuDwv7D7HBzQXWP0l
 ymQ1TpqTcHzuZ7xGVzPmFIROZQTEJnAc4yEZDuVqaWfim0PFNiomk/FJ2lSivl9F0xIQMWkU+MY
 EE0ZH4eOiVgT/XLy6dLiBmGtru4iVL79rSiTKvfDyju20hshChhu9onx92oVjLHuPWf2brUcdjq
 64wzFWpv1eFtWXBRDBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX6fxXs0W6hbig
 EXfdYHFDJKTVqj8j9hpMVzw/WfBgSAgdP6aARDeSY6LzExsYeRQL5D2RYdVPugBLj7IF7jKHAPB
 SUfEx7pe1d/zqtlbTlIJ8TO/Bx4jGGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:11:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20334

Add an "ecdsa" pass alongside "main" for j721e-evm and j721e-evm-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/j721e-evm.conf      | 19 ++++++++++++++++++-
 meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf  | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/j721e-sk.conf       | 19 ++++++++++++++++++-
 4 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
index 6f904c58..bc0848b2 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "j721e_evm_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "j721e_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "j721e_evm_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index e9327f56..df3af713 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -25,4 +25,21 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-sk.dtb \
 "
 
-UBOOT_MACHINE = "j721e_evm_a72_config"
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+ECDSA_BOOT_FILES ?= "tiboot3.bin-ecdsa tiboot3-*-evm.bin-ecdsa tispl.bin-ecdsa u-boot.img-ecdsa"
+ECDSA_BOOT_FILES:bsp-ti-6_6 = ""
+ECDSA_BOOT_FILES:bsp-next = ""
+ECDSA_BOOT_FILES:bsp-mainline = ""
+
+UBOOT_MACHINE = ""
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+UBOOT_CONFIG[main] = "j721e_evm_a72_config"
+UBOOT_CONFIG[ecdsa] = "j721e_evm_a72_config"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
diff --git a/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
index a5c10824..156ecb02 100644
--- a/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "j721e_sk_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "j721e_sk_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "j721e_sk_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/j721e-sk.conf b/meta-ti-bsp/conf/machine/j721e-sk.conf
index 604f8930..0d95b6f8 100644
--- a/meta-ti-bsp/conf/machine/j721e-sk.conf
+++ b/meta-ti-bsp/conf/machine/j721e-sk.conf
@@ -14,4 +14,21 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-sk.dtb \
 "
 
-UBOOT_MACHINE = "j721e_sk_a72_config"
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+ECDSA_BOOT_FILES ?= "tiboot3.bin-ecdsa tiboot3-*-evm.bin-ecdsa tispl.bin-ecdsa u-boot.img-ecdsa"
+ECDSA_BOOT_FILES:bsp-ti-6_6 = ""
+ECDSA_BOOT_FILES:bsp-next = ""
+ECDSA_BOOT_FILES:bsp-mainline = ""
+
+UBOOT_MACHINE = ""
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+UBOOT_CONFIG[main] = "j721e_sk_a72_config"
+UBOOT_CONFIG[ecdsa] = "j721e_sk_a72_config"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
-- 
2.34.1


