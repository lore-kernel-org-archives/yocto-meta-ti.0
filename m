Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F19FC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 21:55:23 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8152.1782770120516008270
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 14:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mEAnx7l0;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mBBtkDE/;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: jm@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKf7Xo3090660;
	Mon, 29 Jun 2026 16:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Aew7Um5g00l/Y
	q5escYF6jo/we2dY/bSje7wBHd+aIM=; b=mEAnx7l0hzNyxXtU4aNWC8f0DtlU5
	k1aqlTaUjfvTyQmZuFfRS6L8O7JrfcmYnrtG7Oe9jrYKdkOLZ6JQIQvnZdu9Zsdo
	6quhnamb2n7HGYX0cwgSxT4q9bq50IrnDv8MvGTyAcMo4MGbp8+spgyhziGzCepk
	bmtWcVWGf2fZrKRt8e8c+UQt1+JmQp+aUVK6AW5e9JHo0nNBmIlIXeMZGY4Q9hfs
	OFCv5CsnAgC2KXNZG0CcCHuHFSLZnIRgzUmh2wxVXvneeQr2UDF+UGDPc1ffvbIP
	fTK70nqiwTNVjdpCSWExehiC/3m8gFEUVk47XyxjrVrxbjV0YN8/Nr5Zw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qngw4mk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 16:55:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0Puy9BT+ZSKiImZiLvMppmO04wckEOijWo4tg37ptzRNj3G7fMY1ygN/v98rGpMXPQA9rWunpEMoWJB3W9xHGugyQKlVxCutzTgieiBfIltaaqpLi4Yx+A9hkJA0NuMS+gqH4mo2WbYEkw5XpTo9FPgFWIK9oQB6ksSFIaIDilzzVmA1nYAiIfb7hbC29QD1DR28EwoUNhGasaeucfA28yOfvSByzZpC4/o6GhCVXr0xZ8TxllSPw/zdlsVxQgI3qEycyWuUsnNPYLAVzd5wH3slPnJqm/jUHafqxl8BLFmccKhKpp88uuz6r+naDghH0ex2awlAOXY9Y5IQ93zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aew7Um5g00l/Yq5escYF6jo/we2dY/bSje7wBHd+aIM=;
 b=EFoMHegXvx3hNk0uSx7yi61fAVMdUyax35WAunfGuukSV0eTMPwGQ2cje712PTe13rhw5+EzDFESuiFLvcmABAcU1c9NGHoNlHr23gn/Rwm895CZ1xkN3Tw9T1rGyfqqjqE90qO8QHrSnmfyxNzQJsi86h3OoXE268LzQ2Zvl4U4dL1f8YXk2SL0qh59N3/gMLS1k3AhClBAk07KUFTWPhryEgbWZ9ZEVzvbdbIy0pg+CUCm1ftuGNeeJJGb3N5bYMxpcPYtVx83wmXhRUTeByjWiWqGFJcmdLirxrbUcIDBFVLI72OWAzE4yFOmMz+x87esJByQhhp72xlRNTz5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aew7Um5g00l/Yq5escYF6jo/we2dY/bSje7wBHd+aIM=;
 b=mBBtkDE/Fbc589/H9E48aybAY8wVum1Asq4U/a4iglvHsq/umr+PoKAvAMiOxas878W9eaKQn2RSuu7BQp4ch+3xGTx2TDY/WwSCp9CIoey+hI1EEs5mQB9MXY86QBWu3rdGWgyG+QrdmekIVvkhqFC53ocKkRBxeq2SKSrNP/I=
