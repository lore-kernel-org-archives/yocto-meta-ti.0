Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B59DC79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:59:08 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3446.1789001946373812632
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HniELTbw;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GanY8WQQ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689M9um11486142;
	Wed, 9 Sep 2026 19:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=59mF0vbouEoSoR5rmw83SkUcM9OtxHGZ2DFK/g4HT
	lc=; b=HniELTbw0X0BXbPTjWKcBP3AASsbW/Y1T2ZPtbilsGshISHhgdJG06M7f
	KSA1oTeR6wnnbysTwCxi9lmxYc8MlqA7DTR4al0ph7TkPhTj6/EPc67PfEZ5sbLa
	X040dgXILhwD66buC3OPBWzG+Hj7ihnb1CbPFdrd368289GS2Z08VsD7758esngo
	R/OIIBminGQJ+px8pCvJ44OZd+mYdcXdV6DuBcDR8By26eTAyGt4ATcBN32GVGJd
	PVazJJSQMk2InQZTc4TRu3iHbU5J1fCvlDNW3wPonpkjySXdT3qUZRvJm1/KYW8U
	sISd40tP8lHPW0Dw+F4Ol09/L/J7A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxesyqw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:59:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIQQbwbFiZmmD7cF0Wcpqy3J2XE8Q4fJWo/Kbyvc6d4MxR1hbMaIvEr7Jjd/rMp+VjUVTMEsKk9i8EW82cxHSUJKB7QXHqoTnWapIF4TPPxMze0Q/Gc8ir/L32FAAoDt5kKtr5HfzqfOf9RdCKY6GUxL9QmZ6rAWSFRBLyjzheFFI2qXWStua9aR5Gg1DJML+Z9lesda6HV2qXXqFG6qQDSiopSeOjUUVfXjxlSs0vvg3x3UPDzIPV2VlkqqC1H43M6XhtZgmlZfwYgnInzmAGJVmjFrhJ4R0KtKazYloeQYDFhCJmXct/0aCR9CKBrGkFbDocpPffeyZ1ze0SkICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59mF0vbouEoSoR5rmw83SkUcM9OtxHGZ2DFK/g4HTlc=;
 b=Gj7Y59721//50XCmnv1kzkIF9EdFR5cqKG2wFfApiYfuCZF0uvB96yAEIoGEMPfdBoYHi+ElbMNVUFaRcOj2I9ukA8mBQJega7tz0TM4i8zKp+iIrN2eCU3OkI9xhTTMotdhposjTAoZuAfeexTc5wm/dMOGga21+z7qGW5/VWud5mRZ25u90tVmje1pRYjq48rvQWrqlrT9ZVyTOcvWHrrvY1usIhcSZdMljNaxlMFPYHgaBR6cdD60bv0KkLblyzaOAAH9C2Ej/QJJiPzPise+lHZ2keMm8ChgPDYvZsPqsLEi7t9hvGeRZpFcPqvWUJ1LQsArjqUAmHVRfvtUjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59mF0vbouEoSoR5rmw83SkUcM9OtxHGZ2DFK/g4HTlc=;
 b=GanY8WQQLK2Zvu9HoBJsoJfOR4mnSY5oaS14y4idEODrtThQtK4GRVu4J3i1NEd4XRbQVd6A9a6xFpENIWyie7UQMv1FZxnyLOLN3Z/ahJRsq0xcFCX/ZEvo/jR5h/M57pPoudKy9OMxz+LY18kFCTMy3gsFH9k4pZvJ7QwYFyU=
Received: from SJ0PR03CA0182.namprd03.prod.outlook.com (2603:10b6:a03:2ef::7)
 by BN0PR10MB5046.namprd10.prod.outlook.com (2603:10b6:408:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 00:58:58 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::95) by SJ0PR03CA0182.outlook.office365.com
 (2603:10b6:a03:2ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 00:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:58:57 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wMsv2306721;
	Wed, 9 Sep 2026 19:58:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7O-0000000GEwm-0dTB;
	Wed, 09 Sep 2026 19:58:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 4/5] libclc: Rollback to 22.1.8
Date: Wed, 9 Sep 2026 19:58:19 -0500
Message-ID: <20260910005822.3867633-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910005822.3867633-1-reatmon@ti.com>
References: <20260910005822.3867633-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|BN0PR10MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f19c5fd-3217-4426-c847-08df0ed6b16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|29003799003|20046099003|5123799003|10063799003|12006099003|25016099003|21026099003|22082099003|18002099003|56012099006|13003099007|3023799007|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info: 
	xF7TiN5oCKF6olaaOIk+1+au9hK7tXjW3tWyZA/CzDnQ3foQNU5k9oh/CgddgsSZ2mxav2IAHXK1LJsEylJqkwYRGOQPPif8bNbgIghpKYJMdxQLZE58SzPBHlt7sU90fnHWF0LoseeN1WTtuqGBmr4Q53GOso47VjsbT7qmBz/+ed8T0QzlF8D7zWvOr9dxoQKhzHhpaOQiCOsYHlhkfvP3roVvZt8BZep9Nw2MzedzqsS59rbY7r6FxA5feMA7xfC6cZ9T3TsyZnDkilnfG531ggDMTKw84PGntgnqeQWZn3SS6TV5Yg+TmJnxH8F/4fM1unwCeLD/uKm7WA41wmH17iGLOfxYAd3rgsCYu5pxPk0stE6sjQJhMoXUR6Vr84+n2ri1XiZcRf8e8NILGEndBIdbziW+rmClXTd9HYbOxEXHMvw9FRahsIU5/0HBk5J/s5BKXSUcR/UHk1qGo0bQ3pFhdU9vroxDNDiQweByGKVjgtNaWappVSQOyqoESC4UJeACmi2ph+a3GytDpuzd9dgYg9J+yvUXoiw2lYr33lpdJN89/rR1UUkEkom8UOe4uU4pwP2nEm3lVqR7umfwQ+h6v+II+JVpALJaULSWuS8Uj6KMC0hnjw7cNh8NZNVtJ07fc+ISq5JPx8YUeA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(29003799003)(20046099003)(5123799003)(10063799003)(12006099003)(25016099003)(21026099003)(22082099003)(18002099003)(56012099006)(13003099007)(3023799007)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0yn5q8dVA3RDn2LopgOtb/mTsEpBtkZLQLz3Rk3CCyxnlwwMkI6sX6lBvSOC67+K1OtgJCmghUxXOJ5YHG3HwVl5Da5miRVXg5kCfY4Q85BnkVjTonUdR835mvCy85xbiEysnOhB5eBpZ1gyZywmD70eyi/Fe3Vupif6n2ymrDIxH/VgpGsBFpVG7T9V87BE7FqCYXw7KrKbaS65RhzpAFQb8Umte/KzJUW/Yjnq/S4YWIxv/6Jc/krwWJgilHzplnmb3FzJPXBbxS54vveFRR1VsMt+FLxg1aRNJAvJlvt2gCn9hKBFzG7ggsgkkv2vrdeTfZFxPLZPX4A0t3+hjy2mta0ffc5UZwy9StfwsKLFZAYEicbB+PnSr5HIGsNGdwaoQbLaXiKgg59NK3hi0Tbd918bYHtx4EWkyej5j41Y7s4v7xWe8bM37yChmEYN
X-Exchange-RoutingPolicyChecked: 
	S2D1LhCEGPW0kFSPfAyQprh74WYL09aNUdt99c2I2kMkUhLDrEZkxcuoCtRb7tHdVln3AnGcHKcxdyniO7eko7L2re2SE5GKE8HSrQ0THgkwVtbHOkZ9qCYsUOFQlhfiKDa1JvR+WlW2oWy8m6EwG5VV8IYj85Y7iTtpdTipSmOjbU/zNj1/BeZMNydKj0hcEeyN2jrf1GR63WRbhPemE39h4K4DUO3tOGF33wxN9uGvXFHzN5SYMcjq9Yj5me47l7pPzbmcOMSIRiAEPf6GmWwHY+PVrt8cT+Q1aXp9gL9wq0dOdUXNP++sJpcFLnKw27ZlHmyFh/sA8SV/8slxMA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:58:57.0931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f19c5fd-3217-4426-c847-08df0ed6b16c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5046
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfXy0eLFZKBU5Mh
 G1Q+B6mziJk4kjAg2rUnyZx/FW++RRlGinn2CjCldboc01qZNEHuG0TRxbdWePxARW8dxZwZS9z
 7mu6Xo4oym9/7Vo5cagAN4n9tKlh3Fs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX2d8u2Tbo0tnb
 8QfVO9dQsvaQ0zlD+Z662QQvnIMjErGJoj5l1N+R7iNBnQBbHBw55C1Wz0SE3oZTXa2maeLcjDn
 8Zu2x1LE1laQK4ZDX37LwqdOgu/CT0LKaBfgWIZWScPUuWBOhPGgXxbibhQGPuR+wY1gIf7DqsP
 Q6sUByRmxHWnBJ7608sQIH3c82jwt9udqekVQdm+MMhEvEEMC3oXls++xP53zvFC6wbaRG++5Eb
 fvMFSvIE5BJSMIfJn3GUOwnF20zphSjF+cqhdtPNhPiyB6IkRAACdiaQv28l5mXeya+nyRSDBtl
 5HNhNFoForXfoWrEOJ7Zbsv8bNOPYduW7DKishioWiLXBdpFw7iTjRNYcf6Am8MHXWPwRqn7trC
 PN9xWlg8IxtY9BUm/8i/kB30X6WERPk5sm6lCuLQfZvqGcWNIu1iz1MxS7J7VE7QEAra08aOmPM
 bPRVHA6f9y+RSNajg0g==
X-Proofpoint-GUID: BgXEhn0kFfZNs7JNc8s9hgNaM4Wki4v_
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa200d8 cx=c_pps
 a=gX39by8dV5dKUPXqjYrUqQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=LpQP-O61AAAA:8 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=IvTj1HvjAAAA:8 a=gWDa-L1wAAAA:8
 a=t7CeM3EgAAAA:8 a=AUd_NHdVAAAA:8 a=P-IC7800AAAA:8 a=6R7veym_AAAA:8
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=57SyGIRnAAAA:8 a=Sspos6EWAAAA:8
 a=lbWr6ZcfdMXQSN-EV4IA:9 a=mWSXxzd7o4STzCXg:21 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=pioyyrs4ZptJ924tMmac:22 a=-74SuR6ZdpOK_LpdRCUo:22
 a=kmyLcwvAnC_t3PsnBtKb:22 a=vg_HiZM2M4GgzivzK9OA:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=ILCOIF4F_8SzUMnO7jNM:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=gVaf0qAd5Psv6m3K4XZ_:22
X-Proofpoint-ORIG-GUID: BgXEhn0kFfZNs7JNc8s9hgNaM4Wki4v_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:59:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20353

Given that we are only including libclc for our mesa-pvr recipes, we
need to lock down the version to a known working version to avoid the
llvm version changes from causing build failures.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |  60 ++++
 ...-support-a-new-embedded-linux-target.patch | 309 ++++++++++++++++++
 ...lify-cross-compilation.-Don-t-use-na.patch |  44 +++
 ...-env-override-of-exe-and-libdir-path.patch |  71 ++++
 ...g-driver-Check-sysroot-for-ldso-path.patch |  78 +++++
 ...tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
 ...07-clang-Prepend-trailing-to-sysroot.patch |  39 +++
 ...efine-releative-gcc-installation-dir.patch | 123 +++++++
 ...ad-and-ldl-along-with-lunwind-for-st.patch |  35 ++
 ...1-Check-for-atomic-double-intrinsics.patch |  34 ++
 ...gure-for-packages-using-find_package.patch | 118 +++++++
 ...ce-dir-location-for-cross-toolchains.patch |  51 +++
 ...-dyld-prefix-when-checking-sysroot-f.patch |  79 +++++
 ...-clang-Use-python3-in-python-scripts.patch |  35 ++
 ...t-anchor-for-adding-OE-distro-vendor.patch | 184 +++++++++++
 ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  68 ++++
 ...iple-for-non-debian-multiarch-linux-.patch |  29 ++
 ...libunwind-Added-unw_backtrace-method.patch |  56 ++++
 ...0020-lldb-Link-with-libatomic-on-x86.patch |  33 ++
 ...ompiler-rt-Enable-__int128-for-ppc32.patch |  70 ++++
 ...ot-use-cmake-infra-to-detect-libzstd.patch |  62 ++++
 ...t-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 +++
 ....cpp-ARMLibDirs-search-also-in-lib32.patch |  81 +++++
 ...d-OE-specific-ABI-triple-for-N32-ABI.patch |  78 +++++
 ...unwind.pc.in-and-llvm-config-scripts.patch |  54 +++
 ...spect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  89 +++++
 ...Do-not-pass-target-to-clang-compiler.patch |  29 ++
 ...r-sort-ClassInfo-lists-by-name-as-we.patch |  31 ++
 ...ove-LLVM_LDFLAGS-from-ldflags-output.patch |  32 ++
 ...ude-sync_fetch_and_-for-any-pre-ARMv.patch |  64 ++++
 ...code-uptr-sptr-typedefs-on-Mips-Linu.patch |  35 ++
 ...p-headers-in-the-debug-info-when-bui.patch |  36 ++
 ...ng-block-when-searching-for-noreturn.patch |  41 +++
 ...M_HAVE_OPT_VIEWER_MODULES-externally.patch |  27 ++
 ...-clang-tblgen-if-it-is-actually-need.patch |  32 ++
 ...symlink-path-for-libcc-when-LLVM_ENA.patch |  71 ++++
 ...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 ++++++++++++++++
 ...e-__gnu_unwind_frame-in-cxa_personal.patch |  33 ++
 ...fix-sysroot-based-compiler-rt-search.patch | 105 ++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
 ...te-exit-fold-candidates-in-determini.patch |  71 ++++
 .../recipes-graphics/mesa/libclc_22.1.8.bb    | 149 +++++++++
 .../recipes-graphics/mesa/libclc_git.bb       |  27 --
 43 files changed, 3062 insertions(+), 27 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0001-li=
bcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0002-co=
mpiler-rt-support-a-new-embedded-linux-target.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0003-co=
mpiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0004-ll=
vm-allow-env-override-of-exe-and-libdir-path.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0005-cl=
ang-driver-Check-sysroot-for-ldso-path.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0006-cl=
ang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0007-cl=
ang-Prepend-trailing-to-sysroot.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0009-cl=
ang-Define-releative-gcc-installation-dir.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0010-cl=
ang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0011-Ch=
eck-for-atomic-double-intrinsics.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0012-cm=
ake-Fix-configure-for-packages-using-find_package.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0013-cl=
ang-Fix-resource-dir-location-for-cross-toolchains.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0014-cl=
ang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0015-cl=
ang-Use-python3-in-python-scripts.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0016-ll=
vm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0017-co=
mpiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0018-cl=
ang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0019-li=
bunwind-Added-unw_backtrace-method.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0020-ll=
db-Link-with-libatomic-on-x86.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0021-co=
mpiler-rt-Enable-__int128-for-ppc32.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0022-ll=
vm-Do-not-use-cmake-infra-to-detect-libzstd.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0023-co=
mpiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0024-To=
olChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0025-cl=
ang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0026-ll=
vm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0027-sc=
an-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0028-co=
mpiler-rt-Do-not-pass-target-to-clang-compiler.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0029-As=
mMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0030-ll=
vm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0031-co=
mpiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0032-co=
mpiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0034-Re=
vert-libc-Remap-headers-in-the-debug-info-when-bui.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0035-Pr=
event-revisiting-block-when-searching-for-noreturn.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0036-Do=
n-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0037-cl=
ang-Only-build-clang-tblgen-if-it-is-actually-need.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0038-ll=
vm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0039-Re=
name-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0040-li=
bcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0041-Co=
nsolidate-and-fix-sysroot-based-compiler-rt-search.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0042-gu=
ard-clang-tools-extra-test.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0043-Lo=
opUnroll-Iterate-exit-fold-candidates-in-determini.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb

diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0001-libcxxabi=
-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXA=
BI_LIBU.patch
new file mode 100644
index 00000000..43221274
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0001-libcxxabi-Find-l=
ibunwind-headers-when-LIBCXXABI_LIBU.patch
@@ -0,0 +1,60 @@
+From 97247b6a1df63a5f930d090a3952876eb67cf6fb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Aug 2017 10:37:49 -0700
+Subject: [PATCH] libcxxabi: Find libunwind headers when
+ LIBCXXABI_LIBUNWIND_INCLUDES is set
+
+Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake arguments
+then it ends up not searching the specified dir and unwind.h is not found
+especially for ARM targets
+
+This patch makes the searching synthesized directories and then set
+LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcxxabi/CMakeLists.txt | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
+index 2b67c5972339..45d84b404b30 100644
+--- a/libcxxabi/CMakeLists.txt
++++ b/libcxxabi/CMakeLists.txt
+@@ -476,7 +476,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PA=
TH}" CACHE PATH
+     "Specify path to libunwind source." FORCE)
+=20
+ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
+-  find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h
++  find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h
+     PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
+           ${LIBCXXABI_LIBUNWIND_PATH}/include
+           ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
+@@ -487,18 +487,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH =
MATCHES ARM)
+     NO_CMAKE_FIND_ROOT_PATH
+   )
+=20
+-  if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL "LIBCXXABI_LIBUNWIND=
_INCLUDES_INTERNAL-NOTFOUND")
+-    set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL "")
++  if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL "LIBCXXABI_LIBUNWIND_INCLUDES=
-NOTFOUND")
++    set(LIBCXXABI_LIBUNWIND_INCLUDES "")
+   endif()
+ endif()
+=20
+-if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}" STREQUAL "")
+-  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}")
++if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES}" STREQUAL "")
++  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES}")
+ endif()
+=20
+ add_custom_target(cxxabi-test-depends
+   COMMENT "Build dependencies required to run the libc++abi test suite.")
+=20
++set(LIBCXXABI_LIBUNWIND_INCLUDES "${LIBCXXABI_LIBUNWIND_INCLUDES}" CACHE =
PATH
++    "Specify path to libunwind includes." FORCE)
++set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
++    "Specify path to libunwind source." FORCE)
++
+ # Add source code. This also contains all of the logic for deciding linke=
r flags
+ # soname, etc...
+ add_subdirectory(include)
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0002-compiler-=
rt-support-a-new-embedded-linux-target.patch b/meta-ti-bsp/recipes-graphics=
/mesa/libclc-22.1.8/0002-compiler-rt-support-a-new-embedded-linux-target.pa=
tch
new file mode 100644
index 00000000..5dcad6b0
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0002-compiler-rt-supp=
ort-a-new-embedded-linux-target.patch
@@ -0,0 +1,309 @@
+From eae63772aacba29de729d9af5c52542cd8a043ee Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Apr 2015 15:16:23 -0700
+Subject: [PATCH] compiler-rt: support a new embedded linux target
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../make/platform/clang_linux_embedded.mk     | 286 ++++++++++++++++++
+ .../clang_linux_embedded_test_input.c         |   0
+ 2 files changed, 286 insertions(+)
+ create mode 100644 compiler-rt/make/platform/clang_linux_embedded.mk
+ create mode 100644 compiler-rt/make/platform/clang_linux_embedded_test_in=
put.c
+
+diff --git a/compiler-rt/make/platform/clang_linux_embedded.mk b/compiler-=
rt/make/platform/clang_linux_embedded.mk
+new file mode 100644
+index 000000000000..d0a890075a1c
+--- /dev/null
++++ b/compiler-rt/make/platform/clang_linux_embedded.mk
+@@ -0,0 +1,286 @@
++# These are the functions which clang needs when it is targeting a previo=
us
++# version of the OS. The issue is that the backend may use functions whic=
h were
++# not present in the libgcc that shipped on the platform. In such cases, =
we link
++# with a version of the library which contains private_extern definitions=
 of all
