Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690BAC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 21:38:56 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1366.1787866726434240446
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 14:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=m2yM6QWS;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QW0rJ/XS;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67RJJneu3732084;
	Thu, 27 Aug 2026 16:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=FjbjdTUBTFcW4
	0M8Ax0MHMKPsT32iizIeFkZKtNtw1k=; b=m2yM6QWSroAaJGjbslOtSlOZ9nVLo
	sRVFwNy8ezgRSb3h8B45N0U/cUX1ZS5Hob8SFH+5F+SoznOVBgHNyBPNQ+d6cWvb
	ENtHAcOdL4OiQydvUO7jdDeCTZZnnAiHeg+f2rwpYTEsvkKn7j/ljwoGQwMdtqbl
	XqFKzrjfr+57W/mdEgAUVxDwf4SHEKM7tiIwgtB1leAVeZ6r1CMcBdtjg2TZ/VH8
	dwkBMQ6PgUUpliwa5D+eKfYPXJ6TPQux1X4BnPI8+8huEGUQTizwSkl8zzOQdi7q
	PnqojUUdJkyBtfibhl7Z+S5jR/LP6eHMP6k//+yV63rGzGeG6fFweUjdw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gahg3cn26-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 16:38:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Soy0qCHJx5/WolWPFHAS4aQpP6eGRjVL+PXJtY/+CRJE9xsZPQQ7fRqtg2ce8iAeITrYZW63OvhkJc85p4v+ISmz2rQsi9XXJiRCAc2BbVjuWHMIlG8OiOpQBs9R7RcAQQceJFRq8x5kvB3+C0+Safwgg4aQ9Cu//hTxLuG4tJuKTT7M8hYDuIly/2PvBbt/bY4J0HqnyvMePG2vPUhWARO2LRnLyDrJsaaHCZ+oaRScBvHxG6+XOZb9uwJ8j+1Q+XmDJ+296OJtSEA6r3sF9zeidZ1NomhDRAd3P7OJPN88lk8KuyETKlLIzVCPOIEBQEq9QfEKFvR675dg3/wBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjbjdTUBTFcW40M8Ax0MHMKPsT32iizIeFkZKtNtw1k=;
 b=nkHY/dSOT7TrEXCmMqFwtHF7R+f/yHky9u1bONHTXYKPbI+PBUoZGBHJpnjif4HWv3mYSX2duBtWEd3Q9CJLZebmdZr1IkCw2jI29zQ6Dv1mbxe4IcdQ9TAZOotmx+eG3GxcwJdHCPnA7ixntNxvrB9hb5oDGRKqEvAPgDKd+xlO40pNt9eO8XrZVw2lY4XabcVQZAwlnoxNIUs3zxUYBbDxRQ6KTcE54n2DGxRg1n5LLkDeyShIbvV61J05uhWcz5Uy66cm6EH/xh/yTTbpXZ1SwvDWzh4MpIENnZ/d5po3lNyEzo6n/Sl1u9kxBIRJgNfBdaOWs0IzNjJDKFzHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjbjdTUBTFcW40M8Ax0MHMKPsT32iizIeFkZKtNtw1k=;
 b=QW0rJ/XSolIjP2fLec3dTCeVhukEtD5pPMqWtPsWCLth2wHSasFSKLMLtAT6c1NL5+6/OSlf7fMGgh4KoX3VykYP3dbItddxWv5qJFqx5GfZW2m3BlFRIwhfnrHkz3f1+CnrM5L/5T2RdSHS4ihp6TfnlhZ1z/dorjL1OZTCYXU=
Received: from MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::16)
 by MW4PR10MB6323.namprd10.prod.outlook.com (2603:10b6:303:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Thu, 27 Aug
 2026 21:38:38 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:303:80:cafe::9a) by MW4P223CA0011.outlook.office365.com
 (2603:10b6:303:80::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 21:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 21:38:38 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:38:36 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:38:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 16:38:36 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67RLcaDM1566226;
	Thu, 27 Aug 2026 16:38:36 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wzhnw-00000008Vqx-30XU;
	Thu, 27 Aug 2026 16:38:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] linux-ti-staging-rt_6.18: Add ARM32 RT branch
