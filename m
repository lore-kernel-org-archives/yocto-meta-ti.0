Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E7FF9EDDA
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:00:39 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83194.1776866436256376105
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eE3JtyGD;
 spf=pass (domain: list.ti.com, ip: 40.93.196.51, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTRogsmncRHtJqr+nrY5bNaQFCy4m4mS0jtj6vAC4afqCTJRaut8TiKVZcLkc0mXIenJYDLXxhbTeeIxgA9JCJAvU7/3hFXBDDkb2Yeuet+J/dMngTOflUOWX3xJiHeJt5tv6Br70dgxxEElZtgdzCjRzv1gU/8rZRJ1+NfskKi9pMqiw7N4n3jG81IT6ancSC5lyPgBsaPGgf1kFsMI0OwIkg/hyj3yKrsKYDnu49EGt4o4pQKGrjLHN0Qui8UNwNjqYNxpyzd4eTG3O1v7aa3K/xhg110DCmlEd1mUci6G0wRj7vEniwEfSf2Nn8NGJ+51lIaxS25v2OP+BeklMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUniJmfkPvB9tgqsn6sVpeq/mW6qI5AQfmiAOmg5SO8=;
 b=a7l9hnvUwfrSxl/iYconGm0fVw23SIKuvd3nwJKe9QsIPXkRDKK16swiIFAzfAGquiK4IAkWZqYHbkUnbUsRk1N+1g8gxe8JxV3+aRnd+M2uby/bjLGgH9d1art9q90OH/sEfcI/YDpBSslCvRbRJDDmSPlSBjeUwJ+eC7gxVG8mbjfDXkqGfiUPaWkAs7GKq7PnC6ae3MaD/UivvVR1cAcp3BvdZuEUBsLWYLzGhFU/ADbY2yTxMpu319s6VMQ0h2gEwSqqKUVd5LYzp1X3KHIYvD77GRAUWgbEs1/ux+OYmcbENNLEL0dTs/2xQR52xPO+NlsFeXPvAZw5mMSFHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUniJmfkPvB9tgqsn6sVpeq/mW6qI5AQfmiAOmg5SO8=;
 b=eE3JtyGDa4EcSqWJl6XuRR9WHR6faSDLwA3useFHtBFHnKHLAKfkmve8u3NJsW1oIJmbo6EB8uCIiU/qpBCkV7loNWF3nQJLm2CHKWTIeBdv4Fu5D6LVKIQ0NU+a1pykX35/bLO8SMsxuKy7m4EPAkEgqNIsw8gV0Y0pZFN7/XZZBFqzB/aO8YZqRRbHhDRGjbxw9qTxli+EOpeuxMORfapJh2GYSDn9unyWNQENUrJBY2osoBVeZY0mzf21f2AEcCObbt5m16VU3a+7jm/Jq1PyLl7/fhaoGLRpW5WNJJSgGGrrVWbTHoJsseA4/cAIZYqZOu6ix3GkeupPGLmugg==
Received: from SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10)
 by DM6PR10MB4283.namprd10.prod.outlook.com (2603:10b6:5:219::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 22 Apr
 2026 14:00:33 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::c5) by SJ0PR03CA0155.outlook.office365.com
 (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 14:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 14:00:32 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 09:00:31 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 09:00:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 09:00:31 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63ME0VRa2511766;
	Wed, 22 Apr 2026 09:00:31 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3F8C59ACF4; Wed, 22 Apr 2026 09:00:31 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] machine: Fix UBOOT_CONFIG setting for tie-test-builds
Date: Wed, 22 Apr 2026 09:00:31 -0500
Message-ID: <20260422140031.9913-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260422134533.3370974-1-reatmon@ti.com>
References: <20260422134533.3370974-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DM6PR10MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: a447f0ab-24b6-49a0-307a-08dea0778542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7e6hdqrFY0Mt/iw7KJ0tc2+cktH3OnPuXXwYu4hd7gaA9bIkBdgHBlWq1ScSlkHKBxtY1EHd21Djffa6ZcoLbfwlNKUYYur404FyKuT+ZQpGyUxeLiTs2sEW94Da5Xl1aQNmL3pmMonMaf6OxGVqC1S7wWSm549E2V6Wywjo0K2KXGfAQgyiUaetucLBsl7fTx0KeWe7fcqNNPKFo0WDqGxlHCQWB4I8KByfj5sJj4IKmD7L+xbpB7XyWMq94xqlrOsiTg+RT6KMcpkGz9UNF2yakATgNbhiSWGuUy/4Zj7oDb1k6GXV1WcVyda8UgQmKW+z73JRKLP8p6PDqiChKAXxTyMp1ShwleZ1nLLO5EtA0Fg5/3q2do7Zn+GboKlelU2mEW0r1nMiTsR9IXcxKIYqyTamWIAPVG/KL7Uov9FVGMOK1YTgCGj2nz6KQ0as3X2QYZfqeKRXL+sTU4aelA+/Cr1r8X9duDSndAAQWhxBk0kQ+5MeVIdMuM4Kob+SqTDKMe2qhrETJSNxL1hVBxJ06CxOV9TG8xU+VP0YCnzJXzLh78ryVPeNrCunT4PqywHZ0ZnCPI8h30S/pjGyz+Nq+wXzLcs4qdUe+Ni4A38+7lAyq3SK/x44gQnO3G+ZCwRvJ35zFD6AOI7SFX0CSLNWFEl4oTVymGQpwpdq/kJyi/XFjkE62N8n0iynpD3hQXYeuDUmaWyWcahmQt8bF/oaYMcPm7vj1FDm0dj7zbel46kp0YyG62+eJmUhEHhlXx1+HF4SMzGfS4xovqI/dQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aA6uMzKqYw1+UKYvN0nU6Wb0OcERxvBncsIP4j7XPKgfwnA75ZogxcKQ0PHRs//JDhBBIhrpA6duR2zZCgYDMM90r8Fh+s7tHbcbH545dRdCKGsd7ZtX2N7u9uEfFHUNU7UumzpH+u/8SSVId2ewZ9wWWsPYLjSZjDON0Qulz6fJTsxfyEBle1ivIToHXHAomAJpiBOCXwu+giVdDI9nPvGs0zETcdrGhbKjoUTuQ7whAtFFRZBbc2q6OiEzZMnppequsgpbELe0NJZTmc3en54WAv/qaRwnGg/U3XbcLWR4Hr5J/5rVWwNP7FQUm9j5PZK666JcbuV/9Rxy4J1iw2ksxWD/zHt7OH0OXHjcmSNcYSMfyDHrNWlLjUEKUYPYKFzOPvFNg+QMROq5nn44ZfUontpbwxJXGZeCMC2An6vOIDn+AQrzMLK9sVkqXuBp
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 14:00:32.9163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a447f0ab-24b6-49a0-307a-08dea0778542
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4283
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:00:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19868

meta-ti / na / 20260422134533.3370974-1-reatmon

PRC Results: PASS

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
- Patch Series: [meta-ti][master][PATCH] machine: Fix UBOOT_CONFIG setting =
for tie-test-builds
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 22 Apr 2026 08:45:33 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 467a4001abdba74b9a5361025433d28f7=
2c066f5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: f9937ef9d61a43800eab7b176fa89888721db064

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




