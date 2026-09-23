Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E7CC98312
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:39:58 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.772.1790177989157189064
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 08:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LbyL3qPd;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mI3kVgJG;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NDFBUA1611727;
	Wed, 23 Sep 2026 10:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pyDWiX+LL/+pelgk8PXWFDRWHnoMnlMtlrsxCq71/
	lU=; b=LbyL3qPdjVSb19A6lYy18766t06T30XhXqtN70nZ/p2bXVhUm6kWW8WrC
	D4znyYMvn6/OefZLzowIy+MAPzj3nOxVK/DTq0+I6eCC75nBqNmbtC49ZIWYppoD
	Oqr4kgpajIki0NslDnbc1h+tdTm5fUXSqq5hV5LltOJ5cIoZpelyPW7pjr124WN7
	DmUe74xwTijAfWe+G2/TuFVqVFWg5hXdnkKgwaCsR1CcMxDmN5rXF3MQYpvSa1/d
	zoz7ctP0q0TzBfF6gfVLOFXrbVetUtTXZy7FgPnyoX3arVFR4l1NUAqNQPm7g4Pm
	0DX6ZlMU0T927HL8kaPDuxjLusmeg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77tq7v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:39:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4cXIQ0Fe7HstWwgKGzR8xQESmcCW+o2iRD8mEN/htsswbgGAEmxvYYPEToCiO2+OcVLJEzOdQUais3a/l3or5alSTKL/TOlHcffVwwIsAQWe1jskiQOVMOG5w0fyfBM5uc+NNStzabr/lwf2Sk+eNn4CtHXehrOr7z6yD6JS817RIOlAFx2kshen1tpt3W8/2vH5NivaePSHoeurzlYK8au619pxCy0J9Dw0ZHpEvaJkGsdnGsk3BrY8wqU4ydJ6y+No8ahY+mKb2aIk8Gtna+gX5sORKm6EvkyUiRg/1OGIrMLFO1PGv6fHpkTZnHctyEX6YZXgSzqfdxcgi3XrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyDWiX+LL/+pelgk8PXWFDRWHnoMnlMtlrsxCq71/lU=;
 b=Foa0Sr5frMocZUV6X1w0KWqLtCEEh12X4816zQHq3bRfWz2q34Z/2V93IJ13gai7jmLMSZjzWd3rrq7gUda4ZWCfEdV1f31Z35IthNnmC938e/OU1Dhd3O0b4KcAit6F7jufxNk+Q8fKvQaI6jFgZO8/Le8TEZ1LZYT07pcjvDoUlPIgvFO0/mYdR+xWOAdjL/2i4vf3pQS/fnWYwP7iTPgCC5LYRUPzGoPtnjnR4gYJFamWM3VQzqN5tFCmmYS+E6iMZhxcHFJm5rcDW0kU/8+z1z963pQYHYrIoMx12WXixKkks7/K+SgXb6QAVZFtFZdd4BqsQZVspPhkMFL1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyDWiX+LL/+pelgk8PXWFDRWHnoMnlMtlrsxCq71/lU=;
 b=mI3kVgJGM4vtsOY3s3tMeMt2QWejq6r7JlMTPYS0RRFlBQZN7jddw/sZ43AfJb5fRA6dJp2743mcnY9OVSlw3a+Q9yjD4nWc1N/vjsI5s7j0zOTcoCjMBILvIysdTjtWYODhjVaEt56QykjKT/LNpe5T5tFSq73WTHNybmGQWMA=
Received: from BL1PR13CA0171.namprd13.prod.outlook.com (2603:10b6:208:2bd::26)
 by DS0PR10MB6173.namprd10.prod.outlook.com (2603:10b6:8:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:39:37 +0000
Received: from LV8PEPF00000069.namprd03.prod.outlook.com
 (2603:10b6:208:2bd:cafe::12) by BL1PR13CA0171.outlook.office365.com
 (2603:10b6:208:2bd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Wed, 23
 Sep 2026 15:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF00000069.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:39:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:39:16 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:39:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 10:39:15 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NFdEFk2302124;
	Wed, 23 Sep 2026 10:39:15 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v2 1/2] pipewire: Add platform specific configuration
Date: Wed, 23 Sep 2026 21:09:03 +0530
Message-ID: <20260923153904.2153823-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923153904.2153823-1-p-bhagat@ti.com>
References: <20260923153904.2153823-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000069:EE_|DS0PR10MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: eadbfeec-00fd-479d-8471-08df1988df3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|3023799007|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iSud0ciBomeRqz3W2h2psD/CcXRs6nqfkZPrShIYDwcmhIntidwE260iBTUdGuTBs77lGZ1U+LOmE4KfXPuCC8YhMZt2/2FYQf8NmpIZsqzdUNFIiVpUskmggEGI8/JIlSR8LmCY6Yuqk+mwhvWFB2qgQMjbRFAKtMu45gQvJmAYGb2XKnv2LM9YZbeeIdUCx2nM9vPAl11zbicoIIpYI822PNGqSTFOvzMH7F3bnJ7Dxa04AIpIJ2oKhhVEq326VxIpUi3ZUBSyl9Emeb8h2YsIFC47rZApUEfEG0rB/NeYJ3LBkA23de0v+s1LV02XRHAxb0RLmmjm+Uu5pHPpeZgJI6hrZiLKlmwrF2fHfTTaG+WzUj9VaAu5JAnYDfWVcENMTBlCIUVHQHGITq7VXlIRhj7QDVqBh8ISmCNEq8TqM76x8S2WMq0Zl1PoX0lQclp+KzGa72tCgcKGWiALIK4saCdr8mVPb4+kYsBe9NBECANF65S+Px5rqu1pBF5iPwE/YDblgvtLPx4xuufDGiFRpaVL3L8nPN/9vrQ/rWAdkppRdOHW1/joIekgD6+NM7xvjtGE/rHEEoZXeUnnh5X8NXd4plEmOeJotg8Qi9j2ziqFu2a3fKFQSbwGAcWFPPKtZCcmieV725YBCUGVlUY+2/9Dd90X1uE7EdeZ4eXb/y/x6bqVuR6cSTLmVSxSRdlHlM3M+PqWRfQwjt2GQg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(3023799007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yxy29Sllr3ilS7m6OXqq+d44E+A9DsOrqXy8Rm54OmxJ8tA2dgR8yU7sn+wHjb7yW0sT+IJcvwGq84TwyQIDrU2LTvbJ0oIQeXuO1AOjEt81w/Fjc+EnD4g4SNK4pUqAYwpNBFlG3jlClP9yom0tsZdEeHIyleo4l5AVfbx6xBIm9gvzykB617F99Fo9cKxH+DVBlPHsljeX4TNDg2yGefdOCthsfSUSFK46tuXVz/wZJo+9LYoxzTEjWGk0x1KtlVXQxWwBbQutJYiu/eQ9nsCotOTKkj/zxXLB+rZWTVRs95RI0oXSOaIyiYs6TJm158QOtjvrcfRoPgtgjdRHd1VTQGcoekSJKAWeY3HnghqTxzYyP/8DHYeGBHSnmVVzDT9xn5iwvRy0A/2rQ6/aphz4WMUd61xXXPJKFjIczKDDj/k0pZ6QLshihah91VNv
X-Exchange-RoutingPolicyChecked: 
	udGTBTUJdFJx0mHlF+ihJA44NP9tse/7IpDdBY0M+CZREaY0n6k6KnPjdCdWatyVrargrRjFSeyMM92K9Brq68i5M4ZLKZN4H8oJyQ/cfZuGOQkdqU/nUNBUuAnFhe1GIm7ViSPxpNPGaaKSwykCCkHMYw1+rgNA0TbW/6VNmBpZ7E9LuuhmweJJVldaoVZP/bXROvPgESWdbFMnZ0rDAF1JI6N4V11dEV+dcHErnm6seLc8x4gwNFtYkAyUsLPceDzmA3qhs6n5jH491awi9nV9S9pgv95HFDxowAQzhiE5/F4CUQtoO+xNXJB+aXWjRp9pZGcxkizILeiEKsVRMw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:39:36.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eadbfeec-00fd-479d-8471-08df1988df3c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF00000069.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX832kO/Yf/SCr
 7Y6Z14+WMMjcmBGsLxU9U6wjLnoH5p9A7eDtHe0Txu7wzPTkcsk9WGKicnNHjUrRJ4cQtYqLluN
 tn0SBEfAq5LhPEhF9Bfjm6HiKldVzdPCPiJf0mTlKfdfXRBZ5da3kdpQk+ZpPG+V89OlbxcuYod
 2AJe3UWW3V2PX+FRRHnxiNJAjGEb4FgLm8KVm+PdueNAmxaBIvIyDMzQcu3GUSr7oIbGTQatCQf
 PVjGmY2rKBqAsQ5vDzHnxWCAhtB2/DrUszI7bvf7uWR4q2TKNiU4fobnjxXuJYf7lRYDElPAzQy
 ZI/t4XHnknowDWhGnF1QupImU3B3bc1Q1GaDd+y8nRRu+04SzvOzB46p7CjHEM43Up27Oe2dklv
 LGWC4o44sEpRQl4W29/1oy7Gln64UovjmvidyLlRGllCIFWwkOfIaSE5CKL9QIEtdya1tTAfJ7T
 PZmiQNKsHIcXl9rjKSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX+geL4U0uGN6G
 SAFp2g1m2B7Yg6Pcs1084hE79yJ+FHCAwpPvKKI8u45mKudvrbTqsVY+1dXeE7P7Vym4IKQIxVs
 iWcwsrKCqKXup4vn53uUCnyQOIT+fxU=
X-Proofpoint-GUID: kruNhGNjEumsqbSik-5uJGGrFMnDm-qS
X-Proofpoint-ORIG-GUID: kruNhGNjEumsqbSik-5uJGGrFMnDm-qS
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab3f2c2 cx=c_pps
 a=OANxLEngf0bc/nxW+UjZ1w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=XgT7tb4lZfqlI_RVjF0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20402

Extend the PipeWire recipe to add platform-specific ALSA configuration.
Add sink and source configuration for 8-channel audio playback and
capture on the AM62D2EVM as the default configuration is 2-channel.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Moved pipewire recipe to dynamic layers.

 .../pipewire/pipewire-ti.inc                  | 20 +++++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 ++++
 4 files changed, 58 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire_%.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
new file mode 100644
index 00000000..65a82671
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
@@ -0,0 +1,20 @@
+PR:append = ".ti0"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
+
+# AM62D-specific config files
+SRC_URI:append:am62dxx-evm = " \
+    file://90-pipewire-sink.conf \
+    file://91-pipewire-source.conf \
+"
+
+do_install:append:am62dxx-evm() {
+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
+    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+}
+
+FILES:${PN}:append:am62dxx-evm = " \
+    ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
+    ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
+"
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
new file mode 100644
index 00000000..857c344e
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
@@ -0,0 +1,17 @@
+# PipeWire sink configuration for AM62D.
+
+context.objects = [
+    {
+        factory = adapter
+        args = {
+            factory.name           = api.alsa.pcm.sink
+            node.name              = "alsa_audio_sink"
+            node.description       = "Audio Output"
+            media.class            = "Audio/Sink"
+            api.alsa.path          = "hw:AM62D2EVM,0"
+            audio.rate             = 48000
+            audio.channels         = 8
+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
new file mode 100644
index 00000000..ac7635de
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
@@ -0,0 +1,17 @@
+# PipeWire source configuration for AM62D.
+
+context.objects = [
+    {
+        factory = adapter
+        args = {
+            factory.name           = api.alsa.pcm.source
+            node.name              = "alsa_audio_source"
+            node.description       = "Audio Input"
+            media.class            = "Audio/Source"
+            api.alsa.path          = "hw:AM62D2EVM,0"
+            audio.rate             = 48000
+            audio.channels         = 8
+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire_%.bbappend
new file mode 100644
index 00000000..f806d28f
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire_%.bbappend
@@ -0,0 +1,4 @@
+PIPEWIRE_TI = ""
+PIPEWIRE_TI:ti-soc = "pipewire-ti.inc"
+
+require ${PIPEWIRE_TI}
-- 
2.34.1