Date: Thu, 27 Aug 2026 16:38:36 -0500
Message-ID: <20260827213836.2029060-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|MW4PR10MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cf62ec-8276-45e0-8909-08df04838e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	KZfJk7rlHhzyq543N+U4gkCXdikOsRg/C1r0Kiybm1hE79M8947or16iUTJYb5xQT3lAiXR8kVgToFTS2UMA9Sbe4HeBaZcMwnOlRfJdrN+Qi2EpIrz0DIJMsJCBnjTFk9v3k3a68KhH7cL1QR2sOwto/jr20E1/Bq4bEf4IBDitMkGcKp2YOgM91KYhe6omUwJ3xYjzmbqlDvqy9hGQIU+p4W1EwCd9Yg5zTGmf2IbZD/AoKgyF+aRhWVexxQ0GnRF9nBNN0+VT48kHkChTncw54YwP+h6NWSVc9uS/nxewYkVFXsAc/yNXB0RypNco90m/CHW7TNz5nqGSVHpj3JcsnUh7b99Jx3TgXUfHMaF/V5briQcgK1JN3ve2/AeFaVN3ddF+4S1vwK7aUhoWyNsNF2d8mp/w6D8x/KLhCcCOK03ceix6vWgobhm7DeZV2MIPdIW4mG64JfAYpNQWE+NTpJ+V/bI9dFox70byNTz6Acic4a6NCYnhOCZ7j/6nTLZlDbJ7yiPsHK6X0tlCoEyMZnFg6/BNKDXb51JyVYk31GUsKWnGqLODZAk+3waN0lfAo4xm1TlXb6EDIXGQzclYHZwO7BUjdP0n2GCkFHjKP4EgJ8TsInqIfze7FMlU4zrdyXQMG3THyttSj26tBSMxa+Cijl7M7YAMvFeNkr6dgFqaOw1ujic/zT9Fg8u2gIGQdsEwPQ2Ou2TIYtQb1g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CGXvqafuYCPRKK5CzHotXoogbC+TyJ7GkQFBeOrAan2C1XKprqXtGkFKdRH1o2ehaxWAxFgp+ErvPZtAgGWqOcz2JLlqd83VYt6iMzrbwEotYtmKO9RR7PqU+Np5XCaxGNNb9SWEHzgB1wLrJWReKPfoKN1nRy1EJ+B6+/GqfH6j4fm32V3p/mpjJb8n0lVTAEFIkhBwssCZWqxth8y4FA2W6BA4dkbmODxpS4A8sy10KyVA9EtC2sZ4BcBWNW3gzmAxTv5Ob9pudMR50LHfIcYg+qwr64z3lrfMYG9OU+DU4eLxwAbOWtChbfzw9gFcR5YUMDNVPAJpkGVvBOUr0DhcleTkz5l8+EvEu5yV2U+ZRch/4/x5iSZsgCHu382Pgg4VEbng/+4Kiw+QE2DktB3mhI4u9f2Tl2gOm7mg1m2Mbk03jsraJ6jnHLX6fBwc
X-Exchange-RoutingPolicyChecked: 
	FjGMKtwW2ws2EgID1AOM5GFuI1oFYm9LgqwnItYZv5VMJ79Elb9GxGSRhmbKwTM1RB7apRqN9iFEWCaNvOJptRePIs7c/K8YBI+SARLSSfLsJKKYGVX/lMadgRKTg42PsPpZFyxgVXBttkAet1b8VO7+z5YLs10Mb8NbqAWLY43cqVEdej5LykM/n698URq9VYkIkgpK9HzCyPAkAMFOq93YnPIbdsBktNqGYnmFDJd8xOOo38mygG9f3F0pm/XdXzA2RTtg93+k5DpAcoPOSQSLcPbCD7ArszHnN6UTD4vEA2iXEv97MsfeWoGoTs1bLcwczOFKgxOQkPa9P66hYg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:38:38.1308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cf62ec-8276-45e0-8909-08df04838e30
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6323
X-Proofpoint-GUID: B-p-3oFAZ8_z3wMK4_P1vXUWnvPm1sHH
X-Authority-Analysis: v=2.4 cv=M4597Sws c=1 sm=1 tr=0 ts=6a90ae64 cx=c_pps
 a=4Gx/Bq66bxzCWlClXrtOjA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=3OY1bVkIxKuBEsxqk3YA:9
