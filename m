Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C54CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 20:13:56 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30180.1782245634458719437
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 13:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dhjwy3Ww;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=YsJAp4T9;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65NJvG5j854641;
	Tue, 23 Jun 2026 15:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=vhqsx8j9fp1H6
	kzcWsATZxWocFFAZBCFkxmSnCN3zKI=; b=dhjwy3WwqdbmUqgLDX1R806wcxL0l
	PwlAinK9PgsJv2wvTs0l80LLWlzYEFv6ho/H3If3e64k2zYbUYtVaG239OP2ifSh
	GloXHmPHhQ9VdUIBF46pGKtESQcXPaj3V5IQNvxugITfXFsMubZc/lx2DyZ7xlIn
	MvzWTqqpefTtoQqfz2isr5IOqsCWzmblE2Ey86bUebdiZaWKLF8aAc7hzuGSiRz7
	+au7r3KiOvhauFCGKw3VXPnhNfqMYveGlunyavTYPLTsa5GFgOix67NWywQRoVFG
	LL4iz8jaXXZq9OtkkSrEmWvChY28pKwoValKUHveAPFw90ulEwOspNdDQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4eypttc6xt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 15:13:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHjZiXZbt/V6U9n8OjX/GrTHA5tw8WzOoZm/POI8XZgeh07wkkmQyHjhpl62zab7vNjrYaytfJT8YkXiQK9YXU+08KlWbTTFIbPfiSO65eZfi7qIJF6Gbysaln/ERrcbDbLgARC4YYNW1MkEEmSeTqw3N4MuH9QXgkQMxwNKfYlxhPRdLEXvXC/1yWyhTFs1+2y23t4MLUwJtUhwwIJy7Pi4dY2njOA5fjr5hkxHuv6pYl3GKRy1LFqMcvg6VIp84EPpORb9+opQ5HcDTKFkO9g9lGYZ6ks2XZstOaEYVKFRgh9iyESbtww/VWY39qfbIWVO/zp2yez8JSYEikNp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhqsx8j9fp1H6kzcWsATZxWocFFAZBCFkxmSnCN3zKI=;
 b=bw0ZtanasSAdvYbyPnHPztJIledJjWyOmytq2A6kPUY6aG6n8BZNf0lizJDCE4CtYDUrIq1C3Ezm5+duYOfrCcsOkaRQtBnKDja2ASlNDCEm0EpZbzICqQEJ70Ei1ziA1/iMQM+ivjCi6ZmPS86QZZHV+QeIVM5S4Dap3EMQza5jZNMq1nfRlSivoxRRRYrNwbgmcPOJ1LyfFAT/lb4jveEDGM1xzskFMtHuAYuqdHGEc1tTSz56+HGp2fVmv66Fw8Mytv/VRoD2f2sUavrHkyIdqvZIdNCh5lr0jwdTSAibjEM5TKbhCs1+MZHcoFWFk9BQl63smizdpWUcA2dlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhqsx8j9fp1H6kzcWsATZxWocFFAZBCFkxmSnCN3zKI=;
 b=YsJAp4T9CyHFCU8PZbZKShALsTT7Km4xRRGjVpjIbJzIttzCbA/m5nstDNk0iCqyUFtnOYKrhyrZxyR77ZnCBnpwC34rQnd9dyb7JCgsJYaRG41HfpJcWFu88VqqS+eh845HldSKuBQvVlp7Jt+mr2Slwkc67DZe8WxpoVkLtOw=
Received: from BL1PR13CA0429.namprd13.prod.outlook.com (2603:10b6:208:2c3::14)
 by IA3PR10MB8683.namprd10.prod.outlook.com (2603:10b6:208:572::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 20:13:50 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:2c3:cafe::80) by BL1PR13CA0429.outlook.office365.com
 (2603:10b6:208:2c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Tue,
 23 Jun 2026 20:13:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Tue, 23 Jun 2026 20:13:49 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:13:47 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:13:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 15:13:47 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NKDlkR3021799;
	Tue, 23 Jun 2026 15:13:47 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v4 0/2] mesa-pvr v24 -> v25
