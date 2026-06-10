Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9624CD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:46:38 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33311.1781131591354619570
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 15:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=L/KhpmhC;
 spf=pass (domain: list.ti.com, ip: 52.101.56.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQYI/BUI7YUEv65O/OqSe1wUPkKzLzc3G0N8qut9qdnmaeegvVY6TswxwlUfsinAXNQFz8o7ckGrnCXsHLyAtNxn39uFkkq51K6Jn3sR8mhQHQJoJgGX3JEOZzXmhDSH2la+T7V/KhADXGVDhQRiDlsAyGWsLbeW2iHknYm+89QFph+K1FwpEtZ8llZswejrPFzikVsj6Wz8d9So0zvuTlUHalpFIqoIMdrWM2soD2mQFzPByNPNhcGWEELElpiodBLo0nmBlnBCe3Q1vGptm9tSLE9NDYaJx/BCI7VGON+9xBtquKfTb/5C8piqwjj39UrunSYTnMVyVLkrmXfD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFngp+0vCb6krThp5SBF+wY865QxH+dwF5WaAuR4Rao=;
 b=kvQL/9nXtvjdRYVNO4lvFZminXEfG0aSz7erqMcNtEHijAz3lxsAMFY6z2oYl8iEqpBuveC+lEVOV6Px2MmofQfHLd62MCQZMBx6DE2yt0odOgNPSixa9RYNmYVS8y4Kk1IuExqfmsUtzwIOTy0DWKh2mVf2dl2R0AhQFUTEEKO89zV8/r+rXDdiqCzQngReMttL+XHLPhr99jdSz7CUHEvZykRpw8tcC6n/7es0yaTF+NEHdIqeY6AtWki+HdgqD7/TUQeT6InN78xbj6QbUnQg0pl+mwyZF8gn3d/lqU2UuDK0uImljnnR2dytL2Q1WASDJJ3RmUPB2SkOt/phxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFngp+0vCb6krThp5SBF+wY865QxH+dwF5WaAuR4Rao=;
 b=L/KhpmhCOFG9qRAdA9X6kmS+j8yeQAkZ7Hz6H0uKFLBatOcy7Lzvzz3JXXHP5yjHRi8k/0gWl142a10fsO+6lDzxWVgbbGD8oez4dUXZUFXmQpiuL7/CryMvfzm6XSHKXMJ7yMD3rXkA2lsyQzDH+5OO34rp/z4G9hewCWVqzBHbgP+KEPl2uhXljyy2HCsJiEuGuQKfRNvV5+XZC+51iKl4TlkAAjrmeCcln4snKrzFY064GtWhuRz1m2xytW9bDj713XMB//Ba/NAinNUOjLqTl6ILkUBjWzqjyYbHBd9RF1E9eyF5olRA9Xy2gUHoTt7tIxQdMaqEwi2JiC9eZA==
Received: from BN9PR03CA0091.namprd03.prod.outlook.com (2603:10b6:408:fd::6)
 by LV8PR10MB7965.namprd10.prod.outlook.com (2603:10b6:408:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Wed, 10 Jun
 2026 22:46:28 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::24) by BN9PR03CA0091.outlook.office365.com
 (2603:10b6:408:fd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 22:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 22:46:26 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:46:21 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:46:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 17:46:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AMkK2X046077;
	Wed, 10 Jun 2026 17:46:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C47AB9ACF4; Wed, 10 Jun 2026 17:46:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] mesa-pvr: Migration from v24.0.1 -> v25.2.8
Date: Wed, 10 Jun 2026 17:46:20 -0500
Message-ID: <20260610224620.1126156-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260610224041.153148-1-a-christidis@ti.com>
References: <20260610224041.153148-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|LV8PR10MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1ce8bf-0221-4ddb-2fc5-08dec7421b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rZwbPGgoViv1A3D7A5l2j7FwYj4usI4GsvyoIGtX9U4BU0TF0FjYa1qSPKvyxcSdn6cH3lWmucH+hz5d1etfnJZvWG/D16T7f+FzHUAVt1xf0Ypwz9lBH4E8BrTaCvD3k7gpvOa/cjz6fWOHrjswkjSjV1xdtkMmL8KjabHU8DjMCiZTYGWXzLOZYON6dF8V6WaNgTsyscZI8shCQ7dM9zawxmmRBjzfWEs0SkqiPtJqaNYUnz27kujUzZGTRaFrkWOnsAuiSOWJETQK8jyNDBtMpCEAXmJiirrwP55/HGoS4HXyfXGfojuR/SwC/RIPDYhRPfLJY9edKxX1bfoCd6ZTFmMrMjJ4LhssxWTyzw6oA2yTDE44V8E170XVDjM8K8cufulotH3lGJ5WMJin0y2X0oAk1fMLOKOnXtrAeeubTwGIUJgHAN32zgPodl20FjS0DR/cNyITY48dA3Is2fClQ+0PTG22S/xk0CAr/sKnifuY9YPRyF9NZ7y4uFcAHlXSMlw4o8jIA4D3Sb+dqaImPnX2VcOVNa2FXvsGItKnLpOklEd0E7wgIoFkm2ZLUXKZwui5jOwuWQgxu+CDpVEUgkvgidzmGmQQMkUgy/uZlVzVRpibnyD78/Xcb0fX0V9APttoqZv8UeGs4eQnUTt5KH5AqLzGxKLhbMGFbhMsG9LEnIfd+PqtzL8TrFJLf5DqSHz3TqSePNZpSMUelugwjBTSkFkQeQk/8of3Oi0=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0yIXOfVQw8JUr1Wb+TJ/WqLqAYZhGLv1mJzDJ94EHR7IwgW9GSai343RZ/Zhff47UhGCsEhgCygBgtQlayfvNo2TAiqE7JGlM8JIrVba5BsvVIzfMlfxWF9aaMNXZvfTpqWxi4ln4vlYLFTLi8e7flYoXsqnZeE+6LnlFLb+6B9j8ELzSlkLTW9jnEgDwzL0+8qetchbTF7lEPAeXB4VCvwA6Orbp0ppigq9wUUuvbUJXlaqvjHniaheCaJJCUDl7HDvDyT8BujZd8wXQ9KFHqGAsPgGf/HHt4+wxI0aW6+roVX/2hxxVhOoKhNZ+5G7laZOh0eBXKRoU3pApbdMwv/wLRSRgcJqwsThsF/XyDcLBMZeE2P98PMpEaNOQXZ3+mA7YvJWczKCtNKH0FM24nftIj8j7DyRXRAADpURY/B31EGIMCjdfDX8amqvFuVQ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 22:46:26.7537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1ce8bf-0221-4ddb-2fc5-08dec7421b0c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7965
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 22:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20010

meta-ti / na / 20260610224041.153148-1-a-christidis

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
- Patch Series: [meta-ti][wrynose][PATCH] mesa-pvr: Migration from v24.0.1 =
-> v25.2.8
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Khem Raj <raj.khem@gmail.com>
- Date: Date: Wed, 10 Jun 2026 17:40:41 -0500
+Date: Mon, 13 Jan 2020 15:23:47 -0800
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c83667b21e28bbd10fc21cc535409f3e3=
c821070

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202605150747
- Commit SHA: 50756d15542f9c2e528f3ffcecd48d0adb4fee68

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




