Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F99CA6015
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 01:06:43 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1242.1791507999070408216
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Oct 2026 18:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pxpZ2qoX;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=X9/w+1H+;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990OeZ31255575;
	Thu, 8 Oct 2026 20:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=U6Mltw2vPb5PkcoV/bT2jLS6LP/UqGTh7s+2PoieG
	fA=; b=pxpZ2qoXCP7i1s1n5hydS3W+2B0dl646whdsaVEH5BylXQVpyE4R6+pAQ
	2GNjE9J1faWzqAw+YX5Yqsx2sHY4xEaZ7XnjD/0bxZSLjd4ZL4xmU9L3X8hjQa17
	Y1r56XOgglNgXPE42yoT+Zlc5a+pmTbjntk4yZt6152+6/vqKf3HWltx2GfIcfwb
	D2eja/wh00ajsgkVvurmTNuIwFuyc50dFNWn+CCqO1SQ95hP+P5gz/DJZPp0dGSB
	cGLxMl6IR0L7Wh9xZuG7F5oZTdtlwlQN/kESy5HY7ci3dNfT0OSyWYr6bKl+L2HP
	8ElsEAuUDq4bgNpFc5w5ViExZws/Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h676bdr8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 20:06:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQFl/UVUt+blJ/xwjVCxQLlk3c8ZE+gKtmgNT+TxuN0poELGrrV+WGMi1qxGR47CWH4OAZs2pMuBZVmIp5apkchYqhZ3KYBe0nXRKWIJ8teu/XQNjygz4FY8GQV/UE0tY4ykLaaydd1LLl4hNknDSEAMJA+Gc834MgZMsUTSHN3WVdFx3GrfZev6/wiaXSxS6YMgJKifpDCAh8aj5mB0Q316QaZCk+FDh98/m4NHzVUi7PN9O0SJpu9jlUoD5E8HxkiQt1JHUTqQAXAdIspCvKv3Q4tIIqhh9fHmqiF5sgcr4tIjkt5XAbLo4P8AHmOwvIOhCLkgOjWMGxAXPuSOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6Mltw2vPb5PkcoV/bT2jLS6LP/UqGTh7s+2PoieGfA=;
 b=FtoykUOeHA7+5I9Tuz+8sG3VPUGy6I5h6Z7hN1X5GBiz8R9jV3UewjBP9QLiuGi45kdhZccZNFHJh0NjbeDyVhUnAzt3Kl7vbl8bst6N+lExBEQB2x5WAHUYBnJPssLsovku/1eJRj4vsdYjly6OE5qxSIA0mdSL0zqAtRbkCy0BjOcXAvrySBErzbj0UD122/+jDD4RuIOfajpwnINuvZHOwowSpoH8mRdMG/qgfoB7hzx4zvPJ8NDYIl9bgNbUO1SMsJ3mXium1Oqnf2Uc4IdCPXt3ac3wi8yzVzm26H+enSHNEIhW+2L0Q87qbHCbY0BISon2YaMrPvczlOtlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6Mltw2vPb5PkcoV/bT2jLS6LP/UqGTh7s+2PoieGfA=;
 b=X9/w+1H+wXXKYvd1xo3Un2PMf2zdJIAHuzp/cZX1sOX7eXO0G8pTR4xOUvSYxttjUwFa1MFMgLfDXSIu0RQIpTa81mj0qluV7gPgw8e2Esf7nXebwcKZNEL0/0DAF4FYLUx+lsZiZt0Npr/htFbTvtOE3yJc2KQwRFWRehFmJUKeHg32TVClpyQ0FjMKUVqSCaZH245hZkf/v/Zvfhadz+8lmCylvb53zGTOn7QI3yuBmOj99mgV/7v61uj7ni2pw5qb2zjGVnfmSsob8kIhK9W0RHuZex2KfC7MUzMVfmAJs4iwePI6OvK3WoCdFy/flD00qbKks/CdvQwnzRAWBQ==
