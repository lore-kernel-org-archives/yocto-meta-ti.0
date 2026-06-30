Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88552C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 18:03:16 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27701.1782842591569881325
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 11:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XspG5hKd;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=A9p//3lA;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UGkJN41326653;
	Tue, 30 Jun 2026 13:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ID7nYzpQY4sPveI5wBTEw5ED4nR1fx5k4SRvz+EJf
	sw=; b=XspG5hKdWDQNS64mhUo2N1YqB5YsrosQc/a3buqpPgBp5G9pwk1f3AqbX
	uwgyPQjvtzijXDFyoE0SGVPm6ddNKLEr5KSyu8DKsY7tkIDU3TsLgOjUOLGM8K3F
	PFNrqmzksHTcFujCTrX+c3oB3prYw9lBRQrpQNLe7SM1gIMFLZ+h3xoUpPPMNs1F
	OUkDhwSbLW42qqostJ3QHEf+BHPIGrH6o7q0WivDFZKH98EQVse/bNhotq9r8YFR
	uFH3TGGv5Hsh+0n4cY41cEaG1V1UlXFEt5wVi2Zih61DifJEDKoIzH6zPvC92QuQ
	fXGauy6t4036PCrPYZtl2so9wS4Mg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f4cq6tb0x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 13:03:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGbwAEvX9nVkhOO3VnZ3FOmBYGBY58HnIbCRWn7ymH2Qtn3YeyRK5NnuSiRDVsMzjQN79YopOMdXPWrRf/0DM1quA9oz2D9SUv7tLmXMk6Hx/q7twmdol2nzbattLNG9xAUYf3gJL3x4OcikkWteynxC3TQFwL3COfpCFmfCip3LWtv6MJ3xS20N7lkoHIYSvVgyiM0wiTLwqWOSCXaNvob6vgJocxf31i/f4P8FLsi40cP8iJUbViBuV02mByKWtDjjOj5s9mHBnqCBLQphERNA8aPHsyj/TTgQrna1Bl46Vy/i3Yl1ROL05gh5CQJ6Ag6cHde8+KHt0x18l3sNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID7nYzpQY4sPveI5wBTEw5ED4nR1fx5k4SRvz+EJfsw=;
 b=P0oD4F+fAWGVDDJ9QEkoxApDXdUaeITD7/dPwL6N+41v965IIvyVVwJcsF42jDfPo/ESagFD6R09W6ci5dDF1pl4zdtc8JK1CayHt96dpHp0IHZmhfMgMkR7+gvFpbv80zAcYtcS3Et1MwglLABSpYttdalkf9P5co3p8tSycLe9O9p/9wQUrpKK59SWoVBCiTAkcqxOomJkc+xA4EuZWLB3H3gPMV7QmKxIse46B+qpJBCAOLFILx1GbqHdCuTM9dGHh75UCx13wxkXSlfYmY9urLWFsyxrI+Z49mIiCyE/xEfY85899sPcGoqffBfld8GV75rCFvnOjuDSSmOo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID7nYzpQY4sPveI5wBTEw5ED4nR1fx5k4SRvz+EJfsw=;
 b=A9p//3lAvv69N7PJ/KSuwAFd6V3Es+JuaTJW9Eg/zjt2iX0iy9jaq2ijkWHPMc4PXh5bZdXIo5ZY/K6V2C9qcVTYOoxfe3twp1FdXbeBfR2fU2x4ENGYdw7Ynm2q4P4lSP2jgeTjC22xnTSoODZKL9MxAtqSomVddgHP0mcVwSze22p/mvzUxSaavxzoUR7AcPyFVMCln4ESodT+dwa1DZE9d3c+VPMxd05s2ILGgT0nlyjP8KQFECN4RZWODrEwEXZc9LeMOQrIl6v3lJLZCZ8uoFxpLvF0d8y84xHWS6cdHL9aaVH7qMjnyaD+jh+dUy4iEAMVVv31Cw1E4OjTnw==