++# the extra functions which might be referenced.
++
++Description :=3D Static runtime libraries for embedded clang/Linux
++
++# A function that ensures we don't try to build for architectures that we
++# don't have working toolchains for.
++CheckArches =3D \
++  $(shell \
++    result=3D""; \
++    for arch in $(1); do \
++      if $(CC) -arch $$arch -c \
++	  -integrated-as \
++	  $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.c \
++	  -o /dev/null > /dev/null 2> /dev/null; then \
++        result=3D"$$result$$arch "; \
++      else \
++	printf 1>&2 \
++	  "warning: clang_linux_embedded.mk: dropping arch '$$arch' from lib '$(=
2)'\n"; \
++      fi; \
++    done; \
++    echo $$result)
++
++XCRun =3D \
++  $(shell \
++    result=3D`xcrun -find $(1) 2> /dev/null`; \
++    if [ "$$?" !=3D "0" ]; then result=3D$(1); fi; \
++    echo $$result)
++
++###
++
++CC       :=3D $(call XCRun,clang)
++AR       :=3D $(call XCRun,ar)
++RANLIB   :=3D $(call XCRun,ranlib)
++STRIP    :=3D $(call XCRun,strip)
++LIPO     :=3D $(call XCRun,lipo)
++DSYMUTIL :=3D $(call XCRun,dsymutil)
++Configs :=3D
++UniversalArchs :=3D
++
++# Soft-float version of the runtime. No floating-point instructions will =
be used
++# and the ABI (out of necessity) passes floating values in normal registe=
rs:
++# non-VFP variant of the AAPCS.
++UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7em arm=
v7,soft_static)
++Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)
++
++# Hard-float version of the runtime. On ARM VFP instructions and register=
s are
++# allowed, and floating point values get passed in them. VFP variant of t=
he
++# AAPCS.
++UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i386 x86=
_64,hard_static)
++Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)
++
++UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7em arm=
v7,soft_pic)
++Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)
++
++UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386 x86_64=
,hard_pic)
++Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)
++
++CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding
++
++PIC_CFLAGS :=3D -fPIC
++STATIC_CFLAGS :=3D -static
++
++CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft
++CFLAGS_HARD :=3D -mfloat-abi=3Dhard
++
++CFLAGS_I386  :=3D -march=3Dpentium
++
++CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)
++CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)
++CFLAGS.soft_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)
++CFLAGS.hard_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)
++
++CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)
++CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)
++CFLAGS.soft_pic.armv7    :=3D $(CFLAGS.soft_pic) $(CFLAGS_ARMV7)
++CFLAGS.hard_pic.armv7    :=3D $(CFLAGS.hard_pic) $(CFLAGS_ARMV7)
++
++# x86 platforms ignore -mfloat-abi options and complain about doing so. D=
espite
++# this they're hard-float.
++CFLAGS.hard_static.i386   :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_I386)
++CFLAGS.hard_pic.i386      :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_I386)
++CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)
++CFLAGS.hard_pic.x86_64    :=3D $(CFLAGS) $(PIC_CFLAGS)
++
++# Functions not wanted:
++#   + eprintf is obsolete anyway
++#   + *vfp: designed for Thumb1 CPUs with VFPv2
++
++COMMON_FUNCTIONS :=3D \
++	absvdi2 \
++	absvsi2 \
++	addvdi3 \
++	addvsi3 \
++	ashldi3 \
++	ashrdi3 \
++	bswapdi2 \
++	bswapsi2 \
++	clzdi2 \
++	clzsi2 \
++	cmpdi2 \
++	ctzdi2 \
++	ctzsi2 \
++	divdc3 \
++	divdi3 \
++	divsc3 \
++	divmodsi4 \
++	udivmodsi4 \
++	do_global_dtors \
++	ffsdi2 \
++	fixdfdi \
++	fixsfdi \
++	fixunsdfdi \
++	fixunsdfsi \
++	fixunssfdi \
++	fixunssfsi \
++	floatdidf \
++	floatdisf \
++	floatundidf \
++	floatundisf \
++	gcc_bcmp \
++	lshrdi3 \
++	moddi3 \
++	muldc3 \
++	muldi3 \
++	mulsc3 \
++	mulvdi3 \
++	mulvsi3 \
++	negdi2 \
++	negvdi2 \
++	negvsi2 \
++	paritydi2 \
++	paritysi2 \
++	popcountdi2 \
++	popcountsi2 \
++	powidf2 \
++	powisf2 \
++	subvdi3 \
++	subvsi3 \
++	ucmpdi2 \
++	udiv_w_sdiv \
++	udivdi3 \
++	udivmoddi4 \
++	umoddi3 \
++	adddf3 \
++	addsf3 \
++	cmpdf2 \
++	cmpsf2 \
++	div0 \
++	divdf3 \
++	divsf3 \
++	divsi3 \
++	extendsfdf2 \
++	ffssi2 \
++	fixdfsi \
++	fixsfsi \
++	floatsidf \
++	floatsisf \
++	floatunsidf \
++	floatunsisf \
++	comparedf2 \
++	comparesf2 \
++	modsi3 \
++	muldf3 \
++	mulsf3 \
++	negdf2 \
++	negsf2 \
++	subdf3 \
++	subsf3 \
++	truncdfsf2 \
++	udivsi3 \
++	umodsi3 \
++	unorddf2 \
++	unordsf2
++
++ARM_FUNCTIONS :=3D \
++	aeabi_cdcmpeq \
++	aeabi_cdrcmple \
++	aeabi_cfcmpeq \
++	aeabi_cfrcmple \
++	aeabi_dcmpeq \
++	aeabi_dcmpge \
++	aeabi_dcmpgt \
++	aeabi_dcmple \
++	aeabi_dcmplt \
++	aeabi_drsub \
++	aeabi_fcmpeq \
++	aeabi_fcmpge \
++	aeabi_fcmpgt \
++	aeabi_fcmple \
++	aeabi_fcmplt \
++	aeabi_frsub \
++	aeabi_idivmod \
++	aeabi_uidivmod \
++
++# ARM Assembly implementation which requires Thumb2 (i.e. won't work on v=
6M).
++THUMB2_FUNCTIONS :=3D \
++	switch16 \
++	switch32 \
++	switch8 \
++	switchu8 \
++	sync_fetch_and_add_4 \
++	sync_fetch_and_sub_4 \
++	sync_fetch_and_and_4 \
++	sync_fetch_and_or_4 \
++	sync_fetch_and_xor_4 \
++	sync_fetch_and_nand_4 \
++	sync_fetch_and_max_4 \
++	sync_fetch_and_umax_4 \
++	sync_fetch_and_min_4 \
++	sync_fetch_and_umin_4 \
++	sync_fetch_and_add_8 \
++	sync_fetch_and_sub_8 \
++	sync_fetch_and_and_8 \
++	sync_fetch_and_or_8 \
++	sync_fetch_and_xor_8 \
++	sync_fetch_and_nand_8 \
++	sync_fetch_and_max_8 \
++	sync_fetch_and_umax_8 \
++	sync_fetch_and_min_8 \
++	sync_fetch_and_umin_8
++
++I386_FUNCTIONS :=3D  \
++	i686.get_pc_thunk.eax \
++	i686.get_pc_thunk.ebp \
++	i686.get_pc_thunk.ebx \
++	i686.get_pc_thunk.ecx \
++	i686.get_pc_thunk.edi \
++	i686.get_pc_thunk.edx \
++	i686.get_pc_thunk.esi
++
++# FIXME: Currently, compiler-rt is missing implementations for a number o=
f the
++# functions. Filter them out for now.
++MISSING_FUNCTIONS :=3D \
++	cmpdf2 cmpsf2 div0 \
++	ffssi2 \
++	udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \
++	bswapsi2 \
++	gcc_bcmp \
++	do_global_dtors \
++	i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx \
++	i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx \
++	i686.get_pc_thunk.esi \
++	aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple aeabi_dcmpeq \
++	aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \
++	aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmplt \
++	aeabi_frsub aeabi_idivmod aeabi_uidivmod
++
++FUNCTIONS_ARMV6M  :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
++FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS) $(THUMB2_FUNC=
TIONS)
++FUNCTIONS_I386    :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)
++FUNCTIONS_X86_64  :=3D $(COMMON_FUNCTIONS)
++
++FUNCTIONS_ARMV6M :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))
++FUNCTIONS_ARM_ALL :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))
++FUNCTIONS_I386 :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))
++FUNCTIONS_X86_64 :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))
++
++FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)
++FUNCTIONS.soft_pic.armv6m    :=3D $(FUNCTIONS_ARMV6M)
++
++FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7m    :=3D $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)
++FUNCTIONS.hard_pic.i386    :=3D $(FUNCTIONS_I386)
++
++FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)
++FUNCTIONS.hard_pic.x86_64    :=3D $(FUNCTIONS_X86_64)
+diff --git a/compiler-rt/make/platform/clang_linux_embedded_test_input.c b=
/compiler-rt/make/platform/clang_linux_embedded_test_input.c
+new file mode 100644
+index 000000000000..e69de29bb2d1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0003-compiler-=
rt-Simplify-cross-compilation.-Don-t-use-na.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0003-compiler-rt-Simplify-cross-compilation.-Don-t=
-use-na.patch
new file mode 100644
index 00000000..896bbd11
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0003-compiler-rt-Simp=
lify-cross-compilation.-Don-t-use-na.patch
@@ -0,0 +1,44 @@
+From 16b03fccab20cac13065ab99f36a7f0a77a62b92 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 May 2016 23:11:45 -0700
+Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
+ native-compiled llvm-config.
+
+    Note: AddLLVM.cmake does not expose the LLVM source directory.
+    So if you want to run the test suite, you need to either:
+
+    1) set LLVM_MAIN_SRC_DIR explicitly (to find lit.py)
+    2) change AddLLVM.cmake to point to an installed 'lit'.
+    3) add_subdirectory(compiler-rt/test) from clang instead of compiler-r=
t.
+
+https://us.codeaurora.org/patches/quic/llvm/50683/compiler-rt-cross-compil=
ation.patch
+
+Upstream-Status: Pending
+Signed-off-by: Greg Fitzgerald <gregf@codeaurora.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/CMakeLists.txt | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
+index a92258ae1244..98c4e9a681d5 100644
+--- a/compiler-rt/CMakeLists.txt
++++ b/compiler-rt/CMakeLists.txt
+@@ -109,7 +109,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
+   set(CMAKE_CXX_EXTENSIONS NO)
+=20
+   if (NOT LLVM_RUNTIMES_BUILD)
+-    load_llvm_config()
++    find_package(LLVM REQUIRED)
++    list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
++
++    # Variables that AddLLVM.cmake depends on (included by AddCompilerRT)
++    set(LLVM_TOOLS_BINARY_DIR "${LLVM_INSTALL_PREFIX}/bin")
++    set(LLVM_LIBRARY_DIR "${LLVM_INSTALL_PREFIX}/lib")
++
++    set(LLVM_LIBRARY_OUTPUT_INTDIR
++      ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib${LLVM_LIBDIR_SUFFIX})
++
+   endif()
+   if (TARGET intrinsics_gen)
+     # Loading the llvm config causes this target to be imported so place =
it
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0004-llvm-allo=
w-env-override-of-exe-and-libdir-path.patch b/meta-ti-bsp/recipes-graphics/=
mesa/libclc-22.1.8/0004-llvm-allow-env-override-of-exe-and-libdir-path.patch
new file mode 100644
index 00000000..3c7c2746
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0004-llvm-allow-env-o=
verride-of-exe-and-libdir-path.patch
@@ -0,0 +1,71 @@
+From d13464858866ff3c0026294d6842f74a11a0d625 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Fri, 19 May 2017 00:22:57 -0700
+Subject: [PATCH] llvm: allow env override of exe and libdir path
+
+When using a native llvm-config from inside a sysroot, we need llvm-config=
 to
+return the libraries, include directories, etc. from inside the sysroot ra=
ther
+than from the native sysroot. Thus provide an env override for calling
+llvm-config from a target sysroot.
+
+Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
+ 1 file changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-conf=
ig/llvm-config.cpp
+index 24ea264419af..0a3f51ae2b83 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -248,6 +248,13 @@ Typical components:\n\
+=20
+ /// Compute the path to the main executable.
+ static std::string getExecutablePath(const char *Argv0) {
++  // Hack for Yocto: we need to override the root path when we are using
++  // llvm-config from within a target sysroot.
++  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
++  if (Sysroot !=3D nullptr) {
++    return Sysroot;
++  }
++
+   // This just needs to be some symbol in the binary; C++ doesn't
+   // allow taking the address of ::main however.
+   void *P =3D (void *)(intptr_t)getExecutablePath;
+@@ -326,7 +333,7 @@ int main(int argc, char **argv) {
+   // Compute various directory locations based on the derived location
+   // information.
+   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
+-              ActiveCMakeDir;
++              ActiveCMakeDir, BaseLibDir;
+   std::vector<std::string> ActiveIncludeOptions;
+   if (IsInDevelopmentTree) {
+     ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include";
+@@ -367,12 +374,18 @@ int main(int argc, char **argv) {
+       sys::path::make_absolute(ActivePrefix, Path);
+       ActiveBinDir =3D std::string(Path);
+     }
+-    ActiveLibDir =3D ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
+-    {
+-      SmallString<256> Path(LLVM_INSTALL_PACKAGE_DIR);
+-      sys::path::make_absolute(ActivePrefix, Path);
+-      ActiveCMakeDir =3D std::string(Path);
++    // Hack for Yocto: we need to override the lib path when we are using
++    // llvm-config from within a target sysroot since LLVM_LIBDIR_SUFFIX
++    // maybe different for host llvm vs target e.g. ppc64 Libdir=3Dlib64 =
but
++    // x86_64 Libdir =3D lib
++    const char *YoctoLibDir =3D std::getenv("YOCTO_ALTERNATE_LIBDIR");
++    if (YoctoLibDir !=3D nullptr) {
++      BaseLibDir =3D std::string(YoctoLibDir);
++    } else {
++      BaseLibDir =3D std::string("/lib") + LLVM_LIBDIR_SUFFIX;
+     }
++    ActiveLibDir =3D ActivePrefix + BaseLibDir;
++    ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
+     ActiveIncludeOptions.push_back(ActiveIncludeDir);
+   }
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0005-clang-dri=
ver-Check-sysroot-for-ldso-path.patch b/meta-ti-bsp/recipes-graphics/mesa/l=
ibclc-22.1.8/0005-clang-driver-Check-sysroot-for-ldso-path.patch
new file mode 100644
index 00000000..e4636d30
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0005-clang-driver-Che=
ck-sysroot-for-ldso-path.patch
@@ -0,0 +1,78 @@
+From 7a12ad3232dd6881ca40d94277ca8064a12d9df6 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@usask.ca>
+Date: Wed, 26 Apr 2017 20:29:41 -0600
+Subject: [PATCH] clang: driver: Check sysroot for ldso path
+
+when we build multilib the ldso has different paths than clangs defaults,
+every distro kind of does that so OE is not the only one,
+it happens especially on ppc64, where OE does not necessarily follow the
+default path for the dynamic linker, therefore adjust it for OE. Check
+for the default path, and if it isn't there, check /lib.
+
+Upstream-Status: Pending
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index d525b417b4ea..1c31901ade74 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -630,8 +630,12 @@ std::string Linux::getDynamicLinker(const ArgList &Ar=
gs) const {
+         Triple.getEnvironment() =3D=3D llvm::Triple::GNUEABIHFT64 ||
+         tools::arm::getARMFloatABI(*this, Args) =3D=3D tools::arm::FloatA=
BI::Hard;
+=20
+-    LibDir =3D "lib";
+     Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
++    LibDir =3D "lib32";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   }
+   case llvm::Triple::loongarch32: {
+@@ -685,11 +689,19 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.s=
o.1";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   case llvm::Triple::ppc64le:
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.s=
o.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   case llvm::Triple::riscv32:
+   case llvm::Triple::riscv64: {
+@@ -707,6 +719,10 @@ std::string Linux::getDynamicLinker(const ArgList &Ar=
gs) const {
+   case llvm::Triple::sparcv9:
+     LibDir =3D "lib64";
+     Loader =3D "ld-linux.so.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   case llvm::Triple::systemz:
+     LibDir =3D "lib";
+@@ -721,6 +737,10 @@ std::string Linux::getDynamicLinker(const ArgList &Ar=
gs) const {
+=20
+     LibDir =3D X32 ? "libx32" : "lib64";
+     Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   }
+   case llvm::Triple::ve:
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0006-clang-Dri=
ver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta-ti-bsp/recipes-graphi=
cs/mesa/libclc-22.1.8/0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-mus=
l.patch
new file mode 100644
index 00000000..0269dece
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0006-clang-Driver-too=
ls.cpp-Add-lssp_nonshared-on-musl.patch
@@ -0,0 +1,32 @@
+From 19b8ca2e1aa536e7d7f7eb379fc4e4d6f1efd07a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 May 2016 21:11:06 -0700
+Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
+
+musl driver will need to add ssp_nonshared for stack_check_local
+on the linker cmdline when using stack protector commands on
+compiler cmdline
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index cb6a9b242421..8f126474b7d1 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -539,6 +539,12 @@ void tools::gnutools::Linker::ConstructJob(Compilatio=
n &C, const JobAction &JA,
+       if (IsIAMCU)
+         CmdArgs.push_back("-lgloss");
+=20
++      if (ToolChain.getTriple().isMusl() &&
++          (Args.hasArg(options::OPT_fstack_protector) ||
++          Args.hasArg(options::OPT_fstack_protector_strong) ||
++          Args.hasArg(options::OPT_fstack_protector_all))) {
++        CmdArgs.push_back("-lssp_nonshared");
++      }
+       if (IsStatic || IsStaticPIE)
+         CmdArgs.push_back("--end-group");
+       else
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0007-clang-Pre=
pend-trailing-to-sysroot.patch b/meta-ti-bsp/recipes-graphics/mesa/libclc-2=
2.1.8/0007-clang-Prepend-trailing-to-sysroot.patch
new file mode 100644
index 00000000..321de79c
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0007-clang-Prepend-tr=
ailing-to-sysroot.patch
@@ -0,0 +1,39 @@
+From 1746960b385afbc9e8e355a3b7c66b43c946451b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Mar 2017 09:02:13 -0700
+Subject: [PATCH] clang: Prepend trailing '/' to sysroot
+
+This is needed to handle a case where clang
+isntall and target sysroot are perilously same
+
+e.g.
+
+sysroot =3D /mnt/clang/recipe-sysroot
+clang install =3D /mnt/clang/recipe-sysroot-native
+
+in this case it will mistakenly assume that
+clang is installed under the same sysroot dir
+and it will try to add relative ../lib paths
+to linker steps which would then be wrong
+since they will become relative to clang
+installation and not sysroot
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 1c31901ade74..f7f096c1ac0a 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -235,7 +235,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Trip=
le, const ArgList &Args)
+   Multilibs =3D GCCInstallation.getMultilibs();
+   SelectedMultilibs.assign({GCCInstallation.getMultilib()});
+   llvm::Triple::ArchType Arch =3D Triple.getArch();
+-  std::string SysRoot =3D computeSysRoot();
++  std::string SysRoot =3D computeSysRoot() + "/";
+   ToolChain::path_list &PPaths =3D getProgramPaths();
+=20
+   Generic_GCC::PushPPaths(PPaths);
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0009-clang-Def=
ine-releative-gcc-installation-dir.patch b/meta-ti-bsp/recipes-graphics/mes=
a/libclc-22.1.8/0009-clang-Define-releative-gcc-installation-dir.patch
new file mode 100644
index 00000000..38470e98
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0009-clang-Define-rel=
eative-gcc-installation-dir.patch
@@ -0,0 +1,123 @@
+From bfba4232621e151cfc5dcb16ce5bf661f8c3d8f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 Mar 2021 16:09:16 -0700
+Subject: [PATCH] clang: Define / releative gcc installation dir
+
+This is required for OE gcc installation to work.
+Without this its not able to find the paths for libgcc
+and other standard headers and libraries from gcc
+installation in OE
+
+* Do not use install relative libc++ headers
+In OE we use same clang for native and cross builds, therefore we need
+to ensure that native sysroot install of libc++ is not searched for
+headers when doing cross compile instead it searches the target sysroot
+this is especially troublesome when libcxx-native is staged along with
+libcxx e.g. chromium
+
+ * Fix lib paths for OpenEmbedded Host
+
+Under OpenEmbedded Host, while building with clang-native, it cannot find
+the GCCInstallPath, which causing following error:
+[snip]
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+-target x86_64-linux
+-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-=
native/usr/include
+-O2 -pipe
+/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmak=
e-3.21/Modules/CMakeCCompilerABI.c`
+hosttools/ld: cannot find crtbeginS.o: No such file or directory
+[snip]
+
+Before this patch:
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952ede=
e36b3c002e3a29c6b1b5153de)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
+
+After this patch:
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952ede=
e36b3c002e3a29c6b1b5153de)
+Thread model: posix
+InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
+Found candidate GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
+Selected GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
+Candidate multilib: .;@m64
+Selected multilib: .;@m64
+
+For OpenEmbedded Host, sysroots are of the form<sysroot>/usr/lib/<triple>/=
x.y.z.
+Take x86-64 as example, the default triple is x86_64-unknown-linux-gnu.
+For clang-native, the target vendor is '-unknown', need to test current di=
stro
+to follow above form.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 22 ++++++++++++++--------
+ 1 file changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index 8f126474b7d1..c80980a7fb09 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -18,6 +18,7 @@
+ #include "clang/Config/config.h" // for GCC_INSTALL_PREFIX
+ #include "clang/Driver/CommonArgs.h"
+ #include "clang/Driver/Compilation.h"
++#include "clang/Driver/Distro.h"
+ #include "clang/Driver/Driver.h"
+ #include "clang/Driver/MultilibBuilder.h"
+ #include "clang/Driver/Tool.h"
+@@ -2847,6 +2848,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDi=
rForGCCTriple(
+     const llvm::Triple &TargetTriple, const ArgList &Args,
+     const std::string &LibDir, StringRef CandidateTriple,
+     bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) {
++  Distro Distro(D.getVFS(), TargetTriple);
+   // Locations relative to the system lib directory where GCC's triple-sp=
ecific
+   // directories might reside.
+   struct GCCLibSuffix {
+@@ -2858,19 +2860,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLib=
DirForGCCTriple(
+     // Whether this library suffix is relevant for the triple.
+     bool Active;
+   } Suffixes[] =3D {
+-      // This is the normal place.
+-      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
+-
+-      // Debian puts cross-compilers in gcc-cross.
+-      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists},
+-
+       // The Freescale PPC SDK has the gcc libraries in
+       // <sysroot>/usr/lib/<triple>/x.y.z so have a look there as well. O=
nly do
+       // this on Freescale triples, though, since some systems put a *lot=
* of
+       // files in that location, not just GCC installation data.
+       {CandidateTriple.str(), "..",
+        TargetTriple.getVendor() =3D=3D llvm::Triple::Freescale ||
+-           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded}};
++           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded ||
++           Distro.IsOpenEmbedded()},
++
++      // This is the normal place.
++      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
++
++      // Debian puts cross-compilers in gcc-cross.
++      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists}};
+=20
+   SmallVector<GCCInstallCandidate, 3> Installations;
+   for (auto &Suffix : Suffixes) {
+@@ -3273,8 +3276,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt:=
:ArgList &DriverArgs,
+   // incompatible with the NDK libraries.
+   SmallString<128> DriverIncludeDir(getDriver().Dir);
+   llvm::sys::path::append(DriverIncludeDir, "..", "include");
++
++  // do not add it when --sysroot is specified, since it would expect
++  // libc++ headers from sysroot and not relative to compiler install loc=
ation
+   if (AddIncludePath(DriverIncludeDir,
+-                     /*TargetDirRequired=3D*/getTriple().isAndroid()))
++                     /*TargetDirRequired=3D*/getTriple().isAndroid() | !c=
omputeSysRoot().empty()))
+     return;
+   // If this is a development, non-installed, clang, libcxx will
+   // not be found at ../include/c++ but it likely to be found at
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0010-clang-Add=
-lpthread-and-ldl-along-with-lunwind-for-st.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0010-clang-Add-lpthread-and-ldl-along-with-lunwind=
-for-st.patch
new file mode 100644
index 00000000..b338d0f5
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0010-clang-Add-lpthre=
ad-and-ldl-along-with-lunwind-for-st.patch
@@ -0,0 +1,35 @@
+From 03875620d0172a7c07e3cdc607a6877b06a130e9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jul 2019 22:51:39 -0700
+Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for sta=
tic
+ linking
+
+When doing static liking with --unwindlib=3Dlibunwind -static we encounter
+undefined symbols
+libunwind/src/RWMutex.hpp:68: undefined reference to `pthread_rwlock_wrloc=
k'
+
+and
+
+libunwind/src/AddressSpace.hpp:597: undefined reference to `dladdr'
+
+therefore we need to link in libpthread and libdl to fill these symbols
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/CommonArgs.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/Driver=
/ToolChains/CommonArgs.cpp
+index 10a1a412eea0..a217897610c3 100644
+--- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
++++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
+@@ -2415,6 +2415,8 @@ static void AddUnwindLibrary(const ToolChain &TC, co=
nst Driver &D,
+         CmdArgs.push_back("-lunwind");
+     } else if (LGT =3D=3D LibGccType::StaticLibGcc) {
+       CmdArgs.push_back("-l:libunwind.a");
++      CmdArgs.push_back("-lpthread");
++      CmdArgs.push_back("-ldl");
+     } else if (LGT =3D=3D LibGccType::SharedLibGcc) {
+       if (TC.getTriple().isOSCygMing())
+         CmdArgs.push_back("-l:libunwind.dll.a");
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0011-Check-for=
-atomic-double-intrinsics.patch b/meta-ti-bsp/recipes-graphics/mesa/libclc-=
22.1.8/0011-Check-for-atomic-double-intrinsics.patch
new file mode 100644
index 00000000..ba6a5c15
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0011-Check-for-atomic=
-double-intrinsics.patch
@@ -0,0 +1,34 @@
+From ea4326b11976e48dde6d99605ac24df048cd3b10 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Nov 2019 17:00:29 -0800
+Subject: [PATCH] Check for atomic<double> intrinsics
+
+On some architectures e.g. x86/32bit gcc decides to inline calls to
+double atomic variables but clang does not and defers it to libatomic
+therefore detect if clang can use built-ins for atomic<double> if not
+then link libatomic, this helps building clangd for x86 on linux systems
+with gcc runtime
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/cmake/modules/CheckAtomic.cmake | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/cmake/modules/CheckAtomic.cmake b/llvm/cmake/modules/Che=
ckAtomic.cmake
+index f11cadf39ff6..80a18a92956a 100644
+--- a/llvm/cmake/modules/CheckAtomic.cmake
++++ b/llvm/cmake/modules/CheckAtomic.cmake
+@@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)
+ #include <atomic>
+ #include <cstdint>
+ std::atomic<uint64_t> x (0);
++std::atomic<double> y (0);
+ int main() {
+   uint64_t i =3D x.load(std::memory_order_relaxed);
+   (void)i;
+-  return 0;
++  return int(y);
+ }
+ " ${varname})
+   set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0012-cmake-Fix=
-configure-for-packages-using-find_package.patch b/meta-ti-bsp/recipes-grap=
hics/mesa/libclc-22.1.8/0012-cmake-Fix-configure-for-packages-using-find_pa=
ckage.patch
new file mode 100644
index 00000000..946eb166
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0012-cmake-Fix-config=
ure-for-packages-using-find_package.patch
@@ -0,0 +1,118 @@
+From dc281691e778a61cc14bca4eb187792d2ffb384c Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 31 Jan 2020 10:56:11 +0200
+Subject: [PATCH] cmake: Fix configure for packages using find_package()
+
+Currently, when a package (i.e. bcc [https://github.com/iovisor/bcc.git])
+that depends on LLVM/Clang tries to run cmake find_package() during
+do_configure, it will fail with a similar error:
+
+|   The imported target "llvm-tblgen" references the file
+|      ".../recipe-sysroot/usr/bin/llvm-tblgen"
+|
+|   but this file does not exist.  Possible reasons include:
+|   * The file was deleted, renamed, or moved to another location.
+|   * An install or uninstall procedure did not complete successfully.
+|   * The installation package was faulty and contained
+|      ".../recipe-sysroot/usr/lib/cmake/LLVMExports.cmake"
+|   but not all the files it references.
+
+This is due to the fact that currently the cmake scripts look for target
+binaries in sysroot. Work around this by not exporting the target binaries=
 in
+Exports-* cmake files.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ clang/cmake/modules/AddClang.cmake | 2 --
+ llvm/cmake/modules/AddLLVM.cmake   | 9 ++-------
+ llvm/cmake/modules/TableGen.cmake  | 6 ------
+ 3 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/AddC=
lang.cmake
+index 4059fc3e986c..44d43aa8f25b 100644
+--- a/clang/cmake/modules/AddClang.cmake
++++ b/clang/cmake/modules/AddClang.cmake
+@@ -182,7 +182,6 @@ macro(add_clang_tool name)
+     if (CLANG_BUILD_TOOLS)
+       get_target_export_arg(${name} Clang export_to_clangtargets)
+       install(TARGETS ${name}
+-        ${export_to_clangtargets}
+         RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
+         COMPONENT ${name})
+=20
+@@ -195,7 +194,6 @@ macro(add_clang_tool name)
+                                  DEPENDS ${name}
+                                  COMPONENT ${name})
+       endif()
+-      set_property(GLOBAL APPEND PROPERTY CLANG_EXPORTS ${name})
+     endif()
+   endif()
+   set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
+diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLLVM=
.cmake
+index d938214f9d0d..4816f2127e14 100644
+--- a/llvm/cmake/modules/AddLLVM.cmake
++++ b/llvm/cmake/modules/AddLLVM.cmake
+@@ -1485,7 +1485,6 @@ macro(llvm_add_tool project name)
+       if( LLVM_BUILD_TOOLS )
+         get_target_export_arg(${name} ${project} export_to_llvmexports)
+         install(TARGETS ${name}
+-                ${export_to_llvmexports}
+                 RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
+                 COMPONENT ${name})
+         if (LLVM_ENABLE_PDB)
+@@ -1501,10 +1500,8 @@ macro(llvm_add_tool project name)
+         endif()
+       endif()
+     endif()
+-    if( LLVM_BUILD_TOOLS )
+-      string(TOUPPER "${project}" project_upper)
+-      set_property(GLOBAL APPEND PROPERTY ${project_upper}_EXPORTS ${name=
})
+-    endif()
++    string(TOUPPER "${project}" project_upper)
++    set_target_properties(${name} PROPERTIES FOLDER "Tools")
+   endif()
+   get_subproject_title(subproject_title)
+   set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/To=
ols")
+@@ -1559,7 +1556,6 @@ macro(add_llvm_utility name)
+     if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
+       get_target_export_arg(${name} LLVM export_to_llvmexports)
+       install(TARGETS ${name}
+-              ${export_to_llvmexports}
+               RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
+               COMPONENT ${name})
+       if (LLVM_ENABLE_PDB)
+@@ -1573,7 +1569,6 @@ macro(add_llvm_utility name)
+                                  DEPENDS ${name}
+                                  COMPONENT ${name})
+       endif()
+-      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
+     elseif(LLVM_BUILD_UTILS)
+       set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${n=
ame})
+     endif()
+diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/TableG=
en.cmake
+index 84c03cd6432e..72da60ce3ca1 100644
+--- a/llvm/cmake/modules/TableGen.cmake
++++ b/llvm/cmake/modules/TableGen.cmake
+@@ -237,12 +237,7 @@ macro(add_tablegen target project)
+=20
+   if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
+       (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONENTS=
))
+-    set(export_arg)
+-    if(ADD_TABLEGEN_EXPORT)
+-      get_target_export_arg(${target} ${ADD_TABLEGEN_EXPORT} export_arg)
+-    endif()
+     install(TARGETS ${target}
+-            ${export_arg}
+             COMPONENT ${target}
+             RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
+     if(NOT LLVM_ENABLE_IDE)
+@@ -253,7 +248,6 @@ macro(add_tablegen target project)
+   endif()
+   if(ADD_TABLEGEN_EXPORT)
+     string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
+-    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${target})
+   endif()
+ endmacro()
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0013-clang-Fix=
-resource-dir-location-for-cross-toolchains.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0013-clang-Fix-resource-dir-location-for-cross-too=
lchains.patch
new file mode 100644
index 00000000..72b989c0
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0013-clang-Fix-resour=
ce-dir-location-for-cross-toolchains.patch
@@ -0,0 +1,51 @@
+From 248a51bece02c199d0f84d14fa7e2e2379c592a0 Mon Sep 17 00:00:00 2001
+From: Jim Broadus <jbroadus@xevo.com>
+Date: Thu, 26 Mar 2020 16:05:53 -0700
+Subject: [PATCH] clang: Fix resource dir location for cross toolchains
+
+When clang looks for the resources directory, it does so based on the bina=
ry
+location and assumes that the containing directory is a sibling to lib. The
+Yocto cross.bbclass defines the default bindir as
+${exec_prefix}/bin/${CROSS_TARGET_SYS_DIR}. ex: /usr/bin/aarch64-poky-linu=
x/.
+This causes clang to form a path that looks like /usr/bin/lib/clang/...
+
+As a fix for this, check the parent directory name. If that is "bin", then
+use that directory's parent.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jim Broadus <jbroadus@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Options/OptionUtils.cpp | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Options/OptionUtils.cpp b/clang/lib/Options/OptionU=
tils.cpp
+index e5aefa012f67..7c1b657ce2c1 100644
+--- a/clang/lib/Options/OptionUtils.cpp
++++ b/clang/lib/Options/OptionUtils.cpp
+@@ -213,6 +213,7 @@ std::string clang::GetResourcesPath(StringRef BinaryPa=
th) {
+=20
+   // Dir is bin/ or lib/, depending on where BinaryPath is.
+   StringRef Dir =3D llvm::sys::path::parent_path(BinaryPath);
++  StringRef LastDirName =3D llvm::sys::path::filename(Dir);
+   SmallString<128> P(Dir);
+=20
+   StringRef ConfiguredResourceDir(CLANG_RESOURCE_DIR);
+@@ -229,9 +230,15 @@ std::string clang::GetResourcesPath(StringRef BinaryP=
ath) {
+     // With a static-library build of libclang, LibClangPath will contain=
 the
+     // path of the embedding binary, which for LLVM binaries will be in b=
in/.
+     // ../lib gets us to lib/ in both cases.
+-    P =3D llvm::sys::path::parent_path(Dir);
+     // This search path is also created in the COFF driver of lld, so any
+     // changes here also needs to happen in lld/COFF/Driver.cpp
++
++    // OE cross toolchains are installed, by default, in a subdir of bin.
++    if (LastDirName =3D=3D "bin") {
++      P =3D llvm::sys::path::parent_path(Dir);
++    } else {
++      P =3D llvm::sys::path::parent_path(llvm::sys::path::parent_path(Dir=
));
++    }
+     llvm::sys::path::append(P, CLANG_INSTALL_LIBDIR_BASENAME, "clang",
+                             CLANG_VERSION_MAJOR_STRING);
+   }
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0014-clang-dri=
ver-Add-dyld-prefix-when-checking-sysroot-f.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0014-clang-driver-Add-dyld-prefix-when-checking-sy=
sroot-f.patch
new file mode 100644
index 00000000..725d10a2
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0014-clang-driver-Add=
-dyld-prefix-when-checking-sysroot-f.patch
@@ -0,0 +1,79 @@
+From b3eea8bcdb792a7b19b879c76eac64f36d1fe012 Mon Sep 17 00:00:00 2001
+From: Oleksandr Ocheretnyi <oocheret@cisco.com>
+Date: Wed, 15 Apr 2020 00:08:39 +0300
+Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for =
ldso
+ path
+
+ * the dyld-prefix shall be taken into account when the default
+   path for the dynamic linker has to be checked.
+
+ * this patch shall be used as annex to the next patch:
+   'clang: driver: Check sysroot for ldso path' which includes
+   the usrmerge scenario.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index f7f096c1ac0a..7b608a84a66e 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -632,8 +632,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+=20
+     Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
+     LibDir =3D "lib32";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
+@@ -689,8 +689,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.s=
o.1";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
+@@ -698,8 +698,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.s=
o.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
+@@ -719,8 +719,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+   case llvm::Triple::sparcv9:
+     LibDir =3D "lib64";
+     Loader =3D "ld-linux.so.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
+@@ -737,8 +737,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+=20
+     LibDir =3D X32 ? "libx32" : "lib64";
+     Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0015-clang-Use=
-python3-in-python-scripts.patch b/meta-ti-bsp/recipes-graphics/mesa/libclc=
-22.1.8/0015-clang-Use-python3-in-python-scripts.patch
new file mode 100644
index 00000000..e29d23ca
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0015-clang-Use-python=
3-in-python-scripts.patch
@@ -0,0 +1,35 @@
+From 17e1af5e12a01296d2c032a768569d4d8b06505b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Oct 2020 22:19:57 -0700
+Subject: [PATCH] clang: Use python3 in python scripts
+
+Some scripts ask for python, but they work fine with python3
+and in OE python symlink is not exposed to build, only python3 is
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../find-all-symbols/tool/run-find-all-symbols.py               | 2 +-
+ clang/tools/scan-view/bin/scan-view                             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/r=
un-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-all-sym=
bols/tool/run-find-all-symbols.py
+index 49a1b1493264..6158876d15f7 100755
+--- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find=
-all-symbols.py
++++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find=
-all-symbols.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # =3D- run-find-all-symbols.py - Parallel find-all-symbols runner -*- pyt=
hon  -*-=3D#
+ #
+diff --git a/clang/tools/scan-view/bin/scan-view b/clang/tools/scan-view/b=
in/scan-view
+index d01aebb4029a..f3375804654d 100755
+--- a/clang/tools/scan-view/bin/scan-view
++++ b/clang/tools/scan-view/bin/scan-view
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+=20
+ from __future__ import print_function
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0016-llvm-clan=
g-Insert-anchor-for-adding-OE-distro-vendor.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0016-llvm-clang-Insert-anchor-for-adding-OE-distro=
-vendor.patch
new file mode 100644
index 00000000..674a3b26
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0016-llvm-clang-Inser=
t-anchor-for-adding-OE-distro-vendor.patch
@@ -0,0 +1,184 @@
+From 259d8eb2ed82c9248387a3cbb1befee358ecbb8e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 Jan 2021 16:14:35 +0800
+Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor nam=
es
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This helps in making right detection for OE built gcc toolchains
+
+The //CLANG_EXTRA_OE_VENDORS_CASES string is replaced with list of
+additional Ceses based on CLANG_EXTRA_OE_VENDORS variable in
+recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
+
+* For x86_64, set Yocto based GCC install search path
+
+Under Yocto host, while using clang-native to build, it searches
+install host gcc failed which causing the include file not found
+[snip]
+|clang++ -target x86_64-linux  -MMD -MF src/base/files/file_path_constants=
.o.d -I../../../tools/gn/src -I. \
+-isystem/tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/recipe-sys=
root-native/usr/include -O2 -pipe \
+-std=3Dc++17 -c ../../../tools/gn/src/base/files/file_path_constants.cc -o=
 src/base/files/file_path_constants.o
+|../../../tools/gn/src/base/files/file_path_constants.cc:7:10: fatal error=
: 'iterator' file not found
+|#include <iterator>
+|         ^~~~~~~~
+[snip]
+
+* Set three Yocto based GCC triple: poky, oe-core and wind river
+
+Before aplly the patch
+[snip]
+$ ../recipe-sysroot-native/usr/bin/clang++ -v
+clang version 11.0.1 (https://github.com/llvm/llvm-project 43ff75f2c3feef6=
4f9d73328230d34dac8832a91)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromi=
um-87.0.4280.141/../recipe-sysroot-native/usr/bin
+[snip]
+
+After this patch:
+[snip]
+$ ../recipe-sysroot-native/usr/bin/clang++ -v
+clang version 11.0.1 (https://github.com/llvm/llvm-project 22c3241ff9a6224=
261df48d0258957fd8acc3d64)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromi=
um-87.0.4280.141/../recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.1.0
+Selected GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
+Candidate multilib: .;@m64
+Selected multilib: .;@m64
+[snip]
+
+BTW, it is hardly to insert a triple by the replacement of TARGET_SYS
+(=3D${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}), since TARGET_VENDOR
+is different between clang and clang-native
+
+* The //CLANG_EXTRA_OE_VENDORS_TRIPLES string is replaced with list of
+additional triples based on CLANG_EXTRA_OE_VENDORS variable in
+recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
+
+* Correct library search path for OpenEmbedded Host
+
+For OpenEmbedded Host, the gcc install path is
+/usr/lib/x86_64-[distroname]-linux/[gcc-version].
+So the library search path is not found with default triple
+'x86_64-linux-gnu' for x86_64. Causing following error:
+[snip]
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+-target x86_64-linux
+-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-=
native/usr/include
+-O2 -pipe
+/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmak=
e-3.21/Modules/CMakeCCompilerABI.c`
+|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
+|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
+|     clang-13: error: linker command failed with exit code 1 (use -v to s=
ee invocation)
+[snip]
+
+before this patch:
+b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-s=
ysroot-native/usr/bin/clang --print-search-dirs
+programs: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-=
r0/recipe-sysroot-native/usr/bin
+libraries: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/build/tmp-glibc/work/x86_64=
-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://=
lib://usr/lib
+
+after this patch:
+b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-s=
ysroot-native/usr/bin/clang --print-search-dirs
+programs: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-=
r0/recipe-sysroot-native/usr/bin
+libraries: =3D/build/tmp-glibc/work/x84_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/usr/lib/x86_64-wrs-linux/10=
.2.0://lib/x86_64-wrs-linux://usr/lib/x86_64-wrs-linux:/build/tmp-glibc/wor=
k/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/.=
./lib://lib://usr/lib
+
+[JM: add missing instance of Distro class in getMultiarchTriple(), at Linu=
x.cpp]
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ clang/include/clang/Driver/Distro.h   | 2 ++
+ clang/lib/Driver/Distro.cpp           | 1 +
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp | 2 ++
+ llvm/lib/TargetParser/Triple.cpp      | 2 +-
+ 5 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/Dri=
ver/Distro.h
+index 0e17b30eb..b449a62dc 100644
+--- a/clang/include/clang/Driver/Distro.h
++++ b/clang/include/clang/Driver/Distro.h
+@@ -45,6 +45,7 @@ public:
+     RHEL10,
+     Fedora,
+     Gentoo,
++    //CLANG_EXTRA_OE_DISTRO_NAME
+     OpenSUSE,
+     UbuntuQuantal,
+     UbuntuRaring,
+@@ -132,6 +133,7 @@ public:
+=20
+   bool IsGentoo() const { return DistroVal =3D=3D Gentoo; }
+=20
++  //CLANG_EXTRA_OE_DISTRO_CHECK
+   /// @}
+ };
+=20
+diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
+index df10458d0..61dc127a4 100644
+--- a/clang/lib/Driver/Distro.cpp
++++ b/clang/lib/Driver/Distro.cpp
+@@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::Fil=
eSystem &VFS) {
+                     .Case("sles", Distro::OpenSUSE)
+                     .Case("opensuse", Distro::OpenSUSE)
+                     .Case("exherbo", Distro::Exherbo)
++                    //CLANG_EXTRA_OE_DISTRO_CASE
+                     .Default(Distro::UnknownDistro);
+   return Version;
+ }
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index c80980a7f..80fd8058b 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2370,6 +2370,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(
+       "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
+       "x86_64-redhat-linux",    "x86_64-suse-linux",
+       "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
++      "x86_64-oe-linux",//CLANG_EXTRA_OE_VENDORS_TRIPLES
+       "x86_64-unknown-linux",   "x86_64-amazon-linux"};
+   static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
+                                            "x86_64-pc-linux-gnux32"};
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 7b608a84a..585a86a2d 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -45,6 +45,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+   bool IsAndroid =3D TargetTriple.isAndroid();
+   bool IsMipsR6 =3D TargetTriple.getSubArch() =3D=3D llvm::Triple::MipsSu=
bArch_r6;
+   bool IsMipsN32Abi =3D TargetTriple.getEnvironment() =3D=3D llvm::Triple=
::GNUABIN32;
++  Distro Distro(D.getVFS(), TargetTriple);
+=20
+   // For most architectures, just use whatever we have rather than trying=
 to be
+   // clever.
+@@ -81,6 +82,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+       return "x86_64-linux-android";
+     if (TargetEnvironment =3D=3D llvm::Triple::GNUX32)
+       return "x86_64-linux-gnux32";
++    //CLANG_EXTRA_OE_DISTRO_TRIPLE
+     return "x86_64-linux-gnu";
+   case llvm::Triple::aarch64:
+     if (IsAndroid)
+diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Trip=
le.cpp
+index a4f9dd42c..86b74451e 100644
+--- a/llvm/lib/TargetParser/Triple.cpp
++++ b/llvm/lib/TargetParser/Triple.cpp
+@@ -702,7 +702,7 @@ static Triple::VendorType parseVendor(StringRef Vendor=
Name) {
+       .Case("suse", Triple::SUSE)
+       .Case("oe", Triple::OpenEmbedded)
+       .Case("intel", Triple::Intel)
+-      .Case("meta", Triple::Meta)
++      .Case("meta", Triple::Meta) //CLANG_EXTRA_OE_VENDORS_CASES
+       .Default(Triple::UnknownVendor);
+ }
+=20
+--=20
+2.39.5
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0017-compiler-=
rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-=
glibc-l.patch
new file mode 100644
index 00000000..3fa436d5
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0017-compiler-rt-Do-n=
ot-use-backtrace-APIs-on-non-glibc-l.patch
@@ -0,0 +1,68 @@
+From bc8371eb77cca413ccb4ebf8239c597f7be40006 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 17:32:13 -0700
+Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux
+
+musl e.g. does not provide backtrace APIs
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../lib/gwp_asan/optional/backtrace_linux_libc.cpp  | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp b/=
compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
+index ea8e72be287d..0344074dd254 100644
+--- a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
++++ b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
+@@ -7,7 +7,9 @@
+ //=3D=3D=3D--------------------------------------------------------------=
--------=3D=3D=3D//
+=20
+ #include <assert.h>
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+@@ -21,8 +23,11 @@
+ namespace {
+ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
+   static_assert(sizeof(uintptr_t) =3D=3D sizeof(void *), "uintptr_t is no=
t void*");
+-
++#ifdef __GLIBC__
+   return backtrace(reinterpret_cast<void **>(TraceBuffer), Size);
++#else
++  return -1;
++#endif
+ }
+=20
+ // We don't need any custom handling for the Segv backtrace - the libc un=
winder
+@@ -30,7 +35,11 @@ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
+ // to avoid the additional frame.
+ GWP_ASAN_ALWAYS_INLINE size_t SegvBacktrace(uintptr_t *TraceBuffer, size_=
t Size,
+                                             void * /*Context*/) {
++#ifdef __GLIBC__
+   return Backtrace(TraceBuffer, Size);
++#else
++  return -1;
++#endif
+ }
+=20
+ static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,
+@@ -40,6 +49,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Trac=
eLength,
+     return;
+   }
+=20
++#ifdef __GLIBC__
+   char **BacktraceSymbols =3D
+       backtrace_symbols(reinterpret_cast<void **>(Trace), TraceLength);
+=20
+@@ -53,6 +63,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Trac=
eLength,
+   Printf("\n");
+   if (BacktraceSymbols)
+     free(BacktraceSymbols);
++#endif
+ }
+ } // anonymous namespace
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0018-clang-Fix=
-x86-triple-for-non-debian-multiarch-linux-.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0018-clang-Fix-x86-triple-for-non-debian-multiarch=
-linux-.patch
new file mode 100644
index 00000000..786ff426
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0018-clang-Fix-x86-tr=
iple-for-non-debian-multiarch-linux-.patch
@@ -0,0 +1,29 @@
+From 6839ba1413cf09eb14a24eeda44fb02c1c6809e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 17:56:03 -0700
+Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux dist=
ros
+
+OpenEmbedded does not hardcode mutli-arch like debian therefore ensure
+that it still uses the proper tuple
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 4a0adedce09a..9fed904c05c2 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -227,8 +227,9 @@ Linux::Linux(const Driver &D, const llvm::Triple &Trip=
le, const ArgList &Args)
+     : Generic_ELF(D, Triple, Args) {
+   GCCInstallation.TripleToDebianMultiarch =3D [](const llvm::Triple &T) {
+     StringRef TripleStr =3D T.str();
++    // OpenEmbedded does not hardcode the triple to i386-linux-gnu like d=
ebian
+     StringRef DebianMultiarch =3D
+-        T.getArch() =3D=3D llvm::Triple::x86 ? "i386-linux-gnu" : TripleS=
tr;
++        T.getArch() =3D=3D llvm::Triple::x86 && T.getVendor() !=3D llvm::=
Triple::OpenEmbedded ? "i386-linux-gnu" : TripleStr;
+     return DebianMultiarch;
+   };
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0019-libunwind=
-Added-unw_backtrace-method.patch b/meta-ti-bsp/recipes-graphics/mesa/libcl=
c-22.1.8/0019-libunwind-Added-unw_backtrace-method.patch
new file mode 100644
index 00000000..0b7966ee
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0019-libunwind-Added-=
unw_backtrace-method.patch
@@ -0,0 +1,56 @@
+From bf7c0933d65eb811c993ff32fdc6b65f6befc5af Mon Sep 17 00:00:00 2001
+From: Maksim Kita <maksim-kita@yandex-team.ru>
+Date: Sun, 23 May 2021 10:27:29 +0000
+Subject: [PATCH] libunwind: Added unw_backtrace method
+
+Source: https://github.com/ClickHouse-Extras/libunwind/commit/52f0f7861926=
cbfaef7e6c97d8a6d7ba2a1f6747#diff-a82fc885e2e4facf4b92d26171c13aa4aa5db296f=
77e1158ba2f8664e3bd1f5c
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libunwind/include/libunwind.h |  1 +
+ libunwind/src/libunwind.cpp   | 20 ++++++++++++++++++++
+ 2 files changed, 21 insertions(+)
+
+diff --git a/libunwind/include/libunwind.h b/libunwind/include/libunwind.h
+index 56ca7110274a..60a27f28100b 100644
+--- a/libunwind/include/libunwind.h
++++ b/libunwind/include/libunwind.h
+@@ -235,6 +235,7 @@ extern int unw_is_signal_frame(unw_cursor_t *) LIBUNWI=
ND_AVAIL;
+ extern int unw_get_proc_name(unw_cursor_t *, char *, size_t, unw_word_t *=
) LIBUNWIND_AVAIL;
+ //extern int       unw_get_save_loc(unw_cursor_t*, int, unw_save_loc_t*);
+ extern const char *unw_strerror(int) LIBUNWIND_AVAIL;
++extern int unw_backtrace(void **, int) LIBUNWIND_AVAIL;
+=20
+ extern unw_addr_space_t unw_local_addr_space;
+=20
+diff --git a/libunwind/src/libunwind.cpp b/libunwind/src/libunwind.cpp
+index 7ffffc2a30c0..ed0b394cb002 100644
+--- a/libunwind/src/libunwind.cpp
++++ b/libunwind/src/libunwind.cpp
+@@ -531,6 +531,26 @@ int __unw_remove_find_dynamic_unwind_sections(
+=20
+ #endif // __APPLE__
+=20
++int unw_backtrace(void **buffer, int size) {
++  unw_context_t context;
++  unw_cursor_t cursor;
++  if (unw_getcontext(&context) || unw_init_local(&cursor, &context)) {
++    return 0;
++  }
++
++  unw_word_t ip;
++  int current =3D 0;
++  while (unw_step(&cursor) > 0) {
++    if (current >=3D size || unw_get_reg(&cursor, UNW_REG_IP, &ip)) {
++      break;
++    }
++
++    buffer[current++] =3D reinterpret_cast<void *>(static_cast<uintptr_t>=
(ip));
++  }
++
++  return current;
++}
++
+ // Add logging hooks in Debug builds only
+ #ifndef NDEBUG
+ #include <stdlib.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0020-lldb-Link=
-with-libatomic-on-x86.patch b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.=
1.8/0020-lldb-Link-with-libatomic-on-x86.patch
new file mode 100644
index 00000000..b9f7270f
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0020-lldb-Link-with-l=
ibatomic-on-x86.patch
@@ -0,0 +1,33 @@
+From 94c6e940ddc44922ee505993549477a0fa7ac50d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Feb 2022 01:31:26 -0800
+Subject: [PATCH] lldb: Link with libatomic on x86
+
+cmake atomic check is not sufficient for i686 target where clang14 still
+generates __atomic_store calls but the check does not entail this
+function and happily thinks that compiler can resolve all atomic via intri=
nsics
+on i686, but thats not the case, ideally the check for determining
+atomic operation should be make more robust but until then lets ask to
+link with libatomic on i686/linux
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lldb/source/Utility/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lldb/source/Utility/CMakeLists.txt b/lldb/source/Utility/CMak=
eLists.txt
+index 04f1692e53b3..da0a48d9da54 100644
+--- a/lldb/source/Utility/CMakeLists.txt
++++ b/lldb/source/Utility/CMakeLists.txt
+@@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES "Windows")
+   list(APPEND LLDB_SYSTEM_LIBS ws2_32 rpcrt4)
+ endif ()
+=20
++if (CMAKE_SYSTEM_PROCESSOR MATCHES "i686" AND CMAKE_SYSTEM_NAME MATCHES "=
Linux")
++    list(APPEND LLDB_SYSTEM_LIBS atomic)
++endif()
++
+ if (NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB )
+     list(APPEND LLDB_SYSTEM_LIBS atomic)
+ endif()
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0021-compiler-=
rt-Enable-__int128-for-ppc32.patch b/meta-ti-bsp/recipes-graphics/mesa/libc=
lc-22.1.8/0021-compiler-rt-Enable-__int128-for-ppc32.patch
new file mode 100644
index 00000000..89b492b8
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0021-compiler-rt-Enab=
le-__int128-for-ppc32.patch
@@ -0,0 +1,70 @@
+From 968515d7aa2d7e4af5f318618c307dbe21538650 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Mar 2022 16:28:16 -0800
+Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/builtins/CMakeLists.txt | 13 ++++++-------
+ compiler-rt/lib/builtins/int_types.h    |  2 +-
+ 2 files changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/bui=
ltins/CMakeLists.txt
+index c3dbd65998f1..b3a44ea3c3b3 100644
+--- a/compiler-rt/lib/builtins/CMakeLists.txt
++++ b/compiler-rt/lib/builtins/CMakeLists.txt
+@@ -813,11 +813,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
+=20
+ set(nvptx64_SOURCES ${GENERIC_SOURCES})
+=20
+-set(powerpc_SOURCES ${GENERIC_SOURCES})
+-
+ set(powerpcspe_SOURCES ${GENERIC_SOURCES})
+=20
+-set(powerpc64_SOURCES
++set(powerpc_SOURCES
+   ppc/divtc3.c
+   ppc/fixtfdi.c
+   ppc/fixunstfdi.c
+@@ -832,14 +830,15 @@ set(powerpc64_SOURCES
+ )
+ # These routines require __int128, which isn't supported on AIX.
+ if (NOT OS_NAME MATCHES "AIX")
+-  set(powerpc64_SOURCES
++  set(powerpc_SOURCES
+     ppc/floattitf.c
+     ppc/fixtfti.c
+     ppc/fixunstfti.c
+-    ${powerpc64_SOURCES}
++    ${powerpc_SOURCES}
+   )
+ endif()
+-set(powerpc64le_SOURCES ${powerpc64_SOURCES})
++set(powerpc64le_SOURCES ${powerpc_SOURCES})
++set(powerpc64_SOURCES ${powerpc_SOURCES})
+=20
+ set(riscv_SOURCES
+   cpu_model/riscv.c
+@@ -1014,7 +1013,7 @@ else ()
+=20
+       # For RISCV32 and 32-bit SPARC, we must force enable int128 for com=
piling long
+       # double routines.
+-      if (COMPILER_RT_ENABLE_SOFTWARE_INT128 OR ("${arch}" MATCHES "riscv=
32|sparc$"
++      if (COMPILER_RT_ENABLE_SOFTWARE_INT128 OR ("${arch}" MATCHES "riscv=
32|powerpc|sparc$"
+         AND NOT CMAKE_COMPILER_IS_GNUCC))
+         list(APPEND BUILTIN_CFLAGS_${arch} -fforce-enable-int128)
+       endif()
+diff --git a/compiler-rt/lib/builtins/int_types.h b/compiler-rt/lib/builti=
ns/int_types.h
+index 7c7f8cb64aa9..81386f1b99b0 100644
+--- a/compiler-rt/lib/builtins/int_types.h
++++ b/compiler-rt/lib/builtins/int_types.h
+@@ -64,7 +64,7 @@ typedef union {
+ } udwords;
+=20
+ #if defined(__LP64__) || defined(__wasm__) || defined(__mips64) ||       =
      \
+-    defined(__SIZEOF_INT128__) || defined(_WIN64)
++    defined(__SIZEOF_INT128__) || defined(_WIN64) || defined(__powerpc__)
+ #define CRT_HAS_128BIT
+ #endif
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0022-llvm-Do-n=
ot-use-cmake-infra-to-detect-libzstd.patch b/meta-ti-bsp/recipes-graphics/m=
esa/libclc-22.1.8/0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
new file mode 100644
index 00000000..cccb1e98
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0022-llvm-Do-not-use-=
cmake-infra-to-detect-libzstd.patch
@@ -0,0 +1,62 @@
+From 8c5fc285de0051107aa9b7e2e269aa2667fd16f4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Aug 2022 11:50:57 -0700
+Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
+
+OE's version is build using plain make not cmake as a result we do not
+have the cmake support files and this probing method can get this info
+from build host and force linking with libzstd from /usr/lib which is
+not what we want when cross building.
+
+Fixes errors building llvm-config like
+/usr/lib/libzstd.so.1.5.2: error adding symbols: file in wrong
+format
+| clang-15: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
+| ninja: build stopped: subcommand failed.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/lib/Support/CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/llvm/lib/Support/CMakeLists.txt b/llvm/lib/Support/CMakeLists=
.txt
+index 099b0e55579b..8c35b8a31457 100644
+--- a/llvm/lib/Support/CMakeLists.txt
++++ b/llvm/lib/Support/CMakeLists.txt
+@@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)
+ endif()
+=20
+ if(LLVM_ENABLE_ZLIB)
+-  list(APPEND imported_libs ZLIB::ZLIB)
++  list(APPEND imported_libs z)
+ endif()
+=20
+ if(LLVM_ENABLE_ZSTD)
+@@ -34,7 +34,7 @@ if(LLVM_ENABLE_ZSTD)
+ endif()
+=20
+ if(LLVM_ENABLE_ZSTD)
+-  list(APPEND imported_libs ${zstd_target})
++  list(APPEND imported_libs zstd)
+ endif()
+=20
+ if( WIN32 )
+@@ -351,7 +351,7 @@ if(LLVM_ENABLE_ZLIB)
+     get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY LOCATION)
+   endif()
+   get_library_name(${zlib_library} zlib_library)
+-  set(llvm_system_libs ${llvm_system_libs} "${zlib_library}")
++  set(llvm_system_libs ${llvm_system_libs} z)
+ endif()
+=20
+ if(LLVM_ENABLE_ZSTD)
+@@ -365,7 +365,7 @@ if(LLVM_ENABLE_ZSTD)
+   endif()
+   if (zstd_target STREQUAL zstd::libzstd_shared)
+     get_library_name(${zstd_library} zstd_library)
+-    set(llvm_system_libs ${llvm_system_libs} "${zstd_library}")
++    set(llvm_system_libs ${llvm_system_libs} zstd)
+   else()
+     set(llvm_system_libs ${llvm_system_libs} "${zstd_STATIC_LIBRARY}")
+   endif()
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0023-compiler-=
rt-Fix-stat-struct-s-size-for-O32-ABI.patch b/meta-ti-bsp/recipes-graphics/=
mesa/libclc-22.1.8/0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
new file mode 100644
index 00000000..a498c36b
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0023-compiler-rt-Fix-=
stat-struct-s-size-for-O32-ABI.patch
@@ -0,0 +1,46 @@
+From 4a114f5fcd2ab8870b26ba3df4747fc066933f66 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Jan 2023 18:44:34 -0800
+Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
+
+stat struct size differs on glibc based on ABI choices e.g. 64bit off_t
+and/or 64bit time_t will make this size different. Therefore separate
+out the O32 case out, makes it more readable.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../sanitizer_platform_limits_posix.h               | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_po=
six.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
+index 05ebee49f2ab..89c4dcaf3e3d 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -100,6 +100,18 @@ const unsigned struct_kernel_stat64_sz =3D 104;
+ const unsigned struct_kernel_stat_sz =3D 144;
+ const unsigned struct_kernel_stat64_sz =3D 104;
+ #    elif defined(__mips__)
++#if defined(__mips_o32) // O32 ABI
++#if _TIME_BITS =3D=3D 64
++const unsigned struct_kernel_stat_sz =3D 112;
++const unsigned struct_kernel_stat64_sz =3D 112;
++#elif _FILE_OFFSET_BITS =3D=3D 64
++const unsigned struct_kernel_stat_sz =3D 160;
++const unsigned struct_kernel_stat64_sz =3D 160;
++#else
++const unsigned struct_kernel_stat_sz =3D 144;
++const unsigned struct_kernel_stat64_sz =3D 160;
++#endif
++#else //__mips_o32
+ const unsigned struct_kernel_stat_sz =3D SANITIZER_ANDROID
+                                            ? FIRST_32_SECOND_64(104, 128)
+ #      if defined(_ABIN32) && _MIPS_SIM =3D=3D _ABIN32
+@@ -110,6 +122,7 @@ const unsigned struct_kernel_stat_sz =3D SANITIZER_AND=
ROID
+                                            : FIRST_32_SECOND_64(160, 216);
+ #      endif
+ const unsigned struct_kernel_stat64_sz =3D 104;
++#endif
+ #    elif defined(__s390__) && !defined(__s390x__)
+ const unsigned struct_kernel_stat_sz =3D 64;
+ const unsigned struct_kernel_stat64_sz =3D 104;
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0024-ToolChain=
s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch b/meta-ti-bsp/recipes-graph=
ics/mesa/libclc-22.1.8/0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-li=
b32.patch
new file mode 100644
index 00000000..09224af3
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0024-ToolChains-Gnu.c=
pp-ARMLibDirs-search-also-in-lib32.patch
@@ -0,0 +1,81 @@
+From 27e4b9755ddd3bec16a851cce0df48e909ae6438 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 31 Aug 2023 18:14:47 +0200
+Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
+
+* in some strange multilib configs we build lib32-image where
+  32bit libs are in /usr/lib32 and 64bit in /usr/lib64 but in such
+  setup the clang search for GCC candidate installation doesn't
+  check lib32 directory in sysroot and fails to find the installation
+
+  X86LibDirs was already searching in lib32 for very long time:
+  https://github.com/llvm/llvm-project/commit/621fed5f5a051a0333415aaed75b=
8f2ed2350dbd
+  but ARMLibDirs didn't include it for some reason.
+
+* if we don't add lib32 for arm in getOSLibDir(), then it will
+  find -lgcc, crtbeginS.o, crtendS.o, but still fail to find
+  -lgcc_s, -lc, Scrt1.o, crti.o, crtn.o
+
+* fixes lib32-compiler-rt build failure:
+
+-- Configuring incomplete, errors occurred!
+CMake Error at TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/l=
ib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/share/cmake-3.26/Modules/=
CMakeTestCCompiler.cmake:67 (message):
+  The C compiler
+
+    "TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compi=
ler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm=
-oemllib32-linux-gnueabi-clang"
+
+  is not able to compile a simple test program.
+
+  It fails with the following output:
+
+    Change Dir: TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/=
lib32-compiler-rt/16.0.6/build/CMakeFiles/CMakeScratch/TryCompile-rWXyQZ
+
+    Run Build Command(s):ninja -v cmTC_84d18 && [1/2] TOPDIR/BUILD/work/ra=
spberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysro=
ot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm-oemllib32-linux-gnueabi-c=
lang --target=3Darm-oemllib32-linux-gnueabi --sysroot=3DTOPDIR/BUILD/work/r=
aspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recip=
e-sysroot   -target arm-oemllib32-linux-gnueabi  -march=3Darmv7ve -mthumb -=
mfpu=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -mlittle-endian --dyld-prefix=3D/usr=
 -Qunused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=
=3Dreturn-type -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3DTOPD=
IR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.=
0.6/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types   -fm=
acro-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/gi=
t=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR=
/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32=
-compiler-rt/16.0.6-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4=
_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug=
/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspbe=
rrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src=
/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/=
raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-reci=
pe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemll=
ib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebu=
g-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/li=
b32-compiler-rt/16.0.6/recipe-sysroot-native=3D    -fPIE -MD -MT CMakeFiles=
/cmTC_84d18.dir/testCCompiler.c.o -MF CMakeFiles/cmTC_84d18.dir/testCCompil=
er.c.o.d -o CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -c TOPDIR/BUILD/wor=
k/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build/CM=
akeFiles/CMakeScratch/TryCompile-rWXyQZ/testCCompiler.c
+    [2/2] : && TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/l=
ib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-g=
nueabi/arm-oemllib32-linux-gnueabi-clang --target=3Darm-oemllib32-linux-gnu=
eabi --sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/=
lib32-compiler-rt/16.0.6/lib32-recipe-sysroot -target arm-oemllib32-linux-g=
nueabi  -march=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -m=
little-endian --dyld-prefix=3D/usr -Qunused-arguments -funwind-tables -fsta=
ck-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -=
Werror=3Dformat-security -Werror=3Dreturn-type -D_TIME_BITS=3D64 -D_FILE_OF=
FSET_BITS=3D64  --sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-lin=
ux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -O2 -pipe -g -fel=
iminate-unused-debug-types   -fmacro-prefix-map=3DTOPDIR/BUILD/work-shared/=
llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6=
-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0=
.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=
=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler=
-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-pref=
ix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-co=
mpiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebu=
g-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/li=
b32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR=
/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.=
6/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberry=
pi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-nati=
ve=3D -target arm-oemllib32-linux-gnueabi  -march=3Darmv7ve -mthumb -mfpu=
=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -mlittle-endian --dyld-prefix=3D/usr -Qu=
nused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SO=
URCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dret=
urn-type -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3DTOPDIR/BUI=
LD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/li=
b32-recipe-sysroot  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -fmacr=
o-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=
=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/=
BUILD/work-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-=
compiler-rt/16.0.6-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_=
64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/=
lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspber=
rypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/=
debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/r=
aspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recip=
e-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemlli=
b32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebug=
-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib=
32-compiler-rt/16.0.6/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now -unwind=
lib=3Dlibgcc -rtlib=3Dlibgcc -stdlib=3Dlibstdc++   -fuse-ld=3Dlld -Wl,-O1 -=
Wl,--hash-style=3Dgnu -Wl,--as-needed   -fmacro-prefix-map=3DTOPDIR/BUILD/w=
ork-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compile=
r-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-=
source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-=
prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib3=
2-compiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -f=
debug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueab=
i/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-=
r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-=
gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-ma=
p=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compile=
r-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work=
/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sy=
sroot-native=3D  -Wl,-z,relro,-z,now -unwindlib=3Dlibgcc -rtlib=3Dlibgcc -s=
tdlib=3Dlibstdc++   -fuse-ld=3Dlld CMakeFiles/cmTC_84d18.dir/testCCompiler.=
c.o -o cmTC_84d18   && :
+    FAILED: cmTC_84d18
+    : && TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-c=
ompiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi=
/arm-oemllib32-linux-gnueabi-clang --target=3Darm-oemllib32-linux-gnueabi -=
-sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-=
compiler-rt/16.0.6/lib32-recipe-sysroot -target arm-oemllib32-linux-gnueabi=
  -march=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -mlittle=
-endian --dyld-prefix=3D/usr -Qunused-arguments -funwind-tables -fstack-pro=
tector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security -Werror=3Dreturn-type -D_TIME_BITS=3D64 -D_FILE_OFFSET_B=
ITS=3D64  --sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnu=
eabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -O2 -pipe -g -feliminat=
e-unused-debug-types   -fmacro-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-p=
roject-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -=
fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/=
git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=3DTOPD=
IR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.=
0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=
=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler=
-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-pref=
ix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-co=
mpiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD=
/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib3=
2-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64=
-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native=3D =
-target arm-oemllib32-linux-gnueabi  -march=3Darmv7ve -mthumb -mfpu=3Dneon-=
vfpv4 -mfloat-abi=3Dsoftfp -mlittle-endian --dyld-prefix=3D/usr -Qunused-ar=
guments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2=
 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type=
 -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3DTOPDIR/BUILD/work/=
raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-reci=
pe-sysroot  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -fmacro-prefix=
-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=3D/usr/sr=
c/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work=
-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-r=
t/16.0.6-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib=
32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/lib32-comp=
iler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-o=
emllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/lib3=
2-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi=
4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=
=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux=
-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebug-prefix-m=
ap=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compil=
er-rt/16.0.6/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now -unwindlib=3Dlib=
gcc -rtlib=3Dlibgcc -stdlib=3Dlibstdc++   -fuse-ld=3Dlld -Wl,-O1 -Wl,--hash=
-style=3Dgnu -Wl,--as-needed   -fmacro-prefix-map=3DTOPDIR/BUILD/work-share=
d/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0=
.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16=
.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-ma=
p=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compile=
r-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-pre=
fix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-c=
ompiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdeb=
ug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/l=
ib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDI=
R/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0=
.6/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberr=
ypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-nat=
ive=3D  -Wl,-z,relro,-z,now -unwindlib=3Dlibgcc -rtlib=3Dlibgcc -stdlib=3Dl=
ibstdc++   -fuse-ld=3Dlld CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -o cm=
TC_84d18   && :
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open Scrt1.o: No suc=
h file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crti.o: No such=
 file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtbeginS.o: No=
 such file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgc=
c_s
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgc=
c_s
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtendS.o: No s=
uch file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtn.o: No such=
 file or directory
+    clang-16: error: linker command failed with exit code 1 (use -v to see=
 invocation)
+    ninja: build stopped: subcommand failed.
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 2 +-
+ clang/lib/Driver/ToolChains/Linux.cpp | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index 80fd8058bd98..37cb6cfdf2da 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2346,7 +2346,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(
+   static const char *const AArch64beLibDirs[] =3D {"/lib"};
+   static const char *const AArch64beTriples[] =3D {"aarch64_be-none-linux=
-gnu"};
+=20
+-  static const char *const ARMLibDirs[] =3D {"/lib"};
++  static const char *const ARMLibDirs[] =3D {"/lib", "/lib32"};
+   static const char *const ARMTriples[] =3D {"arm-linux-gnueabi"};
+   static const char *const ARMHFTriples[] =3D {"arm-linux-gnueabihf",
+                                              "armv7hl-redhat-linux-gnueab=
i",
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 9fed904c05c2..5bb66c9faa1f 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -198,6 +198,7 @@ static StringRef getOSLibDir(const llvm::Triple &Tripl=
e, const ArgList &Args) {
+   // reasoning about oslibdir spellings with the lib dir spellings in the
+   // GCCInstallationDetector, but that is a more significant refactoring.
+   if (Triple.getArch() =3D=3D llvm::Triple::x86 || Triple.isPPC32() ||
++      Triple.getArch() =3D=3D llvm::Triple::arm || Triple.getArch() =3D=
=3D llvm::Triple::thumb ||
+       Triple.getArch() =3D=3D llvm::Triple::sparc)
+     return "lib32";
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0025-clang-llv=
m-Add-OE-specific-ABI-triple-for-N32-ABI.patch b/meta-ti-bsp/recipes-graphi=
cs/mesa/libclc-22.1.8/0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-AB=
I.patch
new file mode 100644
index 00000000..c93a9ec7
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0025-clang-llvm-Add-O=
E-specific-ABI-triple-for-N32-ABI.patch
@@ -0,0 +1,78 @@
+From 7023d17f81a472e72a5739e007b9e7148d105137 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Feb 2024 16:47:10 -0800
+Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
+
+Its gnun32 when using OE
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp | 4 ++--
+ llvm/lib/TargetParser/Triple.cpp      | 4 +++-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index 37cb6cfdf2da..bcd7d345c25a 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2415,6 +2415,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(
+=20
+   static const char *const MIPSN32LibDirs[] =3D {"/lib32"};
+   static const char *const MIPSN32Triples[] =3D {"mips64-linux-gnuabin32",
++                                               "mips64-linux-gnun32",
+                                                "mipsisa64r6-linux-gnuabin=
32"};
+   static const char *const MIPSN32ELLibDirs[] =3D {"/lib32"};
+   static const char *const MIPSN32ELTriples[] =3D {
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 5bb66c9faa1f..c6d6e20dbc4d 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -138,7 +138,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+     return IsMipsR6 ? "mipsisa32r6el-linux-gnu" : "mipsel-linux-gnu";
+   case llvm::Triple::mips64: {
+     std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6" : "mips64") +
+-                     "-linux-" + (IsMipsN32Abi ? "gnuabin32" : "gnuabi64"=
);
++                     "-linux-" + (IsMipsN32Abi ? "gnun32" : "gnu");
+     if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
+       return MT;
+     if (D.getVFS().exists(concat(SysRoot, "/lib/mips64-linux-gnu")))
+@@ -147,7 +147,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+   }
+   case llvm::Triple::mips64el: {
+     std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6el" : "mips64el=
") +
+-                     "-linux-" + (IsMipsN32Abi ? "gnuabin32" : "gnuabi64"=
);
++                     "-linux-" + (IsMipsN32Abi ? "gnun32" : "gnu");
+     if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
+       return MT;
+     if (D.getVFS().exists(concat(SysRoot, "/lib/mips64el-linux-gnu")))
+diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Trip=
le.cpp
+index 86b74451ec0d..d94b7d44d11a 100644
+--- a/llvm/lib/TargetParser/Triple.cpp
++++ b/llvm/lib/TargetParser/Triple.cpp
+@@ -358,7 +358,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentTy=
pe Kind) {
+   case GNU: return "gnu";
+   case GNUT64: return "gnut64";
+   case GNUABI64: return "gnuabi64";
+-  case GNUABIN32: return "gnuabin32";
++  case GNUABIN32: return "gnun32";
+   case GNUEABI: return "gnueabi";
+   case GNUEABIT64: return "gnueabit64";
+   case GNUEABIHF: return "gnueabihf";
+@@ -762,6 +762,7 @@ static Triple::EnvironmentType parseEnvironment(String=
Ref EnvironmentName) {
+       .StartsWith("eabihf", Triple::EABIHF)
+       .StartsWith("eabi", Triple::EABI)
+       .StartsWith("gnuabin32", Triple::GNUABIN32)
++      .StartsWith("gnun32", Triple::GNUABIN32)
+       .StartsWith("gnuabi64", Triple::GNUABI64)
+       .StartsWith("gnueabihft64", Triple::GNUEABIHFT64)
+       .StartsWith("gnueabihf", Triple::GNUEABIHF)
+@@ -1087,6 +1088,7 @@ Triple::Triple(std::string &&Str) : Data(std::move(S=
tr)) {
+       Environment =3D
+           StringSwitch<Triple::EnvironmentType>(Components[0])
+               .StartsWith("mipsn32", Triple::GNUABIN32)
++              .StartsWith("mips64-n32", Triple::GNUABIN32)
+               .StartsWith("mips64", Triple::GNUABI64)
+               .StartsWith("mipsisa64", Triple::GNUABI64)
+               .StartsWith("mipsisa32", Triple::GNU)
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0026-llvm-Add-=
libunwind.pc.in-and-llvm-config-scripts.patch b/meta-ti-bsp/recipes-graphic=
s/mesa/libclc-22.1.8/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.=
patch
new file mode 100644
index 00000000..72ffdc6c
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0026-llvm-Add-libunwi=
nd.pc.in-and-llvm-config-scripts.patch
@@ -0,0 +1,54 @@
+From 17a1a4919c0ff554fc30bbb85a63b9d2a1164324 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 14 May 2024 22:04:43 -0700
+Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
+
+These are added by OE project
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ libunwind/libunwind.pc.in          |  9 ++++++
+ llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+)
+ create mode 100644 libunwind/libunwind.pc.in
+ create mode 100644 llvm/tools/llvm-config/llvm-config
+
+diff --git a/libunwind/libunwind.pc.in b/libunwind/libunwind.pc.in
+new file mode 100644
+index 000000000000..a93d676604f9
+--- /dev/null
++++ b/libunwind/libunwind.pc.in
+@@ -0,0 +1,9 @@
++prefix=3D/usr
++exec_prefix=3D/usr
++libdir=3D@LIBDIR@
++includedir=3D/usr/include
++
++Name: libunwind
++Description: libunwind base library
++Version: @VERSION@
++Libs: -lunwind
+diff --git a/llvm/tools/llvm-config/llvm-config b/llvm/tools/llvm-config/l=
lvm-config
+new file mode 100644
+index 000000000000..6a0dd54b8eab
+--- /dev/null
++++ b/llvm/tools/llvm-config/llvm-config
+@@ -0,0 +1,15 @@
++#!/bin/bash
++#
++# The llvm-config wrapper will act as a pure pass-through to the native l=
lvm-config
++# while preserving Yocto-specific environment variables used for alternat=
e executable
++# and library path resolution.
++#
++SCRIPT_DIR=3D"$(dirname "$(readlink -f "$0")")"
++NEXT_LLVM_CONFIG=3D"@LLVM_CONFIG_PATH@"
++export YOCTO_ALTERNATE_EXE_PATH=3D"${YOCTO_ALTERNATE_EXE_PATH:=3D"$(readl=
ink -f "$SCRIPT_DIR/../llvm-config")"}"
++if [ -d "$(readlink -f "$SCRIPT_DIR/../../lib64")" ]; then
++    export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERNATE_LIBDIR:=3D"/lib64"=
}"
++else
++    export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERNATE_LIBDIR:=3D"/lib"}"
++fi
++exec "$NEXT_LLVM_CONFIG" "$@"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0027-scan-buil=
d-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like=
-other-.patch
new file mode 100644
index 00000000..934d5adc
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0027-scan-build-py-re=
spect-LLVM_LIBDIR_SUFFIX-like-other-.patch
@@ -0,0 +1,89 @@
+From a2171be64a181e0b263fc8ec31a760193651203c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 13 Sep 2024 13:38:08 +0200
+Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tool=
s do
+
+* other libraries are installed in 'lib64' or 'lib32' based on
+  LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always
+  installed in 'lib'
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1085=
49]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ clang/tools/scan-build-py/CMakeLists.txt | 26 ++++++++++++------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+Index: llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- llvm-project-22.1.2.src.orig/clang/tools/scan-build-py/CMakeLists.txt
++++ llvm-project-22.1.2.src/clang/tools/scan-build-py/CMakeLists.txt
+@@ -80,52 +80,52 @@ if(CLANG_INSTALL_SCANBUILDPY)
+   endforeach()
+=20
+   foreach(lib ${LibScanbuild})
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib}
++    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX=
}/libscanbuild/${lib}
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+                          ${CMAKE_BINARY_DIR}/lib
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/lib=
scanbuild
+                        COMMAND ${CMAKE_COMMAND} -E copy
+                          ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${l=
ib}
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild/
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/lib=
scanbuild/
+                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbui=
ld/${lib})
+-    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib})
++    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libs=
canbuild/${lib})
+     install(FILES lib/libscanbuild/${lib}
+-            DESTINATION lib/libscanbuild
++            DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
+             COMPONENT scan-build-py)
+   endforeach()
+=20
+   foreach(resource ${LibScanbuildResources})
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/resour=
ces/${resource}
++    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX=
}/libscanbuild/resources/${resource}
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+                          ${CMAKE_BINARY_DIR}/lib
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/lib=
scanbuild
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/lib=
scanbuild/resources
+                        COMMAND ${CMAKE_COMMAND} -E copy
+                          ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/res=
ources/${resource}
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/lib=
scanbuild/resources
+                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbui=
ld/resources/${resource})
+-    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${=
resource})
++    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libs=
canbuild/resources/${resource})
+     install(FILES lib/libscanbuild/resources/${resource}
+-            DESTINATION lib/libscanbuild/resources
++            DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
+             COMPONENT scan-build-py)
+   endforeach()
+=20
+   foreach(lib ${LibEar})
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libear/${lib}
++    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX=
}/libear/${lib}
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+                          ${CMAKE_BINARY_DIR}/lib
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libear
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/lib=
ear
+                        COMMAND ${CMAKE_COMMAND} -E copy
+                          ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib}
+-                         ${CMAKE_BINARY_DIR}/lib/libear/
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/lib=
ear/
+                        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${l=
ib})
+-    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libear/${lib})
++    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libe=
ar/${lib})
+     install(FILES lib/libear/${lib}
+-            DESTINATION lib/libear
++            DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libear
+             COMPONENT scan-build-py)
+   endforeach()
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0028-compiler-=
rt-Do-not-pass-target-to-clang-compiler.patch b/meta-ti-bsp/recipes-graphic=
s/mesa/libclc-22.1.8/0028-compiler-rt-Do-not-pass-target-to-clang-compiler.=
patch
new file mode 100644
index 00000000..fe24fe05
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0028-compiler-rt-Do-n=
ot-pass-target-to-clang-compiler.patch
@@ -0,0 +1,29 @@
+From 6b1f360c66b60c4bb639057590a8b2162d3bcf6b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Mar 2025 00:30:38 -0700
+Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
+
+In OE we use <tuple>-clang and <tuple>-clang++ which
+should resolve the --target correctly.
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/fuzzer/CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/compiler-rt/lib/fuzzer/CMakeLists.txt b/compiler-rt/lib/fuzze=
r/CMakeLists.txt
+index a57e2fe46245..2928ed2ab6d5 100644
+--- a/compiler-rt/lib/fuzzer/CMakeLists.txt
++++ b/compiler-rt/lib/fuzzer/CMakeLists.txt
+@@ -140,10 +140,6 @@ if(OS_NAME MATCHES "Android|Linux|Fuchsia" AND
+    COMPILER_RT_LIBCXXABI_PATH)
+   macro(partially_link_libcxx name dir arch)
+     get_target_flags_for_arch(${arch} target_cflags)
+-    if(CMAKE_CXX_COMPILER_ID MATCHES Clang)
+-      get_compiler_rt_target(${arch} target)
+-      set(target_cflags --target=3D${target} ${target_cflags})
+-    endif()
+     set(cxx_${arch}_merge_dir "${CMAKE_CURRENT_BINARY_DIR}/cxx_${arch}_me=
rge.dir")
+     file(MAKE_DIRECTORY ${cxx_${arch}_merge_dir})
+     add_custom_command(TARGET clang_rt.${name}-${arch} POST_BUILD
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0029-AsmMatche=
rEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-nam=
e-as-we.patch
new file mode 100644
index 00000000..413bc3f2
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0029-AsmMatcherEmitte=
r-sort-ClassInfo-lists-by-name-as-we.patch
@@ -0,0 +1,31 @@
+From 281cd05306cbfa5744e4a1f3ebf5c745324efe7a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 27 Nov 2020 10:11:08 +0000
+Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
+
+Otherwise, there are instances which are identical in
+every other field and therefore sort non-reproducibly
+(which breaks binary and source reproducibiliy).
+
+Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableG=
en/AsmMatcherEmitter.cpp
+index e6085af5aa91..b0180638c754 100644
+--- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
++++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
+@@ -384,7 +384,10 @@ public:
+     // name of a class shouldn't be significant. However, some of the bac=
kends
+     // accidentally rely on this behaviour, so it will have to stay like =
this
+     // until they are fixed.
+-    return ValueName < RHS.ValueName;
++    if (ValueName !=3D RHS.ValueName)
++        return ValueName < RHS.ValueName;
++    // All else being equal, we should sort by name, for source and binar=
y reproducibility
++    return Name < RHS.Name;
+   }
+ };
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0030-llvm-conf=
ig-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta-ti-bsp/recipes-grap=
hics/mesa/libclc-22.1.8/0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-o=
utput.patch
new file mode 100644
index 00000000..e0597488
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0030-llvm-config-remo=
ve-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -0,0 +1,32 @@
+From cbc2595eed96fa7de77162e4c7b99681579d01ef Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 2 Apr 2025 17:05:17 +0300
+Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
+
+On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
+depend on exact build dir and as such be inappropriate to binaries
+shared through sstate-cache. It is not possible to override this
+behaviour in llvm-config since crossscripts are not being used for
+native builds. As a OE-specific modification ignore LLVM_LDFLAGS for
+native builds.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-conf=
ig/llvm-config.cpp
+index 0a3f51ae2b83..5c95a1f3ff24 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -576,7 +576,7 @@ int main(int argc, char **argv) {
+             HostTriple.isWindowsMSVCEnvironment() ? "-LIBPATH:" : "-L";
+         LDFlags +=3D ActiveLibDir;
+         MaybePrintQuoted(LDFlags);
+-        OS << ' ' << LLVM_LDFLAGS << '\n';
++        OS << '\n';
+       } else if (Arg =3D=3D "--system-libs") {
+         PrintSystemLibs =3D true;
+       } else if (Arg =3D=3D "--libs") {
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0031-compiler-=
rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0031-compiler-rt-Exclude-sync_fetch_and_-for-any-p=
re-ARMv.patch
new file mode 100644
index 00000000..52bdeaf9
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0031-compiler-rt-Excl=
ude-sync_fetch_and_-for-any-pre-ARMv.patch
@@ -0,0 +1,64 @@
+From 3a486a17b697c65cdc7d2c17d9e14f2bfc2be911 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 May 2025 14:03:12 -0700
+Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6
+ targets
+
+Sometimes builds may happen where ABI is not indidated by host_triple
+e.g. on Yocto the compiler used is called arm-poky-linux-gnueabi-clang
+for all arm32 cross compilers, it passed the ABI flags on cmdline in
+addition. e.g.
+
+-march=3Darmv5te -mfloat-abi=3Dsoft
+or
+-march=3Darmv7-a -mfloat-abi=3Dhard
+
+compiler-rt's makery tries to add arm to COMPILER_RT_SUPPORTED_ARCH
+deducing it from triple name.
+
+which ends up choosing `arm` as one of compiler-rt arch to build for.
+This arch is however using armv7+ defaults and then tried to build sync
+builtins using
+
+arm-poky-linux-gnueabi-clang -march=3Darmv5te -mfloat-abi=3Dsoft ...
+
+Which does not compile correctly, in such cases it should simply
+remove the sync builtins from list of things to build similar to what
+is done when we use armv4t or armv5t
+
+set(armv4t_SOURCES ${arm_min_SOURCES})
+set(armv5te_SOURCES ${arm_min_SOURCES})
+
+This lets compiler-rt build for arm architectures without depending
+upong compiler triple, but instead of poking the compiler for what
+it is building for
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1394=
11]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/builtins/CMakeLists.txt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/bui=
ltins/CMakeLists.txt
+index b3a44ea3c3b3..4a328ab0ca26 100644
+--- a/compiler-rt/lib/builtins/CMakeLists.txt
++++ b/compiler-rt/lib/builtins/CMakeLists.txt
+@@ -975,6 +975,18 @@ else ()
+         ${TARGET_${arch}_CFLAGS})
+       list(JOIN CMAKE_REQUIRED_FLAGS " " CMAKE_REQUIRED_FLAGS)
+       message(STATUS "Performing additional configure checks with target =
flags: ${CMAKE_REQUIRED_FLAGS}")
++      # For ARM archs, exclude any sync builtins if dmb or mcr p15, #0, r=
0, c7, c10, #5
++      # is not supported
++      if (${arch} MATCHES "^(arm|armhf)$")
++        try_compile_only(COMPILER_RT_HAS_${arch}_SYNC
++                         SOURCE  "#if __ARM_ARCH < 6
++                                  #error DMB is only supported on ARMv6+ !
++                                  #endif
++                                  int main(void) { return 0; }")
++        if(NOT COMPILER_RT_HAS_${arch}_SYNC)
++          list(REMOVE_ITEM ${arch}_SOURCES ${arm_sync_SOURCES})
++        endif()
++      endif()
+       # For ARM archs, exclude any VFP builtins if VFP is not supported
+       if (${arch} MATCHES "^(arm|armhf|armv7|armv7s|armv7k|armv7m|armv7em=
|armv8m.main|armv8.1m.main)$")
+         check_compile_definition(__ARM_FP "${CMAKE_C_FLAGS}" COMPILER_RT_=
HAS_${arch}_VFP)
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0032-compiler-=
rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mi=
ps-Linu.patch
new file mode 100644
index 00000000..b0aae545
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0032-compiler-rt-Hard=
code-uptr-sptr-typedefs-on-Mips-Linu.patch
@@ -0,0 +1,35 @@
+From b71c398a1b10b29886c2db2a920f476fec6f7de2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 May 2025 21:50:45 -0700
+Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux
+
+Sanitizer build on Mips/Linux faills to build due to assertion errors
+mismatched definitions. This is due to inconsistent definitions of
+`uptr` of either `unsigned long` or `unsigned int` in compiler-rt. This
+is caused by clang defining
+
+__UINTPTR_TYPE__ long unsigned int where as gcc defines it as
+unsigned int
+
+As a workaround, this hardcodes `uptr`/`sptr` in compiler-rt to
+`unsigned int`/`int` on Linux Mips, matching gcc.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1412=
01]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h b/=
compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
+index c719e2a8ef60..60b997e653c4 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
+@@ -139,7 +139,7 @@
+ namespace __sanitizer {
+=20
+ #if defined(__UINTPTR_TYPE__)
+-#  if defined(__arm__) && defined(__linux__)
++#  if (defined(__arm__) || _ABIO32 =3D=3D 1) && defined(__linux__)
+ // Linux Arm headers redefine __UINTPTR_TYPE__ and disagree with clang/gc=
c.
+ typedef unsigned int uptr;
+ typedef int sptr;
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0034-Revert-li=
bc-Remap-headers-in-the-debug-info-when-bui.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0034-Revert-libc-Remap-headers-in-the-debug-info-w=
hen-bui.patch
new file mode 100644
index 00000000..57003dcf
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0034-Revert-libc-Rema=
p-headers-in-the-debug-info-when-bui.patch
@@ -0,0 +1,36 @@
+From 9ace97c0c2df52d823c9d5345cca0251bf2ccf16 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Jul 2025 19:12:13 -0700
+Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
+ building the library (#143004)"
+
+This reverts commit 4d50b405f1585ce172f87cb5f8daf3c1b4145215.
+
+There is a discussion on this issue on [1]
+I have discussed this on PR and also with developer on IRC, I am
+hoping that our position will be considered by 22.x release
+
+[1] https://github.com/llvm/llvm-project/pull/143004/
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcxx/include/CMakeLists.txt | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/libcxx/include/CMakeLists.txt b/libcxx/include/CMakeLists.txt
+index 787cfffa5019..d73bcd852a1e 100644
+--- a/libcxx/include/CMakeLists.txt
++++ b/libcxx/include/CMakeLists.txt
+@@ -1718,11 +1718,6 @@ add_dependencies(cxx-headers generate-cxx-headers)
+ target_include_directories(cxx-headers INTERFACE ${LIBCXX_GENERATED_INCLU=
DE_TARGET_DIR}
+                                                  ${LIBCXX_GENERATED_INCLU=
DE_DIR})
+=20
+-# Make sure to map the generated include directory back to libc++'s actua=
l source directory when generating
+-# debug information. Otherwise, the debug information will refer to gener=
ated headers which are created during
+-# the build and generally not persistent.
+-target_add_compile_flags_if_supported(cxx-headers INTERFACE "-fdebug-pref=
ix-map=3D${LIBCXX_GENERATED_INCLUDE_DIR}=3D${LIBCXX_SOURCE_DIR}/include")
+-
+ if (LIBCXX_INSTALL_HEADERS)
+   foreach(file ${files})
+     get_filename_component(dir ${file} DIRECTORY)
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0035-Prevent-r=
evisiting-block-when-searching-for-noreturn.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0035-Prevent-revisiting-block-when-searching-for-n=
oreturn.patch
new file mode 100644
index 00000000..6021f736
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0035-Prevent-revisiti=
ng-block-when-searching-for-noreturn.patch
@@ -0,0 +1,41 @@
+From 051b3bfa1e0e5cfed4a02318e330b38b0090cc49 Mon Sep 17 00:00:00 2001
+From: Serge Pavlov <sepavloff@gmail.com>
+Date: Fri, 25 Jul 2025 13:35:19 +0700
+Subject: [PATCH] Prevent revisiting block when searching for noreturn vars
+
+When searching for noreturn variable initializations, do not visit CFG
+blocks that are already visited, it prevents hanging  the analysis.
+
+It must fix https://github.com/llvm/llvm-project/issues/150336.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1505=
82]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/test/SemaCXX/noreturn-vars.cpp | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/clang/test/SemaCXX/noreturn-vars.cpp b/clang/test/SemaCXX/nor=
eturn-vars.cpp
+index ca65fcf5ca31..1bf074149f04 100644
+--- a/clang/test/SemaCXX/noreturn-vars.cpp
++++ b/clang/test/SemaCXX/noreturn-vars.cpp
+@@ -225,3 +225,20 @@ extern void abc_02(func_type *);
+   abc_02(&func_ptr);
+   func_ptr();
+ } // expected-warning {{function declared 'noreturn' should not return}}
++
++namespace Issue150336 {
++void free(void *);
++typedef void (*sel_freefunc)(void *);
++struct gmx_ana_selmethod_t {
++  sel_freefunc free;
++  int nparams;
++  int *param;
++};
++void gmx_selelem_free_method(struct gmx_ana_selmethod_t* method, void* md=
ata) {
++    sel_freefunc free_func =3D 0;
++    for (int i =3D 0; i < method->nparams; ++i)
++        free(&method->param[i]);
++    if (mdata && free_func)
++        free_func(mdata);
++}
++}
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0036-Don-t-exp=
ose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-ext=
ernally.patch
new file mode 100644
index 00000000..0cdb2ad6
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0036-Don-t-expose-LLV=
M_HAVE_OPT_VIEWER_MODULES-externally.patch
@@ -0,0 +1,27 @@
+From 53da129f7986c5bd310f4f4a8236987df7e073c6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 29 Sep 2025 14:44:05 +0100
+Subject: [PATCH] Don't expose LLVM_HAVE_OPT_VIEWER_MODULES externally
+
+This variable states whether at build-time some python modules were presen=
t,
+which is meaningless and simply introduces non-deterministic behaviour.
+
+Upstream-Status: Pending [https://github.com/llvm/llvm-project/issues/1611=
99]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/cmake/modules/LLVMConfig.cmake.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/llvm/cmake/modules/LLVMConfig.cmake.in b/llvm/cmake/modules/L=
LVMConfig.cmake.in
+index 70c807abea98..5603c9215332 100644
+--- a/llvm/cmake/modules/LLVMConfig.cmake.in
++++ b/llvm/cmake/modules/LLVMConfig.cmake.in
+@@ -137,7 +137,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
+ set(LLVM_BINARY_DIR "@LLVM_CONFIG_BINARY_DIR@")
+ set(LLVM_CMAKE_DIR "@LLVM_CONFIG_CMAKE_DIR@")
+ set(LLVM_TOOLS_BINARY_DIR "@LLVM_CONFIG_TOOLS_BINARY_DIR@")
+-set(LLVM_HAVE_OPT_VIEWER_MODULES @LLVM_HAVE_OPT_VIEWER_MODULES@)
+ set(LLVM_CONFIGURATION_TYPES @CMAKE_CONFIGURATION_TYPES@)
+ set(LLVM_ENABLE_SHARED_LIBS @BUILD_SHARED_LIBS@)
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0037-clang-Onl=
y-build-clang-tblgen-if-it-is-actually-need.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0037-clang-Only-build-clang-tblgen-if-it-is-actual=
ly-need.patch
new file mode 100644
index 00000000..5efe043e
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0037-clang-Only-build=
-clang-tblgen-if-it-is-actually-need.patch
@@ -0,0 +1,32 @@
+From de58b9bbc8c52299ff22c4f0ab21e3878d411669 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Sat, 11 Oct 2025 16:01:50 -0700
+Subject: [PATCH] [clang] Only build clang-tblgen if it is actually needed
+
+It's possible to build clang with an existing clang-tblgen (common when
+cross-compiling, for instance) by setting CLANG_TABLEGEN_EXE.  If this
+is the case there's no need to build it, as it won't be used.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1619=
52]
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
+index e4cb1a359620..b650b3b986f4 100644
+--- a/clang/CMakeLists.txt
++++ b/clang/CMakeLists.txt
+@@ -479,7 +479,9 @@ option(CLANG_ENABLE_HLSL "Include HLSL build products"=
 Off)
+ # While HLSL support is experimental this should stay hidden.
+ mark_as_advanced(CLANG_ENABLE_HLSL)
+=20
+-add_subdirectory(utils/TableGen)
++if (NOT DEFINED CLANG_TABLEGEN_EXE OR CLANG_INCLUDE_TESTS)
++  add_subdirectory(utils/TableGen)
++endif()
+=20
+ # Export CLANG_TABLEGEN_EXE for use by flang docs.
+ set(CLANG_TABLEGEN_EXE "${CLANG_TABLEGEN_EXE}" CACHE INTERNAL "")
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0038-llvm-libg=
cc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-L=
LVM_ENA.patch
new file mode 100644
index 00000000..583e91e4
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0038-llvm-libgcc-Fix-=
symlink-path-for-libcc-when-LLVM_ENA.patch
@@ -0,0 +1,71 @@
+From bca77d818187e68989dfa9e386b38632b76a477e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Oct 2025 15:44:49 -0700
+Subject: [PATCH] llvm-libgcc: Fix symlink path for libcc when
+ LLVM_ENABLE_PER_TARGET_RUNTIME_DIR is unset
+
+current logic fails when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR =3D OFF
+and it ends up with symlinks e.g.
+
+libgcc.a -> ..//usr/lib/clang/21.1.4/lib/linux/libclang_rt.builtins.a
+
+the real library is at
+../lib/clang/21.1.4/lib/linux/libclang_rt.builtins-aarch64.a
+
+The relative path is incorrect and its missing to add -arch suffix
+as well.
+
+So we make checks a bit more explicit to cover this case.
+
+The symlink for libgcc_so.1.0 is made to point to libunwind.so
+which is functionally correct but it fails some linux distro packaging
+complain because libunwind.so is made part of -dev package but
+libgcc_so.1.0 ends up in the real package, and creates an unneeded
+package -> dev dependency
+
+create the symlink to point to libunwind.so.1 instead then the boundaries
+of packaging are not crossed and all is well.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1654=
87]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm-libgcc/CMakeLists.txt | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
+index 47208fc19869..54009c1104c3 100644
+--- a/llvm-libgcc/CMakeLists.txt
++++ b/llvm-libgcc/CMakeLists.txt
+@@ -124,11 +124,21 @@ target_link_libraries(unwind_shared PUBLIC
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+=20
+ get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH} install_di=
r_builtins)
++
++# Drop a leading "lib/" if present so we don't duplicate lib/lib
+ string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_built=
ins}")
+-string(FIND "${install_dir_builtins}" "clang" install_path_contains_tripl=
e)
+-if(install_path_contains_triple EQUAL -1)
++
++# Decide based on the actual CMake option, not on guessing from the path.
++if (NOT LLVM_ENABLE_PER_TARGET_RUNTIME_DIR)
++  # Flat-ish layout, e.g. usr/lib/clang/21.1.4/lib/linux/
++  # Libraries are named libclang_rt.builtins-<arch>.a
+   set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
++  # Do NOT prepend "../"
+ else()
++  # Per-target layout, e.g.
++  # usr/lib/clang/21.1.4/lib/aarch64-unknown-linux-gnu/
++  # Libraries are just libclang_rt.builtins.a
++  set(builtins_suffix "")
+   string(PREPEND install_dir_builtins "../")
+ endif()
+ set(LLVM_LIBGCC_COMPILER_RT ${install_dir_builtins}/libclang_rt.builtins$=
{builtins_suffix}.a)
+@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL
+   DEPENDS unwind_shared unwind_static clang_rt.builtins-${COMPILER_RT_DEF=
AULT_TARGET_ARCH}
+   COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMPILER_RT} l=
ibgcc.a
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc_eh.a
+-  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so libgcc_s.so.1.0
++  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so.1 libgcc_s.so.1=
.0
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1.0 libgcc_s.so.1
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1 libgcc_s.so
+ )
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0039-Rename-UN=
USED-and-UNKNOWN-elements-of-OffloadArch-enum.patch b/meta-ti-bsp/recipes-g=
raphics/mesa/libclc-22.1.8/0039-Rename-UNUSED-and-UNKNOWN-elements-of-Offlo=
adArch-enum.patch
new file mode 100644
index 00000000..493948ac
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0039-Rename-UNUSED-an=
d-UNKNOWN-elements-of-OffloadArch-enum.patch
@@ -0,0 +1,274 @@
+From 82f18b02d9fec1bcc225a92251466ffee82f56b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Mar 2026 14:22:17 -0700
+Subject: [PATCH] [Clang] Rename UNUSED and UNKNOWN elements of OffloadArch=
 enum to avoid=20
