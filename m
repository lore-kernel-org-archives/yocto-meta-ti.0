Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB5DEDA684
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:09:59 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20604.1772550598522707828
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 07:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=H+Xwt7rw;
 spf=pass (domain: list.ti.com, ip: 52.101.61.19, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXQLSiZcHbHXcdoIwpzvd4i3o9gfWk+AIE6HqM+FmYj4WKilYWIyqPJyojhuPFsCZPFGqliGQKu/U9C0ljJwKDnUzeX2P2AaWYQtSNnUIy6KI5/mva5htMQTGVw1BvVngX6Z8Vv+vtKM0W42MZyhMpKXTwbt+sn43lSkCJICAPgL73Zu/Bay10MFM2OwYOPNKV2bEn4lcSiskEyq8CTYv1JVf5KTxqBP8JBVrywopoWSHWIdhpjS3ibKFmTRZu48nkRq6dmKY6ciQWn4d0p6L5SJ/GOCnvupVTeFDjqq9p7qWba7jYY5najjfPg285XabxnBWQsmuiOhElmSDoLRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkQeiq1j7mKRCXIqheoC12u66gNNHXa7ScWnisbYoOM=;
 b=Jv/eLHX/W8DXFyiQNGsvrNe43OYGa1B3IkqcoUWiIcpzX4HIywXrqkjCWHx62dS/RUPFkjFLRx1YN5O6Y56gqgaVfuvNRW3n1ICbjSEfBNcFyEUdsA78tjEbCUS9Q0H+5+1RCt1XVcgRRQ8cCRvyVWlNRjSHj4fFG0K98SfkHCd/vXV+aOhF7ayflOhKAwZ6KSuA5kWbVrkaDNJwKZ+oLYb3F9MpQ89UbNcCVUmYVwXwMtmcKQP8UX6voSqCnPuiBtkhjqH+LUD89o9/Ai+vnt5mDDdFHIY0HhTO24Mm8pl6g9L8Zfi6xSPkInfUzUTWNDEEnxZp+MC/cUg+7RRgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkQeiq1j7mKRCXIqheoC12u66gNNHXa7ScWnisbYoOM=;
 b=H+Xwt7rwcHGT41NcljHAnllvxMwtK1v2fkAUJrLNaRfxKxt7TQW47lrPclO2m2Sa/hqhspYc6GNWsm3BIjqLEQ7HMoprx1qixzaGMRoF0yB7S5b2ak13FvX7Ed8l4adHpADUtOjIrvlmGHyXJII/+52yNCuMx5kV2t5YXmSao4XH7qakk9ASj5xmMnCPmZAx4SW3E8QdKpSjnKKlhDNUsBZMUaV7clf/unvinn00aIpceQSjRj2IyNFLxpOpP/a4Ay1R/vWCDRHNutc/VDutRSK+u82K/ki3lyMcpI8MCnKats+wNk2SDcelODZbEGeE5cKGFNMAWBWc0iPbLdUDOw==
Received: from PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::30)
 by SJ5PPF6A2C0CCA1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:09:54 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::7a) by PH7P220CA0013.outlook.office365.com
 (2603:10b6:510:326::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Tue,
 3 Mar 2026 15:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 15:09:52 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 09:09:47 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 09:09:46 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 09:09:46 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623F9kRQ3544148;
	Tue, 3 Mar 2026 09:09:46 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D3BEE9ACF4; Tue,  3 Mar 2026 09:09:46 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [PATCH] ti-extras: Add Jailhouse support for bsp-ti-6_18
Date: Tue, 3 Mar 2026 09:09:46 -0600
Message-ID: <20260303150946.1093096-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303145603.1204480-1-s-sadik@ti.com>
References: <20260303145603.1204480-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SJ5PPF6A2C0CCA1:EE_
X-MS-Office365-Filtering-Correlation-Id: d88f6679-f67c-491a-128f-08de7936ebf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	+bsoE2BFlu3lwG6uHGPHY3iuqAuZVBPnhZ9mKDeji4QO1K5Mw/nSnMhyfZ8D2hH1CVfpWJL3UN2FnK7Qg3Bm5byl27fZMlpa+NQ4+ucT8A94P5PlgNGrYZSf+YZqKOEwobD20b7jkUGRqrsMHrCvMZlOhTfkAKOxQMIa/UCXUIvwchMZMh/IpOP/UIIOEKJ7o6ER8lNyV/T8Jt1W/b8BePfDXTqz08dVHnYqoQIbzHMFPKcOFMulel8Od4tqekhaJWnFOtz/BtewLrgW+YIy0T6H4OHOhEB98Dv4WDX7/Vxfp58mSJx+MixmsN5Pr+3scMU79ux0CRbLXTadHLoudRlV4GTMPBirhReH7LUGurosSmaHj71s2iKKhbrbtUHM1bTHP4w1cIo4d++8TepytV2Ptmsys0u/qS2jTK9aOFgkt0x0oceAP6mD9ByLymXxz2bM353tL00msVYJQS7dAM18BTGwhL3Bxkeblwn6AIdhJelSMn/NBweEHajaN1/lDpZePYoiWSCgfbQXqM7heZxHt79Q7XQyTldz9LCjkL/3RmJ+LuUr/rEYan7vhiAS4McVbkNGvEu10YTwL6uwtgB9vP6XWktClswnbxxg4j9LBC6g+xBbhzy+wrXYZFRXk3xoQ5ZFDXafoO+VNfQb0F1Rs+QoU+MV60blfyHgi45ohrohAYDJWXKmUfiXp7ASZnwGFE3mKreDouyUpglVPx5KRpgQnnZp/gR71zD2UpMtMc/OXhim1RKzjPFZ5wvsExRh/CtZfmnb1l8JcyEfL0Sga3oLqGclNuQ2ey+ZnVYHhDoY99LsBXguB+j+PBRslW7opH5dLu7vUuLBaCq0fQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W/U4MGHxJbHp0mqpQ8wXHRrTk+E9RTEtjgb21rmrw51xN4QXYDW7AFpBnysSzzsjifwGZG1cHv0spbf7IPY2Mc2+XKQhY1ohK173FhW9plnBGHbfsidihm1bSZxYB7B1VwXM7GrOXFWq2ajThqVoHG9FiguyVTirzJGRJV/CS0t9jD6E9rXkn9L4+fN+0gfo945zQDjvWS/Fz6JzEL7B1V7wjwNnVJ0oZlHRX5vt7Rw2XA8/X9gG94rceKPX9ClXqWMCcisepLEYmmCal2AFtSROHaezLO90WmaKiRtongkowC1/7LdvQ4mqfFGnjLyUgMH+iExbRO87qCrD7u1GgMvrw3qr87uS25c4OSA+6ACXZnx6+z//BRbTZZ9mZ4gz+A7R0dbFTewXESNOSDaFTeWuNSwqFZQ8tTdHwy8IhvXFTOuGIIXVqdWaXPdKmWEI
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:09:52.6064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88f6679-f67c-491a-128f-08de7936ebf2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6A2C0CCA1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 15:09:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19638

meta-ti / na / 20260303145603.1204480-1-s-sadik

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
WARN - [PATCH] ti-extras: Add Jailhouse support for bsp-ti-6_18
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:67
            Subject: [PATCH] ti-extras: Add Jailhouse support for bsp-ti-6_=
18
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
- Patch Series: [PATCH] ti-extras: Add Jailhouse support for bsp-ti-6_18
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Tue, 3 Mar 2026 20:26:03 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bff44d89d788e01fc5475354e4e676055=
3118273

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 51a8447ebd71a82b9907224852aa664002fe5c7f

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




