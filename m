Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B33C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:08:35 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2877.1787929709408046425
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 08:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=i9txMQ9S;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tXBHA7wD;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SDOphp664769;
	Fri, 28 Aug 2026 10:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gktO3SglA4Yg/Y893p0oRchksWGpdM0dAV41+tdrF
	cs=; b=i9txMQ9SYAC2aV4IuryZFYx897RkAJ+lBDb8Lfz2kHVjL/tWAf7gOVftv
	beA8/ISA8ImL2vkBzbddIRbyLbKVD3hCOd/rlkCXyoRvAcZnNQIVJATS3WtQmkSW
	AmmQHHi5Azjr3hjGHl7tY7P52V6bHOPIfFi+BYCPJFXT9ohfRcJEol1HEx/gmsVH
	Zd5yg+QlqT0xQWTE1h784fVs8XLWQwJ2f40AWva/zPR2mUiYbLOeDSyZpGN4MXBy
	Ek0NmttUfvJt1M+zV+ENaCQ0fA7EEwNpsALXKo5k+7u4vbK+34IQ3OEUh335As9p
	mLN4S2x62H7I3CYxCwjPLEyu44o+w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gb24pbpg2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:08:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCTH7YZSadZjGuQtUdRQe8bpelVQGvEsKnAIfcxk/wN45DFqWRFkY7+FGmdw4epL9kYUT0GEBTqkY4y9Cy7/VFnZYVd+0vZHTSWW8oN6ZaDe9Kr25BCI+CqCoj3Z1Mx86ZMZkPsuHLXLpcIxbTI1qYBaYioavNbuDIyMUd/CgpwA+jbLPOdsRON5fjQh92wCNAh+VDjss5kn6bJok0yMUEQXnOE2PTHwlhR97TxWI97xPt0OrSjFkjUKZpk4LnbUiIKDleUWGiIbQKTh1r9AyJwHJuRaOeb4PhO4tw58mvoyZGiX1Dj7XAp1eogjlrBD8wKgdCCZaMDKXaKvYDAzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gktO3SglA4Yg/Y893p0oRchksWGpdM0dAV41+tdrFcs=;
 b=uIIRsPhRVNpMBiS68mlrQezN6758ZZh6qrlHtz83wYHY9RUId5CruEtlo2HprKxDzfiB4S4deHlvkWxDMTP04V2OETXzYISI5T6esqNng0yTDCAEsaNRcn2mr7C/Re81igBeZk2RdtT5FuNCv1f4PkX3heWN7JAwUtBcrI+RKnwutnOz4+z/mhH+fgUQ5sx32Pyf/pkYw/eAHg74CP8c+24RX+llqXysTCqC8AbNNEnMXWqSkFZ+8pPm2y/iJCVjka1vKWqHtoBjNGU0f7kYWvLo6LT6pJbaSeq7f+K8WlvFcOYh717oV+wiLpZS/qoSrBfpXF6TWTHnPJUFkKoEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gktO3SglA4Yg/Y893p0oRchksWGpdM0dAV41+tdrFcs=;
 b=tXBHA7wDzH722b619tD/w4asp/JiiTb/MngIHxcNC810kLo2XIIgmyFUWiLC1rKFkPdrCrbpCY3E45SJKIWp86Dr+lp1eWjZjmaPHcN0O7gJdzzF7qfShQ01SlEJgnYybah3ahEoWsMw8+tklO8TDhpD6/uUlhyujVHBSt9qYZY2m2Dnbkzzx/MVw4pQgsFXPWoY58ozC2KQyQJ01JCvXQnUlNm82BsRAnWCGFIH5tPx9GAVj/P8C/vSVgt33gBoXhAc3FakopdeLcFD+VAxYeSiOR09Z/l/BsGLWX9q0cetm7Pn2Er8PLaLSkBwGD9cn8sVqiFY8U14YLVd+5Slbg==
Received: from CH5PR05CA0022.namprd05.prod.outlook.com (2603:10b6:610:1f0::14)
 by IA0PR10MB7603.namprd10.prod.outlook.com (2603:10b6:208:485::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 15:08:07 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::26) by CH5PR05CA0022.outlook.office365.com
 (2603:10b6:610:1f0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.9 via Frontend Transport; Fri, 28
 Aug 2026 15:08:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 15:07:58 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:07:06 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:07:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 10:07:05 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SF75wh4037969;
	Fri, 28 Aug 2026 10:07:05 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id C20C62C86; Fri, 28 Aug 2026 10:07:05 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
CC: <reatmon@ti.com>, <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <s-kapoor@ti.com>, <p-gupta5@ti.com>,
        <u-kumar1@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v3] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 10:07:05 -0500