Received: from PH8P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::25)
 by BLAPR10MB5156.namprd10.prod.outlook.com (2603:10b6:208:321::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:55:16 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::2a) by PH8P223CA0029.outlook.office365.com
 (2603:10b6:510:2db::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 21:55:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 21:55:14 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 16:55:13 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 16:55:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 16:55:12 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TLtC5Q952666;
	Mon, 29 Jun 2026 16:55:12 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>,
        Andrew Davis
	<afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge build
Date: Mon, 29 Jun 2026 16:55:12 -0500
Message-ID: <20260629215512.88924-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|BLAPR10MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 818fba1e-c6d9-4d37-b203-08ded62919e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	AGxOgKObevmUaYBmYURvJ1hjPm3HMRHCnQNro2Nr5Q8m5PZPOr7HSDbUVDb98NF64jVTnCbPYXpl8InW2hZnqL0T3Y5lDQeRwJuOlpp7xSk5T0EotZTAmpl5Ec7/G2He20St5IsrVphqqOskML6Kk8MsN0hhRJylzUxB0PN6myJbQBvatkZtbjtc5VDX0Ojqh93NzF27RlsbCD+l4GHyVrQ6eJGQDLkPaa5p/NV/qegxm7dOCidVwXGfjll+MCLvXFhoAubLIIBD+QSTHfMWYQjfcUwSiuNpKr/4qlHYXVbqSxlckzDsxKFvMmJOs+Pjapsq66BIfU6sm0JA/+e7TgGLvwFlV0Aektq0ulAx3akmYKxiq4N4YFoWsBoOPzQEtGrqpvz5YDeSXxPD1a4/kLSHozPbb41+Vco6o0twvqF1SWSQXj3bylBXsy6Ep+B4zboIRs71zMs0NckJp1WgbQI0bI4cbm4V1koTIGlE+GtPlJETK4FxtCxAVVbjfNGO/RGf548SfTcFPNC/Y3X9bFS7QXKIIXNBGNDVZIzFhC3FBipNnzy2y81ldh8VS2mbvSYwDtakWxKMVTfgC03zffrofVC4U1m5jUSz43VNT0weGpjnWiiWc3pgLYTQ6cTeXNs2ZLx8vPHbfdbToCOT6P7ZrAiAjVrjG107phSNUkZ7aRu8RTNAgVtvP5+kRwnH6ED0GmzHXxs/xr19eD0yaQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JYhtg1Ri7WOh1tnR26EgZmzwPIJhacl9FDbRFyxdL8F18XRdZ3EDz0wP9B/JpVn5KWDo1JNFseXRbCTpHWUkiRfWg+Lo0YLJ97Pl4ORxSWrvX+3n2ZVz9XaCQKqOC0fKKoHQqYiukCpKrjDBHLokyVSCY0OSrfkJKf93JZuEXbC9/yuMWTfn5YqdbVcRwSHc7SmJY5auMDkkim5jM8jXwppD5Uey8+IFORFTZsgurhW4f9+vDBfYDqTpt85AFdI9VqYmxQ4b0vA/xcJaM5m4CH5N7HWxJcoSV3Q7T8pm+qokbzBcsUTgr7SIHhAzVgdYQWjBQ8ha/IsTJeBOxGVynD1B732aOYPBJbH/48JJSzutFquxeHDbsYlPdDmm85QyFHpoRSsi9m4952CHDeWyQ1d3wxj5LMqJ2BGWPN8YM+dvRsqoPUFJsEiawHgwXfi4
X-Exchange-RoutingPolicyChecked: 
	A/TJli/hx3y8xIZcasGGubeyyGQO1wkX8LlmMe/mLKB+4jdJ81+77KumLS4XKwVp0lvSnigPoWRzivaaptWnqJRBpQhX25WZfmeB4aCOZ2vZdB2EIwHa5EN4uWCY14yufPsnOS9dQuGepRrM86hCwSQrA1AKG37ooF6E6pirK9uYwXHQqztQ8TXd32+sEl0dgC4hk3+PfToi4NMK6xpjBYQoEfqx7nrMECm6+y1JGIV7WDjLMtofiwPZ31n47EApDyQAwz9L5aTjdTH69AJeUexvQEurVL2ioHqU/XPEuqt2ptF3xy9tpcbw4pKb3tYMilNSiekuhLpamIh9mfaNyg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:55:14.8784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 818fba1e-c6d9-4d37-b203-08ded62919e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5156
X-Authority-Analysis: v=2.4 cv=Yow/gYYX c=1 sm=1 tr=0 ts=6a42e9c6 cx=c_pps
 a=lBUCPINxFTLumcbCLOYEQA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=XrS9OUPtBclnAwdfKUYA:9
X-Proofpoint-ORIG-GUID: 7hRWVL4gdgyAsmzbobtBNtHPtz8NRge-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE4NiBTYWx0ZWRfXwGZyH30s1Kap
 4uwrraZYHjosCNe3VcAwJcN7N4HXvozoAAlkrQvf3uz4A66s28MMAMVIzOCtuPVxwKK0cQcdiKb
 Q+WeB7TeDayka0tvK7pLSvrfxF1zB/ppWZ5cxDavPNTA6ayqVirTEHqg7XIsaFYgL93QvgUpCqx
 OQM9A0akLF1Pmie7Bpt1XHYDI4h5RCGashJLtddy9N57C6LCw/mK8rWX4i175EPg3teOpJYFAJm
 E63IZQIxfq4B4JqjTuPrOcEolYYbHEXW9cjb7dNeQ+yPDPpsYH7yyyIsicw2tAVTpNB0IIOxj/p
 FGRYCZGun7w8Q82/SWWAgSjVq37uQeNbDy9iGKjyNLSI90ya+avSkPdUp4nVuD27YlcE53ebxed
 ICbzMdO7uUb9DZPTPQCxqvC/Yk8VHEH37teRmOV/KIabQEXDIKc1eO6tTfH964vbmhXRXEmwx38
 8wphLHW6kjuRAGXCIdA==
X-Proofpoint-GUID: 7hRWVL4gdgyAsmzbobtBNtHPtz8NRge-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE4NiBTYWx0ZWRfXymx8Q45aLkXx
 DdYcbeAuW4192jWLV9QbTAvaiBKFGgGPir8xO6FDVkoeWGsLSVHgNYlLSsoggbURlD1q2MBjark
 UkVhFhZBmhmYozgnQ7/Q7G+R8gbAwa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290186
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jun 2026 21:55:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20105

Fix BeagleBadge DT which is now k3-am62l3-beaglebadge and u-boot
build name which was updated alongside DT name change.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-beagle/conf/machine/beaglebadge-ti.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
index 78525030..c29031eb 100644
--- a/meta-beagle/conf/machine/beaglebadge-ti.conf
+++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
@@ -11,11 +11,11 @@ MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
 UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"
 
 KERNEL_DEVICETREE_PREFIX = " \
-    ti/k3-am62l3-badge \
+    ti/k3-am62l3-beaglebadge \
 "
 
 KERNEL_DEVICETREE = ""
 
-UBOOT_MACHINE = "am62lx_badge_defconfig"
+UBOOT_MACHINE = "am62lx_beaglebadge_defconfig"
 
 TFA_BOARD = "am62l3-badge"
-- 
2.34.1


