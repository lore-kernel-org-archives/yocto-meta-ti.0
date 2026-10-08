Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADC4CA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:41:46 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3059.1791488497731040142
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Oct 2026 12:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Bm6Op1Iw;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=QZNNMGsT;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HVYAW484705;
	Thu, 8 Oct 2026 14:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KEXspa6U3S5Iwim8UFwBXEvO5yJXx0unEVQu7YDhU
	pM=; b=Bm6Op1Iw8KCLfAzfZWMSKMWr7x3jISvQNQWVv/q28+fYAqidJNuNi1rZc
	tD9gXvXLUhPvUM+dLjyzOaXBpIx7gYJDcvyb8bUKYUGRgFXLlAplH/XJIIuI/kZW
	sdZGPagwy1ltCIxYTNr5yTXTvJMQ55jUWbOBMM84a+NlOLUyQ8fAtiInxaKP5tzV
	8mJrtRlg1B8x3PykxT5joay8DLu4/tJCTiKtUVpyglKuG6YkP7iF2ssI6VU8ECE7
	uLCv1gW2c8yT5JRDJkOokUiCyvpwcro6r/nZ6JZEbYebdWUoJ8z4qy5fs/eJHmFi
	lS9/+iaevGNaVd6WLUUafz/pIXqBQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h676bc8tv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 14:41:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ0UPwQVKatLbHSGmvTIUMRHysZzhLtMWwD3L2XSspayv0Kpu74dLQH0bPno0ctnZZsZ2zkn6Eu3jCFMVfZCRof2S/pK3muUGnmFMPMjZNPfuBulNEr0bnvYv9VZeY8slgwt3eoAmcOXLHeL0F9QYHb0Yg1nfZVp0ZfFci/sBPwSA3Iq3e1jaUnWVOgUCxdx7XFJHfiuudUUzxlvHaJQsak1BeiyxYUcjpnWAX2io6pzuK4N/1qnakxO5wVGpQft/tDqHFAHEr5MFZQV+XeWQJbXS/XXHS37Z6ONeYUjfvyUrmluC4ME77IjduargqlVpluYP3CV22FEU2pqLh1DOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEXspa6U3S5Iwim8UFwBXEvO5yJXx0unEVQu7YDhUpM=;
 b=mBNkT+Lp25UWDyNKP9RG7CIYLq34qHIHrJYonv5NMUABVxpfovdBeMfeqd/Bh3we4kx1SApqepbNrP9H/PVtpw+18WFCZAL4SZjpafQ4eKGIAhQyES13daR6aGG68+AEKCtTDZSFV/zX6o5Ff9i4QMQ7YCKFWWOVGf6TN5YNsx+vqK0+yOOfgjd22fCN2S/zDrOx00F7qhedPstygS3o95LnXZUr7Ts6Lqa8dPAsgYrgXj/cuL9hmaVC2JO4Qnbm7ylx87/9omALhgrsWadjU3ErzSMXjuXO7ggWOo8ZbG11Z75StZodrXstD1WmrwUVcWbYsku9wuNpMVfooovXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEXspa6U3S5Iwim8UFwBXEvO5yJXx0unEVQu7YDhUpM=;
 b=QZNNMGsTOyCce6lEntwZkZN3leaSTzncVuFBbKi8a/81AsIqkc+chtp1/ggPrt5nSueA9a7smZOLPEEWoYapvx3lvYLdQlATIFlfUEd6DE16u7Y9jNr4jA3FCFZ5ckiHalqdCTWuA/zhI975QNPjKQ8RHQ1Dc15t8c/hfo7pDsNDDIhuEpz9KI/kLJjb9C+23FOL7zKFbK9ESetpVs9XTvLJDCHIJsrEwFeUEoYCRf3fCQU6qMZB2kv7BKwKLLSiJKtFy+38uAigQmy4rIUoEhcrCUbLvqId943RvYuGKlV094xqaOutxGJzDldf7H0YyX3FZNOvEOKpkkC7eJIQ6w==
Received: from MW4PR04CA0226.namprd04.prod.outlook.com (2603:10b6:303:87::21)
 by IA3PR10MB8113.namprd10.prod.outlook.com (2603:10b6:208:50a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.5; Thu, 8 Oct 2026
 19:41:01 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::40) by MW4PR04CA0226.outlook.office365.com
 (2603:10b6:303:87::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 19:41:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 19:41:00 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:40:38 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:40:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 8 Oct 2026 14:40:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 698Jeb2G2941087;
	Thu, 8 Oct 2026 14:40:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3FEE09A9C2; Thu,  8 Oct 2026 14:40:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v2] meta-ti-test: Add gstreamer to multimedia packagegroup
Date: Thu, 8 Oct 2026 14:40:37 -0500
Message-ID: <20261008194037.3762442-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261008192622.1944375-1-b-brnich@ti.com>
References: <20261008192622.1944375-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|IA3PR10MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dda976-5802-4114-8e0c-08df257414d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|6133799003|5023799004|56012099006|22082099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	DW+U4Dgu1yq4nmYJctW1QSP0wXvLX6QSjZSUk2SHetEsmFONvfR7kgxSo5v8VZ7QaGF6snAdLx85pi28Lbz4eP1u2Ua9xYLlxl4CoIHs/pjSjCfxCTBHCz6WtrR8ENDX1DKUJEcP/prpXLeYO0gIH3Xy1qg3B+Zho8Av8YiCNmG/5jQi1qDrM+NXfP/8ig7T1VDaI/Z6/krDtuKU4Dw2JiXmVg1uHoQ9XmdHxmPt0W7sh+8J1TUsvimT//v7VrW9yDy48b/W6WkX/n77/jW+NLjN54D3Beh1d+3Qs2/naIeNn4jvg2t3otW6LSLHW6zi7b98aaor/T8xECDpcf6DLTUnHhTt5pDwIpMw2VuaKK03nQ8VKinrioGGCDz8t1jD/sB2JATTcN5dcjbnp/fDL05eJwaUxYZ9UPQp5moBovqMgHdJqCabyhpDhAteJpiJPLd4AAbUh3gYiq7aWjiyKQ/Jc8RjJ1ymD90X/908BLGDEk0Ccn1emIyPB6uXmXXnrJYBkgtGB/xvdC9ZZNyVMDXQIMWXKnulcZRBTFc7DPDeymntqTAOsqrRCeURtjDQxIn5XClyIV65CG+YK6IAr4Vd54NyYA26vcPlewIhyyFhJCPQJ8qWgKB6FOyIY2Psvl7RkKMSAbxzxx+9HfWfiA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(5023799004)(56012099006)(22082099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8R4BMrYcCqMTxVMC3nVPm1PmK9FPSZuu5cSmh1uctXggXTD5t8xb47KGt+xFWSuQsWtcKT7z+5ndzpxfTMaMbbHNGP71V5lBmG72b7STZSRaAdZIbgozO+omZBDrxFZVKXUGuQ5kMm8tDJmMn41azs1gxMwkrPQt7f+5X9JrqKbwZzTxK6Ye6pKy6Utpzv5itBsY3yKqbIsR0MDXUb7upXIBDx2nDwFWiKrfYceNEn/ISKGYh6/nhpol8hQrTh2y+5PSO+BIX1cqaxYsfBGUi1VnZilJhvo1I1+FYzJHm6hZRlP2zZeUHjnE2uyio8p9P9VEKbSdHu6851ZC14+EhNp6SIfbWGfAfKUNQEy5Zv+uXg49C3hfISW/FEK7asyL5uuufafQDaZI9Rz0L5biPd2dmz+jhYEvPACJoB+Apx+1m3+mInE3fkEmPoDGPwhm
X-Exchange-RoutingPolicyChecked: 
	1T7wAEfHXP/5dVZcrNMbgj0Hlp0jMut/x29kJ6VWDzgasQ0PKXO6B2nUkUU8Ze1DjGApFtW73TTHQVyafpwWHuRXceXC9jF+HxWQWaNA1gHDOE60pdZRq0dq/3p8pJDmeweVjNMYae+lyz2s6ZPZXfS5F48ygj4tuPMDNLZqo5EwSMkl6yjOeo8Fp4aDXp6h5VbnaSlOvPG1rDEIGoQfG6g7tPVPLB7zL9AvR/K9SOCLseetWyJPi1pnn7Ns0DNJEVfOKCmFW6RPnXn6jACilfUMr1G6bZSoGGUZGcDVSRnhZDa1wEY9/Xx/G6zFob/Od58vQvpQ62lOjqFwz3j8TQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:41:00.4537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dda976-5802-4114-8e0c-08df257414d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8113