Date: Tue, 23 Jun 2026 15:13:45 -0500
Message-ID: <20260623201347.1152792-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|IA3PR10MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 89379b67-d801-4a52-deb8-08ded163f042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	+XKqXNHwF1bWEGCKGpgziY7070ayDJjY/JtbMpylqIEClDfzPFASXx0mpKjpPZshqT25q8iS1lHF6ndFfaIJgu7hEq8JabR/MhF6f7VYVUnjCZuF/PuV7i6GMjLdUNmdhs3HeDn5arE+nOpuhxJJCbOvw9Q+eXoxN/9yYfLGSV93xT+/jr89XKjZgcrhnJxuc6MzFH8la+37fm6lTLQePdsHN8sJto+So8knZ6xNay+Hnaicg1ggarat2qZEOY8bB5msMhTuxw8bH5MJU2RVV3zdr8yJCxfmMGCVUMem9UOsMgsp8L3eHqwD7DV8QX7RMbt9ZmVy1tC3my9GL7Kx1OlLV04oeiwyktY+P/uIuCLDd/NV4SAy0GHrqg0F4+HmDaKKnIczDfpseBPH+3iyf3FllM3y+zEeI7No60xKpcAC3FphZf18IZc2TPzPPdmWLJT0NOemEyRKOkqA6R2njlhC+mJgmSMJAfx4mtyl/AYQSVDyhiF/HgEfKxgSB1MICBUrnqhLImPOzIyL4ELdC9/0rXdFfpNDZZLy8YZLFG3sHDjyKGz+WvZIdXsz72HMv5aF5GKKrva281SEFimEWcACUn1AwooqU3Flxj38IZk3sWHvASCojIOOTLxPvqOToNO8l3HRQUAaojOf4pYdWI+B/Qi4RZfSs902k2Zm6/FcS3KP4abjFH+t/vSf0PlOD7IunTLZB6fVoDMQ4V8iWg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	K87vdylRM/K00ReZmsAlqpfyJrtunFFYEYjNnDYzDk5E92GrXxk3qcL3UtiUTy4dTHsy9QuB/tDUljOBZKgi+weePFTzLXBqgpv3DQIlQsw/9+5pcUjG512ITSmXHl+UT58FIH/jKV0hm8NCo97RD7S2OYA73RloK16yuFJeLcXx0I2gnHjQzLGe5x7vG15+1I7oDSpZiBEK1OE24Vq04nSz96F12TYvfl4lMjiKkYbDmVagPVpan+GsmuLdiAW++LmqWagyqoXDtq/555xSi+q4gY8xJjlqWb7tTRzr6Q9rZpJtHqBCwgY92NQ2sWIW4tr/h1X2qAI6cKGNB4UexDEOFbx7oSithKGGIVUUktvNhuStAva6fx3EF0iKbWha4Cj6mMYJ+0FJMK4PBCDAI2TUedDu6wxyqGU++XQE3Bvo5P9qrwkE9gJ7RTtt2ISJ
X-Exchange-RoutingPolicyChecked: 
	T3C7RgQp2JqfbEavlqhLRTyLoU4gZ5WPAIpDDzllKEbbdIS+CWzZw4VO4om5Wxyijuf2VziiPALMfCnbokqa4UiKrmWPER3NBQYedl27FO72uBvUALlRz/QPZ/0/pB03cMg2UYYyqoPOyctiw6Ra6kgo7HvlftvjJwCux8arX6oIUy9dh305SBAhjeJmQfaAI/kAQowtf97TOEsgilmami3KF3GyB2pogmrDKci0Y1xUCvz8WpAgcqDTw8DUBZ+waM5xJ1/qFrVoL9ARLTs+mwRxdT8FnnTwQgJ5+2l4khxV5yRWiMb/ON8m5dOsU4U4NSP5zrd8jZ5c0Vj0k4PqzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 20:13:49.4946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89379b67-d801-4a52-deb8-08ded163f042
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8683
X-Proofpoint-GUID: 9PjHX_w5AFJLmLsNlct5Ag4dwAS1xtZN
X-Proofpoint-ORIG-GUID: 9PjHX_w5AFJLmLsNlct5Ag4dwAS1xtZN
X-Authority-Analysis: v=2.4 cv=EPo2FVZC c=1 sm=1 tr=0 ts=6a3ae8ff cx=c_pps
 a=Y5aTAp+79vj4S64KMabfRQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=ZmYl60O_4rpcaBi_clgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE2NiBTYWx0ZWRfXx3jHSaKx/1wY
 x7dRZwtYM1SvFqPld1gVOJzYBm1+H9BYew25/0nhFdhJa4humPdZ/bBv9A2LSko3h3OomZ8AG2l
 7SMRcHbEqj7y7XVD2turOiNTO9HERM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE2NiBTYWx0ZWRfXyVTgGKRV3ZGy
 IQcrvgDJptHI2MIThXO/bVs5XmNuuII9Rs26KIr0qsog/9UJBccj1fUBrLbFDQBkYrZh59tGfoV
 lh2YDiDnQjls6iMGL4XC3X1OwghyAP4j9e/ZgAVETMjTzt2sqyNyrkJGGV6KpkTprN6kOtxATRY
 AfjivSrLau9OTRFuFrmcGc96vJ3Tq4aZtXe8ekyCUbZ8nc788Nq8u/qATGh5AVDl3Pjtehj4ZIV
 qz+GlNyPc4XNR0LFRv9CxTWTf/EstYLo0y5K50b/Xj2wv9xCGprLYM0csCtux9CUuIdnz9MI1Ya
 DA1v/oCooXvkooJlpEd1tgk2w62xbtLkeeuRMzcI6ZT/ZIc9JhYAMtE2ZnHaOzdEyVKRP5g0/65
 +dW4jnGenlc1rjF9B8+tiiC2E7ilfQ==
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
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 20:13:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20062

From: Antonios Christidis <a-christidis@ti.com>

This series migrates mesa-pvr from v24.0.1 to v25.2.8. mesa-pvr is a fork
of Mesa that adds Gallium frontend support for PVR GPUs.

The recipe builds and packages for both Rogue and SGX GPU architectures.
Only Rogue supports hardware acceleration - SGX will fall back to software
rendering. For SGX hardware acceleration, the scarthgap branch SDK should
be used instead, as it is the most recent legacy device SDK release.

Kind Regards,
Antonios

---
v4:
- Don't delete v24.0.1 mesa related recipes and patches
- Update check_yocto_rules.json
v3: 
- Split into a 2 patch series. 1st patch copies mesa.inc from oe-core
  and the other modifies and adds functionality on top of mesa.inc. 
- Delete mesa v24.0.1 related recipes and patches 
v2: 
- Rebase on wrynose-next
- Add support for master branch in subject prefix tag

Antonios Christidis (2):
  mesa-pvr: Add versioned mesa.inc copies from oe-core
  mesa-pvr: Migrate mesa from v24.0.1 -> v25.2.8

 check_yocto_rules.json                        |   2 +-
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   2 +-
 .../mesa/{mesa-pvr.inc => mesa-pvr-24.inc}    |   0
 ...sdetects-64bit-atomics-on-mips-clang.patch |  24 ++
 .../recipes-graphics/mesa/mesa-pvr-25.inc     | 346 ++++++++++++++++++
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |   2 +-
 .../recipes-graphics/mesa/mesa-pvr_25.2.8.bb  |  60 +++
 7 files changed, 433 insertions(+), 3 deletions(-)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc => mesa-pvr-24.inc} (100%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb

-- 
2.34.1


