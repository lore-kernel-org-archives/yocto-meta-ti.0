Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E784CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 19:55:53 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16124.1782330952690052649
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 12:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=GZBgnHnh;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lLulWa8j;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsDqY1332211;
	Wed, 24 Jun 2026 14:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3qskHnl0tUf+c
	uJ8SKiHxmiR5DrO8tZ/wn8czUCKpkc=; b=GZBgnHnhpNWcI0KSsvoRlqvApVvJJ
	gn+KRhJH6aaQm7JO2qvtILmuy2U4MoOAg48UfiXfnrm2S0+SpQ/8LtLiS9mIywcb
	rzxHj8/bzWBPAKtPRVIumpmTcWux80Mi7SQ5w26vdaDnN8FrrAEf2zh6t0scxest
	Ra0uh1qQruRAQCVgF3H1Fvz3HueXoXHzQmDP2mBMNq1Diid02ah+3F4y3q9ezgeo
	4fXgVdq/YngWzxXzevSYn91PEastYJ/IIgVpmzRsPdv2Lc3wKfhyIVhNwM/GgmXD
	JzbFe90v0vXURuCu/kcKt1S4MUD6qYt8ApnexhDc73nJB2AYuG3Bz5xog==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0aspcctn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 14:55:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn1YwFkMVntEfc/+E0Uas8Ig8C26QWzECFyzPMW80e8AWBvI97gd3IuruK21U+Txo2wiCQGPeGjK06OO3rRo6AfrmWOooNW8904n1YQR1wFI2KqfXmVX85JpmUZfP8RDgbOIckGs1ohj0Dpp+CeKaysvdJfKkdKcAs5euZNgIKezGUg4hbfsIDg1T7einffIhSY4e7XAkfpS3VdzA5wwwlXY2hZ33PL4lFBNct1ozxCMVfZLQjHHdRj6rcj/ngiecHZWsHioS3szNOSy68phiZJTt1Zd/jaD8BtQygfp6iusNhfJXepRQHIMGoJi/A7SJoVl67URKwDlLqUT6U9vYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qskHnl0tUf+cuJ8SKiHxmiR5DrO8tZ/wn8czUCKpkc=;
 b=IbDWpR9ZFbBgqOoW7FqK5rInYVLJXejabvm+H2/cMdYoP42LiMyUPnIJu+WDewmCllh/LW1SSbpZN30/1oenOgRJfZk9SCGan9L5rFYxk3Ar9EXGdQEa5ScJ528vaHfOflSlaDvA5yDd7XoP5vGZrxsk+p2WYsBUxbwA5jmb1xYK6umhe1fDuqPuo9NDAzkJVMnZq2OyWC+dVebrr5rb6VTvUbwZgRybrW2BF3sIhjQs8mGYPik5P3/0qJGTsoLs06GnYGw+ER9MivU+8N8lx4x22xXGvErYgSaYmw6qXAIrlpIsNB8apmr1P+REiikaYhap2GwZlpfhU9TeFuDCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qskHnl0tUf+cuJ8SKiHxmiR5DrO8tZ/wn8czUCKpkc=;
 b=lLulWa8j6rIxmz+FmpOtRQIgSPCEaR/EMfDIT5UE91mOB9ina08/MQN01OL735ezxxFRmLinpqKf6Xfg1bKpLCAP7jhCj4r733Iqb5qkIWwql5m8X7qNTHtEAgBLciv8IQra4QRMUQ9p2h8kDm4rwwfVd4NKvWMw+zLsVg0zQX0=
Received: from BY3PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:217::30)
 by DM4PR10MB7428.namprd10.prod.outlook.com (2603:10b6:8:190::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 19:55:40 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::45) by BY3PR04CA0025.outlook.office365.com
 (2603:10b6:a03:217::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 19:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 19:55:38 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:55:35 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:55:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 14:55:35 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OJtZQi1723418;
	Wed, 24 Jun 2026 14:55:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v2 1/3] libdce: Runtime depend on IPU firmware not the other way around
