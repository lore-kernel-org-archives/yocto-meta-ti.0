Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB0810AB83A
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 00:50:58 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62446.1774572657760003380
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 17:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=g7W/JtyR;
 spf=pass (domain: list.ti.com, ip: 52.101.193.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=me6XBqFKg6hZ+l8s4c8ByhzDQWar8MrIFfOZ8g40h+BdH28dlNZ+faXRoGhdGclBD9cbAKWyg/U277L5F6ISHoGzs9i5Nu37yK5Fa24gapL8j0mfIurcxU0Hzvpotvo1IwN1ebHsZoSpO+JNXi9Z8CgKCfE3mKHKJ2YexMDaFgsm86FE4IofqYqswiZ7teUWKHmIMxG+/JZe+okPGTTAwRz6h1ib4h9h2EbW7JvU7liHnodIo+v1+6wcRplcY9EZDNy1g6NO17YGiQi7QsJIDBot6Igqar57A0smjt5HqRTIDHSPqZAh/DmLm7PQ8K6Fsus03k/6GJ23av2iNtDn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYPYA/L0zxedQvTcvWDNXbej+64/pq3C6gXw1NGbX/M=;
 b=qCXgLfti5MgGXTyBb5RPZBlud1CuiWvtajY0k5uOvPHsVDaxj5jiuf26JWA56RTdIMMiS/RCf8MwTX8cvO0kQ+jtCutMGmQxq12EmQFWYtE6OjUSul58R65wahBOxyWP1nrCqYWDG+ctM46IfxUPdenR8JRQWrrnRPqNojGaKm6o1V5GXW9/elg9OrZB1hPvW/CTFB0QEP2rLxoOYfgo13kMLKz/WLtljS22VYjHaC3t6Rtco3zL1sm38MS7tukmkW3mvEgH2YHvZiSVokmRxSaQ8504AcpzCMeYWQrlHay4Ekc+bBSJSuZhTnvyETPMLa5iHGUxbpTTdxkkvLQYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYPYA/L0zxedQvTcvWDNXbej+64/pq3C6gXw1NGbX/M=;
 b=g7W/JtyRb76/iY8UB59FahB3sJfp0aSbn9mev/lEWwivkVLOqdYTVOmAgtko+J7/PdF3kaYOzxG6fGJ0hW3Aww/Di2D6nNxDGIazaxanT7m+OSeI8qD4q8CQmTnYjxJZ/vLRWRHcFvi+jHXTdXpvopcfEj0b4ekX++Swvx/vqHEl+pF/SQAcf9lG6VY0PmygW3ZftPanztraKafYn5bLXo3KO/CpX2vtlTyKtodtXk8R2sP7J7UHLUMia9Xiiv1bWXDMuaetCBlIVVhrPxw93QMa63pA4xiSk/5rQteUt872VJNLgaJZsWG4TZEGLPW8Hc47s/AWIX7A16zKTQ4daA==
Received: from DM6PR07CA0075.namprd07.prod.outlook.com (2603:10b6:5:337::8) by
 PH7PR10MB6988.namprd10.prod.outlook.com (2603:10b6:510:27d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.25; Fri, 27 Mar 2026 00:50:55 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::3b) by DM6PR07CA0075.outlook.office365.com
 (2603:10b6:5:337::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 00:50:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 00:50:53 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 19:50:52 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 19:50:52 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 19:50:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R0oqu64151320;
	Thu, 26 Mar 2026 19:50:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9075F9ACF4; Thu, 26 Mar 2026 19:50:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603261656
Date: Thu, 26 Mar 2026 19:50:52 -0500
Message-ID: <20260327005052.1970254-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260327004905.3892540-1-lcpdbld@list.ti.com>
References: <20260327004905.3892540-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|PH7PR10MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6a32e3-a0ad-4062-cff2-08de8b9ae5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	pFklBvnnlHbVq87xWiL+9myGPxnLI+b/HqshBmp0ntChVCp5jc3EUn4ZamMfwgm+XZJkIgH7qwFumBJ3PWRsfVlfKwHdV/JKk7ITEDgTC77e/I3eXKRbCL19uB+8wr/JT8gNeW7Xjfj+a8MEdtoyLmXQ6wVBFHPk32oOkGEPvsdl2c8yqlH3+9R6ZgmXPpq6C12+EHavE97nLbvOQPOgw6+jQ2s9a9BpZSwWwqQYDQ4eBki+7GAPRnNSAH12iiUlKozYWSoamsjpYKkA5lcybv6F3wUZVJmdCvXUiTZMMP72v7Q4MUwmJkE6UVjfNrdw3bu9fXuDO+LGSthLGR3p6mjcVX9BQJ5RcKSev8KXY4+PUMgvENB98oSJ01tzCBpSGIEKbRbgIrNTguA7/l4WYWBcnUqnaZieLwU9Wd6CdhBzEEJvnMUHfQB6abuMdmY8bIP0k/4FNUo6wQ9+20XLYS8H6+/z8/V0NH4wmdHc9Bw2NJgSoWrC+NSyozheWHSBSjgj4Eubz/10REWzvgFbXz+qzs4Xk+JFs3BX82wnvbD9aEl3paFp2+1597vKsJPTYUmJu58HTC1N8RMxzNTRD18jtI8vRwS1FiRPotyDfmvzMEiCfz/ekAG/BtVS45PnHtZeKIf/+aSU794ugmBSHFdrjRyncNkWQwGXIhx9S0dkZg6XMhCpB1Fe2x7Rp47xEL9H4gR4uqzU2l4YkfmIW8pYUfrLla+CkeofBlUJgKjMlF80sCazuNyVxLlWvqHwJRDCgybV85Dw6kfD1TGW7w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Gi9WG17UNEIJO7j1E5kHnjQaa4X5pgY75+1V60efz7E8OEhSMauz774Df5By/zm5UP1faYJ0rghEA9DFgyGQpDFf09vesmDtFm9a3xnin3Eaa7uWJxBVPif/c4L9mfHycfnpJ4Y6MDNu1kyCJbv75z9pIZFqnKl9PQP5G6mG7sqh6AI3L1To6SlNS/ahwueP06amMFJKqtgQKvcTqVHelgyKfTK64im6IKzxkJdZyNWdd0xwBOhaZJ7Lj9x0+JskbFhdH/PE2Niw66dfAVvh92CrSg+qb2GqX8EQSpLeVc481IPTE2MqGpU0N4hD47XgtoQbN6CK/Fi9ahtf3bb6oqQ6gHFQkt39B0dMjXID9DYyHQO2G+NkAGt2JI3UlXihaFFpyUhcEaFXKVs401uW7j+BqebKoCVGAvh+Oms94hS7d+dpYD8aLVsWdKCzd7OH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 00:50:53.1782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6a32e3-a0ad-4062-cff2-08de8b9ae5fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6988
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Mar 2026 00:50:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19831

meta-ti / na / 20260327004905.3892540-1-lcpdbld

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
603261656
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 26 Mar 2026 19:49:05 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 33849bede093174a2c28e99801f1034dd=
a2921e7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 318807b6cea98d88d1444b77ffad390ffdadbfe7

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-core-i=
nitramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




