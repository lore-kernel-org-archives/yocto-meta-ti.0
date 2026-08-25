Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E552FC5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:41:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16134.1787640095561199083
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 23:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=P5IK5I6F;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=amtvFgCm;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67P2PraI475868
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HrvCZD2aW+tL2hyI3JnrmFNinv/LqinigwhkzMuEK
	VE=; b=P5IK5I6F9W1Ea3eIxbtNhWJOhZy2bvMkHrVEisa2/+RIGXaCE0kP51xdO
	YZYoxViCKkDaBTjfxqZLyOL8TzWS+49oGEgs2jIuD7OSjJ1uML0g319L4Yr8xnxO
	aE0Cnu5G7QACeeMa1u9QFAx4TEIoRR3vEExymqpfmSyOIsypbWtxy7lVWxAhl5up
	FhNevClXDu9z5fB6huyHNTnbNIsLd6GedqNfmJrB2J28RK8JAi7s2/LWce1vz7hU
	dsOp+M8EHMsJ+dxz92z3gbRfMT0YY/TfjYcf52m1AeHR1ii1q+rbsQ/iJFK0FpY1
	QFjX4eHuYu8PFWicFeEVtq2tuXtLg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010000.outbound.protection.outlook.com [40.93.198.0])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g8xga2374-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:41:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVOLGd2NR/vRn/ELPQdENlbWINtTLEkv8XY3oCXQCqgHEUcYzPJgUjr1pPjLcX4JaMjNLp07DebUnmyyOxnr0Z4JRqHS9TTSHa2lZEdKsNen3taa/U+md9CTKlRU7YJd8YS+cnWupT9Khc5VseR9BMxjgkh7qCkO4ZocHNbC+0YJj8ti7T0VKnjyx5P5cQRTc8WPp14npJYUtPVVHzYwsT2RvtiVJ0nKP0TN9Mmn4A6oAt+5ZH623H3oRe71oytEpmVRc6MoEHHPbkTdbgZHgBOqYTF+5MGcEA27zngGn4Oh2kfHzRMpuOuoeaMWqF8oEUJ5CwQoVTRAmgi9vXuAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrvCZD2aW+tL2hyI3JnrmFNinv/LqinigwhkzMuEKVE=;
 b=W9ePSWl0RN1/F61y6U9hq00HMI4x1QuHDL3Hn4WJ5L6xHTM0otn3kjmVaFVfLa8bUOdXibjlbe8AgD61mWHHVLcVgbdZ48W8PwWpwq2b3k0pZyon9rlIEh3+KREGEGPtaXiD5cmhIwCl2j8Gr+NPsNrBvPI7o7OgKV+modDWlNLDHdWuh0KBqR3u7+M6J74VSQzSr8r0e/2tCE7hFTIqRYSGyXFokFOT9wO5ISQo7Cza4CToJCB/XlU26jBSThHCL31Vp/TkZKr//Bt1jEJKpSuNAte33w9LX+9KSPilp9r44LrnGKauBXSOGZooKr7swdILUymXETRq5ujXLJ5RUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrvCZD2aW+tL2hyI3JnrmFNinv/LqinigwhkzMuEKVE=;
 b=amtvFgCmNNvWczOebIubSYeEpy8ZQ5grpOHmcm3jdEBUDxhLMzmHP7QxdEP9k2ECVVEg3MP0wi0BwL9pirO3MxipHVJjwZ86zZEiG+7hujmhmnix9y3bG4VtHpO1Ug5NBld/OLdF56O7gXvse+KjusqzpFWRD6h0sHucLIYL579OJ4h6rlA74yFizCSK7nTwnkXe87HyBJ6wg3Q+yZfyBNpK3BsU2Rm2rvjunc8CAeK+jEiwMU16QPokuq8ZqP4IYjKZv4fhmLHqqSxLpwa5298oO7ZjuU+0CIVpPAfzDrR6Y9Br6ar2MeXIKGUxYwVmezoJZxOgfPe/6djvmYomFg==
Received: from SJ0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:2c0::25)
 by SA1PR10MB6495.namprd10.prod.outlook.com (2603:10b6:806:2b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:41:32 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::2a) by SJ0PR13CA0020.outlook.office365.com
 (2603:10b6:a03:2c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 06:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:41:31 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:41:31 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:41:30 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 01:41:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67P6fUFc2228506;
	Tue, 25 Aug 2026 01:41:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8B2749ACF4; Tue, 25 Aug 2026 01:41:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Atharv Dubey <a-dubey@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <m-shah@ti.com>, <a-limaye@ti.com>
Subject: Re: [master][PATCH 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Tue, 25 Aug 2026 01:41:30 -0500
Message-ID: <20260825064130.2211676-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260825063713.51497-1-a-dubey@ti.com>
References: <20260825063713.51497-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|SA1PR10MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 77428ea6-5397-40c2-b7ec-08df0273e62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	o0dQbhTH+syzB1JMKnp2Z/2Pm0ChLupDGYrCqz73RNhRh4jjnOc419sIJdEm7l4QTQgIZx8xkh6aicUjZU5bXSguJuHWAQOzFY6jCLa5QMqozL8fDHkZz2/TWb023DzyG9557YQz48ho/2dNE8218e8TrrHXbCTGjPSEFYoeIj3u9am8fDRVJhIt+hz3GtkqJyQ2XZsFZWnQHVYKoLkAUsFdWWq9fPt/5K35myc0yi+HOjUKwXMBV9ouihdIX7XSejxXALXJ6mSJWSEhPuNMuNakCb6jECYVz/RClvRn5g69c33b8sRcA79VBXgZqZHEwtUMVBv3lhUoHjQ0RIqPOX0QPVwURlTwrxDWw8MBafBW9oOcBHPJ0hFDUIlQBNhiN7PjruJ3FOJ5zCYUrCKS7Vy4NAMDe8lCnrFzMLlEkhzKV5DW4JVy4CesX0LriFxZKAmPwM7SDAawPoMXuqL4g4+Rx3VzLXhlPNBLchRGKTFddMdxnf/C5bHYyx2PxyzwHO7/gADk9lPQCjKfOmt2alEJh+ttydDFwUXiscXsc2gOObPDyzwU9zSLlywP2fpUSIYuzyEfOLLNr/z0v9jMbIaMqHXgILk+QUfaEy5H7J/MmXUSGixMLzFuck/UkJU0WJgas9g5KbBjKGuCz/tefg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oZAtXP1oBHrNe/GEQWmd9jDtCbIp8qofnzHuSto9McQ9epcotOqmpuEIV0hna/sFkvnz3m/EVByE8Qn6PD0IpG9ZIqYxQCvFseBTpsDfgf7pnMBViCUUnAZroIDGU1sorEuB10SEoWh1/NeSjJzWbAvl/asnQF5pJDkqvPOORnJFOnOJcr3GQiHJgmmDiO6zJ3NhnU43pC1/LeDp18XghctJ1Trly7CDuB7M3STIpRg2CXt1HkHxifvp0g8qktZ46c4jGi4fduVMuBk0g13RgJ/cMoZAMmo04rccYyWXByZlVHhMMzeQdXOPFI0CEIQMjrQzXezlXHfSDzPRYZ5zupWWSG3abgfd0gmmfUIviTCFZxZ9LdXhrz/0cFhGPHj+v/bsir2fB9SwmF+xzmMJgpOZJmtiaSVRf6/QAXz6Cn2WnWnVJriZRo2601QEYooX
X-Exchange-RoutingPolicyChecked: 
	U9y26sAmghuJY3eKVsTlN2VpK4+HeXv5d852C5tg654pWSCHCq4VNERqCPzPHQfu/ppzQ8v7QC5tLuUrqmj5Oci3CNoY5pjGpA3opV5PGpX3UuQhleNTd+ZYCdv7pOsvSXTcA3KCoDEvVZcOs6C6HwbGPfYI7TEIIExl3CK/nAD7SNSKwILfHGKUj/794aonIyzU/hXx08uxZWOxGRUGywdw7mZJKFA1MukYzrF1o4U7h3keR1uMZgboiJpr8wOy/HKpoySQ15yucBNO81rfH02oS+IEhKXRJhQWpDPIWqdRm92QMg5fqS0+o+UvfJaBJnRkju/PibLgTEuEiJlyqQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:41:31.4765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77428ea6-5397-40c2-b7ec-08df0273e62b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6495
X-Authority-Analysis: v=2.4 cv=SuygLvO0 c=1 sm=1 tr=0 ts=6a8d391f cx=c_pps
 a=1KNXh0H2uH8UbroYoe6UKA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=HUNYrTw34XytipvfSZsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NSBTYWx0ZWRfXwgPjKoTnwdvI
 QT+hV8lrrb+b8zoYWVPWra/aes6Zd7MJxz1k/YpCBIZs0syVjhzY9jJCWUzQIEo9pEtu9QObonp
 GTp+aU04giSP28HQXFHHDPcAznBvvx8=
X-Proofpoint-ORIG-GUID: 5hUK_SjKEod6cRcjL8Nr5Uwyie7hlEZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NSBTYWx0ZWRfX7bKH/UEkKXDI
 eqA2+OUp48BN+GKVgyCwwVFiG/RXuNObrA6YExBsRfVwjfVAHZ84Xk6NO5aEnESofmotPNCjSMx
 hc/RmkvwScbLwjmwEXRmn3Z4KLiys4zuHu7uqJQBDe/qFMQMNJyEzMedptmrge2H/DL7GXDbyAd
 AsjZM1Vb5HJbPZEFFND2b7SSlIyIu090u+aNdNkgSY59XeI3CHccmhctYCQkMR3T7LbshnX6d+q
 8U81to3KQzePCnur0ytJXF8UhLZoRdC8ceuis8WInaorO1uJ47n/J2JSQeiQIxvjOj1dV49/yPK
 Lb7voV58pJfUYGXL+8IX0F/CsqrHXYiJBsOrR7Vcsfe6/ctdAXPXQbAnwvlzt4Unyrv+aV2ghZD
 1zUJ9uNoZQKfNO+AtXBuMmm0fl0Uk9wueWtlKMhd4BG59f+0/VJKMU1RTV9VqhXkYqvKjXetdoD
 0isi7jpGO371azbC78g==
X-Proofpoint-GUID: 5hUK_SjKEod6cRcjL8Nr5Uwyie7hlEZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 06:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20287

meta-ti / na / 20260825063713.51497-1-a-dubey

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
- Patch Series: [master][PATCH 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
- Submitter: From: Atharv Dubey <a-dubey@ti.com>
- Date: Date: Tue, 25 Aug 2026 12:07:11 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: ac4c9e3fbd631c591c104856a1946d2ddf20edf4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202608242200
- Commit SHA: 025d1864b5f1b9849379ee0319f466abe3bf27cc

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
    
    WARN: Are you missing a PV = "...". (PV-1)
        meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
    
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