Date: Wed, 24 Jun 2026 14:55:31 -0500
Message-ID: <20260624195533.1152173-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DM4PR10MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1190ce-43bd-444e-7017-08ded22a9070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|18002099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	iXOuyDiRBuQqh3KYM2F4OOdEvOQ9BBA5GhMz5OPyTMa58ft39+1GtOEkgEgSnfBjvJYE2SN9jaNrC0XY96OberNWjYLqO/V+HBQuuc+v8MagcH+hMGsCcYYPPyny/nVd6THGrjANCAWRmcL0eOFnluP1RKlBgA/zV794wXWwZb+g65RMr/MuH5PxG/r4L5SST6Oceb3pk76n1DRXYp2LVYhSTc7HWvvs6lUwADPYRNSk3BFfurkkgxVlFVFah2e48azhBKYWkbOLBf9Ja7Z+CZ/fDq5yA+dQ8kFz9RukMXYDEoJ+ZVczJZidk2113aSMQ96/bZsoixPDtCdgnZNGMm4JFRzjtfFKxFzETwntuwJ9ppys520F9v0+xnZHHjD9Bq2NJaWMchd6Cttv5DcjlaPFbBmHUzUklZs915bHAxfrzXoRX+9xcZ0UFz+77uR1zlNL3O3Aa2gaAYXmFlA+6tgmyS2fda4MR0KrC59BhyunGppZI2H1tquQxJYTx27GuO+wACxng3A14yNdOsMSn5Ke48tjVNqReBpmtsrie/glrA97ccHb+Mfu6G8nlrqCShvqFSkI6s5qNkwccNSzgaw2tLgQj+IM5bHXZMPzaq4XqqxjBmQrWIldK1Jxmj25m7zyIr3ntl2rjUYcdMJQGEIjWxkg+reS/Btn2VB//dZ0O/zZaqbTfBHxni23yxQ36aaUsodmjM+YH03gytJmPw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	G7tKoHNJ0Onl3Ae67tkuaa08no6AjeIoJ68vFwTq5FsQcUUmvzn/NsAXp2LtZTpykuwsMIMw4Mg3gFJ2S49Bna3qNFns6l2IpKIUBzvtrgzOUgoQPdPbye8bDcSonM+waMZrSmjdTzZxlUfmp9YFlpa9WbJH3Xkd2slrB4JbzbGWS5MGgwvOLx4rDAz8KgykLaqH27fMBK+ov36kW9AAX+li+mIgscBimQ6Cpg9Baz5YZB9IttuHaeqibMW4uADdzKYI9lmoRTJd0iasFhlw7A66Miu5KgNdTPUfUndsfbu/3wOvdRd+vCsn0FBsbMQEcRcxV1bYb/78iPr18Xvp9DN9Os6I8BDuGXZqXVn922mSX6hDDsJLQqyv6W5b2hGHa9FjDYLD0DvM+9wIU33qMZte3mIgQ12QN4Ml8aakLUSfpTYJKPD8eU4COlTVxpXx
X-Exchange-RoutingPolicyChecked: 
	pqUETHcbxLSc7RHJCSSmslaz/+k6rk28bA4AOa1vIxUhdc54MUpQ5zj2PThUSs8DVEzbDE/5WREOb6A9BbKssWr2hWLCWYu1YUylKa3DQa1sgsq5Kxj0baQlzQdiwQCDZu2bt4ku58Vt0vQf7QbhmuTzK8vUkaJFQUHfAPouzbdG5xRdgTjuVRRzaCOzAk84ZgKkc8+5F3F3BwDVJ5mwjYTHcNNEcwnCTGV1S+nIs8uiDleFkz2R16Vlzx06ka0CnM7KICmnUzYlGNJi1sd4AOgRxONfRvHXZ8m3MXcFTSNPywV0yI8lYZ0Lr6PSOevKBBfyuG3gsOej4MzbZe0kvg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:55:38.5531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1190ce-43bd-444e-7017-08ded22a9070
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7428
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX9V/S/2lZhG3x
 Ag8tvvn37788HclMvgcjLHp/+dfh+2fhpPpjbaLP2B6nUOzjzdGIY0ANyUDEk0+o53sGpxBAFKr
 V9lN3nIGixG6uKlRVfR8jYVEh5yQmi4KN+ygggLapQG3ADBKV5RpmwbHNlnCkQuSj0YzcyvvpMA
 Z6hCRHWw1pvR7SP/Vwu6YhacMTprlWcfx6K6MfCIyydkBwsk6QS7yOTpK0xn5si2grXudmingG/
 SjaK+f6HSA3TgudRr4/YCErNoCGqTPKKapGEvOrSIiH6CPagADy4xAx77T3Zl8nW6Xo5AO+tXbT
 SwCyFx2hyOTUY+HlMZ8h7AC0bRp5qU7vQvci36hhm0Lfx8g1WeAbmClOJJtPn/HEKnm9E3lwRD+
 bifcqOTLuvUUHDY0D2l/uvj3ubTRzA==
X-Proofpoint-ORIG-GUID: GWYmmtJ5gB_zIplkkfoAN9iC0kr1cPw0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX+qLlmsCgqEyn
 meGFVoOvskn0JHlZV2p6YbsR6mOYojBd+XL5K/EDUncu7bglS23DgmyvN70lqCPoZWkQxIoEgJ0
 BMyeyXnHfVWRgSuUImqzeMq9JPh0hWY=
X-Authority-Analysis: v=2.4 cv=RMCD2Yi+ c=1 sm=1 tr=0 ts=6a3c3642 cx=c_pps
 a=KTjCFeyF3Vp3atYHcTGfzw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=a-luKpXRQnbFmFYlrtsA:9
X-Proofpoint-GUID: GWYmmtJ5gB_zIplkkfoAN9iC0kr1cPw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 19:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20073

The DCE library depends on the firmware to function, the firmware has
no dependency on any one userspace library. Switch the runtime dependency
around here.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Use += to avoid overwriting any existing RDEPENDS

 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb           | 2 --
 meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index bca91df8..246255e3 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -9,8 +9,6 @@ inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "mmip"
 
-RDEPENDS:${PN} = "libdce"
-
 SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https;branch=master"
 
 SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index 2ae44086..afbfd1cd 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31
 inherit autotools pkgconfig
 
 DEPENDS = "libdrm ti-ipc"
+RDEPENDS:${PN} += "ipumm-fw"
 
 SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
 
-- 
2.39.2


