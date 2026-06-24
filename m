Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07559CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 18:36:32 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14505.1782326189747280335
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 11:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=eVE0YTVf;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=cKpJ4fz8;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OF2ZU3483649;
	Wed, 24 Jun 2026 13:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4ySsU5pyGMUDzKV+tiYrkhWLDiqEjD/iTMuEoSSY4
	0s=; b=eVE0YTVf/+7u4C33j3VNW8MerTQgrYu7CK7xU5qjrftih6kerdYXNihC3
	RIAoCSDY9LtnRMvhrtYHAbjVeB4t+s8Iv5Jya0fzpAMIxQnNbApzSi2XotpFcixs
	CBSavz7upfIvy6379RAWw/mXOsEe3a+XblhRvslR7iHESUPMdAjEYkv9T4c+u51u
	98z13oLOUCd3xP5bRXD/3U2vNJiQquHOdVgH7ClAXhQ6rTP95zZg58u56W1zvTMC
	HnDU4Fh+eFQuKTaTFoh5wjJfOyKqXCoOknZ9zxDuSJ8tCsUBGK7tlHWaoE0+/kFO
	G16R/i+JUWME6TOk/TuWW+r9Z8llg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f0e5yavg5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 13:36:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqUysLIHfRLlOkALoMDW4VzkgwF4HwX/weWhoUJNlkgjiGNdD7I5zUnHv6II1y1dfG47wmv0RAMuEnKzrJtOJ+ICynV3Dt01CpbpHZ8nVb2MGitpcI6dNG0I61MSy1SliGHNA9CFWkvPyRXTY6PUNjev/2LoYqErur5Qe3gEPWh9/BANQGlMq3ih7agD+5Onxcozze6QBl/fLCpzMRltPl9wInEcmRZpu2eK5+tbBk6pGsMARrUlDZ3iv6QiKTGctKvUntqVBuIw9i+ETzBzVXXMRNnkO0jU+NMKAtI0fheauMipDM6O/vShXtAheu008UumvuFw6+nkFFyou4xPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ySsU5pyGMUDzKV+tiYrkhWLDiqEjD/iTMuEoSSY40s=;
 b=US+QeIqZR4A78U0k/mmB3VMbsUkXbwQdUpgE9uvmeaNchsuOOyAspUYzDdqtAVMc+T6uRoS4GmI6/IxGndU5NLKKajTEwgqRc7idqu3cts3MpgviY8vfI9wt+Io4yyddncUPv6V3qlEHKBTEKimR1k3/UGE5r1oeg1efGAH22ak2XQiyuNOH5SINf06FKa46HH4WwtMXNKWnL4zcNxO/4lHjNSEF61G4qIrwjh7qiDJF01YkO8FvR4CKRyUppHVRx8Wr6A+X+5jF7Fv8gXGANc0VyFKrSAhzjbkwz1KshErX8AnsSK7hlVoWn2y6L2t7hIVfLG3DJkUgsnkZubNrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ySsU5pyGMUDzKV+tiYrkhWLDiqEjD/iTMuEoSSY40s=;
 b=cKpJ4fz80O4p0inydEhmuNUDZdcu9JbYgaacVWDApZFITmOyIjHuBWBbQmSwQeAmKfp8+Q6kJTzORQN7gI5yWm7hkzL13pr28F2HfkZCTlMjQwKqIfrJRTMe7WoyG07+tKcwApAgyPxtPbIusXzo1jv0PBkRkZhJMDtWnnypMVG99J8dOL1YhVsDB3IbIsBYlxbyfXRsupZy5tMKjq/gpBBbcPYwCertEceFkwyH0nBmLP8GnPLoUW8SFHaoXyf0xgVeBoHsTU/jHcKd8FVszZolHFZVbeQaydu8V7P1QLwVRdcWTesurB19GSDofkrmP1sSewPUY7DSuVbxJ2B2Cw==
Received: from MW3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:303:2b::16)
 by SJ2PR10MB7040.namprd10.prod.outlook.com (2603:10b6:a03:4c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 18:36:24 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::86) by MW3PR05CA0011.outlook.office365.com
 (2603:10b6:303:2b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 18:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 18:36:23 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:36:19 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:35:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 13:35:49 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OIZnX01018458;
	Wed, 24 Jun 2026 13:35:49 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 52CFF9ACF4; Wed, 24 Jun 2026 13:35:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH 1/3] ti-librpmsg-dma: Move this recipe to its own directory
Date: Wed, 24 Jun 2026 13:35:49 -0500
Message-ID: <20260624183549.1360252-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260624183253.1130737-1-afd@ti.com>
References: <20260624183253.1130737-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SJ2PR10MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fe7bf8-fbe2-49ad-aace-08ded21f7e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|13003099007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	7Tl1CFYRvRn/nvkHMYzI2mVCxW5HSYfUnkUBt6qpkQmvPSZ0c6NoGuaicPYK0g2VTIFISbgDszNFOZIJgpoI0hlESXeXnddr92lPjKd+XcEA1vV07IIBz0RkQkNEt42HFsVHn6ee0VS1VEPAZPwmUxFUZk1Op688fLsYlBiPnY9B8+yFwBe+jz0nqmzSKcWaRmP1FTD/0C+aap4Z12Kt/75b5VkDRXVGwajno4RN+6+bRLL5HTsuN6vH6jlVZFSID43Wn7YNSih0C/ce4jt8cLVeNpdKbWYC6N49RKLOrXxrasYcXDsODMEIxgCKZdfwFE0s2s8BHNDbTot3ZsovpssI0qCVtn/8c2ib3NJNwz9UjlRFbuxEjGRWt76sdjjh/Zdoe50MfM/5xI1BSfCXGRffllSzAj2jUpLYhtgq1t/D3e4eP7zukG8V7jBJftrtxBFqRrW1eNyfhir+1Fe3SpRSW/6CyE7asrltj0RJtbXjaRO4lsRprCfFlO4LwkngFwPuRJV0APJ+dLgMvU0jNfWbi7KmNcqTl47SwyrK+S3LdscCH7ONCRVt6Z+B/eFL29makz5OvFaNqDN2VUbs57VsBJhaUeX+TrMLF8L1GlPs93n7FanrBkCxaR/RZGKBjRJ1FPU5v9ARvGW+y1hEn1MDqkwnFYOpi2sxuP7wb7SN0kKKwUrbC2E0gWrDl1OdcNw5M6Pf5KK1i42ywk222w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(13003099007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZZrOMznKw+H1nU2BGbiNAlofVCu944T0X5PnDdxjqoo/e3fCIsBM8oVYyCH5t7OfgzsozSPyqq6ethlC/xzWhy7SfcmjYPTvIlvMstpVANg0KuZpGRQn5qqR9hwrEWyR2p3HLLeDBKGqannh/ooTJ1pjMeINRQHI869N/UfxG3+UComTDlnaZbX1EAxEqis6Em9eSNGZo94sfeH3cOWU5f/7t1PSm86qzDfpMR1iinPoVWDCc0G/tYAM4mZICbhroQIBqKX6awsOnH/YRXJ1mzYjBH3lvjI7T2x2Xuf/Z1CSUmFD6YBpEdI4IHcnl/sB96j88JDdXqn9Pdp+TAlzBbV6NJiRTArjpEnSjVGhU+5kbpweQfXM4t2Yft3wsPDrZokEPAB/CubKSW7lC072Sc0HkKIWmekIPvqRypJsEkAHIVFsIt8GadW3nPbZ3CaV
X-Exchange-RoutingPolicyChecked: 
	as5vSVpufKjk9RCoPMnJDIjaTWYlTGqk7T35HndZ+IjJI7HSt3mKetg39A4w6happl9ACp8I+21anDEPdTYPuaSMNQHdDw4DTNvLg6XsQSObMkagUxfNwg7HZT+t77AjcoZrtH1wK/mLRwK3pfm5yCQGLp8KdKCLcD4jkCmRKfF3m7O7lRDbb7HKrlkBzkSq0El0eI0kXyLLAas7uymRNU67rH4ftNYHiUjws9DOa63w1TpMxJ2m4faAOWyXrTaIHH0/xOW1F7KGB/3vnT/y58qWPf+/B3Zhq02x/BscSYkC5zLFZnLMW8/CjFdVirUpMcLek6qTEenrW5qGpdCfRA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:36:23.2860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fe7bf8-fbe2-49ad-aace-08ded21f7e12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7040
X-Proofpoint-ORIG-GUID: MxMecOnchEUHUthVbz4d8zBWuufJaMUd
X-Authority-Analysis: v=2.4 cv=R6cz39RX c=1 sm=1 tr=0 ts=6a3c23ab cx=c_pps
 a=dVriaH61pmWkicxGRshTTg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=OVfU-T6HF4HmXD29X8EA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE1NSBTYWx0ZWRfX2+o6q8oK7166
 /4lfCFHEsd3Hb6nbq0wh9uw7o9N4Al27DnxUXDcSdGvn1Lu9zpCX+7fTgoaYOapdkv+WPSV8LYI
 A6C0Lr2glid6gY4I1Zj3XvaG+rf/F4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE1NSBTYWx0ZWRfX67DbAiFWcnuv
 XTZPGYvWTiyebmr4cZXYk9m6iy677bS6PvLcweWLXwFtYWdF6L6a6cJ7rZF2snGzQDdW3E3oiNi
 pQaxID1ySKiZl5gENvx4WEtsgs+USqaFXXghjONg2+BgRO4f/0ZwjEW9mGE28/CLw0ALG7E56kN
 fh3gyRI9xfMK/+Y3egsTMV7hqwULsQ2I2VTOJNxOuf/RZqUPY63w217rzSpKYmhPRhloqR6qNJg
 OzT7Phs8vpuDFQduNKZD1DhcrdvGzB3gSOQXS9eOhBy/HzUVGJv0ferMzbxOSBCiefHJJAQiXAn
 ZTkNCVUCbRK+j47phiMAakkNInPJf/pAiq8/VDA/2yyiQvMw/mu2KXlJZ/DyHyXOJg5VJxpMW/N
 xd+3mVeMMxHW7Q4zzIRwXivGTir3wA==
X-Proofpoint-GUID: MxMecOnchEUHUthVbz4d8zBWuufJaMUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240155
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 18:36:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20069

meta-ti / na / 20260624183253.1130737-1-afd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH 1/3] ti-librpmsg-dma: Move this recipe to its own directory
    WARN: Commit message does not include file/recipe name: ti-librpmsg-dma: Move this recipe to its own directory. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master/wrynose][PATCH 2/3] ti-rpmsg-char: Move this recipe to its own directory
    WARN: Commit message does not include file/recipe name: ti-rpmsg-char: Move this recipe to its own directory. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
FAIL - [meta-ti][master/wrynose][PATCH 3/3] ti-rpmsg-char: Update to latest with CMake support
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
        patch
    
    ERROR: Missing License-Update for change in LICENSE. (LICENSE-UPDATE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




