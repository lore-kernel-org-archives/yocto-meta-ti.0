Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279D4C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 08:40:50 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9411.1784277645932637187
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 01:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PB/E8yQx;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=wMER0Gs8;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6an6j1759409;
	Fri, 17 Jul 2026 03:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9BijVl5ZmCEdFR2DsTZ/+DwuwHD8YXQGPKygF9qVo
	lw=; b=PB/E8yQxZ/gNoiHvjRvrnI03klnQcaCSpcOwUWgQOwUTRW32muuHKDmb/
	kGdYlit57sP5mYSQkUtLHMXjuU9jsS3IF7nIdWf34kigRQ71CD7S+wEDVb9nzeKW
	6StEeGwu+dFy2MuSeQmLGmS4gV0sIoqHtql92lMlGTdCC5BbGjsBF6eEbR68CVOH
	2xPp28qZciRjSO+U/FSlQwPXOqqJ1XuA2ButCqJTNKJU8oQHqCG2ZyQrEE2mwdLq
	iJSp4uf+Og5lc/u3S7cS+iDzAJDwqkmL8i0hIpRiwr7srEUxsXoxXrVEbKH+NLWh
	+a7lvHlkb/WP4N+MIJPbBICJMIFfg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ff1p6vv0s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 03:40:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEbohX1lowp39bdHSimkRwfJyC0DhNoDM7M+ptSH1M6bBAi09q2kqjoBwqCwwy85MsDkFjsJqY+IuLOD59Zq7x2vrociVwKvSvZZMrqlGKjYxOrpn70bVopih1h0wyZdrKZ407u51s3KgFMk+7u5w+l+nIMWGD1Qif3Cq21lpoWKNA0XyTNZ7ZtzlsN4dxgbrR7bYSQgFzmzg5e78m+AuqHBOCwp28N3lbkTm6TOlds2Hp4htHldUL/AzSitVnmyb/+AvCEpJKMGaVtoVXSoJK2NvOnS8wCSf0aWIxiKnFQfpE2ubIEOEd0AWvfJyYHzYEN8taduZRgqiOV3jnEiyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BijVl5ZmCEdFR2DsTZ/+DwuwHD8YXQGPKygF9qVolw=;
 b=jdTrwgH/AIj+wiIb8UvhV7bc4x8RyUOuO36iMMCc5np1LsHheiXHRGN9dcpx16IKdY7K5pP4k8gfZcbp3B3MEZ5kznMknnm+xW2E7MirZiqGR0KU4SmP7v4UK5KVmCoL4mkbsNb+SzTlwim9Y7P6Q1Q31nPvbem0be2iAYjFUU/sPyUncL58PXCWEOPCZP5J5rQI2lw6x6qtnxUY1NPTx9DR6BFlThEutU/9Do34s4pfdez/34uMMOVEm4likmpewyoAI3WPQd+gp3zoyXZm5yNlGgtObhJF7DE7hpfJf9dhAyu2C972Qp41XA3BOaL4VB36HA9YgHLqm1XcJ2U31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BijVl5ZmCEdFR2DsTZ/+DwuwHD8YXQGPKygF9qVolw=;
 b=wMER0Gs8uJ62GEta4KzVdpXVS41ataQLp5AALxUdv+tCUHrfX9y7EG41/iHVba9C9foeo7jMCB0VxfTIpdsg8AoitU2lDz7mdUFWSAJjpyyM2jdufGrm4ma7oRssz9iME0yroej7PihigenKSffePvaJcRYGTYVliEtQkkoEg1NL17emWLElseCef+TJkczDxkDHSgYRG0Y91sqjXtazxvy9C0RCOLYri0+PLUf3oYLzuBPw8NphyZYYvB2MstebnA8kprQ0H4wOLcPb+AeslEbZ0PDttKYrNrS20Y2aQ/iv+PuiJisajPgUtAOcCKkfLPl0vl59pjzMKl/AtNJKow==
Received: from SJ0PR03CA0150.namprd03.prod.outlook.com (2603:10b6:a03:33c::35)
 by LV1PR10MB998098.namprd10.prod.outlook.com (2603:10b6:408:3bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 08:40:40 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::9d) by SJ0PR03CA0150.outlook.office365.com
 (2603:10b6:a03:33c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 08:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 08:40:39 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:40:39 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:40:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 03:40:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H8ecCH3406819;
	Fri, 17 Jul 2026 03:40:38 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9C1789ACF4; Fri, 17 Jul 2026 03:40:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <nm@ti.com>,
        <u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
        <gehariprasath@ti.com>, <denys@konsulko.com>,
        <jcormier@criticallink.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v5] initramfs: Add initramfs-module-netsetup recipe for NFS boot
Date: Fri, 17 Jul 2026 03:40:38 -0500
Message-ID: <20260717084038.2203317-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260717083522.1889008-1-m-shah@ti.com>
References: <20260717083522.1889008-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|LV1PR10MB998098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8623b0d6-aead-4df1-959f-08dee3df14a5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	O3rU1C90Oatp7nv7hSO486CehMJyZDzedzFgwRXvSKifw56xCcp+gn24uNxqb6yoIhWvDXKfw8Z2d6x0Be/JCkFsFg1LidIOIBwMjWvCYEu46O+TRfs4F5ug23tr9vbLxVVkwBPMMOtQzSBgVMGUONpae+s/l5pHK6Vs5jFjLOwxQh1y3QLIDmaVG+E0VmJFHVLwUQe3yHKleiB9kLelHyh6r1Qfr5D63VT2VG/iS1WY8qRTfHiqcdiw7btZ2KSnoYAk8tDn1Rjidx389FMXhVIh5/yEnpgYCLUdMgpdvU87IDaV7XtbYKjCYZXok+6CH0iRXKnik6DG3zyp7sVfIBwMgNboJrpuAc2sIHZ3n6jm8TGkCS6eE90X+I5Rn7bKJlPukzItiSAl/YiNEiHw823JcVI2R5q0jESd7mktMYPWCEbf46uahLxLMHyeP4wcUzfsWxqyKgC9o6EPQ79rFIXNmNOeR7z2hSIEY1c0dBHtTb1TyEfSh1rSwZtXQm050r7HUZavnPn3BHywQcCKNM16FVBcTcXRfiUVNNe/LkawBONO2aXcJ/JgVLWTd1Rnwb6J6H085X49y84TaJzRzST2tLI8b3CtZLtyENs2tpxZH/udZfyT7obbWGipAc037xXrl6DBLNvVVs78d3FWEqA5cCrIVUS2T4+JrL7VjsaFleA4n+FqSqazlMNBWCqcNAq9titpQOIKtz4jh8DcGQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6B6fnnRFCFryrGbu/p1C9Cw6XvSY42a0UZZsfZV1cojjBWJYQ3m+84ZRw8t6PkCaeIqclFcsaRoRJdDkWv/l+tEEsQl/MAEZwGyu5KIjJNVhJr2k39DENPUIGyjuixUWxKg/RkkeUF9q8q65NyBySLE3euLgCR1A+HTGI7kGAd5QxPug8sjHynEvh0YcaN5DDB8g1EEBZCdtP3Lp6IMXAsoqyeF7ZbpdJckfOrC4Wok59tv4+nN4mHTN3QJNdgsY1D6pDTpzmrjEj6sSor7uAUE215WflVgwGDsGz9EZjLOZn9NKNVp7FR8gz1btMp/J9cfJyIueYC/JPF9I0spVTckUzcVex8Dtfry8RRAKhmzLuGCEwlprSkwWXDruz3nXyyK7zsf2TEp2iGKIx65E2Eo/ZMP1T0VkKfTRl48z2dQK+xOX/U3relmBJsAnplTi
X-Exchange-RoutingPolicyChecked: 
	B02vyXCW79UREyslXuZOw3z4hRweef7Q3chVMSHX9IBn459DhoPMfsj+MKssqLNPfaWu9DvTBvhWr63P8gjL6RqJuxEMtO6k00hnpWY5C1qKTIDlco0NN31jrBwShBc0gsMfOodIUY7f/0AImTZvbXA+nNfs3P1vtgkBmAmTPKUgPH9Te6FtC1nRqpb8bVd1uEOFXDQyCs3IwznmjMokUDlctxXS3E14XxkJemKch2fzn516HIB6LF94TGI49FojM2VEOVq+Nby5/7P759an8GWTLD2fFvQDOLZPGKtKjnVXaTEHdCEbfGOoyMsj0Mb7LYHn9sQNft0LttsQK3mJPg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:40:39.5500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8623b0d6-aead-4df1-959f-08dee3df14a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR10MB998098
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NiBTYWx0ZWRfX1JKrG3b4v3NE
 IrWxazPalLLzdWDwvCC6Lw48msdX6JJ3v4JkE8LVrcliUFG909NninXE9fQaKdzk5ItXTwJccHm
 jG1GglJTzepgYHsVf8IH7/4tlXE0UcqPJP45lAnriToVGzZbJe/xOYsQCSgueFwjbEBGDJ5SRXo
 fRCdQuLuag/Gta79SCMsAG+p86UlvURQmejiHOir0Q+SkjDSRCZzpnmD53W0TQh5SSehNpP/BC1
 SxVlpaiBG2PBovQPQkibAlvjACMo7Wx1FeHZ+zVsq4KKJbkqyxUN5gTaPIFC/D4r+8bVdZwsdK8
 z7qoZe4dztnaHo8Gmd12QAZ5jEpGmK03WrVSDx9rebizLJ3HQ69d573RwP3xspjPQSxnc+drcN6
 Q9FTm6Gx9bngvQZ7zy9lhbTEHNV3LHilciD/a8jm201iwp71Yr+fniDWRDEq8af7yA8semVWdVE
 6kRyWYJlG3tLfdKKQMw==
