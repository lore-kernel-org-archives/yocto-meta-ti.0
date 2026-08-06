Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5B6C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:33:38 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21206.1786026811199318530
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 07:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YlShj2YA;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ODmaqKNl;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676BoSdw166585;
	Thu, 6 Aug 2026 09:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CRXL8Etm2pk9Jok86xJ6c8SEG5GnD83F5znqBOdpK
	KI=; b=YlShj2YADxqYqY99zyxn/4inDGlh64VkKoSiEoebDgeybdUiPn/gi1BJv
	n7zE7BS/g7RODpTwrxRKC/rJb7aDX+qXHmnt/beGQNlNRaYQIkGP/BUeriVxt/zu
	4kuEFeridwcZ9WMTimkv0tQn3xYz+otszLbpiL6+qMRTp21HdHH3lI4RNqRb/m/5
	+VdrxP1WB7OEAM8hM7B3aE7hwXaLxvGQ7nedTMbw1n9LZ76puxZDTOTuW1PyJgux
	nva7BuPilYWnfa6upNNmtDS58ZBVK4NxalrcosM2bKYAXS+s+uFdbuzwYkHXdIR/
	AFlCig45RyKBRxWT3naDRQO2IasQw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf15se-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 09:33:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBtRhd/u8mzStvtAOQ9NGK8d3n8kQBs0RIkJaeysYCW2xtuhp3Y2285ttzUX8JD9F1KxkosDMo/VPTxnXT9WriyPDHF+JTHgaRjJKwDHrzZ5twALHdGbHD2cvnbCiVf38u4Nt7qcIK2kJbvACdxRANbsfcf/s4g0ecXUGqyq7W+dvSvM6xn1kIrUumKT845NzbyT2yCBgNr7jMIejXpDfvbuhoQ4Bs34l36SpqH99mFVq2WfF57XGNBuRp6BLwmxPLE2p/cjRizt2zG/eI8M39FqohFP70zjSJOB+8SUWFeqJSKJvDRp/DuyD4TdwMNYZltUPAAvf0yt2nsIvjZ4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRXL8Etm2pk9Jok86xJ6c8SEG5GnD83F5znqBOdpKKI=;
 b=quhGL56WdjxQLo0Sv/ZrW3hcPmTCq+JTbgJHOPKcNFIGRHPD08X36u3dYZu2t92R1NqhitI0QzSyNU3rM+J2q0TtzqnGj4u/dvog9MBI1IxjhH+xArCWzRtcYYxe4GLjRXv2rkjA0hsCuepoUTExM8MU21oNlRR9jPS/rgawnCneysjX9vfeGC5efIqCaZ8Zs7UWf1Y4IklhDU111wR8WWRuv4LmW3H0nj5i14oju228tci5znx+vvSxg5AJpUSUblGKFqLfXmob0FvEah6AORlDiiiDpxC88RegsAv0OsSikowzcYs/tbQxZ77UyarSPLb8RCil0GUDkeue5SeBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRXL8Etm2pk9Jok86xJ6c8SEG5GnD83F5znqBOdpKKI=;
 b=ODmaqKNlspux7miVrkZTOP+yw0fnT1CIrtxCnCPuIJMYwEq7c8N+3xPN8zC+a18XsvBvggQAi5FGdeo9cx+xaJMEHPICO2A34h0IIMgE+gxN/i5pJcqb7tpZrsc7tus9udElElZzi9MWEP/zNo4ZZUlDvkicNC8lx6WoZzTU7HmoS4M7k8GoIZHMsKnKCNMdHgkF92ysljXRffB/bKdK+Omlc8RuOZEo5KPqxX9egM3/Nf1951ml8ieHXQRqLhnTAqlDF+ZCrwmFBsimK4VIttHuWQoHOfHNvaYH8FZOOgoW+6H/BbKmg9CC6Aqwx3sF9Q3RpigjrPf8RRZa2UnThg==
Received: from CH2PR14CA0042.namprd14.prod.outlook.com (2603:10b6:610:56::22)
 by SJ2PR10MB7039.namprd10.prod.outlook.com (2603:10b6:a03:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:33:25 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::af) by CH2PR14CA0042.outlook.office365.com
 (2603:10b6:610:56::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 14:33:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 14:33:24 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:33:24 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:33:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 09:33:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676EXOAW3483138;
	Thu, 6 Aug 2026 09:33:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1DEA22A53; Thu,  6 Aug 2026 09:33:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 1/3] kernel_legacyhs: Adapt to recent changes in oe-core
Date: Thu, 6 Aug 2026 09:33:24 -0500
Message-ID: <20260806143324.3980097-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260806141003.2776131-1-reatmon@ti.com>
References: <20260806141003.2776131-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|SJ2PR10MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: ad37bf17-a1dd-4fd1-1c55-08def3c7ac6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TjKWAwTxJwR0YDGgumJDXOekNHKS045mJs8x/BtyGvrpuYOiNJd1O3B+q4HOku/wjPIVHQ3/6Ph2Urnq0NctJbkmR0QyR40eimOu4QZUKkJoqXAw94tXkSNmnMQmohUXFaPcl3z83v1YR7WZj8ZlUq7yWBGm9MLRpJQ5ZEdRq21U8Hp4JyygQNSTU5ohyFCRE/7PAeP7fJfEmZeBGgMrSnfWY4uB+gicTBU7dSqbi3HfQb4sZ7x64FihNKnvjhzxNdWFgiCNVRzST2baaJloSJe5GrXogi6oBoocm8DXdE926a2iDjGqiSh4vzx11wEFt8qnikQ5907O1kKNYoAU3E9QpguhUuiha3WSo2ncQaByEgV3dqybOUOeSVuxrHxSrxt0vJt+MOD0asfrVudKJm2rkGcD2zj2nUwZqISuuRibwAL63YScWnvaJcBpybl+aDL5CjjbuoxU4y/OyFs4g7i2MTJtr+EqGVhoGvgKqvjmBFDTYXBmCx1LZjGOCgw4qbo9HEOhq/pK+6IHIO+uwPIcdGfayF2d2TtfCvMrvB7Vb/5c3QC1W7BYAX9zAjNej4JApyma9+IoJa344lIfGD36kKg+FN80KOjQpDnr234WbtKXFLUfwzhi6hFdTfcUtT9yLifIylggAPYwkxhru83JioeDh/XtJNMb/070ZTHUm9NszLdzQBa2a+j7fUjuwnvSLfXkojKu9x90Ong7FA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mdNf8oqOimtgVN9sgeQqegBSQ6zkkjLLKZTcPQ7YpJLrGts4ZUFhFCbq4pzQrM3VpSPbULVR9d/DFujcSSM+k+WP6H5l1RwSrFmyQoYZkcDTSGzyV+BVpujjV/IOZ5fbrOTUcp5RrCDvLtVw2C8SNsFxnAC5OjAhQdCJIMYphH/O0E/MZ/96+gqySS9+vqlBhdpiSvNNyEeQEcIorlyCZnlV9Dsqinz/LIhuw2FIisI/ew31XfV879dom5XDJo3HteFKEyDuspfb8TQfrbi0IS1RUdKiN3tAEJUcjdgPsq4p2aojUw3b7cPbSCzEbCr+dqPOqWSh69Q2OyLO3yCjoJXdl+vIE5OCP2R0BTVpjiep7D8PRYFWL4e5lrzMNAMIhxjoYCu10s//WzJdoSTiKmzEosLqmQi0rUbcuXxpKNO67ZTFisuIrlW+DG8INROU
X-Exchange-RoutingPolicyChecked: 
	SNkQdKdokPZCq52zIogpmDCbBVrrt93/ra2rhgj7Tfr34k0fShG3pWFFYIebU9MnC8T5zjnY2hX/rjW6tuFRT+Bdn2XWSxSCvnaiuwl8FiIf7BkSJfImglHE/9M/h0xlUZ5ekWEBjQ+RWYv6MV+Gwkn6jC0wUFGRi5ADI6ZBgRuhE2Br8TTfEaLUTjNURud85fiIrzpq19s8E3NVR84Abi5ORzGzFDWf/o4nTU14VHuV5AZhZ/4fXl6I8cM9UYzue17o2fjhgMBkGXkb+X1YFalqlb7hJY997OM/FQj5nDZMbIhosfo7lYYsADSMFntZOiiYAv+WljjevDKkEkbBpg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:33:24.8855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad37bf17-a1dd-4fd1-1c55-08def3c7ac6a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7039
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExMyBTYWx0ZWRfXxeHttUX4hHp5
 pt4EihGDan1iBNTLeJxTThoyJahTCMKHuRjBigWiNd0IPXcLeclaASDifyvxJw2R5UQttD3g6gF
 w7tNQzbDqrf1/lSqKQ8esN5QIKFltO0hT7SU6JgvgPVByHm+c8onZOhQZVnQfTEJ3zbnaqekFL3
 EYLRHRHHv3VgjujXzbYaJhQMLxTEtB6Y7AOAKah92aNxVrkqKAL5oDxG1Jho/er05CDuoL/gsAx
 +bY+385qlYvbqrWwNIJkXyZQyOgf7ov281DWy6jDyhxwj15nvQ+3aMRfWySkFF/J9HklID4IKJz
 k1vVx5nSwqR2k3xC5gHl4OpP9djo5m5tU5THrOR0TWtEi+DaIYqtGKbLkbntkSVEKAktHeWKnfs
 qG9n9h9BInjb36oYrIpO904WdLbnj3Cccxv4GRLrahxLdy3KWRl8Ai9GFD/0Ilke+g1FuE1sLMd
 FagO/VKGEHg9U0RmNJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExMyBTYWx0ZWRfXyNkpxWwJ4np5
 SV8ChPfapbhhIGFiCI9A2WoodBCLeofbwvSTcp+j9OYsZVzrEaG0z+XmTCB7qufKyc7FSXympOX
 prMKIkpgMwZR5W3K0yEEt3g30jrowl0=
X-Proofpoint-GUID: IXZJs6hK7AbRg7wEdEODUxWlQ5STC0o-
X-Proofpoint-ORIG-GUID: IXZJs6hK7AbRg7wEdEODUxWlQ5STC0o-
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a749b38 cx=c_pps
 a=+CNvbeBFiKBwJ3WcPfu9pA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=HafOKO1KdGzpByNQHfQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060113
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Aug 2026 14:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20222

meta-ti / na / 20260806141003.2776131-1-reatmon

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
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v2 1/3] kernel_legacyhs: Adapt to recent changes in oe-core
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 6 Aug 2026 09:10:01 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 007fea8d6326d61cbaa4584b8eee78cada204649

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202608052200
- Commit SHA: 4c9f7c49f524ac9572111231d52ce4cdda751a48

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




