Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C977CCD4F25
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 15:36:14 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37669.1778859368409263273
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 May 2026 08:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RB2CmI6A;
 spf=pass (domain: list.ti.com, ip: 52.101.193.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUlj0sWAjtta2P0rZsR9RzETb07wNmC6oywwotkhmrocd9l56xBoSbWrh6d7WgHs1k7/EgRDg7WViur4YfvRWCNkbJYGqG1fe2htFGygH1XoDcQQE3Gsteud1jAtV4sZLS8BA9V3QOvuFauAYN/wDAwqwSpYD3kphfxgXw011lchd2k/iwDmDwRjtgLrFuO34tmP2hzarOcISFXvgfnJSJ+nLnlDLGb5tKRzn8SIz9+4/eD2+jmxIXooqAYMXPlK9Tis3PGooA2s6/yHddFzejQTZLekWXswGiRa/jr8RNFEkNplnEd6ruS4dxXuptlQPsgM49GmTweVDlpJbLFizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZp3QSPZZ5hrFOdAYXv6NSQ0dhZdoIVzFKvOfDaEIqk=;
 b=g6AoXcye7YWoiiZkqb/MnNvZ2C8hT+90Zu66KyjOQsUChUV3aDMqRwcISY8amhzD6ddz63Z0gGhcZDKVo4guqdJ2tUNbpa85h5YIytWZUROlqnufM1sgqX8RDM9xlvisLaL7Q9jjPhauaKRABFTW5t+HU7aqP1BUuLc7dbMi/ICzeWq2I80QzADwVrn1ppPdo5A1I3jAb8dnNfNzkcsRRQNMPJN3wSQLz21Fj7/Oo6KdqBtGUw2Sr28A59SId8RiTmxETaz5cCA8ORyO4sIlI+AKSMEhyClqyMbvHXnzWiFMNWVfK1fH1GdZa0u+aAVlWFaUdjW3D2LJx+9rlj39+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZp3QSPZZ5hrFOdAYXv6NSQ0dhZdoIVzFKvOfDaEIqk=;
 b=RB2CmI6AzTZK8LHQxqloEhwPSGRKStLpkk/sKV//PLZOqxz3oqVfvDDcCiQI4l0U/x4rQUWdSG/qSclSCnEVLuT5pqS5n/5Nk6EPUDxmYj14JO55qAQn8Bz8aXy3ZgTRHHlA8Ea6jRu9pTyOpkyrwL7Ii7Ok0GqMpiI/ORxLXXQl1N5WcvdHceoF/xUfGutjw32tiN4PO/NEnbjo78hJYMjChaMZ34SRlYXH8vLyyfHU7tIt5vJ96l2LbwzEILl4OQF2XjkZlCGPRWIgIiX5E47hWZEUhxLV+CTUx/5ROFNhM/D8C0G1YJCnrXeQJGyqSf4il1WMqmcwJJRdDT1cRA==
Received: from SJ0PR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:334::21)
 by SN7PR10MB6450.namprd10.prod.outlook.com (2603:10b6:806:2a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 15:36:05 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::e) by SJ0PR05CA0106.outlook.office365.com
 (2603:10b6:a03:334::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Fri, 15
 May 2026 15:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 15:36:05 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:36:03 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:36:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:36:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FFa3tk2707850;
	Fri, 15 May 2026 10:36:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 911B69ACF4; Fri, 15 May 2026 10:36:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202605150747
Date: Fri, 15 May 2026 10:36:03 -0500
Message-ID: <20260515153603.2237884-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260515153230.2514091-1-lcpdbld@list.ti.com>
References: <20260515153230.2514091-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|SN7PR10MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b8f3a1-13c4-4d3f-ad53-08deb297adb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	KJYdKuHc7TdtMYRDuHucMH1nYD2PDKGXq0/E+lBDGPq2N0Tml0r9tlE8dytdxkmtXy0W16hys3l1pnobaVW5ZRjVWhhRulBRptEHeuCuejtyOYUA3IWdb4q7Z9dloVjAQYqXDg+SDv1JXG/VWdHqVJQnwQdp5ZbbW9N8LlBZyC7swwST+2FfCTZs53aGYL0BwuKBkblajrkz5IxPpe88BaHddloS72o78gIxeMu6xW5Yxy908AlOJ2n8wO/cibuVtnh/oZYEB5Grlvl5PQWmylLvVtxtHlsogA291Um7/yFURTUwzwjED8B39zi1ShfTzc0bW2su/tg66Mi/QFBgrhjR1ZPoSrGJthLbb03Iufb0OvqHehBs7SF8jB+EL03Dq1THOXsyVoPFYEJ/YcmrH/T0UspI+VUEqXaq6oflaNvhlTsuUmRPLwRDtcoBhyVIAuCylDAFAqP7SREiNod4Scug7dn4Bt7MYlr+NUcRyK2KpX4ADcqjkWexTgkNLlnwM2N/IsKlttH9wDKr6a+NrvSzE9CtEhNPL5lbm61CdV8VFdc2TGW3RR2Gd3eJhUKvNhJC6D+X0o28r0pixXGeH8SXkste7K7B8Vxv9xdqlFYt/0aDu8AYXqgV84uO75+2CvPerGRkNdkyFerxOJaDm4vxMbqHsoospjlwHGbIp3HQKd8RyysmHl7maXxnUpgjSuB93wZhHjgKQwxvNCBLWnaLcEXIriHHxr/F3OUw/uA=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T7K7lmxUcsmsXhT6RDWDAwteERgGU3RU/vZNkVDpayOFsJ8nmNTvRkHLmqyJUd7NEl7Uc6mOqh4zzA1H/EUaoRHPF9/MIckysCmjEDk5NsOZFsXfsM2aco3klUANZMV2z/erT2XM8XAqDbZrWl+qyr+peWf1p7Yx9WNU1+h5dVa8dT+bBRhBnHzWhhmVWj4lQ82mtHyKRX8wLnthMKCf/liAHoub7jEjsUh4lsxjPuYcJQ2dbq16OTl6qqSvaiEdB9WErB8d6ZaK1fSQb8rdHSPY3Bk/5KR2JtbyT76j0G1QH6r5eK8B+Tzm672aS3fFKqcOiKkxsNcCFSuJYW+TdYDXdkTauSdnK1M9H4UYiDWdtv9+RY9GQTnY4D7hHQL1qy3psKQbVwDaXCxm7K10OjmHwgsf1lMYH87nwyjv6H24DGkUHw95YqpH3pyHwOpa
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:36:05.6466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b8f3a1-13c4-4d3f-ad53-08deb297adb8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6450
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2026 15:36:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19938

meta-ti / na / 20260515153230.2514091-1-lcpdbld

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
02605150747
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 15 May 2026 10:32:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2b2febcc3fa48e7858a869818f312101c=
fc5e673

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: trusted-firmware-a: Remove TFA_K3_SYSTEM_SUSPEND build fl=
ag
- Commit SHA: 7a3e07fffd8bd1bb1f54ad3db63cd931b3ac35e5

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




