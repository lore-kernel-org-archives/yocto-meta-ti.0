Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DC3EFCE42
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 19:41:10 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27144.1772653263445568321
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 11:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hKy/o5ZG;
 spf=pass (domain: list.ti.com, ip: 52.101.52.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxZMJiXmKe4oNoRF8q2srByXU3BT6hJjfqFyGW0gL1P+qUlv7lGr34wMvhe2Ya4OMens+tlgPSO7jW5iWJb37rsRTlBuv+xMtlsB2nb6EX/5tLP91bUML7OBjWqbvjnXZwlVpVAoZUwdZ339/yPQWl4kvnDku5kzkonV7V+oDOPmY11GISdZhcNufpp4yhTHgLAMbQhQ6Yb+IQF3/lxonHww8kOkYIKXKpO07QU4NZUotAxY3hCKqWKbqXOfSgnbCkdXpeDBjm7muqfeqvJ0NkJQPcaMLVMZsuR9SOoC1BFsjHADCrMCNdohZDNlvwP2vVh/WaGy7/c6WxpePzOZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4uH2KTBFieKaHF6RFBE0zSFrKNF8ignApY2omUKFBk=;
 b=QmbgrvNkuWk0E5U0UcrFLYZ8BfINo8VDuK6dx4hlVQ6BSHb+bLOdzrijB21J6St6YNaCZZI8YOYi7Q5Kh92RDRZTYqkfqCtbxtFz2p/k0NcnNzbhocXD2P19kQIOxMtLAWqv30a9KY6GfBKOgSg1pnufM2kuSK7p7tEWOvpgfv+nH0F3swvBC0c1ICARoImF07ZZs7ycmGn9GYSy639wU9PsTgFbNhDDIUsF5SQmKZza/5cQXo3N2wdGkWWEs9P683qK+5a5S533/axuuG5lHPa20Ti+vTi0RhwK9IDxaTT6GyJ3ze/Dnwb9eElIchtfz9fTSZLylpgDQ4O58jXGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4uH2KTBFieKaHF6RFBE0zSFrKNF8ignApY2omUKFBk=;
 b=hKy/o5ZGGrWHUVcovac5mYIzUnSVCeA2BZyRVPLy1nb4JsPCbny8YK5FJSgKX8p3N+8E4ZOh34LuI/8wcqG198a6B/jFaaaCs3EaJ/zwyBWAZ1L62gATyBwzR7fdXoH4JVQNOF8vbLV1o7ewBU2PeFV4Csu1F7ZB+M/usBZD6quQUxtH1E7OyHe9bec2Ls+kvG0ox96wG3drq6Bu8Kdlchmb6PlUpcmHWJrbmq4KayQ8eeZ63O2BRgusSlSiRIdVcFJW8XROM2pNCgymHX8I/iGwe6PWfl6rVeHMpZn3kqHeQC4IuFoc6uMkT/JWMk7C9/2iynOtKx9NA6DD/LmsSw==
Received: from DM6PR10CA0009.namprd10.prod.outlook.com (2603:10b6:5:60::22) by
 MW4PR10MB6653.namprd10.prod.outlook.com (2603:10b6:303:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:40:58 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::c9) by DM6PR10CA0009.outlook.office365.com
 (2603:10b6:5:60::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 19:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 19:40:58 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:40:57 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:40:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 13:40:57 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624JevI4959872;
	Wed, 4 Mar 2026 13:40:57 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 46E229ACF4; Wed,  4 Mar 2026 13:40:57 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>
Subject: Re: [meta-ti][master][PATCH v3 0/3] Add LUKS encryption with fTPM support
Date: Wed, 4 Mar 2026 13:40:57 -0600
Message-ID: <20260304194057.1960529-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260304193824.2495898-1-s-tripathi1@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|MW4PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d62d4c-8c3f-422b-545b-08de7a25f54f
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|34020700016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	AYkhXz3TWnNeZNdiC/NAS7mN9lwK/HF2K6dVMbsfeyipSeS4nWwjLTi65aq7zdRTWjLxvSJuinL+nkGVkLrQDJbehDEmK2mdQv5AH8DbJ6vMmJ+7P6CFwVv+jQHEb0X3JVmGJLa2gchU005OU/20IKaeqtxxm9LAVqInagE1BO9bdm3P+0UakGCpgPxOHHhzALw7gYsUcbSYNPHm4fDIUIj11Uihx2eC+C033jlpZq7jw13t6vPmwPKYck8QHvOn1YwJwTKtMCRPCf7yT+wlYYv5KPF7zHDMCKWWcNluwMCLw+jQPauxe7grwMKlFMT8X4ncyX1jJW7nFpjwiTpQEIImxnmphZMeAdvS000Ar1wp/L4hTI4Yrw6Wa2f6AESqNF95CH8+9DmFnPJSITokTAWzY364MQuxEC1Y3rWdQgb2Ys07+KNLCfNb0dAmRKefMpj7AMNzgT/gX6zLpzJIOo40VCGHWOhcBP0PMBUirow7M+jyFk4Tx70cBABiMRVvSuyvWw9NGCnG/E5/NxTFNu+8Fy57KHULP7uxIX1n1E1VFPjLjhgW/SjZfh+crPwN4OTSOQFnmG5HyrzGPngeIuDT94DYPgac9bAfYMLW0LnBJj1zFV9LsIngShSabH23pl7aUynzSEXKdi21dMzmLFGG2Cq0jUdXldjP2L+1g/kDdlq0Gy9SCo7i+f0sDXQRv2o5YIbSJiPP7iKSdBoHwD0fp/M0Ng9WafqZC3U46J+nb+zYzjgGA8UtAplmz5GFeR+vYZ5UM1Ay3lCJaFDcKQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(34020700016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nbFPBkOR0Qalg6O9+ko27/QpW4GgeGnTvdrUqMPdTvvi1ZB0GVvSWpCf6HYfKnYrc24LGrlZiOAatT8ZJIncEqWleamDDt61YDQOmTfucpEFJ6U34/ydxlkanBJCS4ZE9PfccM08kaVRGeo5E1yFIuaLXecTXijPWLAzKt+Awi1hh1O0VGPwfK8EyZSmncludG2O7wPBfMZ014kjYFiasLcaIuK9ow1XbgtMyi6jbZLVJewB4lsq9Vk74nRUQIBDNddVo4YhWOmKB2jBAf5jT5nlH1/js5pX1rCBF95mN5zsbVd2nG/2eJUmYsOjJSU1iUBQBD7nR4HpFWOZhwpmBBMWcmWnhKTkmtvcz6hRXrNBtB9FFxnmDip7YQx2Wed7xC0jLPVx/qr7EuQxVTDt5Sc8S1ytkgsQFGiY52EqS1axO5ysTkFna9Cx8y1twKQH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:40:58.0139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d62d4c-8c3f-422b-545b-08de7a25f54f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6653
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Mar 2026 19:41:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19645

meta-ti / na / 20260304193824.2495898-1-s-tripathi1

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
WARN - [meta-ti][master][PATCH v3 1/3] linux-ti-staging: Add LUKS encryptio=
n config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 2/3] initramfs: Add LUKS encryption modul=
e with fTPM
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 3/3] machine: Add encrypted boot configur=
ation
    WARN: Commit message does not include file/recipe name: machine: Add en=
crypted boot configuration. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: machi=
ne: Add encrypted boot configuration.
              machine (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-ti][master][PATCH v3 0/3] Add LUKS encryption with fT=
PM support
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Thu, 5 Mar 2026 01:08:21 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 2dd909ce28eb7eee82e43abdf0481d1a3=
9e601e2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Mahammed Sadik Shaik <s-sadik@ti.com>
- Commit Subject: ti-extras: Add Jailhouse support for bsp-ti-6_18
- Commit SHA: c4fd1ddce14d635d5920ab9228130ec01fada824

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
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc:11
            TI_CORE_INITRAMFS_EXTRA_INSTALL:append =3D "${@bb.utils.contain=
s('MACHINE_FEATURES', 'luks-encryption', ' ', '', d)}"
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




