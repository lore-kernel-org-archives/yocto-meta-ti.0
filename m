Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5666.1792606695626690196
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 11:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EsR2adRO;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eT3I8Fag;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LHqoKr833795;
	Wed, 21 Oct 2026 13:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=W1CoY+8gwh2APCFlu0x/ngalDl0VLevRJRlV5noU2
	7w=; b=EsR2adROFTxIbhljetJiHTL7B5IKs2V7SphCSZS8zAD4Jiyzv2FP3W6t8
	250Hi3fGcG2VweCI4KJC4gwZBq4TjGmAWkY8H7SOvPqkuplH1BiYZJhR8qYtReIx
	52/wQ1Y2mFXOCkXMgjxllDLgqRxeH2p5+vEiTyxtmI8XGJa/A28DAqSE4YPlBRZi
	Dgwt/K2FcnarerMTJrJWg5pNw5OUZsulwVlaKi0trvx/s7o058giJPJoo2GQWgJR
	trSrI0s4qMq2uDUM1Ac1/lCAiIPAhwvZICfUScs0kjArtY/SbDd2UuLGN+kqdCjv
	LDKQpAEpaXGNKBISRdO2DIXKR0mlA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hek20d5jp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 13:18:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDG5Um+qCCLw68vZdgEYoxC+/lFFsj0kgfqbkIK42Z8ir/EUh41bm9dtbX+voo2zWUfnzv6bBGw0lmTcBC5S4TgFrmFF5el+bDE+WTJElA4I5jVwg75sJfKgAtWpY2dRNBcjnr4uzz4gLYt/7y3GkWd2tss+/KM4yr8k8URk1nA2dgijAC1fXHs22/ohBpbIdhGIf/Y11m6jf9zLM9svBHnlS+EyKWi2VBAlrdlJM/14ijHPNtDjzAzu0A7qQhlREKNWRAwdTS664Ys3ejJOSEhpKRpFB3+AGWAl5QLd36omtWgaLqxRUV0D88SHDTX2SCOYQ9/Z3COWhfYbpjFT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1CoY+8gwh2APCFlu0x/ngalDl0VLevRJRlV5noU27w=;
 b=lijzVxcsG2xuWWuJuGa3C5SCYFd9LX0a9Bn5KFKpQSEgZ86JYv3bZ+8d/WGoy2WCHRlvlBwWFE5lAn02U/y7en4FvLfOW5yJNIvmQC+Dsn3llgDtKnDKAxSRr0yFA7JWNurdOmxfMWQ1mfs+MbRWfcsmRKoIQ4lIYOAbnkR8y8MFzVGzCj+qs3Z5eJGd3VN8i1Q8XE2F6pwnTQSKIYl5c9XslVoUvihW9O3BYZD50mrQunzxaUwjukMjzUWvW+w/FW0menRXWHQXFNAcLb4cSHOPale2ugDU6TzqYC4AnXHLxEth7IblZxLBb+sJpFB/JTNndIf/7qr3uY3swpfdsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1CoY+8gwh2APCFlu0x/ngalDl0VLevRJRlV5noU27w=;
 b=eT3I8FagF/yhScVb9TIqRFgLBN8ECSL75FsqcNWx18gBBxqYcjylnd6EGNC7gPsCEssLBbikw7TbaffGfQQCPVsBt4u4FqRN0rTDejzMHU00X8gPZrVhBM9RfDsSFrpQfpn2qDdGE/EMRuzEWIkmM0v4ATEvNW1+AhMn33AJ4AMcT6iwFPHrUjrenZQQO9HtYReM5TQfWhBQHEmjQyDOxWzbE6/ZfnufAImRer3Fbru24BptsyDaI0NmmLkxouB3eGdUTVficS0p4bD7PnjDsDzrd8e4Yhm7CBCrH+vSc3AdxN/MLR9mR5NRuMnZs4l0SUtGE6Jb8klYc3JP9S6pJA==
