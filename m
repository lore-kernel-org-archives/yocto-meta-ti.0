Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF58CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 17:07:52 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2482.1791392869496853178
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Oct 2026 10:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ghc5lTsd;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=xbrsEclH;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697ExGdV1055573
	for <meta-ti@lists.yoctoproject.org>; Wed, 7 Oct 2026 12:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=K71lLzBHi4VYeHBTqmdLTGQJIC+oxWfPAo8z2l3kd
	DI=; b=ghc5lTsd1dy8AcQTH7zOnx8AzkTQUI/FUlwrYTU/nmGce+rtpTUrcGfVT
	U5taZR7UYJ/Ao9GFFHFk5YkWV2RltpmMFfF1lFsU6sP3WsqTIFDTeXgavuzQT2i7
	cpbpAgRECjTxQxGgVdpMF4FyJvzoENbL1rMou0DUGlBZ4fWKbjQtNcUuuLpGDhtw
	Nrt0ri9jVc9DYGjbHpv10uZRCvlxj74JzjQx13r3dRDSnkAbattguyMzCbEe9JTd
	8MAw6oHZoXkcI+zDkkQ37Riyp0/RAyR9d2z26WVvOMmTXGbVpx9CXL9x4QFt1yRX
	cz57tUzw+IAjIFhPM2aaCGj4TaXog==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5nc8sw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 07 Oct 2026 12:07:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2jn4dvUNq/S3FNXHimcsqJ3LV/flDvCzA3L7H9DigezNFlNNKRKFwntUvzxVHmzEyans2y5C6+NEe6kBGTUwD+2wIddvBQEyDe9xuLOMqo9z0XRMdSehvKlSCa6vjjx+10MDw6CRjVSuUJYTiIjGyNV3BB6s74wXvR+sIbmNQmnnkEwdBmAJCVsB8baymB8RQjjvKFnvLzC5LJ7EjV5jwanSHDO6AQCjoF9O5NlkZwsDWaiTuF/TzxZVp6KpTXbB2OMvXKOVKnsX5T6Aqw0gKkX7lcR8MX19ZS9EuM/aNzzHeek876TDSjyYbtvEYiUU0rBmetG4Nm2oGeZtBieZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K71lLzBHi4VYeHBTqmdLTGQJIC+oxWfPAo8z2l3kdDI=;
 b=Zd0mY113ePDO7cQ2xf2qjVPO+IWyDa/pkr2+GC6SyAxB8zqVeICIN1ApSfcF2l2PeJorWFYjl9Y6lKNQKc6JqrnrQ1OG6Z9MK7QSGT54s+V2489t1Wu4ZffUrVDRkepUeuyL8W/+eJ0NzbQWBsH+Lrj/i+KTzeNuN76lOcao+D54uMU4U5VlsOcLKvJ19rxuULjJzRlJYLSKhudgDmJ/Cb+i0gbN6A7PamelcMv5AvL13F8l3RZ1Xnj45Zqd/9/Z0WcVybiH/kltdzLCm307VngjqxHbK4WPbrmdh+V/Rc+XomU3jtRosJa099XL1PoP5c6GS17NWkt28Ep18zqhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K71lLzBHi4VYeHBTqmdLTGQJIC+oxWfPAo8z2l3kdDI=;
 b=xbrsEclHn7xLD+kd9Q/1cP8mbPD7cRHPccNlzxTdJOMmNbTGAbtsVR5CpeBL07N5KIZS9QWCvwEZ48dlTLB+7jXZrkmJX2rcqbVv15PPeQVqgDxwuzuh0bNPYsEAtvSpVkmDaxVHtEIGx454BMVzeN/2DyXU+sybRAbLMI/kuRMCvjA0mohP1VJeni+BjcStwoHu0ayiH90v62qCnj10i+mN4uSyFWW8HD982iGVAnuzmo7Eul2UeUib2C/PxPOIyV2SO8R1ZuGlT/wldsFEBaJWzVOPuQpfJBV4jvUH+iFMvz3/58Ejm3Rv0pru3vmYPhPihpfuPXVRDWkZphVfNA==
Received: from CH5PR05CA0011.namprd05.prod.outlook.com (2603:10b6:610:1f0::23)
 by DM6PR10MB4186.namprd10.prod.outlook.com (2603:10b6:5:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 17:07:08 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::36) by CH5PR05CA0011.outlook.office365.com
 (2603:10b6:610:1f0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 17:07:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 17:07:07 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 12:05:55 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 12:05:55 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 12:05:55 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697H5ttq2192997;
	Wed, 7 Oct 2026 12:05:55 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 506C39A9C3; Wed,  7 Oct 2026 12:05:54 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] meta-ti-test: Add gstreamer to multimedia packagegroup
