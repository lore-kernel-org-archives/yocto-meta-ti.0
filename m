Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C926AC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 02:11:28 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60492.1782958284929487224
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 19:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YwPLpEA4;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=fcUo9aCW;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6621LN5W1050925;
	Wed, 1 Jul 2026 21:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5UNrrzORp6h6gzHmteV7dbl9mBjAzukycmcgE1pwU
	0M=; b=YwPLpEA4Htifj00bXYl+rAYO6rtx7OdQwUlTd1dWNCEu/udrzMj2JjZaN
	bES+0mldB8SLz8uItIw94Asch45fSOcoT9v3LtcPwIZ5ekqKzOBLFYn00UjA63pQ
	nzl/LjWGm1Qis2zetGI350wD556pDZil9dwj7HI0Nev9gRl6ZE3x8MTVx3F4ziB4
	b2PZzFy4ji7rnfSzNCNDRGcAqOc7V/BPLsD8MckH/3dmYzdj85lpUcpwf4f8tq/1
	LeMiNKE/+wGk9YJlsDR8OysqO+ptJtSfc4JN+ui8ByhFo9hZ3sfLz1iTvX80gI+X
	/XHICkJBFW0FWuzjRK1DwPeZU4I3w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5248517u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 21:11:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chZWovtkm+CBBCQSOqXeyoQN7KuyDL+NEmGew3ytFe4U6sL/xT32UbcLJr1if2VmJyOZdqzK5vuCcTHGQiGzi/8AU6gyvzkK8av8kv+yWeNIaB+B1scAoTnmnUlH6eXASumz3jSES+N8C1KWnhCfwdv1pzKOsN8oOi2jZVALGYEsmhh4TGAMLzXX5z2L7tAWUobPmkIrKDwpaH5uVRDUX41EYNj9ptDKLd++5Ae5qIDUxQn3kt7F8sh2nvRsBgmeXSPpf0G6srzcCK+Rg5Q800v6d8Eb0ruSBUJFVHkx6M8/X1J/V9s1XRwLfDVrQkiv8KGeQfD/d6NtU2l88ymQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UNrrzORp6h6gzHmteV7dbl9mBjAzukycmcgE1pwU0M=;
 b=Yxbtpfuqhs1AaDseZluEElY3hRJL54UhMGhTAwcooDRyK7+wZJbVI8HbdOs1VqA7Pd8qyQLsAdErN3m028w4PpfP/AwAjR2GqODfEP8TKdVP4hJ/62YJxHSoqTjG16WLlo1vDMTsomPN3qWUepu0lp12lAmzFw1O/dnMC6AdhFypW+L5wVp9gUwNMaUAL5p6kNfFkGPiKZ/NNFuV+yTgOj9uQVWoBg2qaRe8g4eg5mzmc7U7yMhCOUvdwGwIIUXZpLpSIJcwjp0S6qeWJvM68i8ACku6A3s8RuQAGzigiRf1lcl7YM3CxjX5Nbx06nQ4n8xwizX4DPGahpELKMMFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UNrrzORp6h6gzHmteV7dbl9mBjAzukycmcgE1pwU0M=;
 b=fcUo9aCWLA+t4GmpxGltvKxMO4p5q5HXLZ5nqlN5QThszMAv2G+FLtJCQcX6qeTZdJFuoau6wYZrJ33rHasOkeLcfWO+ROZrOOuRQh5nQjArZ0yzci3/3LN58qFs+eyvzp2qRR39SgP24Sb/b/VrJVSo3OpD2jl+7Ava9UMR/ybXCl37c93G3DQJGH9ClSJuKWjMRwoCWZpyO9nbmmmTWrxdVgWcm2u1oniMpARbqlpPnL7mXp1AMW/wPf31ABKqaWC/LzvMFsUXGxkedFTJBidbi4yVHB8JZs8P7YV8wykOODlYxF3GhoGHYcQqoHbxwEojSzn5tNU8aJokMxnz0Q==
Received: from SJ0PR03CA0216.namprd03.prod.outlook.com (2603:10b6:a03:39f::11)
 by LV8PR10MB7822.namprd10.prod.outlook.com (2603:10b6:408:1e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 02:11:19 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::7) by SJ0PR03CA0216.outlook.office365.com
 (2603:10b6:a03:39f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Thu, 2
 Jul 2026 02:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 02:11:17 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:10:44 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:10:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 21:10:43 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6622AhkM2775320;
	Wed, 1 Jul 2026 21:10:43 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id DA8E5142E1F; Wed,  1 Jul 2026 21:10:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] mesa-pvr: Fix llvm-config handling
Date: Wed, 1 Jul 2026 21:10:43 -0500
Message-ID: <20260702021043.96715-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260702020625.3004461-1-reatmon@ti.com>
References: <20260702020625.3004461-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|LV8PR10MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b859ea-177f-45f6-9294-08ded7df33b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|13003099007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zSSu1ezQxjcEmpCxSKWc4Tay2zVaf2lDAUPdPSyY4YW8Pe+9CMdrgVhM5PE7HTwUzPngJ+3xWpoxDYhE97yvezRTkV9aTFySWNTWVYV7bVl6KycXXBTmj9xog6WpkXuuPRosh3RoAWsR8chdz6sP8m5dCWT81ISj4uY1FkGy2Uj3cdfBgXlmjqPs5rTTAkoCEQC1QM68wDrol3d8Pk4GOs6THXz+d1AKg4HjRJn2jPE6I+NilvTR8dElVFhKtuCMRHWF05BOiW1MCdNW+Z4iCa+XCA3Zulb+2O8u6icURY0Bqk7l4y7aGSoCuYaakwSXxhxJ1YscDEgpgKEfBtwFiNbev+MUZvqeRBavUImm6/qh9cQ+nAuDHNgEiBHhEq6f2P7f1zXY+eOdpW0pUde5yLcAEx98aMt3Oqx4s/qe+ETA+vF0Ud6R9StACHz4TkmFt8w+62ZIPl7P9c+bhzdywppcxTu8Zu2UQAli5PsmJbG5G1dFe53LZQPtVVoFI6w18J6w0aRyvsgWIFOO5f7NDrRRG+T9XQrCL5a4/FTVK0+LRMqg7gouff9hOX4ltwFsMkfA+jvP/tihWrmJ/zkfhfVVcyObwaBfcoWgYdnbU00sFyBxZEGYhw9w7Qui8R8ew2MUjhGjxxnujtRTAlWsobmmdTjlz1XrRXK0hOFMac1IWStLCqiu3r1yGn45yX7D6kvWr6XHPU2KYIrbqLXpTA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(13003099007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P1x6B3vSjSfR7uv6Vw7+Tuj3+tKeJXC9qGjW4v+Y8B6PojiYuxNgo+BRd5XRuSSEZRGax6QVNWthSdlg4ZzSodSGIPwO0oq5VpayHGInTSCUlaiQv77qLchqvg5AU+12f3fK6qz6RixNiRS3GYyA4BL6t7LaxPm2UnLHjfoQPRx33xVxpvxXin4wOfJASOkEkANG3d64ImtaPL7DRHQIv1FAJm7UMFCNuWKiPXe1dashcQ8Qjs9MlMi4628alCa/N9QcB1Auw9Kfab9DyWZeu2vXXYElgZ9OGkx1Ti+UPthXX6a+pjAO3pd6Fjka0h8Lgq6xtNDNXzRnZgr1X2JGQ2rXlK/gMIpVTOo2+GiXqHzliih+veax465hjE2novm7UxjXOBnHMnjGn0vzka7KAI+BRfT4WGe/jNdfFXCq3zqb23RjSEf8QPla9gO6BWqq
X-Exchange-RoutingPolicyChecked: 
	poEv0XK5fg41BlnmenaY4tA7gwJx2K566wFqvOPSZwVNhQmp057LAfk5QTToNEo4GQn9N5tQKtydOREreY1RAPm7h2f5qKD60cfNX2NTdfrYJ7tnuNzOKCJnFm011kg96l8GHylTLsMgN+v2Sz6cm/xG5phHxTHDKUyTkqywj+SORUpNUflomZeI3cAPkNpj/EzUpYkhtMhd7G2i2cQvxjuA74uRniiMUHxczaS1rS5CQI9ltMz1NYpuI7SlVE5up9ESyxpm7vIqRa45WVaPqsYUr3WH8Is2A01lM5+wFA5DwhHRU1Z8AIrQfurgPN6gT9Bofj1Hk7MKcE0BwYLmBQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 02:11:17.6768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b859ea-177f-45f6-9294-08ded7df33b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7822
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAxOSBTYWx0ZWRfX2CQRkA460yrP
 VC4+P/avkXMCI/SpnlHE/1qXhNyMe63DOF0IzlfKuJSTSHNglOlkSYpPuPdAFjlx9zZEaU16yl2
 9v8K4q//g6xvjUfK65HWsNJY51eRQ84mv7U/Hs7VvmCZPZBXWkd/0Itx0igbV4crqijvSvoUJa8
 n3ZSjynEIyKuI6EVQEOsTn+F/rMlzGiPZ1GguAfnr6XjT4h1MIynegMHyhI3lG9Q2nBfEOd/CyR
 IF/SSCGW50flOYSx2T+0F2hEprjOCJ+sziKrm78fwRlnellXNzx++U4VHqyzoOt5chP2v5CYmvv
 og0ORXTSwDApDlqS5pSvlhBN3boyyIunS9aN/ZLUONXZWj5WZMOClDyXP80APG4ShaCLOC+purf
 ULKuJ13JUyEnXEp2+bqde6MPijzS3r7nXSyY8or6IMk++sDF1vNfEWAjtX0LOelTG5EWerWLXGk
 IIYU9TWcaQ9k2lZS6pg==
X-Proofpoint-GUID: CHVb1SS7GM03bFqZCWyfbmfPkyCoGBQR
X-Proofpoint-ORIG-GUID: CHVb1SS7GM03bFqZCWyfbmfPkyCoGBQR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAxOSBTYWx0ZWRfXxP+3+Nwqufsz
 VvvNJe4nrYfkIZ69ZKFM1JcSUGkms4MRjnGw7PvQWHfnSFC72iHcRSOPVzy+PEL85hXZygSkUlC
 Uc4H7GByatfpyGL3k0kz+uD+4Q/kvS8=
X-Authority-Analysis: v=2.4 cv=EsTiaycA c=1 sm=1 tr=0 ts=6a45c8cb cx=c_pps
 a=cXHsTeABgwIgPhuKzetQTw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=t9jGTnnlT1RCfQnlPlgA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020019
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jul 2026 02:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20119

meta-ti / na / 20260702020625.3004461-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] mesa-pvr: Fix llvm-config handling
    WARN: Commit message does not include file/recipe name: mesa-pvr: Fix llvm-config handling. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] mesa-pvr: Fix llvm-config handling
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 1 Jul 2026 21:06:25 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ab7cc89eab0e266307f51a45d0a446897690ecc6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: mesa-pvr: Fix llvm-config handling
- Commit SHA: e8e631a0897c65ed67e63b9b8c146a69d2d8cd85

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
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