Received: from MN0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:52c::31)
 by DS7PR10MB4829.namprd10.prod.outlook.com (2603:10b6:5:38c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 18:18:10 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::26) by MN0PR05CA0006.outlook.office365.com
 (2603:10b6:208:52c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 18:18:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 18:18:08 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 13:17:28 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 13:17:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 13:17:27 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LIHRwS3099298;
	Wed, 21 Oct 2026 13:17:27 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 36E9B2C8E; Wed, 21 Oct 2026 13:17:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202610210100
Date: Wed, 21 Oct 2026 13:17:27 -0500
Message-ID: <20261021181727.3387926-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261021180517.1538175-1-lcpdbld@list.ti.com>
References: <20261021180517.1538175-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|DS7PR10MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c101f5-5657-4ddb-127d-08df2f9fa8cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dVrUUwzPWcQf1uWRoXDNz7BNgUSB8F9wT6aq5jWfScuFF7z3aHSxODxhbKdDO25kPjyDOQUK1XYyLaDo7xQgHFfs3hmQm8OHq37liJGjihJJfxFbUgUVsbaiWdyqMHvLXhD07eIOQ9uUiGcarZqey4WlPArszsAS9efFnulj0n5JHS/c/BjrtsXkaxrXH8SuVfrwvP8lwjJwzHR2zelwBEWaCPr35G/c5PzPhHixSHJhYjMUqneC9xvEWKk0svPPSF8Iyc+qhlFbX0aWFFSluTvccy1+oavjkDjKZCs+tysQWQFtudLvBUJUmj0O0Nxu0XqHI4CTPgaAUsEnpOSVNIcn5bCnWWRblYVKb6BlQjcrppkngj1A94PhekDwWimY3x2Y2QdCkU3HhTVpFiak+RaDlHeRhLQCJyc9tjyLDnQL/kmjm387cIRhUP2di5eI9itYIdOhts/UsAC93Wmq3WGl0AeMQzH08aJaXlnHsQAg4bjPRVaXdQvMdl94v87UDSXUq4jARFfI6O1Pbrp0wnonKdXFroPVTR4RRpZ5kBiJC6eT3G6q8TyqbRdqWKGmBVf86Z9N/MSy80nahoZPYwdED35QOwlnK0ydXuR5O2DP34sv4JLSc6qZy/ZaeER+KOvbfHTehWFF1/0hYUHSuY+j1VlQH3q4Pel7v/w6ncOuPonkhTmEWrN95ufRlYK8xLkoWowV4k8hyroczWaTNA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cba5gTQutAfEc2PE2rpFJBZ5mKhH2i1mRcYEERbmKbfMGy/2qcktgTkjdl9wvf29t83v5E+gG6Pbvff6IYws+Qk7Lu8L5iggOP+vDjJyLQNwYbJpYET2Zy+Wu8MEthTWwIRcfPAsnvx0clCJ+qsWN/qPnf9MeOT1/szVI8a70JsSHuxhVPC/0L3no2Z4LkkJYbSs0J8W/Pwh3YVU1Do0vhXJTr4VK13GLg0YmULWHBl/QkbRQC9SAiCvvFXarxQ3aQmZf2HkiduC+flpJOc7Q/WblAyxCrrTv8hR09FfgCVH6MlkZc6wpEVpUFJgG/iq0wZrdLjYh6C0yzQB4izlHDOSr8vSDZcVCD/mSZ05kO+w7Kwd3coLCkSBLem3ysSvvGPJaM5WefwbITpjsjFASfURaS1MFuMp2pIH21T2XQxIG0WYcdvQZ3+OI2DLrs0J
X-Exchange-RoutingPolicyChecked: KK2NmteuVlb2YmJIrIHJG73yvNN0H5sBs9MyrtFM8okAGkOQmZEHEj8DO24Ospxf2VR+4bChXLfJY5QcqqFpr78tt+eIUgG1ZYP74i9W6kzNZox133DYGyc48vgcwLNbLWrp/65Lxei5pUbd75brNdLD0Gb4ZDD23h+reVu+ZQsYIJEDfqG7XbzLmuf5gFjmiKRuMW29GajyRnLwrh2tm5LEVisH0vCT+ipbVNW7NoO6hBcRA+72lNbar7XtsdK9Qv+gymnZDnoEk23myE1WjciYVe3CZ26/UGh+X6W49SYuElgq9ddbhGoBdiCa04+ajIe8E1BCZgb2xZQevLtu5Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 18:18:08.7082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c101f5-5657-4ddb-127d-08df2f9fa8cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4829
X-Proofpoint-ORIG-GUID: zrFaHQd5sXdT2SUALpgOdLqAwzaeCbHe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfXzPGNvxU3V/Ax
 6rKJdHnCzstloCQiGfXIEbwu0H17zghDW9qIAtDNmtSlDF0RIZbunNcPw9Rbh5xgKY2zeCXsW2i
 vIZh8aOt2eYyXYWCA014YycLUMRcWw8=
X-Proofpoint-GUID: zrFaHQd5sXdT2SUALpgOdLqAwzaeCbHe
X-Authority-Analysis: v=2.4 cv=B98sQ+tM c=1 sm=1 tr=0 ts=6ad901e6 cx=c_pps
 a=yaJUXpcFNTkE3gTvo4ZtIQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=X2DKMH3eTJBFqkxL-CIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfXx0Xuy/QZxCYI
 TkC203KWXt41Qo6nothN+kolsH7FfOebCQEUnlzl/IS609rRkjJ0ex0DAfXGpmLhaB5THyC7WUF
 nKvJgsO+VmTpxnlQoj3cIEmc0mH7rmRVnylhujeVzmI1WOeOUCzkrJDuINh6lNX4bw9WEk7c4Mz
 TftPLAfEupv8F/qtjhuVzUIzSwnjV2tUOkBf/stXHlA+f5Z6YD6vZNxew78C2OuQJP7Ah/GJrBY
 uUgjNb7tiqsF/b+H98R4EHimwAtSI4RxW5CAiN0M51AOaAWO2qeqJjTY0ZnEEKRCx0BiVokcn6r
 Y3iOZSexKDl3pUdJ8P7xvK2FLBLm5qFuvtGRS+3wcguKhpzP8srhjBlOvObMBnLp2645xN62cRG
 BGm6QTyEp9sCjHU72YvRhYaVLMHLe8ZgfBi+wZUQF0Yu6AtEjykBZ35kXjbXxTpkyGQwO6loHog
 zZgjmBnqIqRt6+f03Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210072
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 18:18:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20476
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261021180517.1538175-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202610210100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 21 Oct 2026 13:05:17 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9becf5bd71c77ff7fae9167ec247f3f275406c2f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202610210100
- Commit SHA: 760bcd6af8cb13cf9c56c460e4dd0fdba6ea5b79

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed



