Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C8CCD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:46:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5534.1782157571479621541
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VxJPXvf3;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=CqdCuMNx;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65MJaW5a2220829;
	Mon, 22 Jun 2026 14:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ueuQ9VFEE5D4ngoQAzvadAG7wRGXSA1T2QkjW8HlN
	jA=; b=VxJPXvf37eSYB4QzunsutNPucZx9GFRX+DdyONqHKIF/lLPIUaYRewo50
	pCeBvZQ+YrmMdbQcuUlzP/qWUhcNHJCyc9cPMOo8VzluoeU0Nc1Idw0eUpYkEHeb
	rooOBFz4n9eD3Ew1jE6PIRVd+b95OuA+VPNcwlX+haF8M5DktpWA2PnNP0EO/L3b
	UHi63k3lLsZ1QrQUma/BpF59kFl6U5+8w79bh7O5l/IbmlBqyxxZML3CpsKqU3x3
	4AkoPa8Jzh//kFETakG2T1kmDu3qg3V0oIvB/cluRhoiRvuvw+KPc/N5bAX4U20M
	jxaMkjp3DTr0CXw+8IXnwcgHlKVng==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ey42xttx8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 14:46:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwfrHkTI5z9nBWx/kCql7b7vQJoI7hCORKOxeTm3r/a7HuSeOKxEQMQr3MKD8EDXVSIDk/YuJnkqbZwOtpcmcuHkZYVYtUAeKoYgYwPqU73C91Xd0bA8amWdZy3/kTu4TH9Ited7rbjZjGRgUYXYPkevde2bAKQoUCm2klQZUu824CRHMDtpalILwd+TPeFrnvEJsBNrDtmdZ+aSNPD+Be9cVMXEaZ1DR93NUDfNPe9TG7DSBKBAWBvXBpmu6HDTCChKkXVI9e+wa2rOBiUUZCkY9Yg3l5svWcEZndHHnF0Z7Zv9O0c/wTUXZixOQiKgEwBBQlY/mnzBI6g8jCba0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueuQ9VFEE5D4ngoQAzvadAG7wRGXSA1T2QkjW8HlNjA=;
 b=vdkdqpxRyT9FtKsWDDkjIZI51ufB5HctiRTwd8e8pkIaO0YbdffdMHOXZ7QeNQf7jKMLIdybRHUUPcJUNieTUk62FDZLQqO+fpQSGMzqNtcKHj/IFkj9/VOCrua9dPXW9LGjGv/zFUonmAYO8AHKwbSxG3khZUgy3K3XfQJxQfSbZs8JPJ6YsB9WqV8Fs5qaRA73zd8+G4WCReWZMVjDvTteXO5CxXpk0HA6xLRFRrXcLgS6VBPTC8QK5wN4OncyNUPsCS4qM+g6PCsbRw3izxVzep+ecter0SYHo/ixPEJvUHhA9YMLSA6YuF29lns0Ql297HQnRbDYEn1kW+oW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueuQ9VFEE5D4ngoQAzvadAG7wRGXSA1T2QkjW8HlNjA=;
 b=CqdCuMNxrmLtsfzyVkVz/DqqPdlOvsm/V2BVBW8Tg+J9JMbHG0/51+pS4n+eST3e0N6MXq1ZtarG7SKf/5H76bz34WnZ7/2dlksJhJFmBLGlSqvTHq3gBfoMuZQ3gHqR7GjNyeGueR7eZabpv0PIOSN1v4fvWzM00kET0mr95aI7nOeE8G6Ls7wQ3wlSomsPoSXaJlq0dlW0A9WL2p5Iz5akersNgUbbw5g0fre5u/OUWWJ1+qfy8f282QHbrDmqsUMxEGSoW1QljcJbJF7HuP96YOlmhn+yoEEOyYIsuNAQIVRPKfSyLqnsZy7lWZ5LJ8HA8HaVwa2Z6msfhZ32Mw==
Received: from BL1PR13CA0025.namprd13.prod.outlook.com (2603:10b6:208:256::30)
 by SN7PR10MB7048.namprd10.prod.outlook.com (2603:10b6:806:347::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:46:06 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:256:cafe::43) by BL1PR13CA0025.outlook.office365.com
 (2603:10b6:208:256::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Mon,
 22 Jun 2026 19:46:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:46:05 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:46:02 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:46:02 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 14:46:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MJk243012646;
	Mon, 22 Jun 2026 14:46:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 092B69ACF4; Mon, 22 Jun 2026 14:46:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] packagegroup-arago-base: Move to libpcre2
Date: Mon, 22 Jun 2026 14:46:02 -0500
Message-ID: <20260622194602.156380-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260622194403.3373710-1-reatmon@ti.com>
References: <20260622194403.3373710-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SN7PR10MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: b191d540-fada-4ce6-8560-08ded096e5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	dWHjajwdz9r7pK28x6DX/ksaRCyqnVhWVM4//i3lvI+brrgpL7PF0hExpmVKYZlJiKHrWzKCECFU8YOvO4R4ruLC+O0iZv+jc9iuMeYn+vxeI9NDQxteWyUMmpgOUAXWqk7yhbPNM4KJlX4rpzUf1OqJMF8ss9kSheOEmTFf8kn9UvVSN6Q27mProCgRWYADYq/N+CZniOtYiawjABHDOli3kDun3pxv/IXj/tG+BGcZWt2uQl1KHDqD79YyH1LCsqMyROqSrsE0FueetL4R+mbYM9C0YeewaweolHwfA2I2do86o2cKVWdfunMNZXvdB3G/Er5sdTX6/qlm1QSZJYy+p8Xa6u2E8MQ6OnPESZxKSHUUZNzNDS5nlBtbcRmv20S1WAjfpnguvYA5wPlwliCNY67O52Xr6wxrdmQA8yD4LKl1uoOoxqG8cFYnHrPI0ZvMpwh4lWp2jnitSRZ6J9QaBSNrHzVvltvhTsucyA3Yd0X+xKzHO4fCq7LQjf3zKDtOIWpmiN4HmpIJrZhTR0cVYgRmXTZmyvGD9GRbMhRbA0/4q3Nvm72zfA4H2s9quX5okxLhcyZsy5HQ12RhUFbNR0x2ObW30PKhE98xBop+L6RUmOOgvGKDyMP08OJAZdIai9v3Q2OAKdtcQXPumqyTk1P44C1gTAMLHlXJ1qxFE5emoUgp0OSWN9s1OyKw4+gSh9m1HzWNpR8V3J3CtQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eYK7lQmkJZab1izwwAX1HMwxqJzSvNa/cpeu6jzlNdnGVs81RtM6HOmRhe3NIX48c/kcTE6OBRKkpqfsNSMI3Yr03vm90IhAZWR/5aqANheiv1DJ5s+9vU/jEN4SJHdoOWRosqz5rU9oebUHGvB/jADUsOio7L94Arzgby187Fdigp/EN79PECgld5HpwlOow6wj78wLrfSxxwYtHUWa4t50juLgKEWi3MYOBX4K2e5DKAvqJNePs1Urv+zk5j6XVoHbCGzK9rahYwmtceQjaSZ8dlITIfcz47ZqTsJYHO8QO5wpmkTJjGHYs9X0xjJ48Gmnc6vnrAuzOD5m7SBwQhgWFhKOgTZh4Q+7OFxeNQ5q8US7WmeilGCSlUGhotWr6whMInYxb2sZRVFNda6/bGF7mmtAoOuMpqnJdJ9tfk8lPcMAfSpa6mBcMrOJMyAA
X-Exchange-RoutingPolicyChecked: 
	I41mcvuBgteMA2qR4NKPV4p1LCRpiLzyJdEOGXdItpZEU7U1hLoCzFJeZFMVufz1iIrvIlICRwCljtJ6XPgjFjESY/VsqWpuiFI2RCyQv2bZAw20RpRLH4o6tAJ+AJWsDSLic4Pm+YFSgwtnqfhjRmzrFjaB4qy6k8y20iubb5GAoT03Iw80GKA3ZhjuleZ5AniMtNnognlg4aHgUBs2ENz2eSuIamV1wo8dIrBg8MweWimcVg/+syczfU8kdasUvFnMN1WR4TMwdDEyAtQrCs+CQK4IytkY+kiYZp8/I/I3vVR8pYoKBi5Zw3X57EhakR/5ndPb+RYqN1sF5/G14A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:46:05.4034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b191d540-fada-4ce6-8560-08ded096e5f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7048
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX87wS3xkc+9HH
 wMxFsoVGsv3deNVFURZfsxFm81o1CxYKdjP/DjL5Yk9c9hffePmhQByfAbmGIlHzs74gZtAR/oX
 TnngyEJQcn0cs8ZDPTTwO3It8+nYwAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX3bcmcMPZHOs6
 P7R2d2pT+CU2fWI8T7fiBBs4xR0mmYpTuVR9moV1e8iJVa4Oh3dBQGw4fV8DHR5nUoh6U/r33fD
 drmALXMw5TV0UZXDPzW065W31ZWULKmA6Qu+8dZf+ufnfDScAl1A7UNTR8Atd8MkvjsHYMVawAd
 UMj1DcAOuhsyYLpsUykEB9hf2GijOlKqGsbMudwqlQtE/FiKAhELn6cCfQKaJWCM9QDyC15Y19H
 n7OBkTC0SEbCApoxDu4mXZPvpOiLolQlwURYRNqx8eETn0B5asYeE60+Ndg4HAqpGB5omEHegWI
 MVBDd1DrmV/MUKOUvpec4YFFzyQKL1Qnr4LG23SzM2vFucQrBCdUbcEPY+rfnp7ZPZQTUR4qJ3o
 a6b0wnjJTrma9VhPNVK9/IF6yVLFNhhqZD2c5oi+TVitE+RxsCik9Cxba4WlCZQvcYcXjRcOOKd
 EulTln8amcthshhi5nQ==
X-Proofpoint-GUID: s9GwVEYlCGzP1CjuKBlP7EfqmDYqm4gb
X-Authority-Analysis: v=2.4 cv=INgyzAvG c=1 sm=1 tr=0 ts=6a399101 cx=c_pps
 a=kBTuJkHEWKOaoYTOH1TR3A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=1-0sT655ToRlNSkoK4QA:9
X-Proofpoint-ORIG-GUID: s9GwVEYlCGzP1CjuKBlP7EfqmDYqm4gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220190
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:46:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20051

meta-ti / na / 20260622194403.3373710-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH 1/2] packagegroup-arago-base: Move to libpcre2
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Jun 2026 14:44:01 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 395ab3c5734043f34ecc3a11869b59d17fc164e8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202606162200
- Commit SHA: 8b9b4854295491a0272722fe4fb2e0aa773d0a6d

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH 1/2] packagegroup-arago-base: Move to libpcre2
    error: meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb: does not exist in index
    Applying: packagegroup-arago-base: Move to libpcre2
    Patch failed at 0001 packagegroup-arago-base: Move to libpcre2




