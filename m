Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC25C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 21:49:18 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33033.1787694554280426730
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 14:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OHCBBrdy;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=xhUr9WPs;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67PLXl7e2681528;
	Tue, 25 Aug 2026 16:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2uT+JBRkmvEv8
	UIi3w3BJc8uOC9bYpDKOUYMp994v+8=; b=OHCBBrdyfSCb7HtFMSAeHPrky5291
	5H25OySZsn9atxmR2C3WlC68EK1w+OgQeDTHEpDVwVlgRZllvlL17fC6V+lCR+xq
	FJQNH0vwooHryyoEorGMbwi5zEk6QAYJHhz/YgfaT+670Kh4pa/tFKmwCkBgusZI
	UEphyQ+Ex/9leuiwbOGRQrRnqz3dkupVZQ5aAvCX43WBsd70nCCkLv1a8YsfU+4W
	lwE6ecgc1iUg4bU5ACGrLk1ouLApvuaHQeRFHn3cejnA2uMYyes8kp1jqTRhRpoP
	+TBh0v6aIY8jf8rOW5tnyj2j31lvkIuFCo6PwlxSvd6IdAIH3Xt7/KUxw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g9k2v01j6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 16:49:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mc7opOcXYiSyyuvND7xB/CacSF4aI+jbOGbntQhvlM+dK4egdWr8nFxyvPOXw6g3+Vfrm/1J6PLow0Mm1/ifDOIT7KovQa8qInx6ggtcrbp2Rfnsc5bVRdc6Qi3z+MakCoaFNuyxHK+lPpUzoAG4LrpRnF+ScJh0Z1U/eOEB62c9DAW9gFmY9jnf5hvweHEt0oGXYfwfP3eojKPc/TwVfiklxWKunD9UIyMxBmZLRx5SUrGCEC7yQGKiQccsQ3aDPHaIHXEtIrftiP08DG3Lsem35X0PUt+rf718aBPn4kl+d4DGslFtKV4euu75YoCnsRFmp1Qi+8VuSlJrcI0Z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uT+JBRkmvEv8UIi3w3BJc8uOC9bYpDKOUYMp994v+8=;
 b=r87HYFYcemuOvNubCweQFv8ZDT9F8i2COKlgogTajtUsPJ1+XP/2J+mdqjh4D1w4T2TTcKl+Qom+isRoTI9f+qnse+WESP+Y3f888JbAFmD09vwe5S5ZYZntNCw/gqXoPmahiA8GN8OXgx47SLExPOLze3GmrGjPMu1MnlxVpZLGf3uUbKdQ3dUdXy95axj+BcmlXsCOfahBDMKh7SRni9B9Zot7//nDs/hjbcI3DhZ08kk9nlLgpLviAuUWNNgyIoAOyGTghwaOqFEXJwTN8SQK1VlvXFgqbokMQjgkd2s/qjLSRM7QBQBtRFvOR3xd+yqDkRzf1ZjNJi3GBqyJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uT+JBRkmvEv8UIi3w3BJc8uOC9bYpDKOUYMp994v+8=;
 b=xhUr9WPs9BEMIpbe1Iczgo6S2osNAUp47GLNDLLBb0WKpOPVyOELbRDbQdruI2GTr8c2lRMpGlkl4AOtHUjsUIMFnmO7yFekm2XWCPGPftMXSiWW3umMmS/ybUy4EYu46KHcLRkkQu97NJbL7hDNcvkC/kdRHiKSWFMmbqrVzuZoXREBfmAehzdbQb/V0Vd3l6fLMt9QisoeGA1g5MvsWH0a+2JtBekdpLFHUo7GGDdRQFt5Avu96W9PuyX3HZeNgpC8k5i3nixwyKAzjknFcitoGrDgQxtUIwtcshN6S8FTXNMZHx9bjhA+9dh+Op+YxVrHCcVWUKxwktumUXwbpg==
Received: from BN9PR03CA0229.namprd03.prod.outlook.com (2603:10b6:408:f8::24)
 by SJ0PR10MB6376.namprd10.prod.outlook.com (2603:10b6:a03:485::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Tue, 25 Aug
 2026 21:49:06 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:f8:cafe::23) by BN9PR03CA0229.outlook.office365.com
 (2603:10b6:408:f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 21:49:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 21:49:04 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 16:48:17 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 16:48:17 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 16:48:17 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PLmHcQ2067569;
	Tue, 25 Aug 2026 16:48:17 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 87D882A65; Tue, 25 Aug 2026 16:48:17 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202608251347
Date: Tue, 25 Aug 2026 16:48:17 -0500
Message-ID: <20260825214817.3103136-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|SJ0PR10MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b3fc14-706f-4beb-1190-08df02f2aee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|6133799003|3023799007|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	tISDEOOWqm6OeQVsi7oErFG9ZNatcZrNb/tiXRpQeFsnuJkGasG8DXZUorl70SM9otrt9OxcgifnTFmoDYEopi7pWqdLLQvXiYSZ3PKNVI7gA+MQ9D/A9tdEXVZFyquCKIRJRNAalER8rflYqTqDnwDUSD6blL6VYX58/q9xa0tyTm2krexbZW/x/yL6JYvcaTP09r/EX56oZeGT7hzuod8StrsHUkmx7/Novsvm53oFGEz3OFLyJ4261kGd68HxlpuYanKxxZodVZzDtc/OHt6OWDc2w8hVxW1PVUUeAbXIcm964oGVWhXYcsGZWBNyBzVf1o6SZtebQ50HWJWzTZVPxKORyTLsFkRjYB3OCk4lF36lsgI8KNlzW73hIgsgBGf6h73K1g109EvVZHlgZ5/1tGaeYKtSCnYWnO8+0frmif0kIEYSnyBkhH1+bI5n/RiFWbk8VFsa5iDidR3QylaQCC2716bWUGoRW/p2YDMvtqZ/WSNxRqQTaLJuRTs4O3g7/vGqbnpOSzXcxKidxa/l0+zFCB5eqSi8WNB2BLqh+Vl1jNtiXqrgSxOjV/4/3bvjYB11gfvYwYE9Rh3rhlKXnvru29zlu2UP1hcB/zbATmJyow/Y1vITgbXXYJD7ILYeqZjOMhglmhBNxE84kEpyPwWN2WgY3WF6w6YvOe3oFuFn8kfS0kegFkY2uL9NZNHA9OtcUkhcV9afRBHazA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IDvwv5XyjoRmkpQRFNz5m2NHE1KgwkbBps6tmPSX2vAEd/sx1BkrunRIv1lQC7LKoSS1CitEFW27DPHf2+5Bw/SrOMabXCNp2MZT+loYoYjN0hAUHi93MJ63OLwuV/CQ1BrDFnGRZrV4/LEB9yUOyuZ/vQ2tkDVUBHQ2/4Onl1GUeNTJp9qr+ebSrBWNqtcn10b/fk4Wxg2ZYj5sjDWJUc+5kaA4nQnRwKuiwwxIG8Nv4e+v5hr0HTFLrPO+JZd9zvYWduumpAcXHUr1djghB84t0XE+BwlkvJf+IGGWynKgEE4EM9I/PhHBZRFOYBaL7y8/t7uQ9scEHe22jF++mF7vulO7k/N3OcEUea98xUMR7H/iBACRASVmyQ5XssmJcfSc1UXD55LxMVniPU3NN26+Gpq/KoG7bReXzLqTpDbbS/87Ze+Qn7on91qMQFHO
X-Exchange-RoutingPolicyChecked: 
	xrx8g2eYn1aWnBEyvYU/mTa+Y6z5gUsFzLFeJCXtUcJUTzx9glZHFmhRjIwnUpnuGii4CD8YmVjjXvWeLX3WLyZSK2BanpIM+NEHWqvnWhu3FLAxWWAI73vM+k9zVr95xm5BhwuxXncOEGoWILJ2/5EwcRZoMvXJml3RsacmRlu4CTRVGfwOrPb+H9oLuQ4MYQjpxgvHrAX8tyTL3vz/SdzylPlNj6U0afaBNHN4PFOqPNTizi6lx9adAYJ5b2RJ4O+dLmftlWfkGIRdakGUW7Ua6ZONK1XQBfQVzRkno7kZmTqNVPbZEGDLcfgGrQltpYAZH46GQ/GRYyDiVAC+UQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:49:04.8061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b3fc14-706f-4beb-1190-08df02f2aee2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6376
X-Proofpoint-ORIG-GUID: VYf0J16FHR2z3FTbHLAECgPWG5Fwmpu5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4NiBTYWx0ZWRfX8GQ2KIeglbKx
 /Irt4LSEWwNXlxKg0jBt5Mu/RD76gz6NGsESO7/kQNn0V0/uZnFbx2HY129qmYuuQpVMbWJ3Zm9
 B8b9D3jA7hDeNGFc4WB3e4g/kS9y0eg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4NiBTYWx0ZWRfXw6Qnt6wIR5/5
 kLahR7mDkEjl6tzDGJg6tnbo/eFEoddJf7yEACVQVbOi+v9GoVetMheOpszetTolzlvZznbsQu2
 zLkYyi8D2R8XP9/2toY8nGAtqqUMMl5BKON1zVEvXaukBv7YkjZpbHnOkeLvnucbRU5a37HRahP
 3nVwYHYdrI/AmsSeZvR6rPKA3fiXSES88pqjFugPzef0KH/EMLaN6Jr8+iLyuj3CWT7bSpgofb+
 6LsT8AIr7VoLVE5EEUiQLEN7UsAhMw89vTKzk0VZI4wdvsWpwyfUO06QQ1aC1BM9UgtW9GDl08d
 UDn+bBPSmCXx9CY2lDV9m4KPR0JIaQuJtael6l/YKnVEGhbTsOS6kHeMSRnl/utRizNI2HcMorD
 S5oIxTNxQGLShLO2pppneoogmBPkKsLw+Fu1IrnvKdym+MVvnHvK5MZ3qrmn93LFceK5o3Z2HBy
 2GLzozslvzwADWqv5Uw==
X-Proofpoint-GUID: VYf0J16FHR2z3FTbHLAECgPWG5Fwmpu5
X-Authority-Analysis: v=2.4 cv=JtXBas4C c=1 sm=1 tr=0 ts=6a8e0dd8 cx=c_pps
 a=0imTBu3/wk/XLaKPibPjKw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8
 a=gTHzL_SAU--nB3gE8I4A:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250186
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 21:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20292

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV
  ti-rpmsg-char: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=13f4e50ff203b9581dec599a620b57bb9ff1ed9d..4ca322ca563a21cccad8c9ba65e386b9fd34dd16
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=5fb29434232110fb5a176136086d26ecb299932e..8a78938c2d8a270d851c66abc2cb9d8fcf77c690
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=eaa148f9640a047511be89f7652f8b1e93a4249c..2a55868676119435c408642191d1b5523910f288
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=43493bcb9d02b98e4e52e0fa6639c25d97eaab78..f8d2733e4654420b73fe3e17cb83a30a4763862c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c..ca77f7291a4f1c5f6927fee4e47282b03a39ebfd
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=9098671a2d2ce1876543f6d6fd576285a184f5a4..66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc
  ti-rpmsg-char: https://git.ti.com/cgit/rpmsg/ti-rpmsg-char/log/?qt=range&q=e36103aac7d9f6d64125eb917d3c69022cb86e0b..b1e4d172f39081db81305fa50ccaafd3ef8ae3a6
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=7b143203fef1c7b774a49b459c092eaf0b2718e9..76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb       | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb       | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index e40b6ccc..1e33306b 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "b54338ab6ee648bb9bef2e9dab7550a9a1d11d54"
+SRCREV_tfa:am62lxx = "72b61c96ce11c54530bd68d721321022d031b628"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 005f06e3..f7475c2b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "13f4e50ff203b9581dec599a620b57bb9ff1ed9d"
+SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index da7fc0b2..58d335a3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "5fb29434232110fb5a176136086d26ecb299932e"
+SRCREV_uboot = "8a78938c2d8a270d851c66abc2cb9d8fcf77c690"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index e33a1e91..ed4ab0ee 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "eaa148f9640a047511be89f7652f8b1e93a4249c"
+SRCREV = "2a55868676119435c408642191d1b5523910f288"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index eff4c1f5..90811c9f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "43493bcb9d02b98e4e52e0fa6639c25d97eaab78"
+SRCREV_ARM32 = "f8d2733e4654420b73fe3e17cb83a30a4763862c"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index a6524670..b39b4511 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c"
+SRCREV ?= "ca77f7291a4f1c5f6927fee4e47282b03a39ebfd"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index aedc2cc8..66d31755 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,7 +25,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "9098671a2d2ce1876543f6d6fd576285a184f5a4"
+SRCREV ?= "66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc"
 PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
index a0043caf..15fe8062 100644
--- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
@@ -8,7 +8,7 @@ BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
 # 0.6.11 release
-SRCREV = "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
+SRCREV = "b1e4d172f39081db81305fa50ccaafd3ef8ae3a6"
 
 PV = "0.6.11+git"
 PR = "r0"
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index cdfc185e..6f4728ef 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "7b143203fef1c7b774a49b459c092eaf0b2718e9"
+SRCREV = "76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


