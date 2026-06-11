Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0621ACD98C6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 04:10:58 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38228.1781151050632253940
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 21:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=soKrhDDT;
 spf=pass (domain: list.ti.com, ip: 52.101.201.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwPg9AvBGpaKavxX01EU2fGVszitPgH38mzoq24l1/6JfNyFrQhvP8RDVpSrFn0K3NQhAS6me8G1/Bf5hYoyjBGLzZDX+GKb55qHa9my/tpFDcRy9g0axLtpGuctb+SfyPzmgQ3bmb6aJk1zRvgD8W7bdsI+QUUmqZuGRvQkuwnaPIfpzLYR/AEe0lBFU3nj3VCoLWB6E/PwKNmBHPrKLVvpqjizJzErH+nsJlbhkn+QCCDUx1kccR6C6cFVhBT+5Lg3iiN5FD6RYONo0vbDzwfRIV5pOEqQwh8RMXZpggJPn//MowxXHST7oRM5+veUoghUTPVDTFVXiQhHSMH+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETlaRqQPOStFRedZoTGgYGqYCUypUUTGGTEzfCOo0Cc=;
 b=r8hPedCQQsnfYqgWum1u/JwOaV6o5X1IqckPzmNTv9oHXqijo090Sg7lUusM+35y2fd7gRqV6sn3phoQYGw6zXxHMc4Y1ziFtDC+/NoMrtSO1MKY1WquOMqJOXidrqQ1L1hZqxHlr8gcB9fWbXQnJxJbILHZ6YnnRs2KJQLRc1QX2N5i0+SSZETn32YcGidUjpvpc3bsv6uDkaijdPiiFcaU8rZesB6ij/x8IpYQ5MrtxMowrhTE8+IZ1IsM39XQm/iq+7U51avmQGhQQV9kGgbOzBYQc8R3dNl8js4ckmNuxwRb+lckMmq82pwueWz34Z7y8UAv281zMU/UHC/vZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETlaRqQPOStFRedZoTGgYGqYCUypUUTGGTEzfCOo0Cc=;
 b=soKrhDDT5BbqaJe5vhDuviVYKthssG0mDY3VOp3Y72t9S+jkGSy84a+sEUOa+FppB5WquG8zXf6iXiC0wCsYmuU/AXjDZzDUy8boq0MMOq1fxcHIs6yQVXzaGzAETmphfKHBELagOqWTDdio9fqmvifD1WdbbMnHtpQN6LvUlC9tkM33IioOtnrFYT6zVo/xTJyuZE3dWiTeql+qLz3x0Ppu4MZl0hJOIpmdXPgaSDYehUdGVnS9YiMHaeAS1SswUgwocln+RLHfdd7Bh2hsw11EthB993h5OrHMBmB8tf89CpYVhNAZBFXUPkNnph2H8qenltDHaCzcSbOM3OQy2Q==
Received: from BN0PR04CA0182.namprd04.prod.outlook.com (2603:10b6:408:e9::7)
 by CHAPR10MB997698.namprd10.prod.outlook.com (2603:10b6:610:2f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 04:10:47 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::a1) by BN0PR04CA0182.outlook.office365.com
 (2603:10b6:408:e9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 04:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 04:10:45 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 23:10:39 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 23:10:39 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 23:10:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65B4AdRj3007539;
	Wed, 10 Jun 2026 23:10:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1A96C9ACF4; Wed, 10 Jun 2026 23:10:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202606101800
Date: Wed, 10 Jun 2026 23:10:39 -0500
Message-ID: <20260611041039.597767-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260611040646.3657421-1-lcpdbld@list.ti.com>
References: <20260611040646.3657421-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CHAPR10MB997698:EE_
X-MS-Office365-Filtering-Correlation-Id: 93383b50-57d0-43c2-0286-08dec76f699b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8I3X9XDVqHQFJPbuuV8CLe2fr84NJQiXqBp4CU0mbTGYzsk1Ca+dGDnPfbV7py6XK6FuJ+z2GRDB4rywZCIkexqKYFS6X6swPuEDvtoT7ZaewpYzOVeLtPk+ohDZHsQgBDX5c7DvmbF5x6WstJRcH8jTFXwOGNUZyqP4MgvZr45yQsM+TSAr/aO511q9/9lcJQQz1xUclDxKJBaEyeLW+PxaY1y8hOjuPkxTAZE8tDR8l9VsjgdQm+n7Gzr53gFjPoZcsj17lo/r5IK1mlqjLlfP9sJFMwvpIqgwt6NGxuklJwBOS6t+9+Ih0eo+jazgsFiK66nDJ5Gxy8R3pLFwa98+lXAlLMEC8OlkD5NzigaZpniGJKEp8CmcqDm+yuixP+dZnOKdbDC3W61bow0mB36pO2nSOqiG/dTYad6PpMi9C624rnLG59cjdYGmjMzac9mwqN1M4Q4Dhu8Ts0bP03G3c7/IfKmQFHzIEW9UzcoDEvtD7o+2WiQfB83MwLrrBKsVgZg1sJIkPEdk1fyctSeRhDYcVqhM2co3vE6ZYsKUiHCQOe1aNkVGGF00M5+YpqKa5d2gB9ocW1Np3im3rsJTFkQ2JbvD8ojMzD5dyR7e92oRjYkh/qM5glJOSi0kJhiKI3tjgQ20K4cT+HVuuN46da1xCSzA5BJLEgxZefv0o6Unbmg7xObviGvW8icQrFOoZkj06UrMXFq0BagK5vfMfMDKdXYdZeszRxd5XK8=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AnYgmLmVUqHmzEBO/dB1H7KFEAxA+JZ4HhrlRTX5VN8KhogVfKdPcItOYrsQph9uTZR9cyiTzGf1OfpJytjkx/3L1gMI0WEILdhdkDEkmIx0lmBuzfJN0YySlXC4fucS/b64/n/m2GxaD+lFGodk+ljZgWSAYapNB47P4VTSTcya8lrkqBy4OQQ0/yR8wJLx3rfIxCeUx050Vq8s7tQ5YyMc1lSg+hQvcbvXup066h/RF/k7n1mTCBxufOhiCJ6aLbaIeiIW4LHhkQAP6MFRhaZWsn8Ki8BDpqBaZqGwFxOohvfs0v1VDHMmtHUGERqYdPNm5p3Hf2urJaZ5ixY8FMdV4NRhI1mIgMNnqY6LQJCwLGFLvORp8wG1dEDomQnAlc4fZuvJk96K7wzzejcb3VuEwrwMfgwMgE15pFQaU/VylgrrhmRx4kODyWHU+hP/
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:10:45.9049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93383b50-57d0-43c2-0286-08dec76f699b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997698
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 04:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20020

meta-ti / na / 20260611040646.3657421-1-lcpdbld

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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.2=
02606101800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 10 Jun 2026 23:06:46 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bb186f6ed9fcfaa5010dc5a61c27d8be4=
6a0a98f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: conf: am62dxx-evm: Fixup packaged overlay list
- Commit SHA: b5f503ddbff2cdd22d86cfb6769ebbcc11f1e60e

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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




