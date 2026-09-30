Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A90CCA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:11:43 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13134.1790773896350221925
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 06:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XZ+SHiL8;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Dj2EuwxG;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB69ac2715434;
	Wed, 30 Sep 2026 08:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k4JiSDX9iqBm+XhtgOMu0g5b8oIL18o9ITGc0VDtW
	F0=; b=XZ+SHiL85u8x+ba5xJA896FflYgkMSqi/DhH/1Yl+jXZD5lzmzKhpPQ/i
	XlLTs457RpsBjDQW8oZ6C9mRjYOcqeegbadqmaL4ci62eKvSKm2nfktUMny3iwv0
	iPuarzB+tazjb4HeuYok2IhbS9vHvejGeS51O1jUBgZdy2/PG2vBVHzrKOh6wqp1
	rrLWJCU6p3q8wwJ3a895mPijBrOG42zvzTKE3tZfdd8wpwrfisoigBqHWcPpYihA
	qTlc73GyTcToFty9xlZmC2qhxJrjsYJd2kp6qJjZnRFg7hvO8dkb/ZujiUO2ThIU
	RIUVwa/OqrnRRBbc/NsYjWkWK9oYg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fde35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 08:11:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyuMIwM5yPVagl4uS785c3UlNnjGR0FqukX8Jp7/Ku9TsUA9uB9mvgHgrI8qZc5G9Wz00lyCSF6ZEAv5BSZiGT52pjCa8Negc9DJCMj2rd8Ya9r8psWfbbbVKKtcea+768DDMmu61InSYoGjT+r7LMs3KIGLMITnDQacepFVJKJvU1SdlTI+P55HmUFSGUe9n5YXExFLElWcl7TJMGlFQjpQjUy85gMZj0uPetdmBQxxuVoFd6RSbmpIb8Dw07Hn/6YSFVD/+aIymErjWn3ILvFI+jPog8wI4bzck4E//wMCef0rtWAu8ymGLPMUr0tG0tzo+Da4hsJjc/FzqCeaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4JiSDX9iqBm+XhtgOMu0g5b8oIL18o9ITGc0VDtWF0=;
 b=GLf5r+A8eSaAAMoC4/VJHYf62fq5/atlv0QiOsYuBzkriJSlL1Z+7tEGzqNKhkRjKpCcKf+lFEGsgm58vO8L0OlVIMcchswd91dp44AWNn8TB+6hh3t63GoSwQHnRwLpKCVWETYkBFMBo7d5WntXKqabi54zEtRKHiW6+GVBCkohTcwqHqPoazFHECO8mSgdWzTtQX4vJzov3Jp3I2n3hZYIdB1l1zIIwtu+W8NT8q/Wkkz+iKtL/M9JjKWeV14kq484EIIKidJnWVRknH3Lof6FdAEoNfi1C61Tgtj2ugsJf17bgRnm6RNo9c2l8iBWg9pFazE0myGDVID9Px93sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4JiSDX9iqBm+XhtgOMu0g5b8oIL18o9ITGc0VDtWF0=;
 b=Dj2EuwxGuRyL4BA5IoeVrh31lGiFkCgtDRoDVTqKFbaCoIOMHAGLOIFmsjUntOwy4KF8lIY7iAGWjXB+F4X7SMlE+WGl5DtJhT8uuSO+e7yyqt/LOBBScSIp5DMj2fhyEOjs/XdCw7kqlMwIFUriaYcrqEaemFg2cx1PYJ5afvGEElu3wxEn/AN/8BQxaKb8lLVdaHyefdYFu3G/4SdjWd4zklEhoKEbpL0ibkztAJ6cZF/NBaf++UYyWiYTXkTbGtmG55C/p2pN9rkwqHDhqygoK2+e0nJBGQaC2cnBDLFVO+h7rCPf6v8MZ0xwpkMdmRpuOluFNFhv0r7GMMkssQ==
