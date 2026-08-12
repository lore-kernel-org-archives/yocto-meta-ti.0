Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0D7C5CFEB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 21:55:24 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6317.1786571716902721955
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Aug 2026 14:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=l3bEM6/g;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Sg5wmRUB;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CK0Kla862888;
	Wed, 12 Aug 2026 16:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zAYsAwIrywKrR+V0ybXkBlZBrZxSzSWIQNWSvuays
	do=; b=l3bEM6/gSq2c6gYrlt8jljyIIuGlFT2VHXrHTcwfZHT3yRCZsmE22SHTq
	otZz43CZmltFC8i3EWXFI3gNhllCGe8C3g16EEG3QQy7UeVhYhmrVFjN8JfCnoAA
	O++HWgBKGNdwNl3/WR6U2kmGpEChT+ANOgl3xLfyeScVpT/VF0O8mxzrFlGV59NR
	sAmvsjv5nZSigBLE8z/ccUe0r/lbUdlzcsgFBKRch0xRshRWF+ASPopP0GDg3ua2
	uP7otwfak2B8JO4mq0wZj0X+fvEdbB1iL2U/tNKMZE9hagV7zeABFpcTWhwrZD2b
	VNiIYZfOZ6LyvjMbOBgw8sj6l6Efw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g09c28pqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:55:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuPN8XWDgpyzLe55oF53CTpxCwxjwql49G6h9kmqvw6TZ0d27MQIA9cC2f5IeTViMpc1VcIFNPgSyN2fYjZbOY0ICz6TybTh9E04UMTnBnnXWC+M3fI+QNDnlwiQCvll+wXX4JySw3R1HxfeXExij3cAUq1vZu4NHm6iAFMi9l9HUFenn3U61yNCP3UiYK81b/epjWDcZZf5Og7DzF3W0GLkku7faTwPzDBWNUCk00I6523vZzj76P/e9k591DWm5hfLSpPGxagTw+7X+KYQ3D9yAaxENud5fdvt24KFJf0FJenXeoCjnU4vkz3cTNadhStkm1FO/AllNOLYMQ92ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAYsAwIrywKrR+V0ybXkBlZBrZxSzSWIQNWSvuaysdo=;
 b=W6Dm5xi0ylet1br4WKACG4h5Tufpw0Sk+bvNhXF4xCIqtN8EoLyJeWtgqr4TsRxlC0uv7Stx/ZFFfUvJOUJgzH6PnHZ4ZE/SaSh5oDOqNIad2BAZ3jxzu943MRF3kzmeW7gY2v750eovSD0Z+2s7x9n2ghDk55DWFxzOdQvKF7zV0WYgn8GKQJCC5l7RpRWbgsdiPh3maQzBFtBWv4lbyy6BJfpJBpvoWNmYFApYgu2ZO1q3+Owilu27AbGTO4L/eDtIOaWZWxXDa44iW6TumIYfTRSxUS8a/tu2+m4lN7KaAh1fORStyATE6TM3gVyoEK/vjfycf8alRNPm1M2a6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAYsAwIrywKrR+V0ybXkBlZBrZxSzSWIQNWSvuaysdo=;
 b=Sg5wmRUBiBlmhgsG20La8PrRnNtqvaWREzDR7sKXl1boqk7rl3iqrYEC8hY69N/Qpg4GV2VQoc8OnNPyXjo+XLlT4YJGuF3CrPNPWiufHO37j0WK9WNEY5vz25iaJEF6XC51vTFAZIRPf8Hv3trLmNq80chajanYvuKeBCGyHhqzQHNtg3JaKEc+59kNQAEly1qpevf85iUbtMa1++Pb2icxLEuCJYclrm0KyrDYDjZYwa7ngAbU37kQ3d17to0cQljz66gASE5JxXJC0PloiZkreej5/rJ97R3Xzvktmdng5ZSuARS3rMxmIjC5wsO3M8yU5WVPSulRSE7Y5ANseg==
Received: from SJ0PR03CA0103.namprd03.prod.outlook.com (2603:10b6:a03:333::18)
 by IA1PR10MB7286.namprd10.prod.outlook.com (2603:10b6:208:3ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 21:55:10 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::5) by SJ0PR03CA0103.outlook.office365.com
 (2603:10b6:a03:333::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Wed,
 12 Aug 2026 21:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 12 Aug 2026 21:55:05 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 16:54:54 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 12 Aug
 2026 16:54:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 12 Aug 2026 16:54:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CLsrbA3853017;
	Wed, 12 Aug 2026 16:54:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E2F329ACF4; Wed, 12 Aug 2026 16:54:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v3 1/3] kernel_legacyhs: Adapt to recent changes in oe-core