Received: from SJ0PR05CA0119.namprd05.prod.outlook.com (2603:10b6:a03:334::34)
 by CH2PR10MB4117.namprd10.prod.outlook.com (2603:10b6:610:ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 18:03:04 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::b) by SJ0PR05CA0119.outlook.office365.com
 (2603:10b6:a03:334::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 18:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 18:03:03 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:03:01 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:03:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 13:03:01 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UI31Cb3084722;
	Tue, 30 Jun 2026 13:03:01 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7C80F138B5B; Tue, 30 Jun 2026 13:03:01 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Build tests with dynamically linked library support
Date: Tue, 30 Jun 2026 13:03:01 -0500
Message-ID: <20260630180301.740477-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260630174314.1561862-1-a-christidis@ti.com>
References: <20260630174314.1561862-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|CH2PR10MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: a542a036-fb85-492d-669b-08ded6d1d44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ll8AW7fOykANRlCsUF6AmkvaIDDqXP2y6NwqEL2neW2EXuFjFm5aD9FbMss93eHebE6/ZqgKnphh7mnoPN0yEwBtrLnVephvvZv6wvDEPKBMwBIpUjMxr/FUZt92xb7GNInJq0oSBcjhtuuQ16+7GSqsfQF07bDghdPSV+fXuMHmpPW2PzfY7cZo7YzuG5tYuFNAjEw5/uBFt40lpsgc0+lZEpVyZQ3Idxx22fGuCRv5loDf4doHrHVNf+bwsFv/D2soWQUZWWk+xDL5wPGPN/+fGIkKpb0j62dDoohm74EYjSBCBZUv9Kx1XYSeaH10Cg8SI/Ub8a5a9QISlJD9+CCVXgjBSmZ8KItH4FH4dRuQ9R1XX7hfk/lDZMEV56LDbiZI5fYgeQMypv5hhDQF8SoR21ZeeE8tm1Qu0bc+1o4QNajj4zkpFwKtJfxIi7btwei6rlenJ8HziRNlE+WPqwr2jijtIDJnZxsdGIMzhjFltfbjrsD4pwmYiQWhqbS0BVnBR7mQ1y922wqTIRin9xSoe3OKuRqKdiVFZVmGuB4BGcJLyvp+GGD+6Vu13DO1SYPjcEAp08JWPwWXYRPM0pnMWHREzfT2TPVG1WGXZV+b1pCqhbQsc2kP4TSk8gQT9mb3fchlM5S1yt9e5ht7M75aChNdUqGWYCaFhwg1KPjXTyuDoZT4nOBai+rTNhaO
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	p1qgO4C5MYT7ofmAi4f+MLwbSqREHzGHmjKQ0vQ9lJjKsIaK6HEwpS0C4MpQp5Le2VvyScnt7hlrO83fpJ7W5mvrfJbHsKgLFftmKVfmrCiTMtMrOqRIGr79K1ff7Yx4MVXDkqva0JHUZrNFq2N/jyC+T1SDSC/eXiPtSQ+C+w4h2jHNCSYzTwfJCEKPFy4BqPXspO+U7U50gIOdd25x1gxhPYNmBze0BonWPWMVMEt7KUXEsov5lcdq7ZUWloamM2+iM9x9aejmqobzmdjiEyFn7YetvrP1SBd6/nAga3AO1i83cASVc8JICTvZNc6F28T+rhTc40wIZJ1reOiwmtPPw2XQL/twaGvFu+DBNDbL/XM9NiejuOEPperia/HuwYLArUCoSTOAeHJZi2rbtyy9M9rs8x+1dWcJ1KdAckuCBMcf0gVdfcOjNma05wjF
X-Exchange-RoutingPolicyChecked: 
	JWaKDqYTRYskg/WqVADTgbyr5AABRnPmyckORkaxiRuJJlQ/xdnWjLj0OH8yvZkspbFi7tj7zGTHn8JlhIjh3t8gMdLt5+pha+RKA+GFj2ueDHUJD4+9NRt6SbKIASRIiOZRbWmTYuhMecPjIrBLm+tYqSCr4CDm+O9J2Eywm5zP/d5mqF4Mwpr3rI9IGsTdZK9JaTaVAinx6Se4GLwncxLFvO9YnOvL4jjIUjdKovamo/iDfrtB4CVgBQcxVaS8OpmRqk0qZFZA+sZalpBDSUKpbwM1T4FkgfRZfhKnX8S7VeEYFmEjVCd/ys0ikvis7cUSJBU+DAm3lsNF+DDTxQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:03:03.0071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a542a036-fb85-492d-669b-08ded6d1d44b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4117
X-Proofpoint-ORIG-GUID: TWwE1Ws0Pe2RmkHUZ-Oqy5c4dEPZjuBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE3MiBTYWx0ZWRfXwZIwupyw2JdD
 E3zEjG8sMzbNvMvTrSflfuw1Uao3v3dVFwj03yfAOJ0qLAEDmDEvwFAELv9lVeRg8K/iJWIpVnD
 OafytX4kGxIGxKp0kBcPCrixVHgXncmxigKOAXpPlkFAvf4ab6vIEzJG3hkEqWLRgcTKXMXT8qw
 5OYDqjjwRUB//Faip4vamJyqRFpF13w0rcXT7hZ779H2YJTVLLOk3kNFE92CoE+6YGnuc9tmsy3
 uiEPsTmXzz3Gzt9g+D8T4dFDoEMW+dooUHxDgJX0nJVBV0DJ2J6mOu/taRYMefEgc6+BTf04oea
 D2uUcsgs9dwEjrDrSDo8kKxUZg6DBdozSFG7WOi6C0aFcbuE9+XdKMlX6u4oPq5RJOjgSy4zyep
 +jopwkcqPQeSZ8goL5K4/C5l76ECKR5pxeU4NoZCQj1g8zZLTQ2IUSc4Dyn7Bcy/AD6wIoIVfc1
 v4srqBrSrN4ceu8kGvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE3MiBTYWx0ZWRfX6Z0ScL5nXGzY
 HR7JamRIevtPi8jlp/2KM5gZnkpi796j7zkjJQ/uvzMOw5kWkAOviuuxQAJwFiyxH38t23p0YUP
 tdgxdZ+IEc10qs3GX9XZNeWGeWcxzxI=
X-Proofpoint-GUID: TWwE1Ws0Pe2RmkHUZ-Oqy5c4dEPZjuBU
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a4404dd cx=c_pps
 a=TuEuCTxUJaX1tclN0RLokw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300172
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Jun 2026 18:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20110

meta-ti / na / 20260630174314.1561862-1-a-christidis

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
- Patch Series: [meta-ti][master/wrynose][PATCH] libsdl2: Build tests with dynamically linked library support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 30 Jun 2026 12:43:14 -0500
+Date: Fri, 26 Jun 2026 13:28:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6848afcd439b0dd37df0d2d25b040310109161f0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 07bd4c181e2a400d4375ddad7a20fbba6578b133

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] libsdl2: Build tests with dynamically linked library support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 30 Jun 2026 12:43:14 -0500
+Date: Fri, 26 Jun 2026 13:28:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6848afcd439b0dd37df0d2d25b040310109161f0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202606241800
- Commit SHA: 937a0b45728e16c279a7dad65585da061526936a

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