X-Proofpoint-ORIG-GUID: rCe3pPEbYL_5bpY2qG1RCUmIJJX5KHRv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NiBTYWx0ZWRfX45ZIxMhs1OWa
 EuDTCJprFTfBNYfQAO/hvn4/VdHbNu+8O/tDnI8dzRaVZnMoxRwuiHAXQ7fpGzsTBcUTzqvR+nb
 E47IDOvhnK7/ZJBAJvua4nbcHc7z70E=
X-Authority-Analysis: v=2.4 cv=IOoyzAvG c=1 sm=1 tr=0 ts=6a59ea8b cx=c_pps
 a=IMbvhL78Fdh+aiPumIwVPQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=yRcjmrM-YYgyLcW6IJUA:9
X-Proofpoint-GUID: rCe3pPEbYL_5bpY2qG1RCUmIJJX5KHRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170086
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 08:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20156

meta-ti / na / 20260717083522.1889008-1-m-shah

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
- Patch Series: [meta-ti][master/wrynose][PATCH v5] initramfs: Add initramfs-module-netsetup recipe for NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Fri, 17 Jul 2026 14:05:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f0df7401864fa319167fdacab5f1968a47d53760

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202606162200
- Commit SHA: 8b9b4854295491a0272722fe4fb2e0aa773d0a6d

Patches
----------------------------------------
FAIL - [meta-ti][master/wrynose][PATCH v5] initramfs: Add initramfs-module-netsetup recipe for NFS boot
    error: meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup: already exists in index
    error: meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb: already exists in index
    error: patch failed: meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb:23
    error: meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb: patch does not apply
    Applying: initramfs: Add initramfs-module-netsetup recipe for NFS boot
    Patch failed at 0001 initramfs: Add initramfs-module-netsetup recipe for NFS boot

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v5] initramfs: Add initramfs-module-netsetup recipe for NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Fri, 17 Jul 2026 14:05:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f0df7401864fa319167fdacab5f1968a47d53760

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607100005
- Commit SHA: 42b887f0b110eecb91744625bd4db09b1ea59770

Patches
----------------------------------------
FAIL - [meta-ti][master/wrynose][PATCH v5] initramfs: Add initramfs-module-netsetup recipe for NFS boot
    error: meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup: already exists in index
    error: meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb: already exists in index
    error: patch failed: meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb:23
    error: meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb: patch does not apply
    Applying: initramfs: Add initramfs-module-netsetup recipe for NFS boot
    Patch failed at 0001 initramfs: Add initramfs-module-netsetup recipe for NFS boot




