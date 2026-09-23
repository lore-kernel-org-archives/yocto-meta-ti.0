Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D610DC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:40:07 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.770.1790178007495215150
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 08:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=d3B5SpDc;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PzjhJxha;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NDHov5461329;
	Wed, 23 Sep 2026 10:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=8BKkyir2+vBgi
	E4v9SJ3t+EGUR5NL/cljifqf4I2Qbs=; b=d3B5SpDcvP0nQbLly7vyQsXhrp51b
	TXoQ0JBXY7SGZxiMLeHu5ryzStbbnoFCQdga5G01pgiEtFKDxTLBUvs+y6qSBZ7Z
	y14LhYLQvNA8slFDt6FIger4BY+Lm4j1xFiDT9cT6eA8SFpLvEfIaz+5fx/F5HYg
	EBZTqQ2iwbPW3aQIbp79QzJG7us55drzaJgHJZ7j/62CQPNF9b3kv7iVwWGGhQbQ
	p1z3MnXIqdCRQBEEYK/Tkh1648fs0ikST48/gbRr00dj6PWzCN5sWUjY366/DSEw
	qzltrqgYnNcSh3Xi9M2KKdbcLKm4JOzt7h94M+WLBNv+l3/Byh83QjBGg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tsd617-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:40:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0CLkSLNMCj/jB6QP7r1co9NgqrpgBhPVVii4CTgLEUaUlz16RJK0R0/JCkTdyLlaKk64Zrrr4/w1FCcYM8YnBkCQrAPtYe+n5TEdfUYUpe2ttKwAnzycQJnjg6sH1+CaQMKijemspLZBngaFcBTWyugaL6zPFK/M0W+SX88XGR2FKjIUdCPO1nQWY/peZEMGPfkjc064kk6GFAjcFouuVmSQ58WmN6RWku+dKpmjS6b/pTuQ8C7vVEzZ4IQOINLg/RgRwZuxhEMbM7VBY3UmpTSQJJGBpStUyxwURzml12tRDmlytWfizk+beILs79yB7ANmQ4gIc7+UoBGfg1L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BKkyir2+vBgiE4v9SJ3t+EGUR5NL/cljifqf4I2Qbs=;
 b=SN80BhOThitH2boehsdEVxds7++eDEnj0WEwmR9XolAPcEXLqH0ih7VFi8QvTK2d6rrXD9G9DGuvTsY0RRn7JfREii77ERxaOQr3O0CGlzkY30WwBlj0dsZoFZGbnpwq8W3hiUHcO8oKI/LtrC2gZMvulHs9iUH2RJiFHIP4/5t1uL7CljDChHD0eMHRuEZegHPsHx84hq5SzjibOIcVBsC+7Y3ALWpVkVP0g4w8wjoHykbMBbkHHRtjmvS1UK4XLCPhDvofVhz2wrKvfmdWA14qhBbrlYvy4bKdjIpOzz3BIWDXCdhM4zCSukU10tdRYjPJzlS7xqVgJHxnonrxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BKkyir2+vBgiE4v9SJ3t+EGUR5NL/cljifqf4I2Qbs=;
 b=PzjhJxha0d/etOURBEqZynN/wcTPbUKg5nDQyqsXgjv02phSS9HC3jFg+QkDRXb0rkWlZVCIraSYotMNFvnl8PzrrcHQYYRxg//ZpN5wvBIe84wqfJf2hXK9ScjP8WLnDwl1FfHp/Or86qgD0UcxEVXYx59p/C6N246jjLhGiII=
Received: from DS1PR07CA0024.namprd07.prod.outlook.com (2603:10b6:8:44d::6) by
 MN7PR10MB480521.namprd10.prod.outlook.com (2603:10b6:208:637::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:39:31 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:8:44d:cafe::58) by DS1PR07CA0024.outlook.office365.com
 (2603:10b6:8:44d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 15:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:39:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:39:12 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:39:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 10:39:11 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NFdBZC3195873;
	Wed, 23 Sep 2026 10:39:11 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v2 0/2] Add configuration for pipewire
Date: Wed, 23 Sep 2026 21:09:02 +0530
Message-ID: <20260923153904.2153823-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MN7PR10MB480521:EE_
X-MS-Office365-Filtering-Correlation-Id: a52b5993-fab5-4eb9-c070-08df1988dbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|13003099007|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ILmDKN2tsPbkEz47ZfTpHtc4rofCpI/0hgxZxAAxN86AZ5XJ7IMQ2rTQsAnT7pRir2yPo6B87hs+wRzSNMbjExj2rkqsW+K24JMvKmRJyz+NPv6AkBpFhqDL0knJsuUm5DQMnJ187+GVkZOC69y6jDTfSklvMJ5Ex1ewyJb2IKQuUMRqibkmnTE7EP26LsNNsrjNKM1xwLd7qHtuSwlRo2E+9KlXN+TMcfBQZwgzwZBkvZk1RhisO3Ht5t+ZetwBcpzj2H07aO5Gy3XGBe1e1GdKBT6mExbP3xMlr4lTCDWUlpjkEA0shUsVi2GP4gUfjJG4bIUjuzWLEihgSa/06mPMb90quiM0FPgXbbDOUof2ya5OxBAUt3xEuSKx5RnZTaykyKj0yBZGa4+oN7zIbd0sKkT6PDFCrOkkY9X2RS6vGFi96XxPv3CwqmhLKgNhUtHQiqiFKiUC2dzSDCd47Cl+V/2ET5dqea2SAmZa/c15MANjdhfMDLt8SoHnYHl5folZwCJ0u+Pyk3LKT7d1PHXEP1lJPCYpKi5lJKEIhDW+A1XMDMgU7WWeIzNWAxUUzZyLdtp6fsomDAlBiovfZhVlgZHUXM6nqHtLR1WpfodoDuP54JyAwEf9/qWTEOvxaOlodwY6kFpJRWAhJyPRoQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HlY4pPxB3QsDIw/qSkkP3g8G+XqdLbkVzT4ZxUcdJy0n+PFxbXSDSzx7aCRGI3TFc0rtiMiaDrvmIGs29MYEuDqKtLm361UQdinurItdUZdPz2scbBE4NiKT77Ff+pMIUbdorE2H0e7CZFDXkygKnEF7aSwFqae+sVQo5xJfCpKrGDL2cfnw9IWDC5gTZoYWWGUQgOv7QBhqbu3FO8DmiC6q/ovfpVJ++j72bq/Cnr6IjZGxUsFL5REPA6Gbixw77TFUPjHZW6uoVDJChm44ORNIZ7caTmXMZqJS1gprcJXua5U7HayQ+XeOrL029wI+vSb6zbSnTrPsSPDkSRwOkgmhCRfNZJnghMYhZj1gPjD5dhULKIkmD/UIUQ53XdG6KSANVuAcUPZ3QKfSheR1Evda7XaCxmQmVVvX50awVNfaS34KIxaoQPdVoRYaFDLw
X-Exchange-RoutingPolicyChecked: 
	aEJyE3Y/dFHD4xKA8STr9hsESZPfEUxAybIruJiFGdt4gSY/reD5WdqMTLLif35BPOieravcbXIAuEa3kVXXpMtabNCmYW6PJvqubbbuRM+4yREF72gImko955arSz6P+rdV6YfUYbSHB4RwCcAed33KzMIiBGWq3GAZUsb8wjKCvgknm0SsIX7mMXCAVaZ9IGccoEet4gR4TUHp244S0xxvBFWq/HAsIRdqx6CHDpt5veHwKivi3hyENeJwg/qEQmyZQKFrVlwnUkeGRSuOIJsiNFjKrsuhiPPV/7wLDfiZJHTp/yw9AEzgi5HMkZHv1l+OxC15p0PG4ivPQsFnkw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:39:30.3876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52b5993-fab5-4eb9-c070-08df1988dbdd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB480521
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab3f2d6 cx=c_pps
 a=oA0oAqHEqr9/hfEU5FnDzA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=A1TICR-dnY2usqMILdUA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: QbTKbY62UMXqmQWkXQKfWktv6CK2znIA
X-Proofpoint-GUID: QbTKbY62UMXqmQWkXQKfWktv6CK2znIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfXyxnLH49lB38J
 2LdNoUGPyJtIRg7jGnm2Nf5Q4uBRgNxnFEz++1ox6/ahjGhE1XxhfpFl/DBzkXU2h6bk6bdKwUy
 k+OzZXvYD9xLV2LCYskNkOaElraFmnm6bYJDEjUtpSyu6XD2YAhyN7+IvaBB16wfFa5sPKEnWSm
 pc8ifme7YluG2WepMbxwJ8S1l10ACcyK5EY8RBJXKSofAtBsVYk12T2DHctb8VFIjeuKaQDeVEN
 iuDbW6mzHvGD+NXmgC1v9fHy4oF9tlcdNwx66OIb4mZyCLTDGjXmkIs/a6Q5lId9WKAQyTuPgJv
 IAUpcnUN/02pu1pBUCHEPPfAfEuj2+CdqEzctUDqk+XpUtByrdlgcTyuyKnr0ceBcCmhAgaxoO1
 bs/8r+7TmTdC5osRu5mzqDi6SQi7Ie0Vd+Ik/QB5tEwQb/agwNuuSfapnOuf0fUk0ip81Xzq4Xg
 rIhKwELnrCA9Yk3xrUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX2GwRxdzoWKLs
 jSgenizcLNTc2GrgU5VSgguzHu+K7/aRH+nA9+tbYF9yo9GMzHXNMK5Wwzal2HrqIZyC0Bt5qJi
 dR0yK5U7SIN+2tYhiftQL7i2+9Dkcnc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20404

Add platform specific configuration for pipewire.
Add multimedia-layer to the recommended layers and configure dynamic
layer support.

Changes
v1->v2:
	- Move pipewire recipe to dynamic-layers

v1-https://lists.yoctoproject.org/g/meta-ti/topic/master_wrynose_patch/121372227

Paresh Bhagat (2):
  pipewire: Add platform specific configuration
  layer.conf: Add multimedia-layer support

 meta-ti-bsp/conf/layer.conf                   |  2 ++
 .../pipewire/pipewire-ti.inc                  | 20 +++++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 ++++
 5 files changed, 60 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire_%.bbappend

-- 
2.34.1


