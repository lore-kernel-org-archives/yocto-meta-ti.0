Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1658CC5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:29:20 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56690.1786462154586275403
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 08:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FGjMumXM;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=kDxCRa9v;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXJjr1463422;
	Tue, 11 Aug 2026 10:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JrTfN/LzjLJEI9UMMbqsLxoq1ip0nBmJnKM5wfX4S
	XM=; b=FGjMumXMDQ8t21sT3r/7+U36yxy5BAuNjGJftP/fGy+CqRIVc4Q+sZgQa
	+asMt0g/6rHpriTvhgAbhbCbl3x2ZhCk9YON/MD1c8h4Id+qzFpnfPCtfSnkys1S
	v2mNseuJtfW2It1xr84s+owxKMaL/vljCF29MINb6ui/8gRnsesc5qW24PBz0PmV
	Xjm9uEc6Z8FVjZ6byaOPZ8NkVVxzAW26tVgk7MAKbYbpvSgGYhq0s8EZb3wjsAB2
	89/1x/PmrgwzcdrcNEyn2vDKeXo1yYINqjULhwy9FqDdsZ9pTeF8rtJ1Y8Wuj8qj
	/A644ipRbLo4vz6pExUFVtxbgsoYg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g00wna8hb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 10:29:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQBc/ic0I5zuEqIDPtr3a+cumEVSHxhzxc0xtNeMLKdfObfhjtd4kAyg9q6T13y9egn4TZsheoI9QPVBpDE5jlNUmM3F/Oo3ywY+MwnU6YjxgRHd0NzFDhzrLADUn6bQCD6GtV/YwJPXYH3UKQBklCBPx+NUjzu39+q0ohBCkAYA7qXZAtVQJqPzOIVcL33VW+UHsacqVm5bcF4GB7KYY4qPIG75fbjdTtKy5KUr6luYcqKGsH3q7FS7rsH5IukO2e5LnTQtLgopZYrELn6h/xknuh00yGSu3exPAlBa9NyPjxFnM08J7MP8JR6sMYQyQ8iM4z4dEWG75x8nCoBdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrTfN/LzjLJEI9UMMbqsLxoq1ip0nBmJnKM5wfX4SXM=;
 b=WmV4PqbHQEjvUSY0hJevGSoCbsMi35MVSqP6CfnEMk7Sq3tnpyZ/Ce3jC7QdoZWa9oQClRKaP9SJESyYi1gD6N3Gqgu6bOFkIFI3VlqSx5rnmySRO72BrtsYa7JupSl3lHusvjRjWzLs3ri/yDVTFn2IIrPTUbGqAZ6g5eYf9V7FF749mlV0Ahq77a6rrNDT5BSj2HysDYCbQpQoxVBvPiQ8OrNcHDX/9mmFbyJSFMEOumz+DJiNpYpNunIxT+UOZMp2sbNZRISIEhJj0Vud/OqrmPD0oFAvIwm5HWbRrpVZVR9JnK/ZZzZw/TKmwrlYbIqkOPOwRjhwc3QaV8L/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrTfN/LzjLJEI9UMMbqsLxoq1ip0nBmJnKM5wfX4SXM=;
 b=kDxCRa9vp7XYDGw3O4O44hXJoriCl6Gbxlw1wsFOj11RS/oPHeoBykumch7Bgcqcb3FiUTujuT35EMpInAbMFGAKAwOQEsc20RL6FWo6u1Y3cha8i0o8IPrMlLpus9FHZJqqPdr4S9cdG/VRbblRzt9gBEMlf84w1CWPuhuuMWvFKzHKrtyeg/EtwNbZ/9Oi4zIr1kPCQOVAyeSrKUrL02/9Kwu4Lgr2rSJSaA+2UerHhKtfqf+1qtlNNgI78hS+DUy7jRsWbaZEM/EmBAAWFeBE3K/RISKwiSEddD8PNTpkgQ6wWYY902VMZOD/qfTEbKypc797K1TD3f6+gqGR3w==
Received: from CH0PR04CA0066.namprd04.prod.outlook.com (2603:10b6:610:74::11)
 by PH0PR10MB997689.namprd10.prod.outlook.com (2603:10b6:510:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:29:05 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::29) by CH0PR04CA0066.outlook.office365.com
 (2603:10b6:610:74::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 15:29:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 15:29:04 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 10:28:52 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 10:28:52 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 10:28:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BFSqd52858603;
	Tue, 11 Aug 2026 10:28:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 29C622A55; Tue, 11 Aug 2026 10:28:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antoine Gouby <antoine.gouby@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>,
        Antoine Gouby
	<antoine.gouby@toradex.com>,
        Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [meta-ti][master][PATCH] weston: upgrade weston bbappend to 16.0.0
Date: Tue, 11 Aug 2026 10:28:52 -0500
Message-ID: <20260811152852.2694933-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260811150043.97146-1-antoine.gouby@gmail.com>
References: <20260811150043.97146-1-antoine.gouby@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|PH0PR10MB997689:EE_
X-MS-Office365-Filtering-Correlation-Id: b127047b-7fc0-4645-1bc7-08def7bd4707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CIvquECy4bCdGKlxAhmAJzDYMNQEsnnD6mq3+ZTRIB+Sz5WzkVjzC5u8aOKp4Nz6zDvCBAIXjlG7ufTajeCeaDA3Rkd2FwAQXhv7UCbbj4jX6Vq0IFwtlPHLkrrHcuJ/UrKzBta8s4lWRNctshWa4ioI9I9bulgTb9gc2AqESQdDeA1Jj2DPYIbMU2QLCqdhC4KYk5FA/zsN11I2z7xd3i8cWSGywvrRWYvOjPUigCG+w2CZ3eTL1hxtVl9rgGudSeUFF0nYti6J1JTBigrCcr+y8oFGNGoMb87MCxFLvOwxwptwZt+L2X1CkDIRucBjEC2iKecnyIBSeaOm8s81RK5SLjn9d2/eKFdHIqST+kKfUjanE9WunQ2DaUWpa5ZQRwtXlJ52Z7+nzyFZFNjWme1NbWxd3yniyU75QSRmKoUqA+bY9cbo7YNxufWv19vcBHdAXwRJtrADOZI5ItkeIqyxkZog+jIexAgXr0pS81hTNHwGfBcwKMU7kCLXgrMjPftBYPjhC+RUMIgND5H6kLWlYgQybIkIZ6OLpm2YnY8dZMk1cMxsRhaPcxtqz4vDx5eYFCI2YNJgBIMswr5xyer1qZZ6zBXDusm3ZwL3NLPgOd0duFE5rjSomKmMjkG3ek5NwINI/qNtuw+IdqWNYECXcvH88+lstTyld6fK/us5t1NHvbimAg0Esx4tZ+exgFpHeeSBb0qZNgNzxzypLA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	64PSJPIvqxEP+wGqwUL8X8DEYdLr8j7oF0GPJbiuNEBmuW2QETMsYlu9jN1SXXCX4Tb9+oqQlUcNpk1uU2DyZezdzJzArz6w6hBhS1RJOmts/ReJX2XXgli2r5a3QsRHxvFSy8Ki0E+QXNmju4FkKoJh9WA0iNhvGyTMy2Ct7Z3hpqnk6ubgDaDZdzciliF5nZ14CGg4fBtD2x9S/8MavOOinZfLiG5/CAiCDPecdW58/u2muUaaEEBmXfSsONKpneBChjtZLhVbCgpAH54mKp6b14c8cpYLZLHwGlcff0U605hmnNF5SscblkGFfK8Ap/NyCsxSzPIhko3Mv2/h6rxUV7TWiQZLWi865qUfGA/f/plrR13ViSI2t50Vz0I/1DdStSiAFHEZR9cPB2fepjLkGkGowf5WypoBlGWCM1vBR97KI4yuDUECREpYLuVF
X-Exchange-RoutingPolicyChecked: 
	NNj2YwgektG48dPVnUfV1fJ8RpnwJ1eyVpa7uboy6w9BVuT8FhQVAwhwwq1tzqBLMW9OWjtZaqe+MEbDf2aBKOdzTniuceBF0NujP5q3d7F3LCaIbcZ7KGvW+GPXi9AytzriQ8bGRr6A1rDWcsiIp1GamSV6kk6hezMFZImQrqBgXtMsm5RbepFwL7nL6Dj0mHAPKOZd9xcsvIX9SHVcr0PMN1yamK4k4LCSomTzDY/50cAW4TtBZSMVLar1MooMJO6T5fxJ9xaYQwRgXYKV6OtGo7d194LIZXr20MFK99Gdr26oU4KuOhm/Z+qnu6wN/czkAATry+hTxjCtFFI/oA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:29:04.4687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b127047b-7fc0-4645-1bc7-08def7bd4707
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997689
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyOSBTYWx0ZWRfXwAfcZBTOQ5DQ
 utxPHYFPlfM8CO8VQeazxB7Gru4g59AaULZdxyakoey3+pIZV1Nb9Yq7VV40H9jBU8CUV0Frocp
 dWZLxE2D80gfkBStxfv1zt3TcSa8p1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyOSBTYWx0ZWRfX3SfnsECdzo9A
 cOAbYPeJaXJF3/6UZwqWFbqIwUY4bHZRP1h0LydqRUYE5GanxVJUKe1fQf6G929EaE/4MhVzaoP
 nR6zJ68QwTnhF6tLqmOtmh18doZgneoVmWT6OdwD4u+caVSY9EV+gEevqPM8GQZ/vFkdseIQm6m
 XOP3rz8lzDESPdznk0guS6SiClu5qfKtPQyGUzVmOgt7nvJzbKG0Xn4mPza/PY9FHrFi5nxbZ41
 s8CEDECiRa74e0xIcZiwI7FTCT7uPcIGGu6mDKBSMPfDdSwQ+QXPAnf99088DQsoSdgZjtncOKr
 a1jL7v5hHJ1XtFunvbqMwB3QbCztxjdaMwaOhBYUtWKeVud1sBCoP2AAkIqQh/1PDjBWGXMxEUU
 aLHWnoYFGTb38YPd1vTdckXu0KEps9Jk5xqN3RAL9rSspn/R78WAasdej49CruUfV2X0qbuG2Og
 eoKl5r9tMIj0Y9EGTQQ==
X-Proofpoint-GUID: iKumBAt937TnJM63ahB10v59Mj1xtha3
X-Authority-Analysis: v=2.4 cv=cYziaHDM c=1 sm=1 tr=0 ts=6a7b3fc4 cx=c_pps
 a=uej8S9duoQdrJ4czObxKNw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=sozttTNsAAAA:8
 a=ef_xxL1EtnS6UrlDfdMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: iKumBAt937TnJM63ahB10v59Mj1xtha3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 15:29:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20245

meta-ti / na / 20260811150043.97146-1-antoine.gouby

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] weston: upgrade weston bbappend to 16.0.0
    WARN: Commit message does not include file/recipe name: weston: upgrade weston bbappend to 16.0.0. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] weston: upgrade weston bbappend to 16.0.0
- Submitter: From: Antoine Gouby <antoine.gouby@gmail.com>
From: Antoine Gouby <antoine.gouby@toradex.com>
- Date: Date: Tue, 11 Aug 2026 17:00:40 +0200
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 66d7152877a329ae404c71a4341b686a2640aa62

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: dee29d47fde9ce17751e65d565bdea69d66dd659

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
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




