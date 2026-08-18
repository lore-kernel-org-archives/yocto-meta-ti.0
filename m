Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EAFC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 14:36:22 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10164.1787063771935157747
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 07:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FcHDZ5I1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=xL1/fpXQ;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67IDu6Ro3746294;
	Tue, 18 Aug 2026 09:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=scpCL7SBs6WlvcjHzjL/ddQOpA+1sSMTc1LfaLXMJ
	sM=; b=FcHDZ5I1fje17PlsBR0t/HriB2sHI/Vmc9q+WMJaxuDE+/ZO73AYObBm6
	Pl3ri0BGW5hxKqj05VPnnnxPYq/rEIaJTAGjjBWKImtf7b6YaKvGF3UqM9R0OKvJ
	sCyrS81BFmZRcIbZmhX4zGF5h7eaVDg7+isO/39LIiOzU9iRntqBYjTWsgwWZ5ov
	Cd044K7DnEVum39bUdEQWRIVmavOH8w1LHeWRYvzFDykHRFBBGBipN2lNvyKGdzu
	XgIJNDt+jUwEi/QnEgzd6lza5VgD5e+AsLYKqatXIgQuACd115KPW8qQ+6pe2obz
	YYsg5LVFjK9xTInFUmb1v6Pz+77mQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010025.outbound.protection.outlook.com [52.101.193.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g40dm8ub9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 09:36:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBICV5FnSWtxh+HHcFfqJ5vztEEHarOZLgXne+Nm/IiDfN2CAbIEY37QIO52xNp5M6MpRsHxgGexLzOGGvaM7bYKRqkjILM4ntOO7plvCRXaO8P18hzELVpHqvhzWVAAJX7BJnVKKs+WQUXsveOLCFKM15x1ctrmL9pJmmXKMJ9py2IWwFNt9sYCNsZ6ghd3gDNkNWS7X+I+mZjfzGCHXAV8heNyO8S52Xw04Vl8S9GSM0ERO/vfGs55art1+0g2r7j2C9FupxRR0rPbR/ikNnnkMR2GiVcM1pvV8SK4C9r15VOc387fH94BnRplmoV086l+rFCN5UsMq/cO2ZsLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scpCL7SBs6WlvcjHzjL/ddQOpA+1sSMTc1LfaLXMJsM=;
 b=VN8A3AjuFph4HoBzoyqIFyKq/ho6ETgHHnS7XfGHLKUfhu5J9ckKzQ4uGjVDoMyZ+/XfeG1R8rPp2hvZSFGYjvCHBsPQejd5pad34+9MFlrWXsb3cheP8Q9F1w0lamWmWupcZfYt6n8yHaDbKEPHlrZwYCEX7lINphLp6ZBS1cRRvsOdbQuyKftpz/utgI/NK/OC0R0RObY37IXoyXUA9+m1Cpg/V5zOL3VmFirXVnUP3Bzw0Xpr4EQaorOSC82KTjUSZcm6ZMrp/gJ5VlbzXyGB4RlOLO4AKK6Bb+ftjZm9tywgy9TujjjIdtF2Qj6jhQVvDJEF9ptmyOHftvo2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scpCL7SBs6WlvcjHzjL/ddQOpA+1sSMTc1LfaLXMJsM=;
 b=xL1/fpXQQSFT5JTYco6oFTdpgLl4hFaCGA4Ike/Q6143JtU98VFL5LuEHYsb77JSbAoxvLUr07T7C95LcPDZ+gUIW0EXvWA2WLefb9y+KZDjvfc1XNu1H2xbzGjUC0RvgJeCoCZr8Wi5v+jbp79dnkJ+wSTfyVm0h/JQRm5Zb2LPn0wvBHWVLsOk/wBx+F8saF9U9jAjLl47/2uU6BctwTkjqTIon8nW0WSKbEvxb24hGhx1Mb986Yah7HNvPOaPIH8DftlnmacMWctr/1maT9nZEhCLe+G1pGtcdquvCqXjXfcPJPjr7zzEOscOZvK82HxeGeFQNaK5QjWz8DtZPg==
Received: from BN9PR03CA0322.namprd03.prod.outlook.com (2603:10b6:408:112::27)
 by PH7PR10MB6036.namprd10.prod.outlook.com (2603:10b6:510:1fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:36:05 +0000
Received: from BN5PEPF00046988.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::9e) by BN9PR03CA0322.outlook.office365.com
 (2603:10b6:408:112::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 14:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF00046988.mail.protection.outlook.com (10.167.245.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 14:36:02 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 09:35:59 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 09:35:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 09:35:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67IEZxGQ1602695;
	Tue, 18 Aug 2026 09:35:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3DBE99ACF4; Tue, 18 Aug 2026 09:35:59 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
Date: Tue, 18 Aug 2026 09:35:59 -0500
Message-ID: <20260818143559.3046554-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260818143043.3837065-1-reatmon@ti.com>
References: <20260818143043.3837065-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046988:EE_|PH7PR10MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 122e79ae-36fe-490c-1658-08defd360747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	XwSdkb0uT1CasYOe3hl3N9ixhiR6g036cNA+bGM496IQjuPJJLrIQ+ohJGjmXghLLAg/LaOPFTBG2MjSCS/+reAY4MeiviKjxiCxnjSTTAKrayBNxfugQj3FO9UoT32TRWDQPaQhL1R53He3ZuVbmhu/yBEIB3y+bKseMIGRRseAFQLuOMcHIQq+VTOOSyuNoa5m1+kmUhb5fuOiJqRfG191EQJVxMIzaSMOsLzRT4bvIodt1yFBff6z37t0YFR//lagTHPmVH6y/fl3Ifh/gTkD2t16/nYiomJilT8WwVDQXz7hIhLkJxBMIzGeKrtadThKwPCQPMRCV7GJhdpOdTEA2q/SxD65SJBIjAoAmu8rVHT5WjIXhq0+eaOz6A8jENkkHD61NGRpPgYD439etMfv8IXJr8XKF33BpEe6BRtJLeVJgSBNgY7Q2Ofyp5lWU18KakVoSbu3mWch71QpuQ6f2jSvMthQmNHSU4Ti6k6wdI2bejI/ol7BA0JcdJkI4Zr4qne9bn57rEDvz7MCch+c5ufTb0s6WMnyFJw5llPNL7I5EFL9N+tSAjqKljYQUkxamE5WR4n/utmO85udzPK0l2daXcpXE+qF7bVDom7B3CSUnsdMISBHuC53SYfVFQ2Dyo6GPV9pYayq9v9H7tQ1rDw9FD8uPjIdMLW1Gqhcd/gPM3yUg/W9Z+YeahoypPh1MEIrCIc9ibPUZIOUkA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VXkyRASX68rWoJQ0FMvSPBvF0CuOmC90dm1B7w5fxUT4qsDoq0i6hZQHIC0gL2xLOyY+BOZyvpqIqbCkR9hrzdFWNBJLOJlPS7sYR/Lrgvvq2FU97lVACk4uk/3r6+Qh0Udgfh9WmJEJYXv5M9hLb1/VUnDLsgn69q6ylQKVktKwg2Aa2/CeZfC+652uk4B5BdFiu8PQ3wEOtNlDivVN5eTLScYCx/0RJdQavxWyuR27wZJWqHJCe1Wx63xFLL3YHQtoQRh/4kG/DLdE24uCrrZxrAvPKm4Zootz7Vh8DHJcjHhmrClnE1rlGrFWo1O7kqxVS8MZcDd0imXXCxs4C4TYLb2O25T3Z6UDTFPg/K6x+onY18fQuhzpe/gDkiGJCRQhT6DcHHVTFvOxm85O0eFcK5/wwHonciPJFey9h6cztRnCdrW5qoidL/az2pTV
X-Exchange-RoutingPolicyChecked: 
	Yu6e3Dcpxev0xYCTUzDor2R1hS2tcskOA9vzXyqhOj0XFAYisJeN95jUUy6Mivdqzgj4t5vv3+VlXfDLPyMMo5WcPIRQ3jqS3aVkR5olqF2sioc14t0v9Z9YDhIX7UVfOLkgIjyDdh7EdQLxgwz2pRVuW2KEgJwAraW8OmPYq/EbWyHcy2AZFyayxXZotZ2cg3zg1U0EEEAeXGS9obPS3jyNCC3HBQOt1M517teYJ+5lshvehWMIZig8QC4ieQ09u0JxSECtVcPiqryEEtInzPdSWcSCEuchVc4uG4RI+NTK+2lwXHnyXWXuDlgE95OM7538INR71TUQ0fADKXI8cw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:36:02.4162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122e79ae-36fe-490c-1658-08defd360747
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN5PEPF00046988.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6036
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwNyBTYWx0ZWRfX+dHAX/piXkP3
 yVQB0ExX0FQP/ARoYvPUsib7HNlWPYmGAHO0Uhw3wYctrpHA7ye9Gaj5K67iaBmJbVx1a9bz25O
 1s4N+wfJ54ImTnHHNQpZvo1dQC1rWDEuvgGYx7i+hGQ7I3OGTEiEV0mNeZrEnNgW28VMoKKdWeR
 xmAwl4EpDgppJ3vuukbEJAznLdk6zovRLXi8VQqWrnVqOnTeWV8do+hrtSKQyH7IdkMNbVejolR
 qXhTFTNOWbIYBbp3dEOPHab1rEcnc5fom8D+hmGCl27K8cTsrdy3VBFy3KHUqyMctC7HL08Mub9
 rbTdaBzD0M4dVyXCAGN40YbMc5BYLy/q4tOktniDYHPNuBBx1Uztlooq81t69YaJPGmOSxW3qCL
 rW67pyHlwW2hqvlS0KhJmkwe5mK9WhS1koIuxM7PFZYUFIQmgho7oKx9Z5prLGhqmY3xrV7jyuJ
 VHr0wGCmaklRGT0QSUQ==
X-Authority-Analysis: v=2.4 cv=S8bpBosP c=1 sm=1 tr=0 ts=6a846dda cx=c_pps
 a=Uu/nqymW0mikAGBLwR5b8g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=p4bl7opKAB5pjhfuslIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwNyBTYWx0ZWRfX3MPD1mF7rbXo
 duBzV2cAI4Dx/IdGMsWD18SeAzPIxzByAHYcZV707/DPLoEV9kAlXX/pRW9PtYP8+cnxqEq4Hi+
 BtYb9TNqHr31GZ23VC7R4rj6HnR+4Xk=
X-Proofpoint-GUID: aHpouvRs-B0LtYQQVTrUHX0skWvVjymK
X-Proofpoint-ORIG-GUID: aHpouvRs-B0LtYQQVTrUHX0skWvVjymK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180107
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Aug 2026 14:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20274

meta-ti / na / 20260818143043.3837065-1-reatmon

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 18 Aug 2026 09:30:43 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1bfe5bfb9acc9a18b2b9fad7d53e3408b167fa32

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
- Commit SHA: 04d7c5ea453758fc3c0e764817de89549f936655

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