Received: from SJ0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:a03:33a::16)
 by CO6PR10MB5791.namprd10.prod.outlook.com (2603:10b6:303:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 13:11:29 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::6) by SJ0PR03CA0011.outlook.office365.com
 (2603:10b6:a03:33a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 13:11:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 13:11:27 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 08:10:38 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 08:10:38 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 08:10:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UDAbD81655891;
	Wed, 30 Sep 2026 08:10:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 331D69A9C2; Wed, 30 Sep 2026 08:10:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Atharv Dubey <a-dubey@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
        <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: Re: [meta-ti][master][PATCH v4 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Wed, 30 Sep 2026 08:10:37 -0500
Message-ID: <20260930131037.1427323-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260930125938.95629-1-a-dubey@ti.com>
References: <20260930125938.95629-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|CO6PR10MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: edf6127b-2748-4a41-1ceb-08df1ef45670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	luqwkBmXoNsjWWPLsaCcJf8O18R14QkULVSR3r0uBNqTe4keaPE/SKIOuHzhZtKxMhh74/N4iVuXveBA5JzF/YaXtUVONzIONwx1Q9L1rpVpdocpA7P0csACivsMWS3sEBWY+KrxKyt0wgniXpZf+/CCEOtzwrPwFZS8PW1KGnymoMwMfvpN7qbjeugVdmTgHBb5z+E1UD10Xo0d2UrREtO+FoVP78jx4zGeAON4775LrngsQKSfHdn0vlle0dG9UWx7VvSZVMzhJeKFaIRWBfoqPJtVc5IfVSCC9xEMKJF0lI8MmhzA7mgfhgUM2GyxR+xPV/TY9ypwBiWWswfuWLpkNDBjlSWMLK6R4Adx1QKsdQptetyFQ8E530nzW5R2Yd+PYwK6vyxQw6mlopQZgv4gMQUhmQiqc0KU78iUYtaf7FRtsDem/euTfAV1v7P0zy4GBy1iuJoku/VgnZtTuuSclUaOTPZ2MbmzamgNnI/ASvUjxoB0P0BwHVy14fafeQZgFxoJw5kLYUGRRUrtUlZkSmCyReUI6OcSPAkbxq3sgzRWQ9wQRTpWj3Cs0lqQm+r11lvC3PXwQlvUZEYnKcHxKXxsijiON758LRbGoeDwJL9G6n5gQ9E3gFp4xI/t4i4u2ZpLunI0BfdVNwu+hA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	t70aX02sSZDsHq10cvgrYyjd1td6FRjY+9CZBtH4bjyePMLce4uGLDAxkNYuRaHuxTCrVi++4vWOoDxsy96/0CdCUdBLY0pYpWCNVw29MRsBw9uTy4sYDm7GXVVKg8nreR+bxi5BJ7uV5/qRwzdxUrVTObEK1Av5c9LnPkMQFh9AMwGSKafzgVI2D2gkyKNT+jpp4Rrv5e9ypovdUntCaatLkB863A5c0SCpZKYhga8cfOKfpDg1GqogkI0BFDN9pjwzmfc8+1ju29cumshEiGpOa/EwDxh35bHQxrRdUyyob8RvuZS+sm/r6nfnymDYpCboGXUFiYfMQ1dzPuWUzMNqdceqFE5/Su9zh2MI2yPTH9M1cj2iLZKZghzToS3yVFFgKepv4+gNUXhZ8nRJFTYg/7ogqLZnQ7sJd30kE9BnwS3xtliWXECq6/mokeA5
X-Exchange-RoutingPolicyChecked: 
	n38DZnJAD8HMt0T/7ZoIVZYm7p56OngyigvK0XK1mpeR1jLBdHkjgkU3nU+Gfhqblis02dz8o/XxXU4T5hRiKamYve6+zvBzbMmNlMfs+TNly02Q/XzREfOtL74708DXjOtiSilh40liqCp3iOn46GuBpdLT2GmmVzyn7IDWf6tTTkRHWBtm7yagzrhqP9cW83GUaHqfZhYCwASH1x49qr6GJfFPRVhQSvL+ObPQUrsEcwhKg0bpOvClOWWdR/0FhzHrDpSA/0yFBb/19Z9/4i5PClHxD6P0k4SMrChQo1YNS5nrFdnlyjfM0m8jovu6elLv25pswu9DsG7HXZQpeQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:11:27.9692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edf6127b-2748-4a41-1ceb-08df1ef45670
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5791
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd0a85 cx=c_pps
 a=6Lt9nLqKXikdeYFJc2ep4w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=0Qj9ofRoX9efyBQDLVAA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: S3n-4jf7sq9EPX9KKBhW0x_J0Jv4wLcr
X-Proofpoint-ORIG-GUID: S3n-4jf7sq9EPX9KKBhW0x_J0Jv4wLcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfXxRl+SrmqE1lI
 hxmSZRiJh/LWQijh46sUD7Lz64A9HHyQ97oABmyIaA4L0RgxyLwWDJoZvqiclgp0/gpe/gv9rb4
 2/zJWLjssQuLmFMJtzA3jMIWhF6snJA3MmCnxw79v4G5x0yXXP3qzcdq0O8gjnj8WGO5v7XhZUj
 943qptjXO7ngNBIGXlmpbKA7SDMPpkkd36mXlcuJLVw/G0t19BI2w6C4Uvw66G7wk12kDgHqAQu
 hfEjDp5HJ+0Ef8pKM6fUG8HWWTdJaT6OflorwjWWCrEI3h4P5+ToAEQqJXh+0yjUqi6MWcAjjvy
 fhdkw1rRdOlEVcbPm9gaS25x116TaJZ6ijO246g1WQzIEMtvRFT20Mpp+2fLthfSzYrwTWoSMw2
 1cYknasTcTcJ70Po9y5br509RXa2mbD/ViTgMwNzUnF7RjRqpWonqAr8j2XhwxztEf0FumUTSNs
 0bvjluZu6Wrpdil6SAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfXyIevyEKi2QW5
 jL0D/lk2GwMIF4MJV2sUwufjOr6kTccOlWn7/B72C16RhPmaNVRgtncBgOjRdNpw7ZEeIJBCN8O
 y4YVMv1v6NpLcrAYe12sb3LS4r9ceyc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300052
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Sep 2026 13:11:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20425

meta-ti / na / 20260930125938.95629-1-a-dubey

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v4 2/3] linux-ti-staging: Add dm-verity kernel config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v4 3/3] ti-core-initramfs: Extend with dm-verity support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v4 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
- Submitter: From: Atharv Dubey <a-dubey@ti.com>
- Date: Date: Wed, 30 Sep 2026 18:29:36 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 9a1220ed1f51854c8dcf5b95709213f9e510bbe3

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609251030
- Commit SHA: 9a970370942d7ff753a64b31bc367e1e27aa3048

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH v4 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
    error: patch failed: meta-ti-bsp/conf/layer.conf:20
    error: meta-ti-bsp/conf/layer.conf: patch does not apply
    Applying: dm-verity-upstream: Add dynamic layer for meta-security dm-verity
    Patch failed at 0001 dm-verity-upstream: Add dynamic layer for meta-security dm-verity




