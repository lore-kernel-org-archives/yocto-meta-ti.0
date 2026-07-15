Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C994C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:29:47 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8199.1784129379269299325
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 08:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=X/B8Y4Ks;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=DZ7MTGYD;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66FE2u4X3824521;
	Wed, 15 Jul 2026 10:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Ywauc0YhfwBYHoUJBHE4Hs2qh61WTT2Q418KTqAW2
	5o=; b=X/B8Y4KsBp3xvvPZiirlusfRFPxb3x9b00i/I+CNpk3eT1/YAf7Fyt8Jf
	2QFFjJnBSmCnoOX5qYQANHIv5LSCsEnKVcmKIJEMdloO9Ufvllf7ynkxMJLsua9U
	NqGrHDsnevY85FiM1yLMHhI81Br8Ph3GyDOQ0Uxqr+BbhMlwSnDGY/vX0MW1VQc1
	d7kGATFYqz/0CvSKRFF3IkPSDXnPdz8ictz0bg8qZHtqOsuK0yNwGQ20+Qsdo/bN
	n9MxFpcD85vo6XyRK3zoMQDno+MhCZBkFzWAVCdZhp/SWRAwurY/AkmmK2/KQNjF
	avwKWa8++loE8WraBi5MW9kx2zkhQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fe05048aw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 10:29:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgYzxZfUOxqDc6eZ68vv751ERC5VyMKdzCRTqSA1ckkyuVRU2SvzCpjnrvD0Duuvigo9KJNj6ze5qfaZRX8DoEbAKs02bC3euVAKTy3gdXIMxiTmRiMX0qg5MCZQXXjnCdiCqn8g4vkMMrapDVS3gG0vncIgZf2/KtpKTphWFFR/oJEWs4MgiDyUzocDSC2sRw1AnyQYUbT8Jzvfo+qLCjSljiIcEf5IqZz0hTTvsv0QLBUyOnOAWMkXHaM/hNTLbvbsnn2aRO3lfdnmEnO0DDHja6tG/SwuspPxLTvkM0PivcZWu5LYQVuRgg1WAXoiespDWjUBcWQpINvfKbwz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywauc0YhfwBYHoUJBHE4Hs2qh61WTT2Q418KTqAW25o=;
 b=LOnWji+y2zEnYNN4YLpAmuvmCEb3qJZvKHmxiKfqNVmAz9AOUyz6/IXU5cKulwrhLNNwbBVwM1lXyOmtrr9UvLp6uD+k90Pzcixyk969JEGTAIjfdvB2q8trVx1Rw5BP+8EGPCz2XyBZeJVe/GfIaUlfsMcBLNBGOj0qGmSAS+uHoVdzK899HKQ35MSY1O1+L2RuC/G22Gh+w69kBvBa5XcZ3prtUS9CkfoHFPP7Nssv4kNtuJ54Ri2bEfLzyGvVSaNZV6ZWhzzG6bjeUdGdNbgKA1MtkduH8PlohMIuWZ3f4hB0u4NuBhEB9QLq1Yd8daRqP/th5G3ZqpMEW5Ae+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ywauc0YhfwBYHoUJBHE4Hs2qh61WTT2Q418KTqAW25o=;
 b=DZ7MTGYD5sOHq8Oy8mIUUivJ85vaOsyJToyHnKtNwYYG6wwKFdVvLKrKQoSRgl/yyea4fF4HeYwZaITFNEkDD8zQ064ZhTU3LV/2/GSnx7tgXVoDWOZFdxZmThytSHY3Jmil/stP+ENB5/b6XaMsBJOG4uCkFyn44V37qhsiuRhOWfID7Rj8TzrZLRuF4C92lxjayfpMx9JvBJB87lud0BG16TW1vxVRgMaAW6GIBMYegLRfPhRrYMIs+UldcarxU9Q+2rP9coubWEyYk9aZExyp4SdPiTbPkoXRszxi2uSD7b2Op6BNzVvsrPd9gBno4HsQuYLdykmW1ykMSlqJQw==
Received: from SJ0PR03CA0066.namprd03.prod.outlook.com (2603:10b6:a03:331::11)
 by DS7PR10MB4944.namprd10.prod.outlook.com (2603:10b6:5:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 15:29:32 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::3) by SJ0PR03CA0066.outlook.office365.com
 (2603:10b6:a03:331::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Wed,
 15 Jul 2026 15:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 15:29:31 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 10:29:29 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 10:29:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 10:29:29 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FFTTeb3355923;
	Wed, 15 Jul 2026 10:29:29 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 08D2A61B; Wed, 15 Jul 2026 10:29:29 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] u-boot-ti-mainline: Update git server
