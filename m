Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17805C54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 22:07:03 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23032.1785362814610949084
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 15:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DWXf2iRO;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=SZtf61r6;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TLXOj83479735;
	Wed, 29 Jul 2026 17:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MjqYCBNy6lJ6FBV1PIQhHbRwPqF3LF7LjSbEfiSRM
	W0=; b=DWXf2iROr6vvis6OXv24p8ZCz34l1loUpKZliKXWjOAgVNHivI8owlmQR
	AOoAE+9f37e9xoaBZqeKoPYD6SvfumcYB7nfFU4/wOnY5NlXwRF2Ik0DhdFqNOAi
	Z+83MLuk3zPuDQ5LbiHuU2Lgs5OanRHV/kGovaMEgxvMBn8qfg79cv1lUzSYcMF5
	5efpqH85X85NCKkniIh5pkU58k+tUS4gmrwkRmZaJWe8vjc/9tZX01EIlY1AVTmm
	f3CWZGQt/Yh8GOUI7Be7axksU3Ottg4LtMopC2XafNEO/2PTW8pCkq4f4o76IsyQ
	uw7VtIac1umQf8ICDGj31yRdzz7Tg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqshnr53p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 17:06:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaTMUaRvdp6uNtgMjiIGGvcO2TXlbw1sajnEZlCcn/O8TtHQBLBlRfk128eYpJzcq+Oon0LP0wGZd8u79tw9PuIQF8SseRVGa1N5FgZqOBTqf1R3Vc2gY18ve41jNP/HSY60LCl+1IppnxlIvkRT6mgInkuSXKQ9UiYaByEbO/2TqY/YPdrkYLy8vm6L3KpjcDNXvJJK/Jl6gh8JF9q4M802Pkvzt0m58isA98v4BCBWdkpZARLYr+xZxQqc3n48R8X9NT0LDiZZVVcZ2fPNrNVlRNee9ObZQhODDC4NxsuRhwYrG9ErogbzH/xJ8udk/2sRxJyLaQnCgRGcWENTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjqYCBNy6lJ6FBV1PIQhHbRwPqF3LF7LjSbEfiSRMW0=;
 b=UckMIdi60uuocoNi2Fi+YWxFc3hPS7WMEUA5E+gTD5fyAzVGxge/AlKpN/IVVlFGKYp6MYgdlk4P5Dbj8MSGHZDikT3QKwIv0zqqnC/Ev0hxN+PEhmerq+2s84wZSqzSZ7vy4VOxuNGpbOVboQvAvEv8gXSctLXtbiHM5zq/qxPv41fJ1tYWcOcc4IK1f3gG5ne9iNoBomRb1qdXWQ0InK88kxG9oPjGBmsL3tZ9GRLV+Lkj9DxTrBtRpw8ijbvQfmy8gtF3qdGy9p3eNjt+qpmVBI4UnKQlJ3CFFlyL+mg+vpGw4zwO/BGRGRKOblrdd3symU4nN2zbQlSaQz4AHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjqYCBNy6lJ6FBV1PIQhHbRwPqF3LF7LjSbEfiSRMW0=;
 b=SZtf61r699qP2Igkp7Z3+rOGU78wUkyeRhvhzr8V/Kfju12JSLY21XZVW3+65t9xfeEXm45A7Rdf1ItuvBo61uJEv+7Vz3FZ+RXlmljaXdL3koT2pPiOzN+R8LZCL0mS7V6An5yGtsijTOcWzhfmsU1drlRLhk+E4KzNa1Nd5YyV/pLKuvqbKvGFfm0uDnFWOym9o+nHbtsJN8LSgpG8aQyxv0KVMmWS7kYAvPZwbjWV1EwHPFkSoAn3g9at3B3bc7FtL6KiaXPj/2cFZ6UH3j2PhpgAO7DSZa/WB6mCmiTOLv+7WlvidFGhf+jRl7kQsVqgZWatVy2c3x4fP2R+Qg==
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by SN7PR10MB7102.namprd10.prod.outlook.com (2603:10b6:806:348::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 22:06:48 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::5b) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 22:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:06:46 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 17:06:41 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 17:06:41 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 17:06:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TM6faV311234;
	Wed, 29 Jul 2026 17:06:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E52BB9ACF4; Wed, 29 Jul 2026 17:06:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607290400
Date: Wed, 29 Jul 2026 17:06:40 -0500
Message-ID: <20260729220640.689708-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260729220429.2588187-1-lcpdbld@list.ti.com>
References: <20260729220429.2588187-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SN7PR10MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0e75b5-1f44-42ea-2ce2-08deedbdae56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LRbPDWQ3MgL1f4g3DnGho+8F7LhTFoXuwrLUGjxPx4lNr/a/oDdk+2sIeji/9Vhk3GDZxtHIykTRLn/nex3wEqtX7Ln4+bnTzmJ8OcbbJlzbnr7LN3xsJVWs4VQDZpe07Bz755/k/oerqsGZP4cniQ9Dcd5YNCUKoJxxXZkGWM7cqZ/foVoAh1gmdRtaJGFQGZYT8h/GPvqI8x+pVyMsnXibqpq/CIYFCwg48YLDnhSY1QW2lH+LGSRW2X4ZjYJToDelLWTot8G4cGZT8M1NJTe6dzcJCJQECNd0ugJ1zA5EVNGjObyww14JJ6Oyi3y2R6yL1BlYCc9DWwi+iR2IdyuGRkFLs2/Zsh5IiFueRlCwuw3jFG/58225b/3vVgRIPku1SXETbl8+WDdJf8ZlckwR8NZ4rN6/kISpXl8kiQQ0l/maAxcv6gzVFvSRasHZyiWp1AntYebXMfjDNw9lBL7GuP+M6kyLHdD2ZWJuQD7eIZ/r1WyOxZAsGSmmJyTQxeJAaSdxPN5JWv/Mp+c2G4Zc1kXmOPEt2HRSQ2x0IH6qjZxY2J3cU3zpvAJ0k2iznWxQi2YGeVz+QUfsFzt3rB4BsfZpQM/vf/iwuvfyqH0V4SRFFSzNXUAk2LoJDLVSRfO0AfvyG/n4BQ5JARfe9D2LEynfhuqRP5iHicPA+CBf2yuiI2i0WTdBmeeiHwici3kjbXO8mATfXcmhU1cmZQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AtAvQcwqrq3wTOJFyXWJ3zfAzvtm62Q/sFUnuXMI8n7mSfAhINrh4kuLljT6zMVr5wOJJCq6v5NOJt61yCJazRcIonhxXqiaUEp0fde3/1iQ9VrbDnMtl3yCAOfMwfTB1Sz2PDE1EA1f57xm7kKV22wMq9twpw6dt52RPCsGIRCV+CTVo4FgHTTzaQLS05icrLOcfeAm19Eb5s4m8LlNt+IrJjtJuMdGFNh5XZijJWBfmznoJbf60s7ql8Gi/DPNIbjNBKzoUbHd55UnO7NZgam9qTnKMFvbpBuomQzbeUFvx8Gj5bdir8FTJqsdPbDo5IQqjDqNB45vWVe2lUG8yO2aQBvv9P1ouU5tSckK2zVdfQLlWKhywhm8l5Pumlcqh6NCKTZ3AiFEOb0T96hpFHdUvKJcxNuqQ943mOHnJmFo4Jmb+KTLKGAuAHfTrEUC
X-Exchange-RoutingPolicyChecked: 
	h+qNEV9bNWENa4Myo7RQqrRVsngFIYW1QO+4hidKjeENNAo0Mmi0kA/AAUfvwfV2fcazx7BQvuBB+Qm3Fg9HhCzdG5deGWm9t1NAvNe39NEiiSbmpZVCCRJc9h9cqO+M7DlFVKssngs8tm2m3fb689hYvo3K+1io/M2XicTsu1z1M6RnfHMtgSCV+bEpyzW8z7cFiZ+emzAsF0b64NbXpsTH/fJctlem2tmBK6ZOI0xf1Z0Y3+OcQNMHClZtirhOFoJhe2QrZjZsxypIGckh7dvHuL1T86Ll9A531njHQ+R8geUKSllxRWHnoJv5hUHwNp8hByNoLNyxBtf9KqisLw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:06:46.1300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0e75b5-1f44-42ea-2ce2-08deedbdae56
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7102
X-Authority-Analysis: v=2.4 cv=APVzlIg1 c=1 sm=1 tr=0 ts=6a6a797d cx=c_pps
 a=8KrPlQlxEYnZEdstGaGrzw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=4C2I2nHoNkmNE2BiRYAA:9
X-Proofpoint-ORIG-GUID: 1UW2bgrFS8122NokOibaUNPF8TlHf-BF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE2NyBTYWx0ZWRfX0UvDgfJjfbO7
 MtVVzN/AWP9fyFMyoLSWj9277hjM3ofd6b2cYIK7Bda66CmgSBA2nDpats5VpP3h3ekOn5rhtyz
 HD+GWN9ZvhGBnCkL6Kn+EEN4F6NwmJM=
X-Proofpoint-GUID: 1UW2bgrFS8122NokOibaUNPF8TlHf-BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE2NyBTYWx0ZWRfX4NFpBll8XaQO
 pIGSltU9HICqu/GP15W0UJFj5/DcPMFr6RoSJJajUxSPpaI9ENt/hUsMMUAOTanmqkGCD7az/wj
 70DUFH5KS8Slk6u40ZmftDsE9FcSJcSTWKWBPB752iX1vu+eFzN6YMUmn4mfRG8W/4GAMrKNfji
 jqrz5LOYNAKHvdkD9YHI+TjDa0hbwYVkjvyBiyfLokIZQDemXYYBcmLc7RVKsYm0EHUBjlKwiRy
 WqzlkgQXsDXhNki78yPgtkLfNdVFiglfL562MPxFAKL9GiT22x1EGgaHcdmIkqr+xyag15cwc0j
 e6bhDgIs3nDFVk+KtinLDNbXNqCnz1qw5kF13WWbvnifBKZbz45W6QeeCaiQ9Zdj97Nfs8rsb/X
 nlJO896z38zLQPszZgg0JKy+d/MkLC3uua1V4Tgdaf+vAoRcTBJ8wDr2uyxfxVeg3xVeXxc3dQQ
 9OsI1vYiCVLW9fkVmRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290167
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Jul 2026 22:07:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20208

meta-ti / na / 20260729220429.2588187-1-lcpdbld

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607290400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 29 Jul 2026 17:04:29 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fcfbfda6f7ec337bd51f31d3513d3e6e6f20f0e6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-mainline: Bump to v7.1
- Commit SHA: ae90e0a78a717c5a7babe5a397b824c340b7805f

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed




