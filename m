Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FDFCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 06:52:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7658.1791960769978662329
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 23:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Ij5MH5p/;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=iO/7+o5Y;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69E6OIqd2155432;
	Wed, 14 Oct 2026 01:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=1XpeFUaUY/ZdD
	Jp9hSBd8bfqWkRZg05Ge9mYjPe/8a0=; b=Ij5MH5p/tWWIQ/OYVkWBmPft4vXmL
	pn3TbaTh9eD9YpGydMX5fZNI2/lFn1L551Pqij8QBIM/Q4XMghKmqAEcktIjrbOa
	dLx1Opz8XjYnjojRCVi7HcTj7zxRN0TvPcFkHmYM4au7ScJ8Zzy8W05y7lIVqWPX
	gzcEQyGYBhfU4y8GVdK6NHJn0TATvR3tqDSQaz08w/lHK5k8xVBcrc+tsHYCtyxC
	8bCYn0SvPhcoYANQNnwle3Y2cHQTq/aozgv2YHdljDQ4gga7PEvO5HUbQd/SMAl3
	J9kRd02rcQNF4obS+xakfMO4UefV5jyjuljE/OrgFrKMC2V0ZmaVl6IgQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ha02r9k23-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 01:52:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSm8eDV0Cz3cg5yQT2Q8ix2hwmlAMo6HCGtdFlgaY7fW6I5RIuo0K9v21kRKWXweaE6/gwY/FF3UGSiaOfqlu+akmIGW8UHigsXNXLYbfIxPknYOF88QI++4XDvKDEoY2FYdoRGGFAxT0ltRQMFp6KX/B3h/ue4O5BL8j1G/WKafXpGsq12DWh9Dy/uzvopxV1oQr/+zGFaEM0URni9LzaJJ0behXGs0ni+eWBpVrYcWKMeCMDaMkbvdjZwyc8aEmC+eXXolwf+r6SdvkaM8pBM5zLyzlMo0HsTAq34A2VC2+nrKNjGvhke6t+NiYKlKTl33lrpOjNvddJ+F4fgAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XpeFUaUY/ZdDJp9hSBd8bfqWkRZg05Ge9mYjPe/8a0=;
 b=AGA3sScppn4jzhKJCSHEykP+n71suPQee9WCNDTKyoGe5gXKV+Gzd6M+5xKKE+oUDmZC4V1PRDjNgtUeAXOArq+AYH4rg18nMOxbcKpJ8Du2zjEK/b8UVHb3tC+LuauU5M46fn32Z07PGOnjs3vTA4CioyCzI2YZEHapp7vWFA5/Ip7B+3M+WuSLR/q2vhQkF1pTRRWBTUySKdYSk+qn2RR8Bp5n/Ir+ADqq6PErirL+UWdBnNJyMWVuUr1+suLjyQtzJa7HuX4QxGMa0sSb9WlVRBikxBQ5BVivpYXq30Z0pQffbKKyghmNKWoKbWzetCZtMnChNuI55rsImvy2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XpeFUaUY/ZdDJp9hSBd8bfqWkRZg05Ge9mYjPe/8a0=;
 b=iO/7+o5YhDw/JThIENTJUrsuNZmiSWgkoy2553DeovLJJR94CZcmhTphWsonF9Cqvi2bAF6jQ58uoHz9ckO43Lq7ZAL9aiVREmWsRlIYj9uR0USzY/W545z5iS0PWPNKMiwqkhjjfp2W8nExtQ+6OcNzCTeZBeOaBCya6C1RSBpjPvLUwIPswQddnJcHiwdW8Xj7Fj15PSc1sEbYnuWDdwyXmV+AMH3o6BHuJxLz4o0lUJghra5Oz88Uo/YKL37pZavXWrYm07TkROJ3O7LIdS7PF4NhvzXzHBEAUks9RVEB4DorLgrHNZv+FS1ww8LCVxTd28rdFJr1ffayrX78/A==
Received: from BN0PR04CA0095.namprd04.prod.outlook.com (2603:10b6:408:ec::10)
 by LV8PR10MB7775.namprd10.prod.outlook.com (2603:10b6:408:1ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 06:52:44 +0000
Received: from BL2PEPF000352D6.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::87) by BN0PR04CA0095.outlook.office365.com
 (2603:10b6:408:ec::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 06:52:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL2PEPF000352D6.mail.protection.outlook.com (10.167.254.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 06:52:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 01:52:31 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 01:52:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 01:52:31 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69E6qUgP855531;
	Wed, 14 Oct 2026 01:52:30 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 4AE422A69; Wed, 14 Oct 2026 01:52:30 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610132200
Date: Wed, 14 Oct 2026 01:52:30 -0500
Message-ID: <20261014065230.742721-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D6:EE_|LV8PR10MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 08366943-ad59-4bd1-e2e7-08df29bfbfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|260925022911599003|56012099006|260925021311599003|260925021911599003|261009221227099003|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ATEFzWmENgNE5/rqpV4bFNu0k4jYG30zqUFUpBmzb4I0FNsSwIdw4RcZwxDiWO+SyI50iGS3uzGnJjnRRBYC9Z2hYKM3m24GuAslwTuepIdhxCFfT0ps4CiLQ3uh482qe4heeTWXvqz9jDkAWuLsNaMrDSspVaeVZ1knbbWl7cNIInqiTuA5gfTUpfIk9xf9vgRC3vVM4nS8ibIEw1eQz6kwoEjkssl3pbaQC8v8WHuhAMgu1QiNRH5KqDGcX4D2hkv3PZXCJ2bX7MJKZMwF4KkBWiNSfAT21yXPHJOo2oD91xPCZg76gCYOFWhDxYmTV0IAT0yK2IMik/Pry9LeJQXBH0+z1OUzaIKeAH//Udqznaya/W6qfaUAfXZrhy9RGEmlXlZ2N+U50KOs6VIICPDOtUKJZIGr4WMrx4xe+4TYIc394WsUolpG9XbhHXbuo0+qtK5HBbKXPfX2oGg4PCy9tqNSgo69KWD8qJos7J5VfQueGpu6dtSIBYoT254uG/QqZoj6v/nLB7cM1pjJVtRwO0p8zCkJ9Uih8noaLBXol5VtJ0pHfN6OazIASXm947TvbudxdQV7t3ASqTLiMxpzX1TaoxDqyCfbguKqmbUdaclM5lbBu0O4p7sFR1O95JkpSN0zoRT8wwno/rMmntXiKiikUKd3XI5t8EgMjrSkankleLBV49CzpSZFDL4nunPe1qDdjCeOmw2WONHUNw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(260925022911599003)(56012099006)(260925021311599003)(260925021911599003)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wY9xeL8l5JuECtTdWXNBcSGEBQvXBCk5DdpDPmQRXHG22Nbjc1kIH+33RrSncFVKkeVlDXaZSFMIigVSa92fDN+HLbbZ9zfCsP0c+n6eq2nlonIKDI/WY21ET/Cgw4xgL+HUnu8KexHokb85ZimcoNp49z1U78+1obHaaz/pYCCkc6mSC4w7yfNPisMGI7hmOuwGL6c2uM6Bgs8Fmyr0Ts+JcvyVdqDPGKHuRDhE+7R1mr6u0DxoR4j0M1FgF9mbLwWq7HJA/V10FQIyPGMCfuTX7ib03xCkE/bt/IaMqkpnV7QQiuyRkuMDUv2vqfXnFwz7ZLKOg2u7xMw5PNNby38bHxbGVX+k5YDIPseSNQ9ROMyv0u3DKUeiledyU0oNBYuti5qHt3wlPv1vcShz1CjqwcQiTDijMzkLOCnn7F1PsXBdiH9BpetlzVkLwlzq
X-Exchange-RoutingPolicyChecked: 
	3iQp6AIpQojX4jACMAgvW7FQbPtfjusc6Q3nocrS+JwU6nO14a85kReLY9H3VAgO5IKIvumSImvl1edWKlAvQZy5xV2rywzSq4QPf572xfwzeGlNa77AjfxoHxzXu+/sdNN9xlRgvd7j9okp87f18lOkDnE2preCYb+8lhe6rseTNXlZyfiClFRR1Nl48U4Iy6ZlgfSUwx5xrq3QzFmIzIfQUM1zaSx9dqmM0viHYJ3mGgfe4yBaiXLKfzSnwaeWFMRcNjHKHcwOq8LRevw+93rhPFKQG1vLk5MeK0RujJ8+nxLQOQUM1CTDZx4DCDwR4eEuF52o0v2e8LrAjQAgLA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 06:52:43.9929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08366943-ad59-4bd1-e2e7-08df29bfbfac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL2PEPF000352D6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7775
X-Proofpoint-GUID: Rvq1a5vnw1ZMPKsO6_g5s3FnvBqirdnv
X-Proofpoint-ORIG-GUID: Rvq1a5vnw1ZMPKsO6_g5s3FnvBqirdnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX+dHggcBv6K1C
 hiFT99MjGkvZ4XiX1ViIFqDsuZAwjDSLpmLYTbb8s5DtZcumZ254T+kkRFX924mzaez351v7RJo
 pKTVXNNM9iFRtr+gSte9QJ1doClciR4SpRtq1MEaikcdIcPBHE3DmPNcIClPWJDFolBmvidGdCA
 63KSHhYKAcPfxTUSUY2/Jogqgey0KndKysgKqeh1pm4MoI4Yz4/9bS3KrXKIDpyfQBEW+O+A1bR
 xroimhm7SLQ6tYJRFl7sG1NRQ4zuw+d2Gbj23y7RLTwc3sWkk8RItrTn3kURi07aLFzohtFaHuA
 MOIjKmbg1c/kxWAtoFTimOodtZ36Eb4bbSDJh1W0zpmsuTx/+C7Z8G55JneueMiRujdRG0eb5Mq
 odpgDud7+drQtHUwDIFBdCW5qjsyyknx8exCgwDbNq7c3vXcVpvX+c18DNeICR0T567QFNtd7tt
 kyGaKV4uy3zwHkcV4Dg==
X-Authority-Analysis: v=2.4 cv=Vcxir1p9 c=1 sm=1 tr=0 ts=6acf26c0 cx=c_pps
 a=jOIfm9F7dEqBEZKe3Ytqiw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8 a=wSwqeAyGVYT4nUMSABkA:9
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX2xlyC0c5dbGT
 H2F+JYXAgrm60eXsSQZHSNWTHScvgousLb3SZCrJ0+EvBnGq3VGVEhCZjSFm+KLzFH6TaMbRz77
 Qd24TTzlUcUX1ASFfQFvI6W2dlysM8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140027
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 06:52:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20455

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=3eefe4b257b6fd2ef649c25bfc37551df2154165..792d3f648d38cbdba769fab5a77cb2143026c035
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=fff856a50d43288671eaa733f9f59aa25f2fed77..bdbdb414e41afd2a0ddf34143fd6404f14ba64bd
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=fe064c0799d988e6dc4684ffd8792950640f57b1..9ba35283d2ce7c97e633d16abb4edc06bae02319

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 7df28aaa..3d6baec1 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "eef816185ba3b8c36187961ecca7667f4333c50c"
+SRCREV_tfa:am62lxx = "756dd70d3ef34d7a308370d941c9ff126cb6af30"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 4b922638..30eb2b0e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "3eefe4b257b6fd2ef649c25bfc37551df2154165"
+SRCREV_uboot = "792d3f648d38cbdba769fab5a77cb2143026c035"
 
 # u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
 # removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index c1b6f226..caa57ad2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,7 +25,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "fff856a50d43288671eaa733f9f59aa25f2fed77"
+SRCREV ?= "bdbdb414e41afd2a0ddf34143fd6404f14ba64bd"
 PV = "6.18.51+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 5e4726a6..3a379a86 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "fe064c0799d988e6dc4684ffd8792950640f57b1"
+SRCREV = "9ba35283d2ce7c97e633d16abb4edc06bae02319"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