Date: Wed, 15 Jul 2026 10:29:29 -0500
Message-ID: <20260715152929.3292387-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260715151023.464240-1-reatmon@ti.com>
References: <20260715151023.464240-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DS7PR10MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: d88129dd-8cd9-4331-08ff-08dee285de21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	alQAFte0gwb/yZ67oPcaC0zRNvnZeDgBwt5Ya8pxs0w8guBFAH7CWLH5A0DenSZqZLXjsfU+V08yK/zUb1ZwHTucHuIl4YVl+gndZdpFdWmCw/Gm/eJ8YiaeSBZk3+0XGHE1yXkK+4Pk6s0nLtvzDzWj5exJqxYOJcKfGJ6N5cYJiMJkfnJ06uJFwI4B/whfSfBEgnbViij1nKvCVkhv3Wck6VngThCRWN8M6oYZ3IPyGFtzZgwvtI8fFsntuOq4QXuegHK0wEE4T/VUaMosmN7iCRAY+bOpVGIJrWf1r+rGcb4k1rsIx9gMYk6S/ZrGoY+IwB/5QhrgdIBzWU7++8LRD4OZFSjQ2gd7H4IWfCFVhykjRUR+0bTfQmHBj34136GFHRKqcuunv7TokNDVb0Er/VCB8/Dvk8BXmLQGlSo6gybxzPHTYiCWDFfJBrNGOZo+ELRJXyjNoG9jL3raKueFcmtrBoopAU2ubEXkrWPeItZ9uEWb8AkJb5mPKz8BuyGmR6/xR9TeBsCb45JJdCDqRh3FajOrbtvtWG8it0eMCkGg/W2nhGTbchOPVBbxPOXb5eua9yJmNIwNZYznSIx+5SGS8rwod7D/FKCz9pXJroZTci7fGa/hywjB9W9Hdjp4qfyIqFWWlwvM66jIeyYu/o1iqVWpxzp612M7zLtMtgapswtQr450eeCtXK5rPlUyGAYdLJlWd9ucMnJ9+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SbIPIdyCJSYCRzEj9QrOA9xpUPcqlJesHm8WeUhbwPD5RhjklnkNwD0Ij53iSFDsJ1tPrpEl7X/zycZyea24VO4RHCthmMlToQg1/kpQ53OE57OGgyM+XMXMl1BGUFC0uYSYsvDKO724mMHOsqzhQITGUwyGKy0Xem370Doi2ULeHBcfwTB5zWdWzql+cQu2MTW+bijeAcM58f7K2iHjVnBieRxkKQMo6p64WxNdN2NWDYJWWfHf6iiU6um/2XSp/o48Kca/cVXnDEgj4nanqo1rqoBDd60cgmR57LS+arSlYJSoVdo2axk+kktc1giUqoShSiH1fZcCh5GahSgj1bE8QIQzfTY/XV60Y/vPzDCBgTbQLxoCuI48MY+MEvA5xj/LHUvSxWwfYc5NCtcvRZahjecy6xgJ0RqR4WXzE2DjV6lGviQM7crza/5Zt+X9
X-Exchange-RoutingPolicyChecked: 
	SyIHqzHyd9xSBrfR+yQTWM/UiinyD5xQSV8h5BhRby1uKsaMg6Bin0He2VuJ0ztPUXMAKX3gZ5WEH+cC8142exV6Cgi+iL0GwEOlSR0U2YFYk7kG4nGXQ+Z7cTjtzjhpFqmXNYQS021At3yo6R+r8fp/1ibSIyRiZYsNBpg5FIVJNGREaxEADZSLnq5vrvQxTvLSwh+bx52rCeMj0fD6xEiG+r9He13ALoAY5ofsgSHhjF8Kl07lmWvledxl+RPG/lXHKG0Rl0MmUnF132ql/iB8Y/KMW//XnJqixihMaL7L/nvaAH0SN43UEx3rMX62K+ib2l8cgqjnaox99SCb3Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:29:31.7047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88129dd-8cd9-4331-08ff-08dee285de21
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4944
X-Proofpoint-ORIG-GUID: W_Rm8oDZhlZc6tl0dsV4HjIid_Xxc1Ow
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1MyBTYWx0ZWRfX5s8qyA+dIyjL
 wPFeqEbMrMEEkUmdiI2FU6U0s7N3n5ePPzu6v1InNk/B/x1fIS+8ytG8hjim5v1nJxl8zOFqOpf
 vW7/yLDrC0LIH2dKBKiS6G49ZAeNYNY=
X-Authority-Analysis: v=2.4 cv=KfLidwYD c=1 sm=1 tr=0 ts=6a57a761 cx=c_pps
 a=Y7Q6ByIND0QZLGHO7LoGYQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=jpUFPLlG6pqKT_6r6VoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1MyBTYWx0ZWRfX+iGlvrhIDXYN
 kdCun/71C1SViANT3gjEY0gWbvULaAehQcpjH/GZ3jxv3qMmgLnxoknjSeOe1+Jk1qAEiTdN+3j
 psrP/GRBdQCPXPLm85voDVL00Qk7YXDOqyS/MoW2/Vd0/LcVqG+nP+rQF5APhxTRinEXW5qvMsz
 29wqDsXGkkWdDfzC6/w+/KIAsT02H/pOxD1ILZcaW39AGgZ8QDxjusnuHzBPHGRabv/p+Vb70T4
 hvhhomoA3qjxK0V1w7FE24GHkibLFa3UXgYYN99n5iW46F+Cv8SThwkcvENleRJAMiJoi8S6P5X
 DOWpMPFQNALl7Rhbk0dtQ6dzX7jv88d6XvILmnOvZVqkXNLGCmprSSMWc3VCczWHqL/+UwXtOA3
 hZ8PMiNJuvXSj9DBvD1SH6ZpbAUyQP3F85AheljpVAQZAFk7vZJ6CYmxHaIG0AjvWAqKDQI6ett
 uG0qj4DTBwYumLCQyzA==
X-Proofpoint-GUID: W_Rm8oDZhlZc6tl0dsV4HjIid_Xxc1Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150153
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 15:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20145

meta-ti / na / 20260715151023.464240-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] u-boot-ti-mainline: Update git server
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 15 Jul 2026 10:10:23 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f24b88c15c166355a44ef41cb5fe9901c7bebf2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot-ti-mainline: Update git server
- Commit SHA: 7312a079ade476e652cd71e1872d835f9ba5316f

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] u-boot-ti-mainline: Update git server
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 15 Jul 2026 10:10:23 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f24b88c15c166355a44ef41cb5fe9901c7bebf2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607150400
- Commit SHA: 2c4b1737f6cebb9f3008789492f440a0801b06e0

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