Received: from SJ0PR03CA0128.namprd03.prod.outlook.com (2603:10b6:a03:33c::13)
 by MN6PR10MB7466.namprd10.prod.outlook.com (2603:10b6:208:477::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Fri, 9 Oct 2026
 01:06:31 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::74) by SJ0PR03CA0128.outlook.office365.com
 (2603:10b6:a03:33c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Fri, 9
 Oct 2026 01:06:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 01:06:30 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 20:05:39 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 20:05:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 8 Oct 2026 20:05:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69915cJ43393589;
	Thu, 8 Oct 2026 20:05:38 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4275F9ADAD; Thu,  8 Oct 2026 20:05:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610081110
Date: Thu, 8 Oct 2026 20:05:38 -0500
Message-ID: <20261009010538.3809473-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261009010209.39548-1-lcpdbld@list.ti.com>
References: <20261009010209.39548-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|MN6PR10MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ded5584-fc70-4f14-35fd-08df25a18d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	DdwZgQ5dnBjXJwX1HmRCIKREVziOrk3zSkuznvnmQLvJRl7iakgINVqiIT3cM8/47RGIXgTWBvBT2Kal///4qr4f0FRKbmOYxjv9m71rs4nU5pyw/ONM8CfyrGbIfuqPIDrecEYIJA6VOkhTSxUl/zZHFrJWEVU7cEqp7iiViXEuG4VNtMiG+3TjUpB5ySXaJVWSuuYjt0FUXsF/pEoBokZ63rm8p141grPlmx8H8kJhfU/7cMNPr8lZDMB8IRaZCvac+WOeP15TVcZxMoUiCSwhh4T+NYCWiFhGAyWYcjPaMAeGLph5F6/g4Q2jf4jOf0nABltO+awP2cIPwQJiv0GuperFEOk3M+4cY/6Wag2NOFbQobT+mr+vsADlIf0ztwJh9eaOnVT9G79Lzo0/++96ZmtKbHSsCefGHckYF8ljn+hgIE8Tl5VboYiInrMggyJQQ6fZEU34bJGqQ3AVCP27wNy4MOyoXit4/yyMfDWdE2TizGzUvim8tkNul9m3z6KnDspX1NjbB2bUWhM2s8DN+JPZLY9IWq7ml+jngelz081I75kltDzge14hrOuHs1pAErwQiAnFEjIfqbdetdP0emgoqCQ98YR+38KaTmd/QagzatA8IqdN0DAwpfDELj1uZCmd/1or3Gc0bu3/BQKlE9YrkJGg+2SO3B2YQYME03LAnFCLIyTfzdRve3UuHm3Zz5fH+PoD8b1FWaJLQw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	19AVfgp6zK8rlTtvoqL6c5eb8LCPQd2mKhnPYiMZ3ZiaXn84jrsLOgNs2W1QxbIvnRlv7K1Usm0QYMzEJRPbR/mJ5Uc8968ZfpI4RYsWiNkpHjlBaPlmMhbqoATDCPnRLUC/XF/fkNhikYb1O8sZN4imDLdcTunSrwyQVpyCfzXJrjG5IE4PQlZDgmOyhCQ2LXiYiTZ2UKmHP1Bolfmlwx09Cg7+qXSrl1i0zXyY6wP5waT9G2rTQjtCLngDrSHWMj0s6eXW+eAs+XeqA37lyQviED1oLc7LtXNP3Ke+1ycyRPAgkU7Kp35L6WedLgC2saxd0snnZj9AOfISAI5KJxlgtGtpWpJXWYG1SPZZRCHaWy33dnnxF2RT60Rmzim3pVnZrmdf66ZiuOIHN4ZFnLnF2raYeadh9voDjn6U4TP5IS+Q4eXSKow/qJ406IrF
X-Exchange-RoutingPolicyChecked: 
	VLw9NnLEsegXr5vW2NTxOXYdLVybP+fX4ILLhopRqDxea8SbUVVoAmZmEUglAfz4dHw0Jx+wpUkPZUHMwdNXSy9PvRhh4l4zqpxPl/7ouXiAeZB9HivdUfi6CcGLx4/x8RHVBwfk79WzSnuLT3df9rFbaePpoxHveezJ4nD3Zq1J+2wGgx4ISQRPo8BgJ8guKc7r4KcVhYvTLroWKWpEgtYY8fIUZjNspn93JNvvLXUrhqvQ9rod5aG2sRwplYTVUy8SIcnjHb/H8YnOIkrherNHNMOHSW/6/qkIwpg+cqrz59KI9gdNbehToemaQYNnhCFnhPjBudA6MJxuCgVa0A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 01:06:30.2435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ded5584-fc70-4f14-35fd-08df25a18d7f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7466
X-Authority-Analysis: v=2.4 cv=A8j5rKWG c=1 sm=1 tr=0 ts=6ac83e1c cx=c_pps
 a=uZgmHucj+isDzLb5E5/Wlw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=bd6Z6NOMfXQuF-hp7moA:9
X-Proofpoint-GUID: Rsfqzc1gJ6rG-jEGTMUxxnygkcZVFD-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfX6SKNpG5SYEEd
 LPzNLSr0F/DbSW9FJkI1V/E9LIunzbM4neXBP8JVPFz7EYzXdXABeacoJPV0u/+LxsVPvKRqB7C
 QvO5IG4QdbudBaqLxEI0a5td/JDTFwI3Y0xgKRrD4JUdR7WvBqEJvfliiSx4uJOlKbDikyeSAz3
 +HuXMB//Bm5UvQrgWm2ZLAnKuRqcM5oY01zGaCrOhNLQ8xDYJxSMqNkIhhSiuFTSO+ZluLa1lIe
 K5boljSF76+UPgSeXdcAK9S5yR6sMnC2Vo48GKcDkvCsaqiqWfYr1uTBa/vUd7k796mJ/KiC+6M
 1PjQkr1nosrYKIY+2QaMJIjCCZh0kuvSHSXPSKAt/m2ou6Wgsp6B1nOi8htKg6fTAJ/RZvFPjhZ
 M5R74NkayazBI0Ues1VaST8Gs8etEIOgKTPFKBBBaUFaKRNFPWrJQqS057N7FADUdB3ozLJgsRC
 V6WscZmBXdVF1CrjLeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfX59/D9sgmbr9X
 8gliooYvb2w5CRgwP75WPnrDR7boQml4OVnFMSu0C7dgX3pStry1mznFO88yhJFsJeJEENJBdeF
 Z3AM68QF9jV02BtbOrs2fXI1zG4T8k0=
X-Proofpoint-ORIG-GUID: Rsfqzc1gJ6rG-jEGTMUxxnygkcZVFD-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090003
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Oct 2026 01:06:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20450

meta-ti / na / 20261009010209.39548-1-lcpdbld

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202610081110
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 8 Oct 2026 20:02:09 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ac5389343eec64f57a8c4097c52815b0e2e8f04b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Mahammed Sadik Shaik <s-sadik@ti.com>
- Commit Subject: conf: am335x-evm and am437-evm: Bump up max_leb_cnt
- Commit SHA: 506b56b3bef038d8a48a127e0061a12af0a81dc4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed




