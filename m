Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8843C109025A
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:01:43 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1093.1773939693624823342
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 10:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eBvkShZ0;
 spf=pass (domain: list.ti.com, ip: 52.101.52.40, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi6iAxyP4tbFAwgP/RRrMs+DjS8B4pCuihgbEhyAUzgw1MNbyHcCsn8AFdejWKHPU4pEHc3+IfoPjO7OfcT2LSz9bEVBjwqKfhj9I9g9+DiRdzZqbvjgZ+4Dyo78AbEjY0deLReuWwuG1+9U0ZCG0uTFXGbCNl3YG4fC3hoKN9qTC9uTQ+LTZOgyCOfO+TDL6zEpOs9F4fd69LtuuOMzDI9/05E1zjI9Ce2yoceze1VYgTvFlbVU4Ykun8Zv5Cpwp7XtYmCym3KkSuIuNLxzDOip0imibenIcqbER774cYERJmFJrFBml/qCjKu84R/mt4gCd4OVXMsPD5lI2aaBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKIUmD2iRrpi8U2MmJZ635crH7KOfeSFLp2O+5UckY4=;
 b=bxKMqU0e3jIOpTKyr6Oza85qSF5V/SiXejByfpwliJ+onSnNHqWO2NE2fbZDBlWGDE/SQo3dcZLf0Sod0v18wxYV/ARVfuRy0BAA/2bLer2OJO19cnY5Z2iMneau//FbgcnsW0VJ6L26pZVHa4CmQu0oDTUJs2Vz9r6Hit1rNsJMyA/6zZvVdd6n1rOvL42rqKigX8TgCXF1KN5qT4wjl8gp7l9rJtd2mIvMMy3PCXynneGSblE1bL4mteNZ+OujfBcnnWvxFOtV1WuVWk9UXJ1uL64gnPNs4jHo4f3D6uA/c6bNeHN30tGyCqtWlbtFxQ92UarBebSRlosS4TRbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKIUmD2iRrpi8U2MmJZ635crH7KOfeSFLp2O+5UckY4=;
 b=eBvkShZ0qz4amTOmBIcbOuWkP2Em23LxxMjX4HyM8QXPG5U9KpkWloR2gY+Z39FF7fa7P3dB0LGXX598LK9MjuiwaE8zzsCgjY3Pmxw1p8t6oIQa2Xs1nJikJcwff1n+Hr8MCRzNCNgHPc7NG9dEARyF1TS2mOg6uNj98I0Fejd9EVuTZTVdVsck2ov1kXq3erXjv9rMOQXkVIZdc1vKRPXKMZjNlpZ3wDMh493QWnyqK5Td94lOLTeMd0zI845HR/CwKu2+MkerOOvlRJvD3R8dT9HnpRy8DzllyQyYyyP2V453Oo3NqHu7OepKAgW67yWLqd9WCx343WIM2KNM7A==
Received: from CH0PR03CA0365.namprd03.prod.outlook.com (2603:10b6:610:119::13)
 by DS4PPF9C7B9A88F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:01:30 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::dc) by CH0PR03CA0365.outlook.office365.com
 (2603:10b6:610:119::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 17:01:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 17:01:29 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:00:59 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:00:59 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 12:00:59 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JH0xbd606118;
	Thu, 19 Mar 2026 12:00:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7DE76136F37; Thu, 19 Mar 2026 12:00:59 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
Subject: Re: [meta-ti][master][PATCH v8 0/3] Add LUKS encryption with fTPM support
Date: Thu, 19 Mar 2026 12:00:59 -0500
Message-ID: <20260319170059.869970-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260319165833.137342-1-s-tripathi1@ti.com>
References: <20260319165833.137342-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS4PPF9C7B9A88F:EE_
X-MS-Office365-Filtering-Correlation-Id: e512ea47-fbf5-4222-f549-08de85d92a31
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	yWuJuEdNSlHYUzgz+ozOcLE1LAQeSVqnlZaGqJnUP5D/zkrwlT5PXUX2iCT/iFpIQuUOLRcIZjMQ6TxKWyQfKL7UUAoCgZV6oU1/8apSrmfP/yABPhIl+FchU7WwC4tGzsqWoDUxw9Yux8hnx6IdEVhCYZ/0J1IXeNAUmhPY1YJhQWyD2MIAWSjDkOdVZT1hs9QYn/oFRApIxSxudm/EZVs5vrVKYN0tjIQix+SJgoS1nHain5YkmR06P2sHbQV1/HBigKNXDbZ6q4LLS672q/lyi6zkJu2coBzXr3AcTSgvpsbprSosVpX4EGUNN3n0vbYzd+4yA/iQVNASTLjmY4+ZW+VNOnHGd+Puh4o6+t0jcnytVRA4EmHPigDgnqFvWkyjsDLYp3fg80Pcn1FmvH+eMBCdwGh9ev33ztn6gmG1u0cvZStKaWPWGfaD/xkNigEYs64qfUEjLIoXVZarcnltN0iHvL8RAZu2qYiO6KjpFPh+a2lbR9XAZARdV6tW5w3e7wKJtl/B3zQnxde+hyZN5FI34UoByddN1lpNxb1j3SvvOLFiTyW+Sc2RSdDSMX//1Q1tZMrtpyz93EYAgZQbvnY9xAbnnSOZNKRVIxIv78gphMb9KXsyV1D58OucLt6/tx5clN5GkYaqmmCY1VQS7TuqmhYV87nVFLNo2KoSbn0q2DmWr42Bo0k0qYnLsmRtL3JfAApg20Xot6N2GVZ1ZRZH3qlGDkpyrFYYJoiI/JAH48vfYLJHIEWfM6GbhEeLzy1g4CPEx1pcvvyN3A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gOIltXALDt0bg+qZNlcGCwqX29jA2TN+avy/L/KhZRI00F9OWnVhgoQC1BaHUWpnupEzvlKuqIVq4Yahy9z4VJf0rMWCPM3susl2DKv82rJzeDZBt3wpEBvm8toUXSJy/kR6tZSt5NPlPbCP46QpMm/bhpTR+yCe76BkyqbCaM/KRVFNm29NEmH/gzBQv62H8QsYQYa9e/nBxB89QgxI/aW+tpMUh9bgVMwh/7c2yizya7SfpaleYenyBrulOMDV6hrygD/zK2Mb5UAcHs6tDdG/5rF97KCkkC/TDzLSrcFU9FHTRBABVq2Q1EcjIu94IhV949T3ikWdwzLwTCAOfh3kQ2aqw2mNEls+x1XaaBk7kzddN3mklK35M3nvbA5TVICUVQw1oCs8wsIMRURT+nCHb23EeWouDaKGvOPbXF00FQNDkZLWVKLUfg7rq+4x
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:01:29.4515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e512ea47-fbf5-4222-f549-08de85d92a31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9C7B9A88F
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 17:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19786

meta-ti / na / 20260319165833.137342-1-s-tripathi1

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
WARN - [meta-ti][master][PATCH v8 1/3] linux-ti-staging: Add LUKS encryptio=
n config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v8 2/3] initramfs-module-luks-ftpm: Add fTPM=
 support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v8 3/3] conf: Enable dynamic tpm-layer suppo=
rt for LUKS
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
- Patch Series: [meta-ti][master][PATCH v8 0/3] Add LUKS encryption with fT=
PM support
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Thu, 19 Mar 2026 22:28:30 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: ddc2b8b0a4d65dc529360102e5e45a173=
ed4d078

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: k3: set console parameter to KERNEL_CONSOLE
- Commit SHA: 83573186e74241b5646a43a64c31396a009fa368

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
        meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegr=
oup-ti-core-initramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




