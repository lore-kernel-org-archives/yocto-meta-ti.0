Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C35BC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:50:57 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95338.1783093854549286546
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FBfUjUT9;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=D6W+6pvi;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6638KA1R586566;
	Fri, 3 Jul 2026 10:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VmBphbHBM4uJscAIeN1/voA+KDovcpui/QuKASvN+
	NY=; b=FBfUjUT9r5ojxnwhlhsy4ozdmnQ2UP2mxhaWNzvt22JPplGXAcdoPKJ+T
	clkHePdymyl0WFmPLJ3uQBCujrZzSgxTtSyIWvu+vhfzXufh02kFE93P6FbyZIK7
	uExFQHy25YDsnmQstyAKbV2Ln2l6+QMkrVOMsnEh+cwdjgOsqYU8Tm5V4asXYYFZ
	ffSVhqJ9B4kLEMiRhKMzBDU93UYd9pLchalFBmO+sroZX6YcurwfH8Z/5R7C2dPs
	WhXaqKYyUyPi05HlTg3NyNY9zn/Y3cpQwI/J2HSVd8f4cbwiUyJesDAFffHtIcai
	TwBb9n2roNiL/Wk/akujvAac97vHw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f69fwsuxf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 10:50:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwEKg5ZDh931MT1DpT+0JRgejnaIBujJ7of5BuBSPCPO7Ofoad31moURgQN4MvrG3aykVIRaaTPlFi1MLwprPsyRsIslUiqSNyj0OlrnwaMMRembliBUuQziThJ13IOnut8bvto/d+sAKSvzLahD+xqoavhP6hJtL+juLDEaA6n96zQBl3Ldim7UU9n759k1pqjePdV1QZ80T6oapGUp/FIwGkFUCGuVtyCfuivIVmiTuIJ4k9jQS+pQC5iqm6JQpGD8djFxhy1VHNreHkYqb0DQR81zhGETXSrFRHUuLrspFBO4Ai22OMaALTCMZMaBhezdrDi8rVu+tVU9B45WSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmBphbHBM4uJscAIeN1/voA+KDovcpui/QuKASvN+NY=;
 b=IMY8f5rguLLYCegwLigPNRQWqX7cqnz9Hu4dTw8chbQOFaR8Gsxcph8jYts2YLycdk7mUXDjS5VGwGVRpU/xI32UCuGP7pD0PSTF7QRKsqOlBIwppfK/vuPSAgnSjpAZCZWHEjSjLeRC1X35UW+/JlehVrZvFKSBPjmG3M3qkQx+xg7/WaV38TjFHoza7HlF/zrvXfAdqiarv8gkZCKB6GBKuC6B1IfNKzc94b9Af4WepWG8nxd8nPC7c3SSla2A8JWajr/TYeECe2O7tkG4kKKgF74kcu4VmrnePV5wPjYA4U+jhq5SsyLpQ6ZY7S/Jy1bl81T86YIXeBqN7yzL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmBphbHBM4uJscAIeN1/voA+KDovcpui/QuKASvN+NY=;
 b=D6W+6pviJH+rXjb5pIpGJL8CHDPiRc34nFeCVDTsNcsUnl3IkRI2JRrAN/LBME5MVv0fk592RdEiPwRmiiGNWv5guxMzu9V2tZvpvCFyNAEcZOLT6jI0l5WP77MCViyjR/qi8r2ixXOv+8Z9CgtdCELx5S9Cf00j+54vU8QHFasN8tDEibnflk4Z6FVnWEZVTxIvPUWHVsEQFyUYEBlONZA+EH4MQp/tNBm7rJH+wyQh8LDId2xlCXN6KpFCvHNab3q5Ltrv3f26MaU/9awjkjhdRfyMMqhJeQ397M/FUFnuYLHZgllDs+anJoLYbjvE0HbefUGL3AXNRZGawvvAAw==
Received: from CH0P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::25)
 by DM3PPF2DE5834CD.namprd10.prod.outlook.com (2603:10b6:f:fc00::c14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 15:50:48 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::a4) by CH0P221CA0015.outlook.office365.com
 (2603:10b6:610:11c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 15:50:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 15:50:48 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 10:50:47 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 10:50:47 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 3 Jul 2026 10:50:47 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 663Fols02275418;
	Fri, 3 Jul 2026 10:50:47 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8BDD59ACF4; Fri,  3 Jul 2026 10:50:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607021223
Date: Fri, 3 Jul 2026 10:50:47 -0500
Message-ID: <20260703155047.2490635-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260703154905.246374-1-lcpdbld@list.ti.com>
References: <20260703154905.246374-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DM3PPF2DE5834CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 15876a7d-fc24-41c8-3078-08ded91ad9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|18002099003|22082099003|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fOOfaB7ym0DwNlveuNU6gnRFQrJr7eXUV5fbd0GB4n/7NUy7lKCsNr47dxznOibOmb/xIe+BCO1ohoyccT2bOVsqLFYQGfmgxzay1IENqTFpDpb+gTHiso6a1LaAvBFfm9DhSJNdh5YAoHNCQOUALzeXKGjjtT5Ct9F0VbO8nbj9Zu7Z9+btYiLgwrgO15yekiTn6eY7g+Yv0o+t7zyTnpsAvGdftWhjAP7RS9r7h72/qawmy94C3iPp+qXTYuBWXjjkcPCafbpMvJOUTRUpuv8SaJGLeu8X2TL7Zb+Xue2m/VnzgP8vQvqNnyoPT9UqiHEjFtk6lCqJFwfq3y3ncR8yRvgYCaO/7go4U3B3Rbgapmc/8zGnXQfOLRQRtLvLpvysHY+uLq1Ywv4qGw64qC6zJbmnYl5o/xp+fToQWmd+Uve/SEhN2dl7v3FirzvFlon6Fn/jOtoldgiq/Y3DMAkoJu+AhndQPHEhoo7djIzGlHEBCizgTDKH2keJdGvp8I0TaH+M5kLFEO2gn45ZDx0VrriiilhLBaD9DAllGoDSGrK9zw6mp92G6oRiPHML3/o337/vES/q/C4wijEYL1x9+bJad1OxDdw4YFtgadSZGKdW3tHGuZzmHmsQjpTjVwrdPKylzMTI9dNy6FXtX3PdC5XxUs8bo6fDJcfEU80kDiRlele1ERy21ik0ue40a2DJLJpJrYq7SHb/VGHyEg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(18002099003)(22082099003)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ggah0PFiAU/x3OQul+47jYwoirWWiQfBe6avneR6lSpE8WVHYv1KmMreVqu0bkMAEVLvHb5ArxInP/5/KSjMwdzXQz0XPV22/gugtjy2WVHcnwPEmkO8Bl90aj0zRKnqNPvcNoXZ5mUX9a+36LEwtSPjXc4zkPICTJ8Jja5mHXWxUSiIhvyBa1ZLrEt8f3OVXWa6gvugi6mWKKG4wbQmmlQqILLqQKECRV+3eSony8sUDD9mN2et+Vxk4pyHIVeKUqEYqmGiI98/jJic9Reha5cluhnCjFTmiQ8yVlBTbLsWrntUm7VZKhIWrvxXGnblZ3q8yV+VjuDmPuOQLXqr5csfXnkHCmP/bKhEyXjzuuNAuHTo3Qd51ubHwsUDCKbqGIkfrAZbGxZojBPzuirT1XEDt8niK9HTP3JOTEz+ixzSFsVATI09yhmC6XE4MxEC
X-Exchange-RoutingPolicyChecked: 
	GTLBd6lEZHgbB7GRCbPCYWDxXjT511csOD63QiSpiaEzSeeuW+AV+Xe0f8zurXanUAYQ/hwusXwq55yT2mstEGj+XwQV6RASWiLU90CewrxrXL3A4cwQ00yggLQU3hNU75pAKmrswzKXuezyzy6yTJFMWFHR0NNXHZSi2JDVA0AOtqbL1P2AeohWHMHPPYZxGj83M8/d0CN9ZCbyo6MVXGVoMQH/UkLZeCAqzmpS9IX06zVmVuZAfutFV6Tk/T65x+uMVBqpSlrs2ORqbMrzFZ+0tR/iD6x8moo+2r38ZZq257UkcqNRH78XpIE69BVzLiGqGLenwqqI60DCL5EVUA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 15:50:48.1900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15876a7d-fc24-41c8-3078-08ded91ad9fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2DE5834CD
X-Authority-Analysis: v=2.4 cv=ZNbnX37b c=1 sm=1 tr=0 ts=6a47da5c cx=c_pps
 a=sAaYeWWHS4LdRs88aTULxQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=O-mi0qoIjjVpQ3RRylMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: El0tVZ2z8pq9zQCNKh6GhmrbeQ7ns1RQ
X-Proofpoint-ORIG-GUID: El0tVZ2z8pq9zQCNKh6GhmrbeQ7ns1RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1NyBTYWx0ZWRfX8YB8C+YKNbDf
 9WbtKpR0dkLg5EKCjd67JT2t3iXsFfNWi5JcjHBC3qkUCtgzKZ0FOg+3iUEJozpkAG3X5WzW4sd
 COGi15GxFF4NfUkPbT6sN+ch+d+juhusv/WHF9Gp5QTXP7vrMpbCrvWyUu9Ns6xyBLZsEAteMxa
 dzbvLfzXie9XuRGEAFzcWMxWTYHKoB17FMB/mwdwwelc4OMXzTqxEFG+lPA38+F8zdILAmr59Zx
 Uhv8RFvS3bsfP53br30875qJZ3VQxzFRD7ouk7iB0Qs4PegHOx0cR1FfFKhxn3EAiovs8XVIb0T
 MnVJyQknplPQU9VoJyyuwKRF36y1oSjUXi6krAkN1phH/tjLtzAQr32BCCPszOhR5vrf0/zUjjp
 KciTEXaQ3pwDWcVoU2z2YH+8eqmE9udpmbUdplccqiWslI9VdujHSU0MhUS2PHte5BHXZ9ERZgu
 sNs2SDRac11ErOlJMjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1NyBTYWx0ZWRfX6GLGLqtyCXLZ
 bkQNTQzU9hVZmTrRRsmM8ofbX9K6/obdNR7MPxHQ76nWUfOFonH7048GEurOE5lYph805GTAF0x
 aLyl3kv6KHYIMi66Rvo+Gi7k3ZLyFqo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030157
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20124

meta-ti / na / 20260703154905.246374-1-lcpdbld

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607021223
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 3 Jul 2026 10:49:05 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a2ea18bb6a0484dc31b847b42a3d03ac17182e41

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: libsdl2: Build tests with dynamically linked library support
- Commit SHA: 3c7885aedbe8c0196b4ac7842166d8569edb84b6

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




