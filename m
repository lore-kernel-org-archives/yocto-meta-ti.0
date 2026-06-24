Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAC3CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 23:38:18 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.670.1782344291124247834
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 16:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hD8r5NE4;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=G/y0YnFS;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsOSe1271518;
	Wed, 24 Jun 2026 18:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=U8CReLCyl4PhMsoQmy0kgY61i+3sMPFNeF5xRzfhB
	pI=; b=hD8r5NE4TUrm6ObflhNL7jjvQuxkeLoZB43p3JFbk49PifLp3QsLYfNk2
	wgDVdxFJKb40inJ74EY5szO7336hfExAZBLyntRyKW1EIZBTcOGXIYRNCFzmI+MW
	cSjnYL+0A5KcyJp8VUQjYqK/jJZG13zgY7BzKh4w9+Dt40xmLoZoGBgrejEBcUfg
	mkllvaglJjhOOvYTSfKDzw7RyCFz+GxNVKDu9NL2EoNe4TV8dhPzk9OkVVwmshrr
	C+14sApjHZP61J+jQkeoLZeSlpn2gW9fjDwwdlKQM6p6GcMXZ9BZgHLiU1juSR08
	mR2v24NLtv1Krlz7XUcMBAXntA1Cg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010009.outbound.protection.outlook.com [52.101.85.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0e5m4ab0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 18:38:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRyx2bfrOTREqzh1XQ2wfC9qyWEukqSVF1c6LH2Qwfmj/n0qaH1tjCq2dAp6GSFTUgZnDszV2OcQY9kKNt3VufSeI8J4qCcQUBl9zll5uVm2L2sBscR35yVc4pzz9aybxyOjgIuDMRSILFx6yhmRjM0STrJsu6mIj6ibAlOeRk9E4Q14jHOSUtDxo6XxeTZRrbXP1Sq6bLHxwtgZEbT6dWtrg+H75DmzA7u3dLIGYeh5vnZOgmmaZWq5UKxmcdhqSeGEB/qRljppuDRS18Yz1oQFa6rFB6ZqD6Ald5cXneE1YdGJwiTJByvzfXJdXdCdMIyXYf1It1hXq7CHBuAU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8CReLCyl4PhMsoQmy0kgY61i+3sMPFNeF5xRzfhBpI=;
 b=Ow18uW84xt5rqFzap78aqlAtQ8oUbjf4/GVyjkdK1ddUMl5OPXOPR4oJbChVl6Zppdre2HtXu4cTNSyUY2v+rA8zFzU1O97+wPc7jkuflZOculRrbxDrB33FEI5mY1qo6diUnZMoDCqSlXJWUjTKnfcFBnybby8pU9z057Jj0MWT49kREQ/FUFTIMg/ZSFR2sUrkvIGUrmCXIgJih8xqJbqaj4htCeUu+OwIAc3wxisg9jca5VmnoPQPHj30sDFKMdXKQpyBLngJ25LYqPXnt5Wqq+HcRBJoL0WFN3V6s9kdt3dqfwyJ/379aj2QoExRNu+KWPgbO2twt7nNOx7neA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8CReLCyl4PhMsoQmy0kgY61i+3sMPFNeF5xRzfhBpI=;
 b=G/y0YnFSbco5tguKDEkpWCaCwPJFe+O5s3Bdh1B6fJJSPQbxA+AenouiWEkYcxyjpH9Htswkuzx6NdCnT0apzBpFZmPL4RnbwbK3W3/ZeLDvyYrnQHvJY3JtUjXje2t0ot+dO7G8ahEYxU6sfwsDI0L7P3xwLeN0SOpu1andRrK+a25y+7aIPsa0RJfRsO28xJfHb7ZeBPe0gZLTjayTUWRdw4wnEaf51gX49omq4TNxsbGHOOgzXV1VrR0kVmN/X1w3ZqhVkb+1OWcx8a3eSpPNDmyx3fZC3PdzKb5h4qUX2c2AEo0Xbbfb/KvFCd4LmyZ1jYLaYL/wHZTHpwJSSQ==
Received: from PH7PR17CA0067.namprd17.prod.outlook.com (2603:10b6:510:325::13)
 by SA2PR10MB4441.namprd10.prod.outlook.com (2603:10b6:806:11d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 23:38:06 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:510:325:cafe::74) by PH7PR17CA0067.outlook.office365.com
 (2603:10b6:510:325::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 23:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Wed, 24 Jun 2026 23:38:04 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 18:38:03 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 18:38:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 18:38:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65ONc3ap3243156;
	Wed, 24 Jun 2026 18:38:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5212E138B5B; Wed, 24 Jun 2026 18:38:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v2] ti-linux-fw: Remove default SUMMARY line
Date: Wed, 24 Jun 2026 18:38:03 -0500
Message-ID: <20260624233803.3823344-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260624203026.1155961-1-afd@ti.com>
References: <20260624203026.1155961-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|SA2PR10MB4441:EE_
X-MS-Office365-Filtering-Correlation-Id: 7310e7a6-a870-48f5-0d0e-08ded249a309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	KWYq8bI0tuhPvDesbIa5DvNoJ8SbnD9PaTPzeR3eM+A+Iky2s/zIxMG5ydmuEt1OUXVpYJzqhxGpHTOj5wnLc3NFgxuvWfSAdOPz38isa00xLl+Qd+tt/R9qkxnR9c5CNqKyXyiXz4pDxY8ycnp5qVhgEis6PmYJymP0T/2bKcffm/EIoXIr0Xbskm1OX0raI1usynYZW4x5QikvCLLGBSEj4BJ/Tr2JGLkxz+GbVWyUEUlg/jJEl0Pjm4MGWHfzDwxB5dZ/xph1eY8ku7lRWbiPAGokbXYcpBXtBzIT/KJxekqEqFHjD5UAjOGMdDf5OUIFIgkCqfvyjAwvT5SD+bGPyJa702YoE66Oh1J/FXbsxnL296wpwUwNJIcjNxm980prkf5/EZkcrZnw+zirOSViJrcnGSR1/U54YpZK4KA4up7m2hKN45FStPruaBNH2+9HPMSVghipyNExvLjMxS1B2q9RGMBgtPTAMc/uE7Xl19cDPjnmkf79IFW0ga41FveP19DCiQLHZOItY5yYmfMH/Y0I7DnIq7F0h/gpWcDzyd85QlQfZjpX1VMk9WAKFEQNYmYaqynBvPDcsQ3cWybokRnEJOnAy0R1tmOr6gkKoP9MyXvaszZky9I1rQkJnVUgYCcstowcwqEGjiCnDrCLkqv/K4jrlH4mz5j58hyUNe8T4pVK6XRxHwOIhHmTPpT7VAUov1qcHi+eaO8mMg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QL2pFt6TyB05UrdemdXJtVRzXqjCmdtFVSNIlSDwE8XxsbXBZXNRZj/8anpPtnpziDWw/WYX2XAXpYbHKRcy8/l0/hGivUSrW13Qow2O+/0bJ5DeIVXgXT2BlTHiIFKMfsv6OhHYeAQotNMiMF0Fv6sTLgJFWZ2Wkq09+9tz3NxYBY9waiDAICLY3oOjPhUjKiUYVxGXmewmwBvIQciwONChr/UT8PQkYaLi8+W6Ol/jiToAJX5cbhal1HV9bmdqHXf4LzWGHXZ4fL7CP2ImeOa4cWYOiTaV1mF2XtrOH5RmmA8CEmDqFcMvWOxWNrlIkmg1UhmIz4+aKz5NO6ky/lVglvB04ENhCAmEXAGSkuqpwX8JPS/jZhK+v+0EyGRvalLVWr+8wXHnywpe4s7i5o5WrIDxMB1p5fNjLr4XZjrkH8wYpQUp84vkK7YuSFhE
X-Exchange-RoutingPolicyChecked: 
	CNulE6hyppbQnlUdsY+L27wrFWR4vdgaT4VJRgEx6bPc9QduG5jvgwdClHqOSdBGTvmTTCU4LFwlR6cK7VrLtDQBhFPunVMJd6zN9I5/DBL5o0E9n6/WHpM/RapQQkgFtW9Mxq8BQEKqDO2FMmj08n0wn4Dr4By9pFXMdorhZYJv+eFlg5FxFbBxMPXcKDllPDQGcDH7l/IcvrJOGYTKXcfREg0cV0AeS+EvJO1Qx9th5B+cN4hMcL4j/YmlfNTCzOjMeJaWCET5Q/GPQsPX9gIcEQcFXrGGgyQTzVLV2/Mm1Qh3fxp4kkhbs21YCNxJHQtlX7pWQmlYqJObVvYxmA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 23:38:04.1585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7310e7a6-a870-48f5-0d0e-08ded249a309
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4441
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a3c6a61 cx=c_pps
 a=A+iiJIZ7q7LOtbDGyL1ITQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
X-Proofpoint-GUID: Xth0--SgwH3ekqBAYzAA9700DMxys37u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE5OCBTYWx0ZWRfX/b1Nr1pvZO33
 Ikih8967lJ11lH6kX/XISu+BFLBZEIX3UvCQEKy6oFIzktIjXPSdfJw7QRSt/8fYnNEnUHPLqEy
 e6z0m0rAFPQpP+ejXVcFudellY+/rdHhdNEitMWF6jx+EqC4+zu3RTMkxr4OSKEIxGcQruLjcB/
 8tq84/tBIfyN1+pMQbTnp9rjqF1XsMzF/iMtV/PFLjtw16mxNnpedKfRZwvxwPYTF4mR58ON/Z7
 oLtEqYXGEKlBDhaxcAr20jdH3RL3H4s+5uakGHtYNwwWiXHYhaon1D0BFPsnTPbLjG7kp3Hpt0B
 qmIIXBJdHhYZmf3T46x/O3YdBsTSJxQsffAQ9xEbDpeZzYRMRBNfRtpuFcKylNvI9x1R0pKKDs9
 SrNV2uz96ZDEjZ5raVpWLOz/2JYT+ACH4A2nameWxzWAkREHcdyOI4FZenjOzA3B/5cNPgt8DLf
 2Kbivt0jVCU5xexupIA==
X-Proofpoint-ORIG-GUID: Xth0--SgwH3ekqBAYzAA9700DMxys37u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE5OCBTYWx0ZWRfX8HDZBaLTWyWD
 USKOT+QOXX7Vsr5VzPdNM7LYRqC9OPNwtAgx5D/qDExfbN+E1XMUPgBELkgYXgaYGsXQj28hocq
 6/mEQ0f9CYBN2+UoAwNysoyuVl7woL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240198
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 23:38:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20088

meta-ti / na / 20260624203026.1155961-1-afd

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
- Patch Series: [meta-ti][master/wrynose][PATCH v2] ti-linux-fw: Remove default SUMMARY line
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 24 Jun 2026 15:30:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f4315be5bd9bd4c6d8db59bc58c7102a1b6796bb

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
- Patch Series: [meta-ti][master/wrynose][PATCH v2] ti-linux-fw: Remove default SUMMARY line
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 24 Jun 2026 15:30:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f4315be5bd9bd4c6d8db59bc58c7102a1b6796bb

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