+ macro collisions
+
+OffloadArch uses enumerator named `UNUSED` `UNKNOWN`, which are common mac=
ro name
+in external codebases (e.g. Mesa defines UNUSED as an attribute helper). I=
f such
+a macro is visible when including clang/Basic/OffloadArch.h, the preproces=
sor
+expands the token inside the enum and breaks compilation of the installed =
Clang
+headers.
+
+Rename the enumerator to `Unused` and `Unknown` and update all in-tree ref=
erences. This is a
+spelling-only change (no behavioral impact) and mirrors the existing appro=
ach
+used for SM_32_ to avoid macro clashes.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/5bc=
3d1966b2d0b300c338d85bb38e356f0d12a8c]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang/include/clang/Basic/OffloadArch.h b/clang/include/clang=
/Basic/OffloadArch.h
+index ea665b1..970487c 100644
+--- a/clang/include/clang/Basic/OffloadArch.h
++++ b/clang/include/clang/Basic/OffloadArch.h
+@@ -16,8 +16,8 @@ class StringRef;
+ namespace clang {
+
+ enum class OffloadArch {
+-  UNUSED,
+-  UNKNOWN,
++  Unused,
++  Unknown,
+   // TODO: Deprecate and remove GPU architectures older than sm_52.
+   SM_20,
+   SM_21,
+@@ -145,7 +145,7 @@ const char *OffloadArchToString(OffloadArch A);
+ const char *OffloadArchToVirtualArchString(OffloadArch A);
+
+ // Convert a string to an OffloadArch enum value. Returns
+-// OffloadArch::UNKNOWN if the string is not recognized.
++// OffloadArch::Unknown if the string is not recognized.
+ OffloadArch StringToOffloadArch(llvm::StringRef S);
+
+ } // namespace clang
+diff --git a/clang/lib/Basic/Cuda.cpp b/clang/lib/Basic/Cuda.cpp
+index 514fa2f..7884910 100644
+--- a/clang/lib/Basic/Cuda.cpp
++++ b/clang/lib/Basic/Cuda.cpp
+@@ -75,7 +75,7 @@ CudaVersion ToCudaVersion(llvm::VersionTuple Version) {
+ }
+
+ CudaVersion MinVersionForOffloadArch(OffloadArch A) {
+-  if (A =3D=3D OffloadArch::UNKNOWN)
++  if (A =3D=3D OffloadArch::Unknown)
+     return CudaVersion::UNKNOWN;
+
+   // AMD GPUs do not depend on CUDA versions.
+@@ -141,7 +141,7 @@ CudaVersion MaxVersionForOffloadArch(OffloadArch A) {
+     return CudaVersion::NEW;
+
+   switch (A) {
+-  case OffloadArch::UNKNOWN:
++  case OffloadArch::Unknown:
+     return CudaVersion::UNKNOWN;
+   case OffloadArch::SM_20:
+   case OffloadArch::SM_21:
+diff --git a/clang/lib/Basic/OffloadArch.cpp b/clang/lib/Basic/OffloadArch=
.cpp
+index 05177f1..f3bbe64 100644
+--- a/clang/lib/Basic/OffloadArch.cpp
++++ b/clang/lib/Basic/OffloadArch.cpp
+@@ -17,7 +17,7 @@ struct OffloadArchToStringMap {
+ #define GFX(gpu) {OffloadArch::GFX##gpu, "gfx" #gpu, "compute_amdgcn"}
+ static const OffloadArchToStringMap ArchNames[] =3D {
+     // clang-format off
+-    {OffloadArch::UNUSED, "", ""},
++    {OffloadArch::Unused, "", ""},
+     SM(20), {OffloadArch::SM_21, "sm_21", "compute_20"}, // Fermi
+     SM(30), {OffloadArch::SM_32_, "sm_32", "compute_32"}, SM(35), SM(37),=
  // Kepler
+     SM(50), SM(52), SM(53),          // Maxwell
+@@ -132,7 +132,7 @@ OffloadArch StringToOffloadArch(llvm::StringRef S) {
+         return S =3D=3D Map.ArchName;
+       });
+   if (Result =3D=3D std::end(ArchNames))
+-    return OffloadArch::UNKNOWN;
++    return OffloadArch::Unknown;
+   return Result->Arch;
+ }
+
+diff --git a/clang/lib/Basic/Targets/NVPTX.cpp b/clang/lib/Basic/Targets/N=
VPTX.cpp
+index 6526eef..9584f8a 100644
+--- a/clang/lib/Basic/Targets/NVPTX.cpp
++++ b/clang/lib/Basic/Targets/NVPTX.cpp
+@@ -64,7 +64,7 @@ NVPTXTargetInfo::NVPTXTargetInfo(const llvm::Triple &Tri=
ple,
+   // Define available target features
+   // These must be defined in sorted order!
+   NoAsmVariants =3D true;
+-  GPU =3D OffloadArch::UNUSED;
++  GPU =3D OffloadArch::Unused;
+
+   // PTX supports f16 as a fundamental type.
+   HasFastHalfType =3D true;
+diff --git a/clang/lib/Basic/Targets/NVPTX.h b/clang/lib/Basic/Targets/NVP=
TX.h
+index 9bd0cc3..eeffb0e 100644
+--- a/clang/lib/Basic/Targets/NVPTX.h
++++ b/clang/lib/Basic/Targets/NVPTX.h
+@@ -87,7 +87,7 @@ public:
+   initFeatureMap(llvm::StringMap<bool> &Features, DiagnosticsEngine &Diag=
s,
+                  StringRef CPU,
+                  const std::vector<std::string> &FeaturesVec) const overr=
ide {
+-    if (GPU !=3D OffloadArch::UNUSED)
++    if (GPU !=3D OffloadArch::Unused)
+       Features[OffloadArchToString(GPU)] =3D true;
+     // Only add PTX feature if explicitly requested. Otherwise, let the b=
ackend
+     // use the minimum required PTX version for the target SM.
+@@ -146,7 +146,7 @@ public:
+   }
+
+   bool isValidCPUName(StringRef Name) const override {
+-    return StringToOffloadArch(Name) !=3D OffloadArch::UNKNOWN;
++    return StringToOffloadArch(Name) !=3D OffloadArch::Unknown;
+   }
+
+   void fillValidCPUList(SmallVectorImpl<StringRef> &Values) const overrid=
e {
+@@ -157,7 +157,7 @@ public:
+
+   bool setCPU(const std::string &Name) override {
+     GPU =3D StringToOffloadArch(Name);
+-    return GPU !=3D OffloadArch::UNKNOWN;
++    return GPU !=3D OffloadArch::Unknown;
+   }
+
+   void setSupportedOpenCLOpts() override {
+diff --git a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp b/clang/lib/CodeGen/=
CGOpenMPRuntimeGPU.cpp
+index db0d56d..f78047d 100644
+--- a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
++++ b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
+@@ -2266,15 +2266,15 @@ bool CGOpenMPRuntimeGPU::hasAllocateAttributeForGl=
obalVar(const VarDecl *VD,
+ // Get current OffloadArch and ignore any unknown values
+ static OffloadArch getOffloadArch(CodeGenModule &CGM) {
+   if (!CGM.getTarget().hasFeature("ptx"))
+-    return OffloadArch::UNKNOWN;
++    return OffloadArch::Unknown;
+   for (const auto &Feature : CGM.getTarget().getTargetOpts().FeatureMap) {
+     if (Feature.getValue()) {
+       OffloadArch Arch =3D StringToOffloadArch(Feature.getKey());
+-      if (Arch !=3D OffloadArch::UNKNOWN)
++      if (Arch !=3D OffloadArch::Unknown)
+         return Arch;
+     }
+   }
+-  return OffloadArch::UNKNOWN;
++  return OffloadArch::Unknown;
+ }
+
+ /// Check to see if target architecture supports unified addressing which=
 is
+@@ -2382,8 +2382,8 @@ void CGOpenMPRuntimeGPU::processRequiresDirective(co=
nst OMPRequiresDecl *D) {
+       case OffloadArch::Generic:
+       case OffloadArch::GRANITERAPIDS:
+       case OffloadArch::BMG_G21:
+-      case OffloadArch::UNUSED:
+-      case OffloadArch::UNKNOWN:
++      case OffloadArch::Unused:
++      case OffloadArch::Unknown:
+         break;
+       case OffloadArch::LAST:
+         llvm_unreachable("Unexpected GPU arch.");
+diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
+index eb3f9cb..c8894a1 100644
+--- a/clang/lib/Driver/Driver.cpp
++++ b/clang/lib/Driver/Driver.cpp
+@@ -946,7 +946,7 @@ inferOffloadToolchains(Compilation &C, Action::Offload=
Kind Kind) {
+   llvm::DenseSet<llvm::StringRef> Triples;
+   for (llvm::StringRef Arch : Archs) {
+     OffloadArch ID =3D StringToOffloadArch(Arch);
+-    if (ID =3D=3D OffloadArch::UNKNOWN)
++    if (ID =3D=3D OffloadArch::Unknown)
+       ID =3D StringToOffloadArch(
+           getProcessorFromTargetID(llvm::Triple("amdgcn-amd-amdhsa"), Arc=
h));
+
+@@ -961,12 +961,12 @@ inferOffloadToolchains(Compilation &C, Action::Offlo=
adKind Kind) {
+       return llvm::DenseSet<llvm::StringRef>();
+     }
+     if (Kind =3D=3D Action::OFK_OpenMP &&
+-        (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D OffloadArch::UNUSED)=
) {
++        (ID =3D=3D OffloadArch::Unknown || ID =3D=3D OffloadArch::Unused)=
) {
+       C.getDriver().Diag(clang::diag::err_drv_failed_to_deduce_target_fro=
m_arch)
+           << Arch;
+       return llvm::DenseSet<llvm::StringRef>();
+     }
+-    if (ID =3D=3D OffloadArch::UNKNOWN || ID =3D=3D OffloadArch::UNUSED) {
++    if (ID =3D=3D OffloadArch::Unknown || ID =3D=3D OffloadArch::Unused) {
+       C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
+           << "offload" << Arch;
+       return llvm::DenseSet<llvm::StringRef>();
+@@ -3305,7 +3305,7 @@ class OffloadingActionBuilder final {
+     bool Relocatable =3D false;
+
+     /// Default GPU architecture if there's no one specified.
+-    OffloadArch DefaultOffloadArch =3D OffloadArch::UNKNOWN;
++    OffloadArch DefaultOffloadArch =3D OffloadArch::Unknown;
+
+     /// Compilation unit ID specified by option '-fuse-cuid=3D' or'-cuid=
=3D'.
+     const CUIDOptions &CUIDOpts;
+@@ -3407,7 +3407,7 @@ class OffloadingActionBuilder final {
+
+       // If we have a fat binary, add it to the list.
+       if (CudaFatBinary) {
+-        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED);
++        AddTopLevel(CudaFatBinary, OffloadArch::Unused);
+         CudaDeviceActions.clear();
+         CudaFatBinary =3D nullptr;
+         return;
+@@ -4669,12 +4669,12 @@ static StringRef getCanonicalArchString(Compilatio=
n &C,
+   OffloadArch Arch =3D
+       StringToOffloadArch(getProcessorFromTargetID(Triple, ArchStr));
+   if (Triple.isNVPTX() &&
+-      (Arch =3D=3D OffloadArch::UNKNOWN || !IsNVIDIAOffloadArch(Arch))) {
++      (Arch =3D=3D OffloadArch::Unknown || !IsNVIDIAOffloadArch(Arch))) {
+     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
+         << "CUDA" << ArchStr;
+     return StringRef();
+   } else if (Triple.isAMDGPU() &&
+-             (Arch =3D=3D OffloadArch::UNKNOWN || !IsAMDOffloadArch(Arch)=
)) {
++             (Arch =3D=3D OffloadArch::Unknown || !IsAMDOffloadArch(Arch)=
)) {
+     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
+         << "HIP" << ArchStr;
+     return StringRef();
+diff --git a/clang/lib/Driver/OffloadBundler.cpp b/clang/lib/Driver/Offloa=
dBundler.cpp
+index f69ac41..6d446f2 100644
+--- a/clang/lib/Driver/OffloadBundler.cpp
++++ b/clang/lib/Driver/OffloadBundler.cpp
+@@ -95,7 +95,7 @@ OffloadTargetInfo::OffloadTargetInfo(const StringRef Tar=
get,
+       Components.size() =3D=3D 6 ? Components.back() : "";
+   StringRef TargetId =3D TargetIdWithFeature.split(':').first;
+   if (!TargetId.empty() &&
+-      clang::StringToOffloadArch(TargetId) !=3D clang::OffloadArch::UNKNO=
WN)
++      clang::StringToOffloadArch(TargetId) !=3D clang::OffloadArch::Unkno=
wn)
+     this->TargetID =3D TargetIdWithFeature;
+   else
+     this->TargetID =3D "";
+diff --git a/clang/lib/Driver/ToolChains/Cuda.cpp b/clang/lib/Driver/ToolC=
hains/Cuda.cpp
+index 6cc73ff..d97b926 100644
+--- a/clang/lib/Driver/ToolChains/Cuda.cpp
++++ b/clang/lib/Driver/ToolChains/Cuda.cpp
+@@ -319,7 +319,7 @@ void CudaInstallationDetector::AddCudaIncludeArgs(
+
+ void CudaInstallationDetector::CheckCudaVersionSupportsArch(
+     OffloadArch Arch) const {
+-  if (Arch =3D=3D OffloadArch::UNKNOWN || Version =3D=3D CudaVersion::UNK=
NOWN ||
++  if (Arch =3D=3D OffloadArch::Unknown || Version =3D=3D CudaVersion::UNK=
NOWN ||
+       ArchsWithBadVersion[(int)Arch])
+     return;
+
+@@ -408,7 +408,7 @@ void NVPTX::Assembler::ConstructJob(Compilation &C, co=
nst JobAction &JA,
+
+   // Obtain architecture from the action.
+   OffloadArch gpu_arch =3D StringToOffloadArch(GPUArchName);
+-  assert(gpu_arch !=3D OffloadArch::UNKNOWN &&
++  assert(gpu_arch !=3D OffloadArch::Unknown &&
+          "Device action expected to have an architecture.");
+
+   // Check that our installation's ptxas supports gpu_arch.
+diff --git a/clang/lib/Sema/SemaDeclAttr.cpp b/clang/lib/Sema/SemaDeclAttr=
.cpp
+index 3f0ea5c..e6d3516 100644
+--- a/clang/lib/Sema/SemaDeclAttr.cpp
++++ b/clang/lib/Sema/SemaDeclAttr.cpp
+@@ -5732,7 +5732,7 @@ Sema::CreateLaunchBoundsAttr(const AttributeCommonIn=
fo &CI, Expr *MaxThreads,
+   if (MaxBlocks) {
+     // '.maxclusterrank' ptx directive requires .target sm_90 or higher.
+     auto SM =3D getOffloadArch(Context.getTargetInfo());
+-    if (SM =3D=3D OffloadArch::UNKNOWN || SM < OffloadArch::SM_90) {
++    if (SM =3D=3D OffloadArch::Unknown || SM < OffloadArch::SM_90) {
+       Diag(MaxBlocks->getBeginLoc(), diag::warn_cuda_maxclusterrank_sm_90)
+           << OffloadArchToString(SM) << CI << MaxBlocks->getSourceRange();
+       // Ignore it by setting MaxBlocks to null;
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0040-libcxxabi=
-declare-__gnu_unwind_frame-in-cxa_personal.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_p=
ersonal.patch
new file mode 100644
index 00000000..f458fd0c
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0040-libcxxabi-declar=
e-__gnu_unwind_frame-in-cxa_personal.patch
@@ -0,0 +1,33 @@
+From 5dbd0a05f64a43849a7edde95a0e5f2323cd1f9d Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 31 Mar 2026 19:33:29 -0700
+Subject: [PATCH] libcxxabi: declare __gnu_unwind_frame in cxa_personality
+
+ARM EHABI builds of libcxxabi fail with clang-22+ because
+cxa_personality.cpp calls __gnu_unwind_frame without a visible
+declaration, triggering:
+
+  error: use of undeclared identifier '__gnu_unwind_frame'
+
+Add an extern "C" forward declaration before the EHABI unwind helper
+so the source compiles correctly.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1897=
87]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ libcxxabi/src/cxa_personality.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libcxxabi/src/cxa_personality.cpp b/libcxxabi/src/cxa_persona=
lity.cpp
+index 35f4e3807724..ddff277cc7b8 100644
+--- a/libcxxabi/src/cxa_personality.cpp
++++ b/libcxxabi/src/cxa_personality.cpp
+@@ -1116,6 +1116,8 @@ __gxx_personality_seh0(PEXCEPTION_RECORD ms_exc, voi=
d *this_frame,
+
+ #else
+
++extern "C" _Unwind_Reason_Code __gnu_unwind_frame(_Unwind_Exception*,
++                                                  _Unwind_Context*);
+ // Helper function to unwind one frame.
+ // ARM EHABI 7.3 and 7.4: If the personality function returns _URC_CONTIN=
UE_UNWIND, the
+ // personality routine should update the virtual register set (VRS) accor=
ding to the
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0041-Consolida=
te-and-fix-sysroot-based-compiler-rt-search.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0041-Consolidate-and-fix-sysroot-based-compiler-rt=
-search.patch
new file mode 100644
index 00000000..a2a7fa80
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0041-Consolidate-and-=
fix-sysroot-based-compiler-rt-search.patch
@@ -0,0 +1,105 @@
+From b818a92ac171e80e39ad9e99d1f862d23f2bb5b3 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 14 Apr 2026 16:17:01 +0900
+Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search paths
+
+Consolidate patches 0008 and 0033 into a single patch with a fix for
+native builds.
+
+Background:
+In Yocto/OE, compiler-rt and libc++ are built as separate recipes and
+installed into the target sysroot, not into clang's resource directory
+(which is relative to the clang driver installation).
+Patches 0008 (getCompilerRTPath, Khem Raj, 2017) and 0033 (getRuntimePath =
and
+getArchSpecificLibPaths, Khem Raj, 2025) addressed this by changing the
+runtime library search base from ResourceDir to SysRoot-based paths.
+
+Problem:
+The patches unconditionally replaced ResourceDir with a SysRoot-based
+path using CLANG_VERSION_STRING. In native/standalone builds where
+SysRoot is empty, this produces invalid absolute paths like
+"/usr/lib/clang/<full-version>/" pointing to the host filesystem instead o=
f the
+build tree's resource directory. This breaks PGO bootstrap and any other
+native workflow that depends on compiler-rt runtime libraries
+(e.g., -fprofile-generate cannot find libclang_rt.profile.a).
+
+Fix:
+Use SysRoot-based paths only when SysRoot is actually set (i.e., during
+cross-compilation). When SysRoot is empty (native/standalone builds),
+fall back to the upstream default ResourceDir, which correctly resolves
+to the build tree's resource directory.
+
+The following functions are updated with this conditional logic:
+- getCompilerRTPath()
+- getRuntimePath()
+- getArchSpecificLibPaths()
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/lib/Driver/ToolChain.cpp | 31 ++++++++++++++++++++++++++++---
+ 1 file changed, 28 insertions(+), 3 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.c=
pp
+index 77a2c73f0..ac28b51c4 100644
+--- a/clang/lib/Driver/ToolChain.cpp
++++ b/clang/lib/Driver/ToolChain.cpp
+@@ -15,6 +15,7 @@
+ #include "ToolChains/InterfaceStubs.h"
+ #include "clang/Basic/ObjCRuntime.h"
+ #include "clang/Basic/Sanitizers.h"
++#include "clang/Basic/Version.h"
+ #include "clang/Config/config.h"
+ #include "clang/Driver/Action.h"
+ #include "clang/Driver/CommonArgs.h"
+@@ -723,7 +724,15 @@ StringRef ToolChain::getOSLibName() const {
+ }
+=20
+ std::string ToolChain::getCompilerRTPath() const {
+-  SmallString<128> Path(getDriver().ResourceDir);
++  SmallString<128> Path;
++  if (!getDriver().SysRoot.empty()) {
++    Path =3D getDriver().SysRoot;
++    StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++    llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
++                              CLANG_VERSION_STRING);
++  } else {
++    Path =3D getDriver().ResourceDir;
++  }
+   if (isBareMetal()) {
+     llvm::sys::path::append(Path, "lib", getOSLibName());
+     if (!SelectedMultilibs.empty()) {
+@@ -1021,7 +1030,15 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir) c=
onst {
+ }
+=20
+ std::optional<std::string> ToolChain::getRuntimePath() const {
+-  SmallString<128> P(D.ResourceDir);
++  SmallString<128> P;
++  if (!D.SysRoot.empty()) {
++    P =3D D.SysRoot;
++    StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++    llvm::sys::path::append(P, "/usr/", ClangLibdirBasename, "clang",
++                            CLANG_VERSION_STRING);
++  } else {
++    P =3D D.ResourceDir;
++  }
+   llvm::sys::path::append(P, "lib");
+   if (auto Ret =3D getTargetSubDirPath(P))
+     return Ret;
+@@ -1049,7 +1066,15 @@ ToolChain::path_list ToolChain::getArchSpecificLibP=
aths() const {
+   path_list Paths;
+=20
+   auto AddPath =3D [&](const ArrayRef<StringRef> &SS) {
+-    SmallString<128> Path(getDriver().ResourceDir);
++    SmallString<128> Path;
++    if (!getDriver().SysRoot.empty()) {
++      Path =3D getDriver().SysRoot;
++      StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++      llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
++                              CLANG_VERSION_STRING);
++    } else {
++      Path =3D getDriver().ResourceDir;
++    }
+     llvm::sys::path::append(Path, "lib");
+     for (auto &S : SS)
+       llvm::sys::path::append(Path, S);
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0042-guard-cla=
ng-tools-extra-test.patch b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8=
/0042-guard-clang-tools-extra-test.patch
new file mode 100644
index 00000000..9b4e29ff
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0042-guard-clang-tool=
s-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------=
------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM=
.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config=
-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (=
add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM=
.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (=
add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+--------------------------------------------------------------------------=
-----
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLis=
ts.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -8,7 +8,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
+   "Enable query-based custom checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" =
OFF)
+@@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tool=
s-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/c=
langd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -215,7 +215,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0043-LoopUnrol=
l-Iterate-exit-fold-candidates-in-determini.patch b/meta-ti-bsp/recipes-gra=
phics/mesa/libclc-22.1.8/0043-LoopUnroll-Iterate-exit-fold-candidates-in-de=
termini.patch
new file mode 100644
index 00000000..39e27ac1
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc-22.1.8/0043-LoopUnroll-Itera=
te-exit-fold-candidates-in-determini.patch
@@ -0,0 +1,71 @@
+From 965f9d87adb0a7376454374fbc140ab69bd796a9 Mon Sep 17 00:00:00 2001
+From: Florian Hahn <flo@fhahn.com>
+Date: Fri, 27 Mar 2026 13:02:51 +0000
+Subject: [PATCH] [LoopUnroll] Use MapVector for deterministic iteration or=
der.
+ (#188821)
+
+NonLoopBlocksIDom determines the order we adjust the DT, impacting DRT
+child ordering.
+
+Similarly, ExitInfos order impacts the order of SetDest, which applies
+DT updates.
+
+The order impacts collectChildrenInLoop, which in turn impacts the we
+process BBs in LICM. And this in turn impacts the order in which we
+perform alias queries.
+
+If the order is not deterministic, we sometimes get different NumNoAlias
+statistic counts, and possibly also different IR, although I have not
+confirmed the latter.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/965=
f9d87adb0a7376454374fbc140ab69bd796a9]
+Signed-off-by: Sunilkumar Dora <sunilkumar.dora@windriver.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+---
+ llvm/lib/Transforms/Utils/LoopPeel.cpp   | 3 ++-
+ llvm/lib/Transforms/Utils/LoopUnroll.cpp | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/llvm/lib/Transforms/Utils/LoopPeel.cpp b/llvm/lib/Transforms/=
Utils/LoopPeel.cpp
+index 91737b5c30533..4c67d5a9ae680 100644
+--- a/llvm/lib/Transforms/Utils/LoopPeel.cpp
++++ b/llvm/lib/Transforms/Utils/LoopPeel.cpp
+@@ -11,6 +11,7 @@
+
+ #include "llvm/Transforms/Utils/LoopPeel.h"
+ #include "llvm/ADT/DenseMap.h"
++#include "llvm/ADT/MapVector.h"
+ #include "llvm/ADT/SmallVector.h"
+ #include "llvm/ADT/Statistic.h"
+ #include "llvm/Analysis/Loads.h"
+@@ -1121,7 +1122,7 @@ void llvm::peelLoop(Loop *L, unsigned PeelCount, boo=
l PeelLast, LoopInfo *LI,
+   // later. Immediate dominator of such block might change, because we ad=
d more
+   // routes which can lead to the exit: we can reach it from the peeled
+   // iterations too.
+-  DenseMap<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
++  MapVector<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
+   for (auto *BB : L->blocks()) {
+     auto *BBDomNode =3D DT.getNode(BB);
+     SmallVector<BasicBlock *, 16> ChildrenToUpdate;
+diff --git a/llvm/lib/Transforms/Utils/LoopUnroll.cpp b/llvm/lib/Transform=
s/Utils/LoopUnroll.cpp
+index 6a2ccbea996bf..ab35d217f0d93 100644
+--- a/llvm/lib/Transforms/Utils/LoopUnroll.cpp
++++ b/llvm/lib/Transforms/Utils/LoopUnroll.cpp
+@@ -17,6 +17,7 @@
+
+ #include "llvm/ADT/ArrayRef.h"
+ #include "llvm/ADT/DenseMap.h"
++#include "llvm/ADT/MapVector.h"
+ #include "llvm/ADT/STLExtras.h"
+ #include "llvm/ADT/ScopedHashTable.h"
+ #include "llvm/ADT/SetVector.h"
+@@ -515,7 +516,7 @@ llvm::UnrollLoop(Loop *L, UnrollLoopOptions ULO, LoopI=
nfo *LI,
+     BasicBlock *FirstExitingBlock =3D nullptr;
+     SmallVector<BasicBlock *> ExitingBlocks;
+   };
+-  DenseMap<BasicBlock *, ExitInfo> ExitInfos;
++  MapVector<BasicBlock *, ExitInfo> ExitInfos;
+   SmallVector<BasicBlock *, 4> ExitingBlocks;
+   L->getExitingBlocks(ExitingBlocks);
+   for (auto *ExitingBlock : ExitingBlocks) {
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb b/meta-ti-b=
sp/recipes-graphics/mesa/libclc_22.1.8.bb
new file mode 100644
index 00000000..57eb1d6a
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb
@@ -0,0 +1,149 @@
+SUMMARY =3D "Implementation of the library requirements of the OpenCL C pr=
ogramming language."
+HOMEPAGE =3D "https://libclc.llvm.org"
+SECTION =3D "devel"
+
+FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${PN}:"
+
+LLVM_RELEASE =3D ""
+LLVM_DIR =3D "llvm${LLVM_RELEASE}"
+
+LLVM_HTTP ?=3D "https://github.com/llvm"
+
+MAJOR_VER =3D "22"
+MINOR_VER =3D "1"
+PATCH_VER =3D "8"
+# could be 'rcX' or 'git' or empty ( for release )
+VER_SUFFIX =3D ""
+
+PV =3D "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
+
+LLVMMD5SUM =3D "8a15a0759ef07f2682d2ba4b893c9afe"
+CLANGMD5SUM =3D "ff42885ed2ab98f1ecb8c1fc41205343"
+LLDMD5SUM =3D "ae7dc7c027b1fa89b5b013d391d3ee2b"
+LLDBMD5SUM =3D "2e0d44968471fcde980034dbb826bea9"
+
+LLVM_LIBDIR_SUFFIX =3D "${@d.getVar('baselib').replace('lib', '')}"
+
+# set the default pigz thread
+export PIGZ =3D "-p ${@oe.utils.cpu_count(at_least=3D2)}"
+
+def get_clang_arch(bb, d, arch_var):
+    import re
+    a =3D d.getVar(arch_var)
+    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
+    elif re.match('arm$', a):                          return 'ARM'
+    elif re.match('armeb$', a):                        return 'ARM'
+    elif re.match('aarch64$', a):                      return 'AArch64'
+    elif re.match('aarch64_be$', a):                   return 'AArch64'
+    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
+    elif re.match('riscv32$', a):                      return 'RISCV'
+    elif re.match('riscv64$', a):                      return 'RISCV'
+    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
+    elif re.match('loongarch64$', a):                  return 'LoongArch'
+    else:
+        bb.fatal("Unhandled architecture %s" % arch_var)
+        return ""
+
+def get_clang_host_arch(bb, d):
+    return get_clang_arch(bb, d, 'HOST_ARCH')
+
+def get_clang_target_arch(bb, d):
+    return get_clang_arch(bb, d, 'TARGET_ARCH')
+
+# Don't put build-time RPATHs in the binaries, whilst they'll be stripped =
on
+# install they cause non-deterministic binaries.
+EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_WITH_INSTALL_RPATH=3DON"
+
+# Don't embed found git information into the version string as this
+# will include the git server URL.
+EXTRA_OECMAKE +=3D "-DLLVM_APPEND_VC_REV=3DOFF"
+
+LIC_FILES_CHKSUM =3D "file://llvm/LICENSE.TXT;md5=3D${LLVMMD5SUM} \
+                    file://clang/LICENSE.TXT;md5=3D${CLANGMD5SUM} \
+"
+LICENSE =3D "Apache-2.0 WITH LLVM-exception"
+
+# Snapshot
+#RELEASE ?=3D "108df0694cc12fa496f63faa3a8762e7cc1a3b37"
+#BASEURI ?=3D "https://api.github.com/repos/llvm/llvm-project/tarball/${RE=
LEASE};downloadfilename=3Dllvm-${PV}-${RELEASE}.tar.gz"
+#SOURCEDIR ?=3D "llvm-llvm-project-${@'${RELEASE}'[0:7]}"
+#SRC_URI[sha256sum] =3D "f19bc6ed902e30413a8a034a024fae228ca57339b450d3682=
fd7437fb2573378"
+
+# GA Release
+RELEASE ?=3D "${PV}"
+BASEURI ?=3D "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${V=
ER_SUFFIX}/llvm-project-${PV}${VER_SUFFIX}.src.tar.xz"
+UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
+UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
+SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
+SRC_URI[sha256sum] =3D "ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653=
ee0d8fcee479ff"
+
+SRC_URI =3D "\
+    ${BASEURI} \
+    file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch=
 \
+    file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
+    file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch=
 \
+    file://0004-llvm-allow-env-override-of-exe-and-libdir-path.patch \
+    file://0005-clang-driver-Check-sysroot-for-ldso-path.patch \
+    file://0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
+    file://0007-clang-Prepend-trailing-to-sysroot.patch \
+    file://0009-clang-Define-releative-gcc-installation-dir.patch \
+    file://0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch=
 \
+    file://0011-Check-for-atomic-double-intrinsics.patch \
+    file://0012-cmake-Fix-configure-for-packages-using-find_package.patch \
+    file://0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch=
 \
+    file://0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch=
 \
+    file://0015-clang-Use-python3-in-python-scripts.patch \
+    file://0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch=
 \
+    file://0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch=
 \
+    file://0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch=
 \
+    file://0019-libunwind-Added-unw_backtrace-method.patch \
+    file://0020-lldb-Link-with-libatomic-on-x86.patch \
+    file://0021-compiler-rt-Enable-__int128-for-ppc32.patch \
+    file://0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
+    file://0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
+    file://0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
+    file://0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
+    file://0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
+    file://0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch=
 \
+    file://0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
+    file://0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch=
 \
+    file://0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
+    file://0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch=
 \
+    file://0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch=
 \
+    file://0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch=
 \
+    file://0035-Prevent-revisiting-block-when-searching-for-noreturn.patch=
 \
+    file://0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch=
 \
+    file://0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch=
 \
+    file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch=
 \
+    file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.pat=
ch \
+    file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch=
 \
+    file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch=
 \
+    file://0042-guard-clang-tools-extra-test.patch \
+    file://0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch=
 \
+"
+# Fallback to no-PIE if not set
+GCCPIE ??=3D ""
+
+SRC_URI[sha256sum] =3D "922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b=
9861b1a9965888"
+
+S =3D "${UNPACKDIR}/llvm-project-${PV}.src"
+B ?=3D "${WORKDIR}/llvm-project-source-${PV}/build.${HOST_SYS}.${TARGET_SY=
S}"
+
+inherit cmake pkgconfig
+
+# Depend explicitly on clang-native instead of using TOOLCHAIN as the build
+# objects from this recipe are build explicitly using clang for GPU target=
s.
+# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we n=
eed
+# to wrestle CMake to configure without a toolchain.
+DEPENDS +=3D "clang-native spirv-llvm-translator-native"
+
+OECMAKE_SOURCEPATH =3D "${S}/libclc"
+
+# Semicolon-separated list of targets to build
+LIBCLC_TARGETS ?=3D "all"
+
+EXTRA_OECMAKE +=3D "-DLIBCLC_TARGETS_TO_BUILD=3D'${LIBCLC_TARGETS}'"
+
+FILES:${PN} +=3D "${datadir}/clc"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb b/meta-ti-bsp/=
recipes-graphics/mesa/libclc_git.bb
deleted file mode 100644
index e8645d4b..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "Implementation of the library requirements of the OpenCL C pr=
ogramming language."
-HOMEPAGE =3D "https://libclc.llvm.org"
-SECTION =3D "devel"
-
-require recipes-devtools/clang/common-clang.inc
-require recipes-devtools/clang/common-source.inc
-
-LIC_FILES_CHKSUM =3D "file://libclc/LICENSE.TXT;md5=3D7cc795f6cbb2d801d843=
36b83c8017db"
-
-inherit cmake pkgconfig
-
-# Depend explicitly on clang-native instead of using TOOLCHAIN as the build
-# objects from this recipe are build explicitly using clang for GPU target=
s.
-# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we n=
eed
-# to wrestle CMake to configure without a toolchain.
-DEPENDS +=3D "clang-native spirv-llvm-translator-native"
-
-OECMAKE_SOURCEPATH =3D "${S}/libclc"
-
-# Semicolon-separated list of targets to build
-LIBCLC_TARGETS ?=3D "all"
-
-EXTRA_OECMAKE +=3D "-DLIBCLC_TARGETS_TO_BUILD=3D'${LIBCLC_TARGETS}'"
-
-FILES:${PN} +=3D "${datadir}/clc"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