X-Proofpoint-ORIG-GUID: B-p-3oFAZ8_z3wMK4_P1vXUWnvPm1sHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE4MyBTYWx0ZWRfX/v4qy9XAJBYd
 9k342ku+ydkwEAa+I9jcLoOOUffd8UJxR2TjFFPGwiQP+E6jatYED1KOhfdms/pZYAjYS6I49D6
 V+8qCE1Y6t8Sl6F6OxpMwgMdt2Itz4aUp54Sf8ktN9Hi915qQ5qBAoJDjtuSyYJtGnfYHWc3feS
 ZUjY116QRSrnWwp+4p4t2bo+betLCOwQYqHk4lsykzgz9OrMJ9EwZEv/baPyE1ynNfFxUFggtVq
 Y9C282Dbaf8YspH0nggGHVZ1kcGYSYB+R0ybJryIKeQIQg73+wlvSjqUOJER/mvuBlEg2YWXX/e
 YjDZEuixs4f+UwCuJCXof0IVY2L8MpIpdWK0KahG6dAoVGimIUxXL0KixVUNaFusSX/Ar3dzBSC
 H61xB3JW7FmI6YqK9jZ2rl+dh1kTwstVHJgxPwLtCwfDnKk3BRhTOZzh+1MZwTCAb7aBfKp1btw
 gh2VPf73K2+grV0XdRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE4MyBTYWx0ZWRfXzp0H3ajdalo0
 0k0qGcJ3vGw2YwKTxv5h0R3pqotVrz3JaaDgegdTwysSngkKYO04CUfVDC8yFF9AnquFGNEskni
 eGR7awkdARbn4UykeHIDqnjja7AvzIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270183
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Aug 2026 21:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20294

While all ARM64 devices use the same branch for RT and non-RT builds,
the ARM32 devices have a separate branch for RT Kernel which is
"ti-rt-linux-6.18.y-arm32". Update the BRANCH, SRCREV and PV for ARM32
devices for RT builds.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux/linux-ti-staging-rt_6.18.bb         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index a979668d..71fd330d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -6,4 +6,23 @@ KERNEL_LOCALVERSION:append = "-rt"
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.18:"
 
+BRANCH_ARM64 = "ti-linux-6.18.y"
+BRANCH = "${BRANCH_ARM64}"
+
+BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
+SRCREV_ARM32 = "65cf808e0410dd16ff0bb1f03a1bb7e67cbd6c32"
+PV_ARM32 = "6.18.38+git"
+
+BRANCH:ti33x = "${BRANCH_ARM32}"
+BRANCH:ti43x = "${BRANCH_ARM32}"
+BRANCH:am57xx = "${BRANCH_ARM32}"
+
+SRCREV:ti33x = "${SRCREV_ARM32}"
+SRCREV:ti43x = "${SRCREV_ARM32}"
+SRCREV:am57xx = "${SRCREV_ARM32}"
+
+PV:ti33x = "${PV_ARM32}"
+PV:ti43x = "${PV_ARM32}"
+PV:am57xx = "${PV_ARM32}"
+
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
-- 
2.43.0


