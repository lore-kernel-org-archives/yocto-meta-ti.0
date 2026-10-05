Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA9FCA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 13:23:54 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19959.1791206624737584059
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 06:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qx8VS2PL;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NYp4PCgM;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695DLvNT062728;
	Mon, 5 Oct 2026 08:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jOnvexOEJbpsEiPJHggcVRREQ8KQ7kHtxOL+EXoKJ
	rs=; b=qx8VS2PLlCaFHMmeZ3Gkd1SmzHnEN1OsL+Vn+Ig0DvaXsaUgl33yYQozL
	+mNpJXuTVFBKN512YCnbpx8oVRDgGZIJPwnptu5Jw2E0EcFrIMp6quWpFLAXhMtG
	yZ1rpqqO8D+kAUyTM31LTTE4k7vMGLdDwNLaoWBcwPWVa0lrEsL1Fy93iycZpXOb
	Vvq9prUROkycowa9axND7bMTQ8VpNe+QclTGcfn1qKzbBVRVsoBII08FNn/SuU7i
	ll9K+6PQC9Uc820GDcL8IeftXjjtWpLgo7r+9qcnMoaXjfOhW0p9/MDOoO2JJH+0
	Uhl42nsTvl2LFLzRtxXiACr6n/wTg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012068.outbound.protection.outlook.com [40.107.200.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h3h335nvj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 08:23:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2XiWzX46wjrbuZyLCa3FO51tfw8+/3JRd09IuBIPskoH2iZL1je2H+NHfGQHR3Iyj4m3REZ6RmMZvq+0VuotbBOCsaRtmHWvOI4CBOUQbE+orOnZ5LxJwOzkjg/CWrhIRwJ5vBiYXHlE+ZlQXY4ikHtFHsp/EzMn2/j5k9Goxd6kCgIuHhnSTB84RYQ1jAT1ckUl3sSmuAeS9IU13VW8FKo3mVYuJKijXXgsCvmi/N0ltFx2C3Lwon9qq6QkyYc4F+9hOLVjo+1E+jckWkt6W5Xd1vcMPtP7e4/YcbWow6i2dMBnaNLEViVcW1xTen5hX9caae9Cq/qD5MGAyg4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOnvexOEJbpsEiPJHggcVRREQ8KQ7kHtxOL+EXoKJrs=;
 b=pjivLoNZ7XM4dl8K2eDq0IFt7dXXlrA71P/ZKibusvvL/GzE5HnJ6arKvA3lCbRn6DZcgNjlYWhjs7zoOaWnznrgjo30Vb1y7bbfmWOr8mZfrGv5FNVK0pkD1gDCxG4lEcfB4kSHAQK0mPCCiHbhCofRxlFArgjmK7tuvXLO76Kz39KkpI3Z0JXMtDMkZp+Ir7MGA6OiUG/sCORY3ZJa+0vRTcvuTd6Ay1VsTF2hXKk4SS8bZ7R7wbtusjWXe431iyAkmE/GfjqUZ9LBFqQzN8+Kfgm6v61Utr8eUNudHLuuEK6WaW9sEwJJ1D/AOdVbFlwfZRd4+b1HbOXemYFV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOnvexOEJbpsEiPJHggcVRREQ8KQ7kHtxOL+EXoKJrs=;
 b=NYp4PCgMOviYYNmbitZmFPqrc33PdA/17JldJQzR8NqbaJyQqKWPqzZWRk8P0XdcoY+gAzh7y7hftfm50rYd8lWRIL2Qx3+DBiqMufpTCK1A1NGUnMq+AG5IMmkNL7YvzfLphoPbY/zNTDJwFxb/pFXpDk6QwH5xNipiqqxYtDulo00RollC2jgLDTQpm7AdwZJ8XpBeoPl9G8RWvQ6sL4GffnoVlxvF1nigL9ghymX8UY2RKsyHbFxKmNnhe3ODYmk/Q9J2qz5GugS/4IkzWgaHMqYOhtZqBd2j1J9PjwjWSfp80HrDm78LZJd2/3ILKamq+L1/yTLjvTX/jaQrQg==
Received: from SJ2PR07CA0014.namprd07.prod.outlook.com (2603:10b6:a03:505::7)
 by SJ2PR10MB6962.namprd10.prod.outlook.com (2603:10b6:a03:4d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 13:23:39 +0000
Received: from MW1PEPF00018894.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::3b) by SJ2PR07CA0014.outlook.office365.com
 (2603:10b6:a03:505::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:23:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF00018894.mail.protection.outlook.com (10.167.249.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 13:23:38 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 08:23:10 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 08:23:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 08:23:10 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695DNA9w250166;
	Mon, 5 Oct 2026 08:23:10 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1E8519ACF4; Mon,  5 Oct 2026 08:23:10 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] k3r5: Fix mc:k3r5:libgcc build error
Date: Mon, 5 Oct 2026 08:23:10 -0500
Message-ID: <20261005132310.3069110-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261005130234.1532926-1-reatmon@ti.com>
References: <20261005130234.1532926-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018894:EE_|SJ2PR10MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0ddbab-b61d-4dd6-64a9-08df22e3de04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	IUD5rNcq+r5Nx3JcX+KxgeRdoMWI1gczz2hK1b22B8TJGMg76ACUljBD+QBkErIE26BswmcZQ/cA/b3egqnWzGgHHPrwYF9cM2VUpRG5wYSnSC3qiJRUfcKiBSDLfVEI8MwBm9MysXpw7PFtKuKqA6oBk8TsLWyUDR6MZbMGMJqchpj7DVuoM4cWYmu62B4a/bQ0B3Ic+27iV2z3t0xvt7ZAD6EcnE1bQUJbixKj5E9TO8/pW6Tlz06zkB23UVyXhbSUPQKOe/BVMvwcaoJ1srBHLQG/QX9fIgWFwIXrH1+vA2BTB5WZcoETH5QpA/D7XnV6RqGXkqhfxNd6yAtYy4e5JUDZ8EVEKSQP9cUcSmkgUZx/gkmuhxF7OcDJm2FcgI7O0IBRPAtO9WXMSTc/coA4jYFmoEfsYfStGRLyiPSFyHaxHMYKPKrqxjhxXQDzKDFAWs3n3ZZdgE3UMPpzRU7+FcaOsnYLSRdwD/YsxjMrWxDsneBoJax57L3FYLzXACMaShpDYGqjwPyjDhACpAC8M7UX9U26IyfmmcxyPP35Lr8hh4B6D85gT5QuC4Yp4ODC6jxufqIxRDxkIzmSPyrR4+sKO9WTCw8BXumgG8HRKx182gbGrpSBHeKgJDSeqx7+8BKs419WMcBPwrI/o6ZSFepkSc8DonKo9wmtje8yG6U8F9C3+NwXGXdnoxWL
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	X+Y1l08YvMVdaUVf+vhuPtyRNldSNErFEsDrfudv9jf+RXdbcIZG48n1pVP0qr6k060yEF1QejqUCSfvDZmT+bYqEN+MSxq8LHA48k9BgJSqZ7lz6LqWp9WfM2zhNC7VwgCAll8snUGf7dgusVp65c8yAbqjLBbV9zN999hTwoskkuO81R8cBhqFH+XwnjM3FsOiI/PNDNcw7efoNjX2y3f1vSZVJQ+DxJ+Xthy0gYrfp1lmrNJgYsGhjoSMc3RjPJKB/A3sySODIr+6RenFI7KAR1FwUWu0oZp/kXC/NDDtNQR5oUmA3abQ7taW/HvtDonvZOjZ3HZXNvxqIKBSZO0+scSQ3hLx7OAiR+hVKrCx4YrmCiFas88vXqvCqEuSzPpfZFsw0ZZgVZh9+62sLzHVWQ+6EwXhzgEB/HVkJTzSRa5sfLAU25zTF4j/0FRo
X-Exchange-RoutingPolicyChecked: 
	W3pZ4MBCSUrUOJrKGh3FrkP/7OxbapPMJdhfmWqkD76/eCIeNGixIFKm+xyRady24V14bCPXGTUAKbeyEYj7vaPX2WNDT4FaQ6s5FaltcqCaDdeB8eW6KAa1qhVGYdbOuq4N+7UapBhI8HJTdDU8eIgPpXcCXejNV14iPptEsAlMNgWJOEV0GFdkoIIWwPBpvItLriOJOhuTt1s1JZrodDypntZHAlhSA/lUFJr/3gL6ar7CJv0Ty7EQxUctqJUNchR+QZwPYDLDZDT1w1bSdJx3Nmu0+cNbgDxRZ6v1P5gPgnB0Xyfwxyf0ML6JKPyoOtWdcOrtM70arJ+vIQqnAg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:23:38.6377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0ddbab-b61d-4dd6-64a9-08df22e3de04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00018894.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6962
X-Proofpoint-ORIG-GUID: YQaMPJlkD__P8K-n8TsBhzbeP22wika7
X-Proofpoint-GUID: YQaMPJlkD__P8K-n8TsBhzbeP22wika7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX5FAEqkniOtSF
 vdgo4H9gRjOSKcJ7oTbCgT++FSLh8ruifZztW4uCajOvE1p9hIwV65odZyzSNZB9upEVo7IzecM
 2aIiAoN8BIXudtp7bYtHSCMFIq5nGL8=
X-Authority-Analysis: v=2.4 cv=QJX91QLL c=1 sm=1 tr=0 ts=6ac3a4de cx=c_pps
 a=hdF+edV3qND9tYm1xB2jJw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=0FU90VRCsbXza-vuh-kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX98OVcxPa/Ber
 ibBA7iSg28IE4OVP1V5A+lwQJhA/V5s5qh7oVFmKZe/qZd8TyznonoZ62J0M77kTENRapWX1tGR
 vVwq0LAQ+HUeDPPCTMTULNlF74l9TJeD7qJoZPkPd38CEYoWHFw9zNAwsEkk0Asv7xRpwBpKiF/
 OQyGZ7rEXF8B/njSrrokJ5K2iA0UQoI12gjI0Gafcz8LgtaE6KBqQhCeiR4DTj7L0efcd46tSz8
 l8XUg1MVVYDRjIMd1AFxwlpz5ozo7hYRpqKFA32iemxYJqZdlDlMIQYoohuf8w4WmEv+qfT1vzx
 lWffQYNRbP1x4NNw314zXkCOpg0hClu8l3ZLkelxI0L5C/UyLUZC7gQ5CltMoaoYOzH07m5YS7n
 3rR/Ph8opgCIz9pu0gFYW6G9Aa3vApLb6mIjD6d97zNxT0JmeOK9bHWMSLL6xnthuN+3MZWIJbn
 cDX8Av54mfzbhcKbGtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050051
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Oct 2026 13:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20437

meta-ti / na / 20261005130234.1532926-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] k3r5: Fix mc:k3r5:libgcc build error
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 5 Oct 2026 08:02:34 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b049c1d4ffbc5d85309ae9615aa70cf03c24fe2d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: k3r5: Fix mc:k3r5:libgcc build error
- Commit SHA: e0b9f6aae7faa10d313f6b20b68b4ba8626bddf7

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