Message-ID: <20260828150705.2251944-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260828145834.1304057-1-gehariprasath@ti.com>
References: <20260828145834.1304057-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|IA0PR10MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: a9048d92-bc59-4caf-e45d-08df051625be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xLOFIr77CxEm8aj2nJhL22juLAJOmZaiREp5JU9DyT3KQk/vHPSS+pZ5NKQGNmIiQRgr0XC+ClfWyjQhPc5we6xvyqtDXiQGEmy2yWP6HFz02dVePgHZxB3e86ulH/7pbmFpn8np8eOoEgn59lZ2aHMzC13SGDZf4VQ9lkZSeLhONej6WazwA+VRl5JnxNVrju0PCxBz/VIrfGGBEh/XzIFS+1aUaC24eNFf0ogwUquBkN/m75kH7zEoxFnJJqubKu0Y7xTvYmCKGBNyqDoAPHJzOjFwppL7w4JT9ILGT+ZQLlJkpiTfTSYZ1cEf16zzTWX34WrjRUAs/48xV63AV2rg9d2CTTwNAdDD9wyOJVDr1M+HUF8XMd2jvYYe8yVMmOBB8aK3el87pZz7C1iHq55A/YNsk5tndXRxSZ96ss6XkhwkORQw1M7XNEDTckC4dci6JrewQmGHl4OyimlCNwBq3IEnjcWoSxn3ReiB3LkPbEylVogWYGmD+MspFV4l3Ehx2MF+rZ53JNsd1BsZcqjP5Cqvi2SXpr0aArfDQhA2fvfBqSl8pTqkpY8y0++IBcdzaKKMDYR6h1zDbSkiz9mNZPsO9GWQhgaQeJZPmp7Jikys/hNSHSXe/DNV4JYUpVYIDfpsPRgGF9l1lcgA16T/qvZpZAIIPRWJzomqxznV10/lIjZXwezMxVwmwhHgxtBa6CK38w7NMpO+GDi3+Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1K5xia6ubBR8IQ+Iakss0zc3HlbQPcMvL+HOTBFbNLVGyDgW0ddxnfhmWuwfeFK7wqcuNvAfLj8CarzdWNBNq4l93Gc6tkzd9rgGb+7NUf29KJRQI5kN4RvmKeeaCD6XB5IGOBUQ67bTDsKfzCH5RtVYhna/oGBrvUP5/0A7M7D4kBwKl3dBmc0OlSsSpfL7F5BIIvIJuGhXiNDbdCNGx0qnc12DiSehaJ5SqZFeEbW0Z5Zk+hNFKMgbUtnZ1GZQvdBpETf7iiCSF7AnxkZIeKR31Qeh6TOAh4DH5UzFRxhdSEdLecpyr3BgAtewVKJtjugLRDiC1W3cQYogIzcEd34RnFYongvvq891W7Sw32MI+YBORNXrUfzZYXCd03XL49i1h/YTuafXfFnBlkuPtkGIkrn4TqopLkRRNxPf+CI6Bn1IrCvcgL4MDgzhlvwh
X-Exchange-RoutingPolicyChecked: 
	kCY132uBemeRkUIzFDObotRX11LHTbUSmiS04Bg0mi9NuGT345xBdkspF1/wjwjSEThOpTtk1ooZoeriDUqaYluSOVzVRJmwUMT2uzYYT/lDmdT8ei1+L3B5Bz7TLzZyrEhBVNkeeyPUaxs3kKSFs8VzYF5YNBn9gzvquCm/ERewM4cvCajcVteFK4rkL6+jwB8moEWN1DrQYBjymoOMi4v0ZhLcfdQldi6nrfeCVNuu80hiGSbgyAEDpaCYSXN+s7TmTTICmMa1De4euWh+Etb0J4qVUsw3OhWG+Xbnt9dgsVv20cVdW9acFZNl8jEJHP0dKFc+2WIt/6ocOQUd1w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:07:58.9365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9048d92-bc59-4caf-e45d-08df051625be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7603
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzMSBTYWx0ZWRfXzZOO/bfd84ik
 Lu/FqPJGVbVTnojOxELrO1YqKlabm7AgKuNgP4Gmyd90C6m7b4/Qv6a+ikMsnuq6Swqaw3BmyzB
 0a+5fLOXEAQX9iulIisFcsyfoCKxW+lXwgGAi9Q0h3MeDNLue7MB4KiuebDQAq3eXcDq+bPk+1R
 Fn+HEC+HuvHbT38mvSPgbnxnS0V/2cltDKbgjNt7qmzCCv0JChtH913vzhGvKywzYwcxnSICkqm
 1LdH7yBF/38G+MtlUr0HH6q45g05RPwY6cRNhrOi/igPbMGIBPfZ3akJEQOJ5g0kZmg1i7MWa9P
 5C0zPoJ77UHsRi1UN7fvNSqS7LJtlcyo58PJQQLP/2piVnLToq82jVr6il6qiZUb9g09JGXLLSQ
 tiFh/S+1l85I6XcIPuO6E4oM8dNCba5oSPHYUbfGxwvFNDoEZwDMOtPpdg0/EAjmuGsN3uQgeOs
 qou5MRJpLHF9Y23buPg==
X-Authority-Analysis: v=2.4 cv=A7pc+aWG c=1 sm=1 tr=0 ts=6a91a46b cx=c_pps
 a=S19i2aQNi83ZBCZ28RB3Sw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=nrBokKTXjNqfbvFcs3kA:9
X-Proofpoint-ORIG-GUID: 606-g82PRx6h707df7k2KFkx9ztwhHjN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzMSBTYWx0ZWRfXwfgib9zGLE5e
 7cCgRZ9OgHnX19O1pS/22RGKATmSQ3VXYuJXeNthDEpN4a9ltXfptqAoXViURdHSGrSQREX1MGc
 8tomI4q9cBEtnt/s1deffFbEz4DbsTE=
X-Proofpoint-GUID: 606-g82PRx6h707df7k2KFkx9ztwhHjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280131
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 15:08:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20302

meta-ti / na / 20260828145834.1304057-1-gehariprasath

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v3] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
- Submitter: From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
- Date: Date: Fri, 28 Aug 2026 20:28:34 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 71b70ca82ff70205a5338cbf7645708eb4172576

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202608190946
- Commit SHA: ef43a90c91d5a9754b2f28f09debd553fbc6a2d5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed




