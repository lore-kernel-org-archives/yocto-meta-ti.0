Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB3CC531CC
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:45:54 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6211.1784839545166618081
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 13:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YHeMUnV6;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=HIVPO2yP;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66NInwpX3176979;
	Thu, 23 Jul 2026 15:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Mb2XDC4JoQhs7l4a1ZLn+JNbEPdX+DaddiO3IGFs+
	zM=; b=YHeMUnV6HId/V4twD2IFdqDLvIuvc+BejDEKtm45Ppg8/KdLISEnYqEU/
	+4IFpRgARosDT348UjpN8LAVQz1BTGgD0C6TrArFyWoYhEW9OUI1meDi+6HbVhF7
	STk98eYqGWxyd3oPFn8Yi6YWkcrFvn4hd1yUTZy90rWaLRBxdvtQ3mqXg1y9kEoR
	JLNVgT/d1XJifoDOfyBqpAAVViobkLtxu9nkuGIH0ETvGuzGodQLkc48svKYTN8x
	qDqSMYMEvrhM2KAtZRKq44LAn3QAs0zO+dwsPc6d/cTFk9lX41C6STgPDPDWrOqI
	LEqGR47IMQK8EAB+HRt/+kJWkrZPg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fkjawb7f6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 15:45:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlhiR02Z8ZmgH59fpmlwnckVrTNd0RIDJEsMFt5Lr5VSvO9SDcPgtoHCjeWo/EccdDmapye5EcZeivAEgZCFB11IiDP+/DfLi0JU1Wicpf2jVxN+N2JRUBpkhW3+34O3uqA95U8iUoBMcDQ8pALQRYTIlCg3LSYrBRyPhkhNwrRnwh9tJOX88/7Hh6RiBgY5hT+NMobfVNeJDniLQPOk/5pqijg7ckYPtiR2z//XMoJJsedzw81QWsQtmxYXnpRDlP/7HX7Bze2fsPhMeJ2rLr6unLhAEV/8IzQLHwXhcuJQK+3PLPhsbGEZ894g80ezRP7ddkgveLqNBjWd1YUxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mb2XDC4JoQhs7l4a1ZLn+JNbEPdX+DaddiO3IGFs+zM=;
 b=IJG2h3qx1Q9H5b1eJmB0wjd/r7UQusi+hXUpk7HMAIHFvlmj/QC6IL7sg5lfuU23fMJQqQTH3IQwCiXxkUahR4KgVoA2gHRmNyF2megzraIvmbH4JdNUhcxG0BejVrWXT7t+Zm45PZJVAzTg9kEIE2qDBU2cc5h5H8gIfOWxjNnhFbqvvx9SXvkosHG3dlfSaIOBGBHrKXlF7bDwxYuKoBshYUzyOX1G/vZ14vAH7GNFekbiXbTYU587fw16GiYLNtJ7slccX3I+Q5Yy72a1OoHzsRy/8tp3dE8pdjNnp8EttrruLKMSIcpARo8mn7O4e+hiMUspnoZAb8gGn7Vysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb2XDC4JoQhs7l4a1ZLn+JNbEPdX+DaddiO3IGFs+zM=;
 b=HIVPO2yPb7H+9HXEW/IESMpMUNHK4i4WLaCaqfSBgjLLxwBm9ulIw1g4dYDJIIYSsef8fkSKXssv6X4SiE//nR81K5glvo53TIeQweo1ApAA8PF/RGk9ZkiscCht4whVfY2i3Ey/uEkbmIs5tx+szSSdHr6wUXSQVyKjoTypP4EbsNAsMul/+UuWkSE01YuYkGSpQuFn9X6zm2ov+dg48JkUCIDVo960K4V3dVtMUkld7oUHA5zWUQhdrZl03JRhaOQVDLREo4Mu1bUh6/Rz7w8dIXOvF7oWBxZGyQrnme5hurSxNZTaUQmplVJgAEsevxPqXFkB6futGJqw8gzj+A==
Received: from SJ0PR13CA0083.namprd13.prod.outlook.com (2603:10b6:a03:2c4::28)
 by SJ0PR10MB5693.namprd10.prod.outlook.com (2603:10b6:a03:3ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 20:45:33 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::c5) by SJ0PR13CA0083.outlook.office365.com
 (2603:10b6:a03:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Thu, 23
 Jul 2026 20:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 20:45:32 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 15:45:28 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 15:45:28 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 15:45:28 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NKjSJa1567581;
	Thu, 23 Jul 2026 15:45:28 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CF1449ACF4; Thu, 23 Jul 2026 15:45:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] mesa-pvr: Update SRCREV
Date: Thu, 23 Jul 2026 15:45:27 -0500
Message-ID: <20260723204527.786829-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260723202229.3192049-1-a-christidis@ti.com>
References: <20260723202229.3192049-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|SJ0PR10MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: 49dd0c59-a358-45a4-fc03-08dee8fb5719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dfTEW6GNnuvn/88+WfyxsVH+1OCdHoF2p/Lq1S0ES+LPgIo+3v5yFYXmskiApW8wEgR9fpHD0RvGh5E6bZBADDheehybD8yVR5ac0OkNUg7kPuXTHpcQdfPxHGmDXSE/vSmkLhG1zaICMiCne3EoiSVyiNv97TWsfkP5uNpiRMl2pimE/WuJ355lwV89AcoHSdskU0RnVpoZXs7gl1dFlnLwPT29n0LFp4hrcgWjxR0mdoyxjt72Oc118TOqAGUKkS8EOg/ByUcn40PoboWiEup/vK0Kim2KLAAJoS25FEqTjX/Mi5ZkVopIaV0TpVbY6mL7w/jW3EOBRHjW+KEBXaTxC93h+HKKKvUji5LH2bHIhinSPz9cXD2VSHqDYRnf64zwoY3fid9v+U5MBjDyZKU0bvQFbGOTu1LbZRIMlf1XyC6dTGg1d0u3AztyDFBhwjpYExN11Q14C//BSDc5ytJgy/kCB8mX1hpQgUR2eI/BxD1AdzgiebTGl9NT09Rg/fRokDCgB7Lwxx3zj1kVmrtaaNd6Lc1vRxPJJTL9t+lIQfkopSH4ZfgXsrUO7PAAcIu2Emr4B4uyKWTOgh8EYlf70W85XyvT1tyg6p0AmaH7ZTvyGU5xEn1VGT39QBwF8sZk1xtq8URF+pZHX3llYk9fk9wKIoDqLNTzywil7pUncHiVsm+14aZGSb2d3Tdb
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RDION0GymlFpRMYyzdxD5p9+z5vrbm66PiziWthMjEaASdCJWsviLxQWUOAxFoFjnrvnk5bFwMXLTdK/AjXA1/nUy7mjkZznoFjeBTp4rLoTcOyAQeS91hG8yxnK5Enf3VYoose9V6nF9Q4fcHTIWV4NaHtT6RpvI0wyqpw8AqJwRIEirQHMVUKcOyooVj2Jx0SbEnCuvSipQ8c5TS8AkpUXg8LIEddtz8yy3uszC3ykZ3jxvdZC2qUeIVxfLPqvAirly8rRjRdJHHdH87afcWyjxPxmnX1hPsdZMquzIli31QIUmHaWofOl8ARg1UJuVevdLYypIHtmcBbc/hMK4o7JAXAMPnD7cS4mktG2cKcjEkWR4W4Xq4nFrYRoJuKEUW7HOOEwSJOWlkJi8t8Yx0j71aZdi7u80ytUoHhb+RGtFsa+vQcsHmPd32PD0b2n
X-Exchange-RoutingPolicyChecked: 
	DokszqDOT0evW9xojIXQKdw+Tq7tQ/y0Jm2TLoHrWnh6p9U/mxDvQHPzQA9KTgSj7/c+K37Q3HboPdkq6tKbsK3xdpuhXeQTtRWXTRVayB0+bEPotyDVUfITTrvSea0eU75yeIr8WmyJf9nHQf4UxbG4+l/K31WK6IPYywBFBlYaJCG74rjd9UBSdWZfgzCvzlNBTkQeaGABpPMckmMYc05g8TKuuQERaTDfoP152gkKuZOtIdaWqNLDcBHrOf26ft3EOcIIS2PgheNcIcdBOkZfxhof+XXqz2krtv0wpT6X3Mq6j6QtftFxT2rqJx4sA0+cii/hFpT54os5TVG0vQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 20:45:32.7559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dd0c59-a358-45a4-fc03-08dee8fb5719
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5693
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIwMSBTYWx0ZWRfX3S9fRmB171Pa
 4nz18PvHiIENlGdpzfGFCi/5I05yv3lG7Wv4GfOYrWcINLFKBbk92GFtCUAKYdv72BpGaGdke4x
 cGTqGbIqCQUo0M52viTKTFKozENlHNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIwMSBTYWx0ZWRfX7pu9v9nzSFWp
 vCbMsyTESJuWKvH6e6rKYHjspCgStC/McLBozHpD42Y+VSUUq1QTkFLPK/862T00HqFj6EBbbFc
 8Vqw7BUsNaPhtryqawolC+LAmNLe+3J2tdS5EjbnTU8v4o2q0mEJlTQU41MsSODtjVD/he/sGIS
 p6a/+vCVRT2F7u0RPmLLbESFTP9823/yi4TaeWqkhdTptnv1uqZW8F5Fhqohnk9uKwVkaBgHee6
 OHbxdlFAie0iNt2lY1PAmALT3t6SDVYmpu/KWSfV6h81BuSp7LurPrnFIgCs1m945fA6knFuxmD
 Pfrl5Loe5RJQ40Euxap6ImXE31mip+kPPBXLlgU/JBxZmizwTzJG4ByKyynpocqVMgc3+Y9Xukf
 Cqxgu94dbvN6TNDXr+0moCnpBwCs9loGfXZiqiJreyob5ci1Yf1e8mndemn0nzP1UWGg84AFRlw
 frEwUJOGe5crkp5c+3A==
X-Authority-Analysis: v=2.4 cv=GPE41ONK c=1 sm=1 tr=0 ts=6a627d77 cx=c_pps
 a=FLJGh2IUmjoo+n/grE3sag==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=kOZS4Z7qrdfGzVeWghIA:9
X-Proofpoint-GUID: qzv4RUDdIeWIVxLu_yilcFLl-xiYMAgj
X-Proofpoint-ORIG-GUID: qzv4RUDdIeWIVxLu_yilcFLl-xiYMAgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230201
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jul 2026 20:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20193

meta-ti / na / 20260723202229.3192049-1-a-christidis

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
- Patch Series: [meta-ti][master/wrynose][PATCH] mesa-pvr: Update SRCREV
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 23 Jul 2026 15:22:29 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a567fe50047c577d07dd22c63d98ae8e8f670709

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: mtd-utils-ti: Update SRC_URI:remove due to oe-core update
- Commit SHA: 0023e653900b54724a7a8d4d27af2c675b5c5583

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] mesa-pvr: Update SRCREV
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 23 Jul 2026 15:22:29 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a567fe50047c577d07dd22c63d98ae8e8f670709

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Rasmus Villemoes <ravi@prevas.dk>
- Commit Subject: mesa-pvr: correct INSANE_SKIP for mesa-megadriver
- Commit SHA: 4fb36e7a6324904580a91570f0eafb3643381575

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




