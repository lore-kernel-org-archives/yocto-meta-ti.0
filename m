Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BB1C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 19:10:48 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1476.1787253047086940016
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 12:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Va+zhi/g;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=fy09UxtY;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIKXpi1699114;
	Thu, 20 Aug 2026 14:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tdJvkSHoCW0o/RArqVilLGzvGGHz1VnX7PPV0QXFO
	04=; b=Va+zhi/gOK+4hZRELeHvDTdBkPCT4qUg64UMsG9D1ti9Td5f2sv6Ez6Wh
	lok6zaFc0ULmmdok/sA5JGUBSlEXedW1TdHkQOs5qE2VULJ+otx+v2EOGwugc6+E
	/dgWIzuGI7Mv8+Nxpn3VMp8HhYlSB+I4PFSKTmQos677AwV9MLOnLQDVtt2bD2CV
	nbE8LY2NnfXT8zHVEIyu8OfY8AazjyyLyHuFo3UHnxmAy9EUCph/ZxUD+ZdzErQH
	DNIiTtIg67IDwUHqtCm7ldZD2zOmE4J2axQmFANkGFGtI6v8BZzxihCg0wdN09eP
	8SI8j5ytvMD4xVn5CcJb973s8sXQw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g60gfaxwy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 14:10:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW46TFg9JDZeHh4FupF07UwMqrso+JknWbV9+9NsegrGeMeoLrKJ3xsHWAEdc/biripsHI4H2RnHIT2L92FWuoR57owjftbaMcS693NxYHY6hCDj72EGfvNYuvN2++u9N+kjHOGZrNK8d0DjApFb0GVg6LiZzGb80hSOYX5JIdFY6tz3fqOsPbWioQ1f5jlbC2dEov73Xal0nV10Ou//tPDvmUmSXfgv5uFsZdDfhHy4OUSitFn3G+G1AHaJPBtuPqM+rJW1JElE1tw2ns1PzkgP5D33I+QZA1niSKaSfgnEqTjOeN0YsWx7AhrTyWcxtPQBNT2ROlXOOwbvEEnYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdJvkSHoCW0o/RArqVilLGzvGGHz1VnX7PPV0QXFO04=;
 b=xf6II2U5kmzaBjWhax/C/rZy6j+Y9kMzJNPYXJifly/BRLMMtgM7l/VPDinG4C/vZX91/ffbFGxB9splBRLTqq6veKSGF0rMXM+DiI3XGi7eeATn7aLUCIBPJscKeyoqeYIBIAA1e4B+gE5gzkswYA5VWyo5Ci5jIYgERf4/piQzEkcyOZnCbwqn0IQpXSS7rDYIO3EN0IitqpoAWHgs/iMCHcbhmxPkp+8J1LyJZ6ZRPMdTSEtzb0Eew9DQGA9JAFlyFTZ5/ABeBru099cZx+uzXNHdfvY6XJ0P5jKQGN2XMG5qX+0ilNamBrcEqGMPPwA/lDpT4oGLYVp4z/Nmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdJvkSHoCW0o/RArqVilLGzvGGHz1VnX7PPV0QXFO04=;
 b=fy09UxtYX4BqmP3pdvDO5a0aNgrTdUV12GZSmsYAqsCAFP4Q6oyrpg2cF/8s6mr+9+5EvgLm7/1yEiLBChn481/whIvDFozPoOX/GvRsqM87j4p/BlqTgmFnfVzdJA/si4oXW6Oat0Y7W2R6JYVOSAVlNQrxodb7AS+nZOoot/5mucbQxwXgFWY7uoFRpwZzpD+C9mvcZBs0J0dH19ryvFDhJFEOCapNQCLxIgS8s8xyAqCW+C+rn6un7TX7XOdrnIIjcZ3yhfil/OHR1u1QPT1rxwN3LiU5BYlncR4oPLK68Hpf8ensf63XUe79fu0gLYBk8qs+qoSvV6W/Tp1D8w==
Received: from CH2PR14CA0045.namprd14.prod.outlook.com (2603:10b6:610:56::25)
 by SN4PR10MB5606.namprd10.prod.outlook.com (2603:10b6:806:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 19:10:40 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::21) by CH2PR14CA0045.outlook.office365.com
 (2603:10b6:610:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 19:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 19:10:40 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:10:25 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:10:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 14:10:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KJAPHn1759775;
	Thu, 20 Aug 2026 14:10:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6F63A9ACF4; Thu, 20 Aug 2026 14:10:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] libclc: Import from removed oe-core recipe
Date: Thu, 20 Aug 2026 14:10:25 -0500
Message-ID: <20260820191025.3436228-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260820190908.3203620-1-reatmon@ti.com>
References: <20260820190908.3203620-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SN4PR10MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: ac090ebd-693c-4513-7d2b-08defeeeb9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CvrHQBeZ5NBp/fMW1cZ7KeIwQ3xHRc7B5E1/hwb8iLwsu6IBnKjz8UUDbkrFr5qOfglzro5WuCeoTkv1Qmi7E5sBp3jLGReJorcZ/dDcVmJh6I1Wi1OuOoHexms+19+aDuswxazmzWKnen0lzMLqWKfQ1K8TvpFTt1IRgI5H7ogHk4HGkvIe9iqqboamBz8dgisvirAvO6gww9VAVtzepAcHjOa7ibDMNNwekqekNFUAIweBHZn31NQaxoaTE0Y9IEyMOCvlRboWXtQjT9ipi2YF4WjJcpLsGLtdDNtV5n9HyRQwD7YdooNu1IWrze78JLjeqLnQzaJDG5aQ2UjAjL2s5FnI3BXm6kxZ+cIPKPC0Sm3NxZ6kzNhas5AbfP2Z8k5NQ1PdWtSSTyAC5xBzkKLzPPCgulYZaI3J4pS8UVKgaDpLrbynoF2xhBdk/sU0OMmVZ1cH8Mxw9w+94+Lc+oJWM5F0q1QcsykU5Mrg6qB4V0P35xmmUibUpyQ2K1lXEwoFkzL/TnXFO32mBvzGyQYvbtnUYBe0w6GjA+PtOk+bdIG6eauuQOctGrDTFGVFERVu0c2P+B02pa1NmxPtOhuxqTC+NsHwL8Ag4S4cIjh92dBTilDTbh/rcfreyDy39HNwRy1Z2h/JTJq4Z/EZM3A/bGcCxskHUt16misB66ebAPYqzbeUu62pd2laYMvcjIfNxmXjBqVQ58fofC5kEA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+BGkpT/axN11oYmUO2dritpYiwPF/pMl2HpTmLGJVuQMWOrp+PuvWB6iqjIVePNwlwz3viFTjurmr+XynoUEshD+8Jnd6ZUjTlMG5viTBaohxbJ1GTAt9FfiDC7Lk1IKKjxU/BUSKW5gvgn07dKlGH3Ne83KnsJBwtRJOviTARlYOB0nKM6ylwePEdMHrOzJ4/8P75/4gOBc3bA9gadPCL5NOMCqdvM+QH4pYs6NUvKcTbtj6qM7lRwtaSWHo2UCsQlYNap1cCdti+7YaKSTu+47FNXg57p/DvUSuJSwjL3DyKJQYK7NicHzHEUnhSy5CywbScyzEMFDIFksnA6uPt6lNVVUjedEzWGGvv15ARRo9YwM8LL6M3JFNL88WftqZfPWkqGilJvXRsNFTOFznNg+TcXfLlJZ90hExAMF5e3DEjdZOvz1rSktIpPNTk8x
X-Exchange-RoutingPolicyChecked: 
	UgLLmEuNcapuSI41QkS31B7sGkDRcne6MQ6sHwR1fnruWGGYfIN22JTf5uA5cy7DtvN8L6j+20JKioVioR5ZCQbMAmTYy4tnablCEdO0To3yzgaSTd8F8DMyZ5k4+uZJwm2wdYwuGPgUjua7fHowpXnc45AY4U4NeY1hSfKyPwk7rK0mz50gV3KQbGaLNKAEmT6ZuePDtQkssUirpfqRWKSc9N2Jlcn9VTSS8arL6JMpumZjjxbfHxbCp00MY8ulLWsiipSVzaqthH0gyEAWqJyxBA868fWH/hRqUvXPCk3oXEdXwbwu45AUGa5dN7TAbd1k1JzFWfLUZchkDo4nng==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:10:40.4725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac090ebd-693c-4513-7d2b-08defeeeb9c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5606
X-Authority-Analysis: v=2.4 cv=N8MZ0W9B c=1 sm=1 tr=0 ts=6a875135 cx=c_pps
 a=GVBTemxG2YnQtEc2diEjAQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=44h2azOeG0xN1_HZQj8A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 3X89OMftJBe7Js0SBs1dJHNLEp83tcYa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NCBTYWx0ZWRfX44WGCPgyq/yI
 JiyM9HBerkyw40GdzWeOhCgduqDJ0RSjy0UnsHkMwD2bksFjG6gUOIvIDPtJ5Tn74YkR5iylYs8
 BTwBXJ5DzNLmmKwsHoKaPf6tkEFtt39wz5RmcoTqQ283/rMSdubAdZ85lQOiBezhPLquVpmwuHD
 Cm9knIJ/+SbbVFIAmyZ0BLX/QUtQKYvTNLmXIgM6i+S7Nvt1Qep3xDGzsBxoPRfgbuMkNHLXa+2
 e8xFBj1M1hQuizuUhd6ndYmRKNEcZOF93zR928y+NVG3///EPfggv/B8sGjxJwEBKU/b7Ct0Z0/
 yGcLrK/sddb50F2+JXZnVGtiPVpWkhMwdQ66Sqjt8yTXmhmcCWTFmC4BWEBAAVTHidCC/30vCDI
 FUrDq17zrCUjGUyT8kfzGe3u1DDq95SyY0EIRaShAaZBYGDE/mpZFl2i1Pbzbvt0DBDbtFvPC4u
 KDQ+dDwH0YjHXWicvMw==
X-Proofpoint-ORIG-GUID: 3X89OMftJBe7Js0SBs1dJHNLEp83tcYa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NCBTYWx0ZWRfX0wR0YxAHgmJZ
 urdrdA+llPaVhNHHrnnkbkGc3iGMT8FgBCJBDA+tdyhwZRVPvoOkIdrZImql83skSe+8PdU/ykx
 PJXKF+nXPZCgMm87iIv9R90tLCGZ3QQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200144
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Aug 2026 19:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20282

meta-ti / na / 20260820190908.3203620-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] libclc: Import from removed oe-core recipe
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 20 Aug 2026 14:09:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e51a505bd5bb46c5a1eebbce1e9109596882521e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libclc: Import from removed oe-core recipe
- Commit SHA: efa79ecf86c0b5e5aac109f7c6c16e5653df5b68

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: Are you missing a PV = "...". (PV-1)
        meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
    
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