Date: Wed, 7 Oct 2026 12:05:54 -0500
Message-ID: <20261007170554.889624-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261007165126.797434-1-b-brnich@ti.com>
References: <20261007165126.797434-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|DM6PR10MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 9257d16f-cf7f-4c30-8dff-08df24956af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|22082099003|18002099003|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 
	twdJ1mwZK8r4+XdTBYNmYdv1U0u8+9HXy+1QwVQGS/C14fUk1ABDwyIZaHOlMxzg2zKWkiBMiNrDmQpol7SI/5hovj2G5VtdfVabwayZlIxHWKdHH9F5xNB4fZpuU43BoB5f74ZfekUyEkvAiMwGmkV4U8LSfMh3NkEjlzQWEyKkw0rf1NClXmYWPFH/yTxe9gudmYUjyjdb3Ant3Ev2Q4FpB+lKXWRbw/Q4f4Fej6dGE7hyc4fI5N2ngx7bkDf3UtX/OOWOomVA2DKSKtIJ9as/Ptk/CeU+HY2cT0Veb0NW7TtF896AhEW3LB0rrQXZ74sFHgK9IQP/78eZ0WtkoZnwWVk+SsUFjeipxcHMFGSuIrruo6Y6j5cVibMXVg/k1pZIOLzuJAlB8OEhTubE2WNmaVYyxyQ9jTOJFyCFuCLDRrLYEZ6d1XhRJm5yv3XpoP9yqpBQof30pGmqxE07b7BYrFLGbjggnXmew9QkXqlssBCb6BlnIavUYSAi3iz5jpQF0safw1debqV9l5lpJsb/H8kEs6RxYD0RLAsaRM7m6MlUZvfy+lHbb560imNxu4afimsrJISBX4gxn+xWumwS1m2XRJ3OYXMH9PI0kt74g66Q2YI0XdOIeezJlqZRJjbMr4B4JB/3jb6xjxdYdg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	imVtVCpkH0r5SusAJy6hdM6w+5//v/FSdYEUr1qLvEiLSw94xK/Nj9tLYsrYrC3946QtmU55K8uBTU9CVfci/y4dD4xdBA4VSEgko2X7sXe864RpeyGhGbKwee5DTFU774t9QyFnBwBl8frRqW363S80FZDnbheQ6U80986wbuFNJLcaV+Je2IKmcJWBgIMV/gyJxmLAMctgdl/zjSWXNb+/bmqkoYkQMgTLH4yFmsJF02Dica0DAGUIgC5m0Tq5aIGcWKB0aEckbyvTOWKwPc/IItxETcVJCJY9WAnkJxBjXDkJosJmsiA19RXfx7XaBH56v2ACRy3+jXJexaWjB36lML+aSpIvu1r1kuTxWBU2wR32bxvNWkXDAUmFau8BwQvsZGivQq8C0aTKWXxKdgUusEoiRjuuGtRLFvv1XskbaKqRQZIvykOsC3hq9b1C
X-Exchange-RoutingPolicyChecked: 
	3hyu6/7a6HaCEII92LVq0Vj76Cd9DiM0szpCzq8h8Yab+VFNK2moRGLqYxzxVhmiexxuMO/D9D/lZ+FqZGtdYgcThB0cuQuypCnrh48FgxRZ7ieIgc6qybFy95sn6VB8LeTKHxClY+eS5kKkE4IpFkhHXYJNvOVclKjKva58c5A1AzrZduG7zeE4uzmS6nbl7d6cfIL04ieLS+tI8douNnwbWSoOwIFE3EImx0IY7Z1waibGQ5Z95DOAojANQw8bgTV/v5H/7t338qBGnFiqXlmIAg5w7E4TZYQ6UhkMDiX8u7IQicHPEx4jwWdhi8WzSTxJp3TV+A7J7IzjovTgdw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 17:07:07.2139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9257d16f-cf7f-4c30-8dff-08df24956af5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4186
X-Proofpoint-ORIG-GUID: qJv9pgYT9Rjob4ZrmoRuJkVrm-Hu7a0l
X-Proofpoint-GUID: qJv9pgYT9Rjob4ZrmoRuJkVrm-Hu7a0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX/EQofv3sm7wM
 AABK3iZMZ/XMf9bbNqiZbKPuC7dEy7sx3cdHn+EUERgRZtJ9XeZ0YLi9T4IstihhXZFj0gJnp8L
 sWLW1DcXJPu4vmJ5hIVmgpdSP0jheRIxr9dvoLVfKCgHkyCVOcfsFXPmAFO5pUvjvLMwtm9u6au
 sKk2hVWbIruetglXyfqqc7sjxjkTjjx6Wp79IViyJFHpg0wCN38XuWduTLyzLgDW46/dOfGpk4C
 iyjkapwsV/G/i2J+AXruKRdyeQlVNVekdVQknti0DmnDOh39jeNjtLhoUJfakO6SLMA61asV5Dm
 8yBplNxUXiRhHDzH73Q+Q4GarpfyA1heQkNQ8WBC+2OINOdRYj/84/+1Z8qqjmi988FpaZunKdD
 EQSkM08AEMryTCjmaTQihrSahDbO9hnNfUeKhbiSj1WEG6bXQa/PlVWvaurE35hz6eyLCgn2U81
 BWHIfB5YVVxIpBIYr9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX12sD7JVo7z72
 FsVhphAMcsbUhkWfSlAByuC87gV8KlYOAS1ctOOc0d3Gu1PLdQcsZiXNKKXUIFkdfRDc+op5Bgm
 Th1u0uWQannOcBEi8LZoyr2qCnJ0tLw=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac67c64 cx=c_pps
 a=E1AkXC+xFF28g4y6WI75Xg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=aGQ4AIydlmouPoZN2j4A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070067
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Oct 2026 17:07:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20443

meta-ti / na / 20261007165126.797434-1-b-brnich

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH] meta-ti-test: Add gstreamer to multimedia packagegroup
    WARN: Commit message should not include directory path to recipe: meta-ti-test: Add gstreamer to multimedia packagegroup.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] meta-ti-test: Add gstreamer to multimedia packagegroup
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Wed, 7 Oct 2026 11:51:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7c1f5d7c3d59ce7704ba8b946ac8fd6e78753d54

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
- Patch Series: [meta-ti][master/wrynose][PATCH] meta-ti-test: Add gstreamer to multimedia packagegroup
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Wed, 7 Oct 2026 11:51:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7c1f5d7c3d59ce7704ba8b946ac8fd6e78753d54

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




