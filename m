Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7052DCD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:56:01 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33492.1781132151359287887
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 15:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pkt1yOQl;
 spf=pass (domain: list.ti.com, ip: 40.93.196.38, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYPb3XIzZRKxQ5H1Pi31QCJXLbRbjRpTqcbQkfr/DS8j9ETJhMuc5+c2DvDbvi7r6WcqfdfXpGlb66RgiThyFEtdbZnpO0v8vV5t8AHUH7+AZyX2XmuUdOTd2BihKLZG7OJ/nH1NToPf4LMT74r+t2hxJKHwsKFfWJco9chmEynY7Q2iRu8vVe1dBwzibiVniJZ4ojEuMLop9JuX+2ovIKxFUc7AdLaC6YoavUg8XQzTbmdyCbqVs7hnh4w8njH46hBU7eZdpa/7D7324yoYsXTK2AwaMY/2j8PH3FSWGS3ODBhcMcFSdT3XQdxtMmfQGhIqsJYKtmgh1DrwAaMOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9Rc6fkLmVIOmHyCAnCPTGri2pHG+ssVwiq/3fwjr+M=;
 b=iyPFRe1o7ucbVdBtHKnBI9vpqrwi+ojP2Iqe1UaD4HYCzgERm3eHvGQZ8TUUAPooaw8VI03x9JDzfFEflUgSMf63jF1Tib9X8wuj1tAqw5xx6Uef0QPDRUFxdVdy6/JTgOlH0vwKTyvqIayK6BfanKib2KTZeIw/mZxaB/FG9pJxPVr2bBoCDyOaVPgFizCQETYe54wtnbQ3Zq4/BkNRIeNK9Sf7SlxPQCdOlgAR7SILw5QhCJS7tigR4QWG8o6ly/JE2qXXOzcKlaJ/K6mnha7k2ocOYg3GuOE07wEISk/nTAmwr45/CECOeVIQHBpKOEDDnn33/KtO/QKPoxhUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9Rc6fkLmVIOmHyCAnCPTGri2pHG+ssVwiq/3fwjr+M=;
 b=pkt1yOQlkSCCnuX2sdlUwrj+4wHcEnH4sQfQUySFjJymLYPv1Wjn63+F6S75spmmM9p+1ILDvEIlwbVGuQRUtSJKGzNWNGSx46fiOa340/I1DLnLyKJyFZCKjdAOmEm3+VJx6PSivDvsH2mEslXAFWh3L4q5RFzp1LEfBLz7srAoVMqC3BMmIW/PgdK5lXiRrqVvQWWfkPY57FlE8IVqrxKXZ17gqOcpih9b0NfRNNsHbecWBdX3PGYhLR7uNMKFomOsptkXtDkjnUrpzmH/zD1Wd1SObH9tMIp77HfhGebFL58GY+nRsZv9xqnyVBDylbzAxG7qyKhoJnQ3TFhqcg==
Received: from SJ0PR13CA0121.namprd13.prod.outlook.com (2603:10b6:a03:2c6::6)
 by SABPR10MB997942.namprd10.prod.outlook.com (2603:10b6:806:509::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 22:55:48 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::37) by SJ0PR13CA0121.outlook.office365.com
 (2603:10b6:a03:2c6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 22:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 22:55:48 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:55:47 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:55:47 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 17:55:47 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AMtl6Y3604513;
	Wed, 10 Jun 2026 17:55:47 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 97E6A9ACF4; Wed, 10 Jun 2026 17:55:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from v24.0.1 -> v25.2.8
Date: Wed, 10 Jun 2026 17:55:47 -0500
Message-ID: <20260610225547.1343744-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260610225153.154945-1-a-christidis@ti.com>
References: <20260610225153.154945-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SABPR10MB997942:EE_
X-MS-Office365-Filtering-Correlation-Id: 4310a80e-30f9-41da-7351-08dec74369ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	8ZBivCTCFbd+heDMxfxfX5IUzhGZtHaaC4mJsumFTk2NfABSze3vAUOUiEXWbaOgNBRlX8w7YpHNWgj6WjqkQikYjkr3+8bchFdnEcnMPwj9RUxRpf+5Cu0yejNuRbxJIBxT0waDrg7zf69FvGJgFuPJl4MwfcaqufE5kPLadGnXDWXpFzgmZk1b/c26q3R8PnFAtTk0J4rQHNAigcTVizAoFTzu0eAXpACnFXb47imi2iBi21UwEEM17sYIJRUjL7ZWzRf0Hm0BMNYpFByLRiK7u8AL3EDw/6/0eUP1K+ddtDaVdLvCANsEbLu/aT42/gLJaZ/4q0p7vFpYyTAP/yrS2krzjMBcS1ZwUn1mvpNr7Itp1wwdjhq7wx6YYx0va+mHCDP0YhDh9y1Ja/EDEkGOUihR+uxxfehykGgcfBlh6ov0IHqMWi15sQKNbA/HD6vfepnrIUBCMNtKx/yDL+yz7a9FFmeLL3174alQOhVW5VkdP3qflpsKHJGDcyC+PDB7oYjdJoE8V4LE1ZKO5541PEPk89Sz5EYlftHW4+meY4iGtblu6QO/qHZbtiW10XGYfkXuYx6zeflwDyrkXPZ9domZehU5i9aY8ag41hCyZ2MCgyb8eNwTvzgmQm0ebz/m0fvlUjrvGACM31w13zQFrMSL38Lk737ee3i3IUHo64YKYpPgoXwN0+I+3Nh572n61FsWfYdrZbCv/o1tzZQ7meT64QOfs5VjoeGuvqk=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	11e91G07y+urp4xTNCwFPFao39POgPnQjZCG7RY6d42EcBap2Yj8HoPwBzRBOvp6bOMlPgZR9Rjmq+33FFr5CxAlZ0vmg0s1NJt22cOMWv8uyRGOuFc67l6lkWl+poHCY4e/pX6kegFx+itu+PBze0E6I/2v5pAoNVIVxDwDvx9BxkS/9ubbfsKp2wehehkazvFqohrH/CNLKuHHSqhSt55ctrqVhvpvOvJhmBScdCHYbf1UdboHkhHyYtKt3DkGI+6JUQx1zoVMvjnBEbv0J1DWwFGyaplPP8x4+ftqWcFttyrJ90lijtMwlHWfnXeMoycVjOv6gZHlhXbvrwyu5cPI7dy6tsM2qzYalLIYw1Jpi02BXhvezNh8wHPhKrfvV78cHm99q1OQnXV0el+024Sen1tBB+SJ0n1nxNrrFig1pvsoIQIlmS7lUpUtFzgl
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 22:55:48.4245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4310a80e-30f9-41da-7351-08dec74369ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997942
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 22:56:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20012

meta-ti / na / 20260610225153.154945-1-a-christidis

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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration fro=
m v24.0.1 -> v25.2.8
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Khem Raj <raj.khem@gmail.com>
- Date: Date: Wed, 10 Jun 2026 17:51:53 -0500
+Date: Mon, 13 Jan 2020 15:23:47 -0800
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 597a7c94355990e9d49ba59d995f90c00=
9682575

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: conf: am62dxx-evm: Fixup packaged overlay list
- Commit SHA: b5f503ddbff2cdd22d86cfb6769ebbcc11f1e60e

Patches
----------------------------------------
All patches applied

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration fro=
m v24.0.1 -> v25.2.8
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Khem Raj <raj.khem@gmail.com>
- Date: Date: Wed, 10 Jun 2026 17:51:53 -0500
+Date: Mon, 13 Jan 2020 15:23:47 -0800
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 597a7c94355990e9d49ba59d995f90c00=
9682575

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
- Commit SHA: dd0f9863bd65467d689ec895d96b386a034df660

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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:117
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'freedreno', ',freedreno', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:118
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'broadcom', ',broadcom', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:119
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'gallium-llvm', ',swrast', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:120
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'imagination', ',imagination-experimental', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:126
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnavi=
v', ',etnaviv', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:127
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:128
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',=
 ',lima', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:129
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfro=
st', ',panfrost', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:130
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagin=
ation', ',imagination', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:133
            TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'f=
reedreno', ' ncurses libxml2 ', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:170
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'etnaviv', ',etnaviv', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:171
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'freedreno', ',freedreno', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:172
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'kmsro', ',kmsro', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:173
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'vc4', ',vc4', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:174
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'v3d', ',v3d', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:175
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'zink', ',zink', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:188
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:189
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'r600', ',r600', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:190
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'virgl', ',virgl', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:201
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'lima', ',lima', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:204
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'panfrost', ',panfrost', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:207
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'tegra', ',tegra,nouveau', '', d)}"
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:117
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'freedreno', ',freedreno', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:118
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'broadcom', ',broadcom', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:119
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'gallium-llvm', ',swrast', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:120
            VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'imagination', ',imagination-experimental', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:126
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnavi=
v', ',etnaviv', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:127
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:128
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',=
 ',lima', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:129
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfro=
st', ',panfrost', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:130
            TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagin=
ation', ',imagination', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:133
            TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'f=
reedreno', ' ncurses libxml2 ', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:170
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'etnaviv', ',etnaviv', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:171
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'freedreno', ',freedreno', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:172
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'kmsro', ',kmsro', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:173
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'vc4', ',vc4', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:174
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'v3d', ',v3d', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:175
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'zink', ',zink', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:188
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:189
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'r600', ',r600', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:190
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'virgl', ',virgl', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:201
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'lima', ',lima', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:204
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'panfrost', ',panfrost', '', d)}"
   =20
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:207
            GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'tegra', ',tegra,nouveau', '', d)}"
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




