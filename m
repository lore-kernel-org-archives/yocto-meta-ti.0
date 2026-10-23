Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2292.1792742476715124081
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 01:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XlbqlKwm;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eafaoB6T;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7ERJW1985919;
	Fri, 23 Oct 2026 03:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IfU0nM0+pdPbNlDRLZqBCVK7ksLsSZSi3ixDICmas
	cs=; b=XlbqlKwm9U3tFk0MOjV1Pl6M9a6ajo1ekA/1UWbZgJcM8wZ0V458mLmGK
	ZXrsVyFYXnXDwOVO4+mPy4OFNt29FINtpg/pQIl/IwWumYddsCAdcyrz13KOrC/6
	7t8CN8Be87UkGnvjS2mMx8sZSozUmufmnPhyD7r4ny8pKLEIOJGPjbgmyvgZQO42
	IR6RAJxDr5luky13/FDUxUnovXt/KRIQ4TymbcLXDv+QZk5t9WnEpoQxJvzhI9uA
	2j8Kd7I4XvJuAtOqMCiZWZka278pOGKr3CFxQr+t8Hply98bjNmn6GgbNRmDKzSM
	SXEemPEthqh7yWQsyXf+Asx57Ef+g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfybthekb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 03:01:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhPF5qLwMhwsnJaxPBOBWualuTBc22Rm6NOa+QmYRiE8MzbYb/DTLBrEc7xaRDvFDNlFlHanASq3xtcxHmlsSAJupKxuYWKMAp/ENWPLzzD4HNJdSb0142HB+ZD4QOA0ztDzdI5R39XIR3hB/+OrKt61dIDFHJBc3CXoBEwQCO7qNWpjMJV5ewM0qUje/5JRCZZAqixFiBiu1jB4geI4xn5IMBHHbJS55ap3astiPJfMXHYLbU0pqwkySduNiTRT+kvwvl4F/j5ir6Vyd1jr3QiHBQHADWfbK5oL49A/tpeK18C/pvV8W0wx9DOOgk6Qx/2NFwFlqu+xRp0ER7xW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfU0nM0+pdPbNlDRLZqBCVK7ksLsSZSi3ixDICmascs=;
 b=K+qEHSzbYOt/xG8kUSN6GGmy0IG02rXxUiF8BtpMUy6nI372nKM1zZgbymbBMF9I6Jqcm+xv7NRO6c8ab+2KSCpHTf6dT0rrSwBpZANA7lCTLi7t87AgXXSzBRUUxVj86+luqoY+wNjzXHwXOxSXmSpCtDHZ039Ue4d67TrtsUfasWFJRiTWmhPSo5vXOAqWTS3y2C+AAsvTu1DcgCiHVztKC3meXK7a/qDP791D8Kajhl4s4MLxqu/l3lc3j1/tZXaEJmoQsU0tnqvCX8FPbc531TC6C4kpciYgJ6V0aRcQGZXMRwTyZEMSf2hlJtei7tMS0Ix89/ea7ylJed2+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfU0nM0+pdPbNlDRLZqBCVK7ksLsSZSi3ixDICmascs=;
 b=eafaoB6Tl8J/qq9zd0Sg25/VPnpumvaDerr/xsFIRwUgEUojAqCoPV2QFENHluJawl+8P0AyaW7E5tlUUnOR/xVXcEb9r5UGkxjncJehkSZPVGkrEob/veJoughK9xj9uMxLs7td58BMxfa0MrYmkhAU4ey8AhbeLOFWvCk5D4fkXsUoUQdaXYjhmhiaaY0rBVu9UOEI+FAq3q2poq+uGn02RHaDp/ig0qT/pE6urdsHKsP9EF2jPmlggdBB+fZFy8fKAgw1yzGHNOCpkb0JbEAiuykjA/egxAEf6Vk1jdiViaCHpl556B7AzegZ4gLBjVqq7T+oT7QIzGR666CqLQ==
Received: from BN0PR04CA0133.namprd04.prod.outlook.com (2603:10b6:408:ed::18)
 by SN7PR10MB6547.namprd10.prod.outlook.com (2603:10b6:806:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 08:01:11 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::7a) by BN0PR04CA0133.outlook.office365.com
 (2603:10b6:408:ed::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Fri,
 23 Oct 2026 08:01:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 08:01:08 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 03:00:38 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 03:00:38 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 23 Oct 2026 03:00:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69N80c891126343;
	Fri, 23 Oct 2026 03:00:38 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D47229A9C4; Fri, 23 Oct 2026 03:00:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [wrynose][PATCH v3 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
Date: Fri, 23 Oct 2026 03:00:37 -0500
Message-ID: <20261023080037.3606299-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261023075540.2577479-1-r-sharma3@ti.com>
References: <20261023075540.2577479-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SN7PR10MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b942536-79f0-48f2-5908-08df30dbcbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|18002099003|22082099003|10067099003|13003099007|56012099006|261022075727099003|261009223027099003|261022115727099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: OC2rXWwCr4anf/iTDkgr6zEHkyJp2kDmZDAIkwRZioWf07Lb3jStUGe0KZaXb+b0jMExppJeV/hqE0PaQ8iYeiperGeMpsFnIR95WuJBt16+Wkp5RmmRIXsCTwC/gjcKuoxV5FyVVq10NCX0JarmO5OrSY5AEy0abbZzUINfJ3ZMc8R7ZkH7UaP4mzckU/9rH30s6ZWKjin+Rd63i3nURdJUBYV11kAJ6HR5K/wHYDcnYIN3697OHYmJ9+W4tZLH+3N6ut7+jH+yitAY6V2zFDu1KqvoJmLI8dMJsKcmffLtql5BhUayBKGUWmU0aXXB6rzYG3Drbc12CBShHFVohngxnc8RzRQC9um+I7uD2ffqgzkneKyA9gWTQvLFLAgSjC5py/iHMXNgoEWLTaaJOGygFLPq5q5oIDe6CD/5W1E7NM2Dru/e9n3KtGSOrIRkmx4q6aQMa/xwi/8cEC1NEzJ3RTLS6gKaj3HR2nafHkyD56pUyAb2U47sc5Au3Ryp7NHOU7rfMOaPiXd70qpztSA7aV1fSFWWSjBEWkDTdqWCa8a/Gk3fv4PZvZvURjqYsgiYNLV2o+ZdB/+3K9+e3/kKrMKyW9P+HqTIQ3EiG1fl2zRN9k19TcY/8AClN3tph8y94W3Te8v9xSfbWybf+A==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(13003099007)(56012099006)(261022075727099003)(261009223027099003)(261022115727099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Qm007vbatXiBgzd8CrSyyLnEtTTduz4TAUYOenL0fu+PJ7YD1ekW7J6G5fy30cbWkGKgX0ubgONfz44yx3Dr/AvfpfmoUaBu7so5ZEwpVtxHUc680vecBVMlOGv/odYF0YiT/AJ2U1xOt+kzESx+zb+RM/wIR/0incm/WHr1esK3O5YdZoTNrmhBQrRj/IptiFhZM8g8sPKZQL1NINQ8GGe/H0KlgptdqkJYmTKxBpVuc/vtkmp3AJlbWlvvdV3WkOoNqyMkcncfpbJ0wvOnjwQpNi8J0fsvGxOnRPRc8ZqbEbZnArpwb9txJ/ZG7VGhVbM1I/GQsNtpOfui/5/vK7qV31q18nMC7i+w8cuJyhFnOIGrX3D6+ejC9CtHKRfUoikTnag5cDi42wja2EbIeeW/GMWnaddcowJnEEW8n9D11+Dqiq4rZzTEk7QdCcCx
X-Exchange-RoutingPolicyChecked: 4tQP/N2Jm3PHIOuBP/SxxJf6lR94vC23mHH3DzlbDn7uWfSy/U4RPAOdaFL4Cr+YKkuo9J01GqFLDk+srLM69UhmFfwez0vv3U0YeDiqjJm5q73TTqIdsn0DnxJmxcBNQ32U5s0JQj/6IFSK4yAtxKc5RHv/aU7MC6mfEH/aKv9nSxcahcaZQsO/LUViWFnznAkzw6Hp2W3jlqDp6uY3sea3Ia5FhqpeP8V2vWNtqw9BnMiotBo2pBNX4/odaVjwe0DyJJM5G9JRjqiW/GzhlpALnmcyxmvyZZn65m8BJEe2gmkk5s3t2dmRWuVPTFS3WMtuRSMm1gMjYbsR4pvlTg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 08:01:08.2186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b942536-79f0-48f2-5908-08df30dbcbb2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6547
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfXzvyNTdQ8Yetd
 JJNgDJ+j4ebLvZfs5qBombkGH7kPlpZl1FAI+7IyQ+goeEbw/oD8g/PscqKDl1ImhXTT9jyT2Va
 sWboZeRRqcIdxh51PeLFYLVzn4EM5C8=
X-Proofpoint-GUID: Mnx41SiS-8bnzrStdHAEIDv1Xp_vYVyu
X-Proofpoint-ORIG-GUID: Mnx41SiS-8bnzrStdHAEIDv1Xp_vYVyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX8iTC6JKILwDz
 YxJZb04QvxHsfGdHVfvHJcX6I2ftUCJH8rkkFAavKeOfAJ3UVX0bBfqa/0dHazj1ULCIzYLZZE0
 2XvDE7QaeM9fmHND3CTMkWSFCRyndS0RH3f8Lb2C3vkYWvPUmvItSHp1N3xDHIF3TxU9O+cS97Z
 QgzS6i+I2wW0zOOZMvuLS180z2aqDCoA7Fg+SrcW0+Sn1jXCCkNqj+qIot8Oq0guLB7Nm+deA6F
 Ahl5qDsbtUDOYqmr7qF+Av2+Fv2cn8pcA0LKmrcbRbpDfkHZSJ0B0odsfYHnXTLYpgfhxJ8n7e4
 VDkSC1ZAqDFWRim2aWEWVt25iB5DWEHHCy38W5nTh2mU7yRgrwOySxeEhOmUGi4Nfpq7ncWlwV8
 hQD7Yw2Y1Fwh8p1LW7+9deSuOJefrj3xnGRuLyPoqDrUzZUdMEnvJgfqlgEuxLsMH3X3hPWk/ZH
 KNcFW9y4pBuH6f6DDPA==
X-Authority-Analysis: v=2.4 cv=ZYaIpcVA c=1 sm=1 tr=0 ts=6adb144a cx=c_pps
 a=UFaLwPLgEuA+t4da0Yst/w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=Z4bngV_jFuycox0ZcukA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 23 Oct 2026 08:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20493
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261023075540.2577479-1-r-sharma3

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [wrynose][PATCH v3 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [wrynose][PATCH v3 2/2] am62lxx-evm: Add DSI config fragments for display support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [wrynose][PATCH v3 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Fri, 23 Oct 2026 13:25:39 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 37364711cc93e44432e5e0e2081957c3e657fab2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Aksh Garg <a-garg7@ti.com>
- Commit Subject: ti-test: package iwlwifi-misc linux firmware images
- Commit SHA: fcf809649115791524d1961e70e086a63f0d5cdf

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



