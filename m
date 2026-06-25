Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE36CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:01:11 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15072.1782403262134810613
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZVHXlxLZ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ALthyKjF;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdA5F3618260;
	Thu, 25 Jun 2026 11:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BVDTCYuizce3wWtNZIxaOeaOkwbFAdPU1KpTAanQz
	8U=; b=ZVHXlxLZyV9S1XKSjzfo0pKhI3rij4FHB+mEeTyKnJbiAUW1O0bl079+N
	1i7ZfkFkhIzVBsA4TylQ1SORQMDaxhopJgRHwAQL6d/I6NGEq3f1S0yoQYI1I9DW
	GUGgG/3+vQ6g6EQHIw5b8P/nO7fAhlcu/nigu/v9TDf0fForIsBiOnps+XZ0u26z
	/kSerRem3uo0w/csiYxXVfO4c6huX8God9L6uVJD+xrmj1j34c+BrG3sUArU9q+l
	+DLvKDha7VubVTgwcWyJ+EvVUQ4miAXtrnn7igH3PRgtfQycYkAA/sov+syHXCt4
	qgAYRbM86O4BVEVHyhS46tPH2Mylg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f12jchwtp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:01:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEYNKwa3+5E4R8V6hGTve+TGR6H7aWB93DI5RY6+VuJm53cNgTJ5Acc+FnUFNK1rbJFrXAd7QkYbzFeA2kn2sLoq71nLdZUV0V8BlahJNd7K4uFBHwWBDZl45CDs5gmeNrrQTgUj5hEv/fYuz5IFe21LnqPSio6almP11zmito/RzJtpA4J+N44d2rxe40Qn4tFzVGkAXiWUpxvnCb8dO8iTysraHG8+yvwSDnk1b/ltgerwtSkpYZTqRBKI08LNG5JmFJJYDXnfIeRdm48SXyyToXdEd2OjXxQO9S54mdHik3p7PEHDSynpGxzMPa8Xz1JAor3LnKkzoUDxIdP98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVDTCYuizce3wWtNZIxaOeaOkwbFAdPU1KpTAanQz8U=;
 b=DPg8Qvw6j32atNOJhjJQwAaV1zBHDaUFjEptdcwLbLdTb4YR6RTawbMi0iipeJiHv05v47IYHIwInjdsVK3/M7Gg3BY/QNhnSMG3uwNTvuGhOUS7YWql0HdaIUhCX3r3tbIDoj9+9j88mcvaSUxn9qwJyGR2Y4VddukZZivI7iiSa632kj+OtKeYzt9MRVq8et3KKxQuUexIs+JILynr6b2zV0sBQCNquU/CjDrjlV7KBKVJ/t2uKthDX4o15bNFOiLUBkP2yUVSNv5LwKf1nFpsgXOtvoFwOMSV1Yqi9a4K0tz2891O7NZ9OmZlpMrEy+Zu7LAEPQEondnxm58h8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVDTCYuizce3wWtNZIxaOeaOkwbFAdPU1KpTAanQz8U=;
 b=ALthyKjFcEip3ivfG84etnw0fotg9uJ1LXXiEUKi8VblQWdTFD47YJ7Lei7dQJxCD9eldRMn7Yk/Pfm+tAFT9oM9p4q12ciS/9QSHU2M4aIpnNvNMazNj2s/YcyylmU8QyHXPgs37QLBybjcAVa7DHaYVUVzlUOmeXs45lTdFqI7b9U8Qq9AnQNsiG7lghUEjbpj30aHeqYY8nMy0XDeCza8lpltwa8RBYNfa+/bD8oPfypAD7CmSoHUoc0ezqAesTJiqYzsRzHbGaMB8K3MB19GUakQkZwr2j5z3VPMvIveUcHFpNik7r1F0WmHJfEC0uBeta4B1uGxXxn9mE5/sQ==
Received: from SJ0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:33b::11)
 by MW4PR10MB5812.namprd10.prod.outlook.com (2603:10b6:303:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 16:00:58 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::9e) by SJ0PR05CA0006.outlook.office365.com
 (2603:10b6:a03:33b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6 via Frontend Transport; Thu, 25
 Jun 2026 16:00:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:00:57 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:00:54 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:00:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:00:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PG0O623671673;
	Thu, 25 Jun 2026 11:00:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 459799ACF4; Thu, 25 Jun 2026 11:00:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] linux-firmware: Move recipe from meta-arago
Date: Thu, 25 Jun 2026 11:00:24 -0500
Message-ID: <20260625160024.1262544-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260625155800.28627-1-afd@ti.com>
References: <20260625155800.28627-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|MW4PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 167155cc-f983-4c5c-087c-08ded2d2f219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|13003099007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	XYK9AViYeyCZKXdTh5EImpMQvR6I4qRTJCuBPADgNBlmxhDTTr+rRQApGHupM4CTJ7zsriolHhEoG0NTcmqaO/xRZwb5GosxIaeBxpHRzTI3hyejwoYKG3kAad2veaFm5kqAw2AkBFUI0mL/draIImNReFSTahzPSwxkzVVVk9KdwcR4QWSFbU6pJglUxbrFwdNLjvtP8owPKf2c13yb6PsQ8uY1Fc4RPti90qgCYJPDpnyc5fEiGo1qCT1G+SvaaPxTraZLf78FVVHzkueznPh7bkMNQu42hJJ+AMbBJpY8nTfCQkcUxQQ7lx1hnIiBz66mXzhkGiA2XtZXmtA73IKXOe4xjthX1EzvY5JHrFlaveQE8k3AmIVDWpNnYFI88s3ejzf531utOaCawfDkrrBTVTe+95y8pFqJBPNZuqdhm4cRvfr2Tn/Rs8JFuVel+Lykj2yt7O5kQfpfxdD05ug7MIiXqGtfnfPphQ43YSksim8RiCNbxFuGAb3b//tlMa56yHqXh4SKeNn/nN0eFoT+yZ2BlHT6xVXtpEnmnVpjJ/+3XvT6RAZIjCxFI0PtolyPl+ul3EoSNnbU335QJb9Q8DiFN7n1VDHW2Mi2RgzBsYxVl37NPhiUSOQw5xEF/Mc8w13A9vC2EjmjS/8rHpDKIu1Gvqzo8R3OdsJHINc8TVssTey7bukX78sYIOo0plwrtBq6O4G6U5hmPVvAkQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dpIDLbXqbezCmGoEu39WrMoGaoJOViuGEF6WERcWJGbsa4XfetKKujF1jxTGEgOUKAKpd8BN26EaSmJ6rGlmAvVo63B2k52cnmATZ5+Q7z3iAWqKNR7DJTXj0mZhbRC63NqdEXXUlb+VFj0tzVv5jj8QsueaC5flY9qmdyHxNqXRwCT+Oenwx1tVBrTNPqg5azrAn6KmDK3IVgHWK6LP/IK9rUwwLTIozObD/Kl/V4fDzLa1OtZdJjqzcuDqXiB/Q1U/uCKTUP+tWvsQYuba2IJ3leyX6k76KNapms0Pa5xGEBHXfznqu0mNduFJRtiIJrLNf1ljS1p5xyQjYX/TUiQo9HFJXMObZ74e+zGy4obNM1M4Uda1FvgbEZVZCGaLBCjH/pWTunBtOUrc96xnM4rrwYHwLNU/qKVV1lVEquOiB7zaFK7SAc1gV2VyYAA+
X-Exchange-RoutingPolicyChecked: 
	WT6jLnKj7fPWjwIBAKZG5/LhF0y79w7+hWPKufeRd/yCxC0pzAy2JfaEhfOfJyCn54KSzp6/PhY/CO0yifLh6RHglsp3Z8bPuQt1WL/jydRu7OZ5a3JxNgiks5sLBns+tfdD4wM42JDpGmMv76BgmsLcC3ndubBB1d6gSWtoADGm4her8etdYejDD3KBFX2rYpNrqqet9N14s6lB5oBWV37WKUnpF8EmhXRDIANavZNNAHHH1q/nFvbwm6cifta6mrtb0CdO/bvjEAsn3fD/guwjWQZ4VkDhUDYNmUnV+73LcEDOKCpViDjS0YTWj/wUnux9jAK5rf/YTIim5rhfiw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:00:57.8568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 167155cc-f983-4c5c-087c-08ded2d2f219
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzNyBTYWx0ZWRfX264bZkL/N57L
 kvAqfMj4t73xiks7qk/b4jx0NhKn6qJO0pp0h5TeTu35b/1C7J5UBFVeqcmLJQwZ36VhwPLOKYk
 JWzLA077aabXkZj6jphhP/f2aaiy3MtWXbPJt1ixjBqZHt86KGPIShMrKYoMyhDBp3ZVzmQY0Dz
 dH7iEGdQ5KPpid5/mNxsSqAHIg8r0QQk3WMMvpW9g7D1BC8hXU+C4lm1GdUVOXIFDFg4zjNVcUz
 u/09SMSh6YSj37v2tGaQe85fu+R0gOcutbrU+iPzLnBKc2G1JihS7zSfPYGlI8QFUj/G7RHcVad
 /EcqXoqVJY847y3cSH62Ovm1+bDiWoklIjuVMTBd4eI2NuEULfF3uqVf4OgXFEdyArSCmmRZmqH
 YbSiYcG/XO8Bg9W7QntSIvN2vyLV+xsriA65chL3K52GLUBldUjKZgGYDlwOV0xjubZcc1nBkiB
 8nP7csg3aCeC5bYpJoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzNyBTYWx0ZWRfXwy26Rq/0wMFd
 DCqH3jk3+6Kl6ZPnn2TIlqwSvFoLjGCQtBv46tckVeoZU/FHLoty9BwB/3ZaVM4KwIZCgHpT8Ch
 GlWpKQ9zs5hY+2bsk7ETo7x0EQ2cxio=
X-Proofpoint-GUID: eVtCaksnAHsYekW6rrYS6tr1fYmZCuK0
X-Authority-Analysis: v=2.4 cv=WrUb99fv c=1 sm=1 tr=0 ts=6a3d50bc cx=c_pps
 a=Eb813/LJkoRL1pr8t+D1ZA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=VkkHSWmPFM6PHLY5UBcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: eVtCaksnAHsYekW6rrYS6tr1fYmZCuK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250137
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:01:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20090

meta-ti / na / 20260625155800.28627-1-afd

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
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-firmware: Move recipe from meta-arago
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 25 Jun 2026 10:58:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0299ddb1d9ece21f81362bbd840e9b679500493a

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
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-firmware: Move recipe from meta-arago
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 25 Jun 2026 10:58:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0299ddb1d9ece21f81362bbd840e9b679500493a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Suhaas Joshi <s-joshi@ti.com>
- Commit Subject: tfa: Update TF-A for K3 devices to 2.15 tag
- Commit SHA: 88ce8160ec6c5804820555e0bc29dba23059a4a1

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

wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




