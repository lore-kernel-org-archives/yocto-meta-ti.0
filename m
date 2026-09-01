Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE6CC61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:52:55 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2700.1788249169608184639
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 00:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=IVpVXbAV;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Ur/0Xuyf;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6817AQ0N1852550;
	Tue, 1 Sep 2026 02:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cmT+XmFudK6YSf4cA260mb4DLDuVPIghN0mprqpxC
	+c=; b=IVpVXbAVg8uau7+A/6d1BmSYGfIJGJ+cLLWsHcaqjGordOWnNhSWgQt9b
	VEgXti2rikCZCge0fzSMEtGqu/8Br/o3/bF0iAGpOFxrgcqLaK/LaaKMPEQmeKiq
	P9xufDeJrhzsT2GbCwTAKkTgHnwulK/wWYfOgZ9RxudxmQLUqbPWTJgmmD1Q+pG8
	/12+uNz8IVqR9yVI6/D6DXBz7binHDIC4zsNNe2asWw8P84WvXuDunJhLO7IIwwv
	gcnX78M1us6b5Rwj4EuV2MbqrwChhtK60TdjghcJOCLiQX4nnMd1a6qd9QqaYEYj
	78fStATPV+SqxRjZLVjz7XnjUbnMw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gdmp2j3f5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 02:52:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rROnwspXHrgQEEF+7peWFMWkx1jArnmMXsfJ2suwX3tNAFyYJU0OB+w8LOV3CFYuda4ngTPnpdTLonPhlFt8BHcQ1qNodPLTZcZEgbW6At4G2h4D7Cy/AFg/KxGtDR6aRyc+nniW10vkUlsUN3QKASj0fELR3ibTUcDnn12aup7L9tebSPyQ5yIxYYc3m9F+EzGR+a8nXEuCgpBTD64jWCZFF3yf6ek+5I0Vqt4Z+G+xEJ/LRzINIjZTxy4Z3HtG6EGq194yRBlQUHtmTKp9ZBDNO/IijoOXYmYqajkDN0S7A/zbpOvs9E9srXUhNOgnXG9YXIEMeQT/7Z2AzGS/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmT+XmFudK6YSf4cA260mb4DLDuVPIghN0mprqpxC+c=;
 b=O9EKMOtrQ6krBZOeeCrkWuQstISvnLzH+Xkziccj0B4j4wjuuZg8pe/QraRjiColgrOFgdOrE7jPnIeG4Jbr4x7uBsti5xpgNgLBvdQhYnXabigBmd+Dr8mXyMom4iGHYZ6PpBmfV4Q7yyLjYxBYWf1fPzfvKXcvdMAubjd+byj38mxBDI8xjhje1u+HUU13mnGZu/zVsJ49SNwi7/BIRv0io9tVuVW7cH/zW4LOG5chZDiFuwZUYxhm+zkxs+P4n4PKC41SsrOb/iRhgOTfEzBj6/ZTwctqwAkXCmb2AbLboOnQpJOYp89+dx1MzZrvWJHRyP+WSJrx25MCl1JVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmT+XmFudK6YSf4cA260mb4DLDuVPIghN0mprqpxC+c=;
 b=Ur/0Xuyfs/GOx3ZpvpHKgJzygyOEgHCcBF22X+Dys89s+6ERo9ORVknmDN94Fm9u1rQxFyolT64jNcxkLXoAd9t9kUXLRbJG8vVt2aCxIvPRLI/CQQd5lBUhJm9Iyb1a9uggj0aC+hfuDkBcEiDCIqxwicJq9x/4AqoeCUfWJ7V4Obv45T+JDv7EE574U2+4qLDZsAN+eNIDrieNtfANThnERutWkaisKzdilGJ0qOLq9ZXMPC9ZxVNhq25pxtBGhssIO5gOcSTKvMAUEAnDgWdhe3hyo0wHFK00lKsTG1Ugh4nRUwND3XmfldonN/U9h+ytsSRixM6gCHobjTMuyw==
Received: from CH0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:b0::13)
 by IA3PR10MB8251.namprd10.prod.outlook.com (2603:10b6:208:570::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 07:52:45 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::13) by CH0PR03CA0008.outlook.office365.com
 (2603:10b6:610:b0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 07:52:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 07:52:44 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 02:52:35 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 02:52:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 1 Sep 2026 02:52:34 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6817qYnj2385911;
	Tue, 1 Sep 2026 02:52:34 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 489E49A9C4; Tue,  1 Sep 2026 02:52:34 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>, <afd@ti.com>, <v-singh1@ti.com>, <p-deshmukh@ti.com>,
        <j-sahu@ti.com>, <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH v3] ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
Date: Tue, 1 Sep 2026 02:52:34 -0500
Message-ID: <20260901075234.2762587-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260901073128.1118254-1-p-bhagat@ti.com>
References: <20260901073128.1118254-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|IA3PR10MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfeee43-47e5-4b52-2cc9-08df07fe0218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	SDnfQcvG0L+MezGBFSQYjDNyNT5uMYw/FE7LQed9u73EgTsac7asiwwzdG8fYcvD/tu8nIFXElbYMf+ThAWX0zdu0gonk2GJ94RVsPqhx3N3fGnzlX8D1XM2bpbpHtYHlhqVvWDnxWvSjBzWCKNV6WUm0sUDObRdB1R0L18F14NcFnb7Q4as7jVz3iQrK0ykwElzuiUze1gjJG+biXk1IJy4trk76QCephFAmN5AlkNh81VI3sXJSsOsi+C5tWeq250dXvcPoKWcYCosRXVG9j0uwk87yP6OvIWmKL9sb+K86oNcJSr8FcjKCLUWRl4J2jKcL2Z79Yb/rlPSG8coqn5m76kcfyZ2iLiqtHyBb5MzbmAmeWoLxfSzm8bP1rk9xC6aDrHqBLuRsEnzU1vjEKmPanN5wI6MzYUcXFWtbcUQii+MezNgB60N1YEHBMdWSr3XukkUSzp/2rLJM0K6u/xyCfyu6BBmgfyh13uA6iZbI7cDlplSxmj58kz3y7FItzAVv5og56sihV8QXWe6d2VYGulVPsbBB+7l9F6Q+qEtSXUnV347QwkbU5NnKjMEtiv4OjAv/m9A+kMeQfrGEHzUMUfe0s/bUliTfZZ9K4S44j6RooFNe3REEJfxi+3yeixrAhU2Zi9REZu4xtqFMVM0ycVBODUEnHpSsDK3JACX8JGew+VgH3H3ToKgcMkwmnM53aZuzEKm1IZdMLGM4Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/o+ZYHZpYDOVJW2iiG72BjF6/3AWQ9reaX46kH0TAqFIwK0PUG/2awecUj7+52bx3wLDE/1UACkAzy9hryKjSMNfdBGuXTObSGvMcR1m1fKgeNvXfxiOXZDaACU+Fw3xhYhrvT9pqJEoBuVgT8gHreFuBYwi0DLYnZU0skcYSv/AvkiEn09REBSVwYU5v2nYhboC9iH+M8hMeo/5HHgROHUezhsLCG0or5E1GPQHPAOi2Y4a8Yte8lXg0GApq4F49LnXYT2ue/raGkosXkhk7fkJeZMOw5mnkTqj+22hO78R3TzPs3MzRq9ieW5eyZgyVUEZxgIgR2xee4vJuEQLCbrnrzUkPF//dyyXct1kHqTkNRAq6Fmvew3ryP/gjvtQFL/avH0qAgHkNKqeZgJQcZFtZpSpH+w/Wji/Ig2Y8fXEn4jwSsC6tk99W2wCvFu8
X-Exchange-RoutingPolicyChecked: 
	ZQg2uEKjy4Pf0HEXLf7ANr5CFy98i1L/Ylkp3ci3HW6T3685spDZ8fpztZfYsmMu6D506hErQAlr8fdGjrv5K4/dcoCXYi8q7ywPhwC76nc8Impm9lGMh/lIP8oio+D5epip4FVY5SyTe5Hkw9xeE5H+tbxdaI+6e7IHPR9kXcJnEGtvsTH7Jrwgyr8XEMJlS911XblG5xjs60lAnIoLUlED3Zx3ClWXwCMrt9f671zFXnvjccoUuNOi9qBPrt15fsxINEPsgGuk3gKWziAjUGodj+o8eJxtsolmYurRqMJCnF3U9YCzT0Sr3/myoGRcVtAARxhrE6yNM/CdQip4TA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 07:52:44.7112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfeee43-47e5-4b52-2cc9-08df07fe0218
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8251
X-Proofpoint-GUID: r5sWWcD9RCOcvGdkBF0EeVWkRt_m2wri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfXx6jnDkI/bpKB
 n4vWsNwgtnUsZv7GA3qpUMBNiHEGTEsUDkgfuuFwU7s03LmmZS0ZoOthe9ztJLWjc9bO/lwfCN3
 xTXag/8LJ7gMzOxnpHYyvlBG0Sde4RKjDp2ljfeKI4YcZ6e1F9N3wUzBX+gMLc1H2dIcnjr97f2
 EnYU2YcvrOocbejzK89yIEmOD1dpc3aVr79CYR7Kd7nqniaeQo1QhpQANi+vihSEahq5Tqb0fCk
 vlIKu0yYrq28uMgpIldRtOrYSmDWO3NBte0BqSZaLwwnpM9lMthKzrmxAEeJrVsLXOwx4t9JzB5
 N0xW2v7TGwD8VusemEHk3vfz6Lt/iuKBOmdj318b3mUQGoMFJPYAKXeNqWl1uCsx+KTjOBkuOMw
 Z3RJ5NFe8qEgE0yPkZ0GoOT4hxejYOysk7T8+pcYEBpm8eZXYMmglQ6CL64GaR375ZWypeLCWzg
 k5vi9pEczj+THG1c0IA==
X-Proofpoint-ORIG-GUID: r5sWWcD9RCOcvGdkBF0EeVWkRt_m2wri
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfXz01i5/zKO6+t
 zUmPWceOie/JCbZyGRcL+WcRWvdfOGyneOpKGyvAFyGP6Hyd9hW5pSNn4SmT9z0g+f3IJA1NwWF
 GzL3ntkSV7/ysrouEcQ/HgDmXY580R4=
X-Authority-Analysis: v=2.4 cv=QuVuG1yd c=1 sm=1 tr=0 ts=6a96844f cx=c_pps
 a=IxQEmK7OG+ZB3KQxmUR4Jg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=MNMY_YqVaS5_lh3rsqMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010069
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Sep 2026 07:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20320

meta-ti / na / 20260901073128.1118254-1-p-bhagat

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
- Patch Series: [master/wrynose][PATCH v3] ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 1 Sep 2026 13:01:28 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b220e75d37fc206e6b324b08315f4c398c39194c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 4359f764bdd9c496fd7b4f2c1319bdc646a87b35

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v3] ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 1 Sep 2026 13:01:28 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b220e75d37fc206e6b324b08315f4c398c39194c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-staging-rt_6.18: Add ARM32 RT branch
- Commit SHA: d6f9a95ac6ae5b95c96294bb04e722f0d19ac960

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