Date: Wed, 12 Aug 2026 16:54:53 -0500
Message-ID: <20260812215453.3479369-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260812214920.3639941-1-reatmon@ti.com>
References: <20260812214920.3639941-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|IA1PR10MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: f075412d-165c-4c73-d3cf-08def8bc5ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QH3MYT8/akxUwFVhX9PjeafDm0rl7KAG5m2xZ1t8vpGxyERLLu19U7CoAX5ul0nIGpX8sb9j3gUh9yVkzsc7nx0e23sNF8H3E1IuVJW+d3+aXHGxiIAAyXQvew1nepuceTk6d86PZGefHbfVLIa+Ynu5an8uvs5RJTEbqxsGZeIxv5VpDtg+NTL35L8RiY7MsfXDKqsWnTznj5YbBYM/9YFl2TngE/YsDc7ArBDJwOE5HK28g3Z+aKI3K9ITzdAibFzXw6AB04ljbiXRKPxytvJz6g7MO+L9181j4k5g/4RxEzj9B2IfXst23K2o3XXxkHeC5XcTuWMTbUvAT8vubboNwMFp9lpp77LG/CmJ080799WYj9m/iv+c2tkDbiYmaUXADbD7/lHtVPp+c9a5AGzVqQdiA1+Ny/1iyuBWH1t06sd0rwL35+OuikSZ1mVtrs7gUB3/quP08cGRwGpf8vehCJ3rPkIKZKnT9n1cj5an2takvsRmksi0Vh1HX9dIXzZQnxEpfllP5iy2yDiugpbJtt1Q0pjy4TPReeUZNLGR/M8X+fcjTEsfVmQ95fE1NTqhHGTMFK330OazzV11dLl376/1G4vuqwICstYdhC7HdC8xmCpRBgnMoqNxJjvRVWh+uVgJoC0bl8tJU/xcDi/NyKNETrh1iOhBQtmKdxGHwnHSApbm/g+yEmgz+IPm
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JdsvzvVw8fKHq6i5xvoRhEWKTnDe99ftAbBAwh4Yi7sv+MGSrsGIQhyr6CIAQO5/gw1AubNZ5iYmUlfw5WwAvO28duYKU77ZEPLYUC1JjRn4Mm6Tq+Ki498BhAcI5BDXA7pUu6drgaX9gGci5D9UwjEZDKG/zVvo0/SFOdB4nY9nrL0gVN4f/Yo5utxlQcb44JSNBdmikRRIjvZA2qY/e3kPoDasDeVfFlo3I9QsVa0oVyQ2ENGDB32BuUjdZxb4Xzgz/GiAIQ747ZZvayMNa/S1TNEFgWPmTqhutAJ6Hhv2CAIbQSBDACn+KLgHqrvH0YK/C1PEmroS80KxKpFllqKAMonueK2bQyBRtW0kCiMordz3f4iVza/g4s+mg0jC5Vx71XcS3QO6OW2MAydbOmZs2CMhYy28WpvdaW+AQHkyjUDUbWts0Vdot6YyX4UP
X-Exchange-RoutingPolicyChecked: 
	rLvw9GLNfo/0WfwRsey5X9/lrG7jOCXh7sMWPIVnjEpzwjrdRy9zR/4IlkNVQu/NhUg6pLnUJQYwNsdqiJgUbxh8FqlqtvS4s8h/xWcwyDbOAiQ4tsmX4G1DNcIqhENUXhmOd/l8G36co82VqGxm+zyxdQiIZ3P0IAJ3RHXQejCKyHwrZjyzv9LMZ5LZFGZ79j+MDFkkfHG8GZq+P28c+brLVFH07aX+5oIERuKTACfU7v7PGeBCvzAq+E4UC3/XT+o1PfgUHhAGuJQcDk+IQg3e3LLIVp9QmKM/+qsIeUmNAU/VRmlR/+sE0MGdu4XoqOqyzg1gVfvGL9GpH2kPaw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 21:55:05.9219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f075412d-165c-4c73-d3cf-08def8bc5ec1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7286
X-Proofpoint-GUID: -QVd2R0g5jR4MhU_FygCQ2HbL4dY6Kkx
X-Proofpoint-ORIG-GUID: -QVd2R0g5jR4MhU_FygCQ2HbL4dY6Kkx
X-Authority-Analysis: v=2.4 cv=PrCjqQM3 c=1 sm=1 tr=0 ts=6a7cebc3 cx=c_pps
 a=ZegHLSctVnYqdC7w6owYpw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=di3swuCc6Ctu-C67fWsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3NiBTYWx0ZWRfX8+oZjbOW5n52
 Msco7JgaS3n3LYECmL6TH9CScrcuufy0TdOrRek72nLs8bo7JDvNRV+XJWdYgVqHYjxGYOYcoLm
 yptTfMhyHyWLdEpn60Xh0Ed5f0KC5Bk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3NiBTYWx0ZWRfXxNrQvni4UIDe
 5NvT5v+8WSOeYOW6YitnFsFOkDYXOSCjNZnHGzVvSA59pjFkX2S3HNaE/XP9Yc674Wr23SB2iTa
 taXgTgmP//dxvkHc5wvQFZfIKQbkp5tGTrjeiHiOqzrwTH/3jqi8V2HK48Zv9O//zMEPYU2rYjC
 i5HM/GqXOh8i0JC7QqEecG6o2hI89By2hMpxOkgV8UaNvw74ARSDBgSN5VmRNsCubtnrCCxto5x
 85obIQ5vOwwvcMBssE31w7d9RwI/NGzaNvGEwKW+wZhvCoKZDfmDDQoNW1xeTUa+ACJOHjX1A3P
 Yf2HMovAZ8Zjm8+NvnQKDq919OAUbfF0+mLS66WHksWGaUcg2CIc5yB8ef1keKwHjctI7kzjJu6
 jRpHoyY7OxvmyD/al+XFGQCvYyA2JxCdCZhlEi4a6Jh0UT97W7PzGwvni2H8eVjdwVG6n15vOv8
 swzsWlokfaqOuCEQL7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120176
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Aug 2026 21:55:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20260

meta-ti / na / 20260812214920.3639941-1-reatmon

PRC Results: FAIL

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
- Patch Series: [meta-ti][master][PATCH v3 1/3] kernel_legacyhs: Adapt to recent changes in oe-core
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 12 Aug 2026 16:49:18 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: d0412f705767e28857162a634630bafbd2358cec

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-core-initramfs: Decrease IMAGE_OVERHEAD_FACTOR
- Commit SHA: 9a5228e56c20f4b3ae65cec904010ba208e635d2

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: No recipes in default available for:




