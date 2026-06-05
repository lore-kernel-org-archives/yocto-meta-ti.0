Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63947CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7064.1780663130521316131
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 05:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RmL37UZY;
 spf=pass (domain: list.ti.com, ip: 40.93.201.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l56SktA+vFOZow7qvOY480dw/vSAH71FFzs3g8VU9MtB55Ftmn/M3aIk3hF8VY7Dl/enlzLN3hArauF0SDccMkbHlo4NZUMFTQIO0nMhln1c+fWCz5UUlKn8GyyrcSRff5Nkfd8HRHDqDVtYEOicWT1u+BSkhmf75OLc5uaSIBGcWtw+x+vVTbY8fFQCc9+s5OyBTo48Rfz4rZkQsUhb3hHb2Nc28DklbFWkPQ4arOyGVYxrG+DpW44iG+k8nd3gX5XsB5dsW604WplTPoX85RHwiCWtGlOEV0uEiCZJjKyKNRQ0Hd4zkiJOfNBwajQrGD2TbqHeLPaATf9QTPrVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXIDnWgUt97JODrJqFNcKbzRZr0v2j9rKF02s7FVudI=;
 b=r/EAxyvWpWS4Y6s6z6HjDNW7bib/CZ3ZLl3CLTBHdWALrJt/cpzuPGEP3zQDCwdHnFheHBb2pnRGe3VTeuFdYtA/AifYOBACXDPCsX6z0C+DiqKRyXn1raRcpwgjtomX/o0A0Jmc/s0daRNYhiL4WUQo0r++WE3Sy/siuMp/meButliSiMPH4d484bI3neKGUJGVO9rqFW4XGjaqWjrsZlz34F0xPHZu7rYHnUHw4s5dt+LetYnXNzx1VAl6jq4UvRqQcWCWdDPG+ozTMy78A7/BosYF0zAnemryhC4JtrgB18vfPXbmH1YzjZzNS7F4RasAgqknzAvKfv24VenRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXIDnWgUt97JODrJqFNcKbzRZr0v2j9rKF02s7FVudI=;
 b=RmL37UZYcr/BVUPpYbfPPAWbuOG7Hf18jK4gRGCbao/IHP423SGplGw+zJHuMB9TpFrDj693XwnHcZe0P+XxmgA5q2jkkdOHmUcTaKBHIfimX+c2b5U0oph2gwS4nALk399Prjfm9fITsk9HhvvLahsXmL1k/8X2z3BW+LWp6SboG2jVJw+N5SUWKQwUq260FGUwSfz8Bep7T8LBzZ36SihTP1YpKTYpo72DJHIbybM+LP7GTfU0p97GZnnofAEc8Nea0kUlOb29YMJDiRdB1G71tsEsqed13fhglbnvGB5y7qLTt0oNHCahNou7aaTgfraMlUzIb2m6LdGwwhcwNA==
Received: from PH7P220CA0167.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::9)
 by SA1PR10MB6520.namprd10.prod.outlook.com (2603:10b6:806:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 12:38:48 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::92) by PH7P220CA0167.outlook.office365.com
 (2603:10b6:510:33b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.10 via Frontend Transport; Fri, 5
 Jun 2026 12:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 12:38:46 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 07:38:44 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 07:38:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 5 Jun 2026 07:38:44 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 655Ccidc1893856;
	Fri, 5 Jun 2026 07:38:44 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 3020E142E1D; Fri,  5 Jun 2026 07:38:44 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <nm@ti.com>,
	<u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v3] initramfs: Add initramfs-module-netsetup recipe for NFS boot
Date: Fri, 5 Jun 2026 07:38:44 -0500
Message-ID: <20260605123844.3149438-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605121720.1850683-1-m-shah@ti.com>
References: <20260605121720.1850683-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|SA1PR10MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b92b315-0123-4207-5e9c-08dec2ff62e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	uYuambgM0+ZYrMWVZpWUOYauKtDorU7oqhxOFqWhiV6Hn6p2mhqoAjTngTx0Hlaxc6OpYyaEaHKKLTgEJSiX+2o4CcD7XZJuRTk7UsyJuJbPLkkxjKXj/MKG7DOw8CnUHEfj1NEZ3AJk/ay3Q7Cj+jnRCwagSXB3J2UllaV7NmVSDgtqapSEyLSOoaOl//zLnZz+qEV84CTvmxlfoMyMKEVziG7jmuJgOIxxXp1W2ikmm8RRpuBcr8lgutlSooiGX9+V6/x0qS/gW6CE9akf/8H4KmAGl4ZKA/akZqteFGEgfR5GCc7BgAjxxtZ84KYLam7BHkQaQYCyNxzzqM53BXxgdMqvaUcAyFIk2FlscivSQiEZxIxPLqni8j51ixNRX9TyBXmIBb3lhwRWEMqxwsi6EnK/+eCOfwIPSDULpU20NGfka+a2hLJP8/N0bLTv8u5zjhJG4s+wbLM+Xy27fJ7qy4TcqInwFFZPgz6TJsWlRJPiLl9Ow42DLcPJ2pjpCDWGQIuJ7t9x++dyT8FmY1X/EynkJrDTrji/StS7ZutmVDFY3Vf0fijU/QSIEC8jFePyqIBACKKDni0VIsA89dRyg63M1Ed/RvLNmlT2g1B5R+FSW1N+b7Q9r0aU/PJeiR2AFWnZ4UQcqCvsctXOvQFxkaXuTi0XkvEeEv81mDCXUj4onsmzQLIe8TXqE3pYE3TDGTLtXB+V6v8KBVwlYoOmoQESqA0M5OLX2yUF5eA=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mjrDD8tNcVcGzB3hBGAvLeA2mSoy/ATSZRLTSL6isfC7z6scYQEWFoo5sc0PpEB43Dnn09jHqb18k+HMrLWIFkhn2YYLpdhRQmIZ7AI3OE0SvfTNlyelzgmmfna6jBH35fM1yNMvzqJBF7mjEhgWK0cxIC3/R8fhrfzn6hNmwbwN6dH7An0HKfCM/3dfQAQgCcQNv5bfU5Q47HLr9XnoYWYvKnNYIhBXCeMoaAXUTI/KQP04FijPqIV325V2p4uH6+PXVIlVEB9B2d0ta+BtsdAht0EPtU3+NCqIDwRiara4l4FmxYGKN/lpYCuZ79Zass1Nom7vYSg2ZBVpU1vrxX3tqxQsSkMNhgr1SMKzBO5tv5fwcJMSoQE5dT+LG86jjJ4bw71PGIVjLnOG0UG8GtzPxc5/oaZcrmb/9LZAdbtznfM507JuxF90T7UF+WAX
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 12:38:46.3794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b92b315-0123-4207-5e9c-08dec2ff62e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6520
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 12:38:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19980

meta-ti / na / 20260605121720.1850683-1-m-shah

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
- Patch Series: [meta-ti][master/wrynose][PATCH v3] initramfs: Add initramf=
s-module-netsetup recipe for NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Fri, 5 Jun 2026 17:47:20 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 23874c54376b899b3847f24dfd658aa92=
d05d6ac

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: 1fb5f1718d4673b2a9c794f83e9e5e4769c39d23

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v3] initramfs: Add initramf=
s-module-netsetup recipe for NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Fri, 5 Jun 2026 17:47:20 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 23874c54376b899b3847f24dfd658aa92=
d05d6ac

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




