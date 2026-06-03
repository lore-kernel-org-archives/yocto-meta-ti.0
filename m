Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B5DCD6E60
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:09:11 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23826.1780502942223850050
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 09:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Syy1OCMc;
 spf=pass (domain: list.ti.com, ip: 52.101.43.65, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq54zhF0gI8faY2ZnqU/OACiwx7bpEHIPnjQK29A3POAwBBTILefpQqHZ/6m/etRDI6c8EBOLugeYAMND8rbpdU2hECRqKenvUcijdjV2M6TmgT3GU238lQs22+NINsT519HU5auAdCeTRNAn+YqdxxAn4dXaJ3E/syQshgV80dZGWIrCnMks03AWYjvXOmUF+scHj1R7BTkP87E6fZ5MbO3qiJgvA9Ah/oKalaTOO6A//5OVHMAoykNjufCiqtj3iVMDx7RabgBm3hFRoL2TVviAcyreQWA6qDX6zCu1IWKkc3xXRyjjjq3Q9NlpMQ93+vNM9ZzKRAZ3to+YOWe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inztAVr/0Q8IywSifEds1B2It4w3ppgfX4MxUT+Qz2Q=;
 b=OT3gWsSy7bkVNj2Xz+TUUzJh+JbtEr6XQ+2kdHhLjJOxUaC6ucvbxj2Q3gU/PEhecqaEUnaW6Lw1/1JnI/kVna5GFNeW1Tv8dJ7ehsniRCQJFZ3kaiGPBMAam5zG2Old43SGNTOsgVmDC4S5YRAIkawenFcSf9XTTHslTuLWSs0+ExWSQdjvoRcCJhTW9UhLcEl9n6Zra1Cp6bM3g14MKtZrw8zr7DnFruB0yCl4+oKg+sL3UM2yz7Gio4jrCtICXBxdwrG5lZzkbVgMlEXQaYsMOHXRtfVKj7NwSMsb3nGAkJ00pdg6fvY6sIFLvmUBXj9PtK5T3kcUcaRot2+yJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inztAVr/0Q8IywSifEds1B2It4w3ppgfX4MxUT+Qz2Q=;
 b=Syy1OCMcKYZyssRmsTdFfxKjPYMeczZ4f9mmw+6Rw66vZRR5zH2wATi1pnyi2HaQcCsx2N7LI8FshgkzVuxxQMK9uSTFbLBKpn6ILSUC8mEG2a2ufuUV7DeWabqVbQTSPX/1QHeKSLQnhn8sc29kVhlAgOXFq/vR5xNsMkpqJv82tLhbqPEN9fZOdEspNOIfViYpCR7dV+52AK2WvwU/XQaXUlPMXGEMACXJidy4fVLYAYhQJMSd+CQjnnI7m2CDbpXH95fRtbNO44t/vBdoxM6nJ9ZvrmsBr6EoxYGe1B50aMDNFI1wCtuqSVgFQGK6Hha99EmpFGgQ+54gnzcmCA==
Received: from MW4PR04CA0256.namprd04.prod.outlook.com (2603:10b6:303:88::21)
 by CO1PR10MB4657.namprd10.prod.outlook.com (2603:10b6:303:96::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 3 Jun 2026
 16:09:00 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::ad) by MW4PR04CA0256.outlook.office365.com
 (2603:10b6:303:88::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 16:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 16:08:58 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 11:08:42 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 11:08:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 11:08:42 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653G8gTR2076907;
	Wed, 3 Jun 2026 11:08:42 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id ABCD39ACF4; Wed,  3 Jun 2026 11:08:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v2] ti-img-rogue-*: Migrate GPU driver version
Date: Wed, 3 Jun 2026 11:08:42 -0500
Message-ID: <20260603160842.24544-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260603154816.3066421-1-a-christidis@ti.com>
References: <20260603154816.3066421-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|CO1PR10MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e465d14-074f-4f79-0e64-08dec18a6b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	PTII9UNovr2Di2IroAVwsiwyeZDE6mUfAHk6K0NTpHNSVQk7l/wG2gftMSdpplkp6JgF7MRPGRlFJqpSZtAYYZJ4PKrMgMi/znrVeubkAblRsR9O1I4aAtxTJPvwRVOAfWlTvbbC3hnkGy/isaMgxlb/JgPXhih5Wh7QrOJNJcO/39CtRaU6GmmsrTDhtzm8UADIP+z6Sc6Q+loi+Jn3rSoMgy8IsZKtvmFQS8DG2YGKLLdhYiboZfR15OXlKBJiE5uZ4Ps1C0ajyXCRdfZjGey77JS3T+OUjnBJ6nKTd4HMZs/CtjQcPdt6NDwsWxgN+i8JwUmXgo3DXUIxlmvGDkJtDNmV4v1+gPqY8o/C7YTqSRKCrFqEoYSg00+0+XNXjXBPaF1N07LwZQWwkFM1neFkTTlIpVjjxGdzyw8U0Fr1k6ysIZB6FSwwBqTMCYrgG++84VtrQSBiRtAl+xFkd/LVXqyXnMqWnRzHRou7/3Zn3PkP042E03UD7nkCdJFOQPxAm3cEtzoaq0VnvJC3+SnhuHjzehtR1VMWPV8VGxYkG54Sc02RyI9SIxWmMVoxRHcbU12BPvO5J05JjWGKge2uVOdaW5Q4xV40JlIq8e5/r7+FpE13HyOBOGnTByl6MxDICK2mm3PqtY7cnYdWw8JPEmFdhtB8UKPWIDMkzH81ZVJrGf9Iq5GZ/xn2zjD/xoZA9evG7WO43VPCUkUWct5ym6YIXKBdxU1oBmNxWgo=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jgqhnzAXTVLObdRyDClvit0Vnb9qF+7OhPS/KmfMk62P1DwrS8lDaP3ZvO5fu5DkJHQV+HNWKw9PEvH3l18i05Qdy8JoOLMZ/0KbJdGvT9TH6zhaFYqKhkTlfMjDrtESvsJAb7jsSLWBX/FdI/QRrrfGOz5zuOOvrBOqHgRfSijsEU/laFp573X6DN51YM2EqZjC72/6f/aQ53LweNYxEizYdJDfgupIJgK5Leni7p/wbcvTTo45P8uzk9NJI5Fy1XX9RrQbGVN7lBHESqEenwUqKlhceLdsna9TkaVToDOhgQOMYZY5cDvZyddoAcecK9ABMWsSVSWFakH82bLO5m9dt5r9UYgVU6lMhBB7OjuVYp0GVCHb3glqNvJXNhgQyqyy1G8iKBqdL9vrrAAxI/Kyyouv4w0onBajgxsUEryF1+bZzDaykfUPCjTowOdo
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:08:58.6515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e465d14-074f-4f79-0e64-08dec18a6b96
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4657
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 16:09:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19965

meta-ti / na / 20260603154816.3066421-1-a-christidis

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
- Patch Series: [meta-ti][master/wrynose][PATCH v2] ti-img-rogue-*: Migrate=
 GPU driver version
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 3 Jun 2026 10:48:16 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fc07ca4062a39274eab9d894183ed3c01=
00df268

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202605272200
- Commit SHA: efd871d4eb504ec366027fdf6d1f934d2844a04a

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] ti-img-rogue-*: Migrate=
 GPU driver version
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 3 Jun 2026 10:48:16 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fc07ca4062a39274eab9d894183ed3c01=
00df268

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: ae9f90cf0baf823a20d10b5e4e3c6af465dabe98

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
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