X-Authority-Analysis: v=2.4 cv=A8j5rKWG c=1 sm=1 tr=0 ts=6ac7f1ef cx=c_pps
 a=rA8xTxhMCG4Q6PG1LLvkJA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=aGQ4AIydlmouPoZN2j4A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: rASlKIMuLLFRB5-_6OS6yG6nwidiiVI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3OCBTYWx0ZWRfX1XKwubCQLI6h
 TC1RbKlH+opcGAcbVWywa055vUF38r4Snyk6L4ePyS65a+mSXWHyD+XE1oRoomFh/o2RSYN5BgB
 K6mj+hLY9uKyXaapzP7KuGzhiSvzUWe55Uqc9PGX4UiIBl4civ8qnYoqzfaDx6C0mQHDelv+KXS
 7JFokHWozqf5aJOV1d7LGZHQve7HV277ApHTZ1SaW1JqVmyyAl/meVforIAuakoabcmh2HFDJ5S
 XvphFmwK07BsprhKcRyULKfZ1ETIu8R6WNI2I+JLAArLoyQ6Dz8vINXtmDdXCK+zrJEzELgdtII
 Z/wC1qLPn9HpXN+ygMe9p5BQg0y6osJQus93QvJ8AUEwdg0WK8cI9jGe8gp6FQA4fRXCbNLvMog
 2HiTfkLpXslt5OMbG/ZurTNL2PJn1+STIek70ENfiJChc/oXpxA/KmmQ29Wwpsc0aloRSr0HRxi
 g6QxjehkO8tElKuGi0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3OCBTYWx0ZWRfX8NORsD93w3I2
 hp4CX09ivvJMoBh7jnxv07lUPSGcxBepo8VgZIIheIXwz3pew1zxdtVX6/NcQ2NXIp49wSZjJUc
 cBOHSL4WRFYq2G+BlaqTUYf6PtQ43XE=
X-Proofpoint-ORIG-GUID: rASlKIMuLLFRB5-_6OS6yG6nwidiiVI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080078
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Oct 2026 19:41:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20448

meta-ti / na / 20261008192622.1944375-1-b-brnich

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH v2] meta-ti-test: Add gstreamer to multimedia packagegroup
    WARN: Commit message should not include directory path to recipe: meta-ti-test: Add gstreamer to multimedia packagegroup.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] meta-ti-test: Add gstreamer to multimedia packagegroup
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Thu, 8 Oct 2026 14:26:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6c8a28204c9cc263a4526e8d67ad7c5e58a38709

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 2bd07c4cbfc422684c9842c1fb3a89d1c2785eec

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] meta-ti-test: Add gstreamer to multimedia packagegroup
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Thu, 8 Oct 2026 14:26:22 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6c8a28204c9cc263a4526e8d67ad7c5e58a38709

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
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: Nothing PROVIDES 'python3-pytz-native' (but <build-dir>/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb DEPENDS on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

wrynose - PASS
=====================
All checks passed




