Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50241CD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 19:01:34 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137199.1781550087370786906
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 12:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CTjE57sZ;
 spf=pass (domain: list.ti.com, ip: 52.101.48.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDfG7eSX75uuIeOu1wcj1heGjag/yKerqzoZGD7pSKKZ/tcg/vp0t5ykXgdoTojFLjO2RY2REyxdJ6RWBpT2Mqo+sXs2nzkqxjn3Ay5C+TlolHQ2lH+y0f7N8g91GQqvddwUTtWOxsqxx7AQh3uQsRUbKV01HLUcMdobfXMHuQDKLnviA7Z7vA3Vyg5Hb7Fgr31dAGyVtJrFvpCznzWO6BElWUEyQm5VoH9+3Ia62DMeJ2wlmPxN63s4DJWSwHXfVsaD3NSQ7ZoAkPoPJVNYYWhqECR7wR9pO5P+KYQRQANg2nY+y0EfuJWPlsN2GDAIAgi8ACj1ImG4fTgHaK90Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+lI97y6djrYy0ddFEiO0NLDXotedn4Ph4H23qVEdoE=;
 b=ma9DictJLg86iquB9jTbiuPQkVg3EJW5x+1HdKpHVbtvyzNt1T7iH+GfA2KcUX3uf6AI80bTwKzEcw/4H3DZ0Sd1dlb7oBlOyNEMX9U7rNKDsV6nCIfCpH8lVp/5YXT6lqUbotHJM0pHHGRik+WE4dzEi612kzA+fb9g96GRrKT5+xGzythyn019hZAUufXDArpX/Oxdam9/Zy2t6O+/ntpRaNdq/SaiJVY7rmzlM36lOxV8dC/JEarIc6uSA6zFQV6SZn9H8QFVkSbjNlQ3/G0oD+4ithZWxy6IjS/WsHf3H6CMB9e5heEYmk1mSq5evs3Yqyi36hIm38cNeDKYow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+lI97y6djrYy0ddFEiO0NLDXotedn4Ph4H23qVEdoE=;
 b=CTjE57sZ7sc52Z2w4og62xizg/LMfT8akgm6WLc46mDHuVIQ4DBnnVncxz0sl+vmppmoUP3y5cWowwkB1oElIaGWLbwshoeKum9i4SoxffkyUW8G3++oSSah6XLDyaPeJsryvmMorSvaJcw3IlJY1R2C/cO6wzFOeyYANVbcJ5NlGUk/va9JAe4jv/mElV+4UJWXXlUCs8ecm0BthHPWG1WIQMU+OuuSQM1KrRdVjYmHuYGETzHDqzJWHkWG+giFnIicAfdfhN7GGxX6k+enpVELCXCl1z8v8QFWhGRkmUYd7Ie2Nk3wt5mX1Y+ZLfIK6vPt5oSIQJRxHMS3J3jtyQ==
Received: from SJ0PR13CA0201.namprd13.prod.outlook.com (2603:10b6:a03:2c3::26)
 by CH5PR10MB997718.namprd10.prod.outlook.com (2603:10b6:610:2ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:01:25 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::3d) by SJ0PR13CA0201.outlook.office365.com
 (2603:10b6:a03:2c3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 15 Jun 2026 19:01:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 19:01:23 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:01:22 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:01:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 14:01:22 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FJ1Ma02540966;
	Mon, 15 Jun 2026 14:01:22 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 93DE49ACF4; Mon, 15 Jun 2026 14:01:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202606151035
Date: Mon, 15 Jun 2026 14:01:22 -0500
Message-ID: <20260615190122.678060-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260615185347.3206644-1-lcpdbld@list.ti.com>
References: <20260615185347.3206644-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|CH5PR10MB997718:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e958d29-0d7e-4eda-3421-08decb107e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ou+fsqB5M5jO9OxhmYpOkFiuM1WxGIX9isv6AKR4VPWwcN57AQ7j4LJEclFBAYG3DdAIX8dSNZC8NRYSI9O5EbZkWfPWm1JZVp/EyjxAkjANmqR6JdVnG7VTPI3hP4pW84kO3B/orw2CnGZjWhosIcwxTzqOlxUZ84oI0lA9OFsFmjAjFmXELm5gjJIL9KqfDVebR/E6dBonMpqdbr98V7oNxMB24Pd3OfwA5ObjAL4jnBuQ8dBgj1X7MXtuB1mLPSlunr4BCLSjq90v4FWxkNUh6ue1F9HHNE3ZOtGv+KIAist6DhuKfBj3WR4x9TI7LOhf9wrE6Ux7UTrLLjfEWt639toRG4/hSAjtR54hiS9IyCWPpzayL6lWFJMt+dlX8XZTo3dQR7oQIpbc7vT6jx3GjF2vNwIyHXEvjqepoYPy68KN4fev5IgWK6bg8DQZklKaZ0Uxy93ic/Y0mJAjxb+KtbaaLcwvlPYPuhqwwuHrcca1xSvkl69gXkMgRC7HspXgNWaRf04Kqe4Whut2UBlQh8lJKSg6vxOxMxPqq8LFIMN+1DcaUksv/CscnnWHeNytUpPep0hCkoyr/t1ZMxirSxsPDL6WocZdbxAP1Wd7MjgyWuNj98FtRyRYfnZHEGyDEvQsI/wiT9Hfl565C0EeCdXvl9jBDKYHGHN8yf5duA8nDls8Gv7dZlJX3MRHWWT9/42aWa9Mtgo/OiPoVGZob9qqNfv3RrjJ058rB+A=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uNJtEiVEreWl61QKzEac5BVM9at4RpT/O/oi6QlsSP70tbGlHN2mQEbpS0W6rwCjXHXc3M9XYZ+33R0U37jhkw1O28AZln9nCPkGhU6JU5VHFt13vNfZwEek0Jhs/c/SK5T6uYXSoWsk2T3Omkf8pXtO+F7GHWgGe4SMVPluVCH40nlBq9qIfSGW8kKYfzxoL/XhwB9ToYjHhkwMwISNWUZdNDwVQeZU7Py3POTG+NsxOuCkN+xiDTfZaItQ/MMs+EacP+DKGD5x0QG73hpKwTanIL8XUIOjoiz/mLk4CXHre+P0Yh1+6wSHXIdCtZSdgcHciD14KcP1jAVTPvE5MVPieLSRL4Pq9IM+3PIy2pxZSuPSFPz5s79IBdTnbVG1fKvxc/KsUEbOmOczylhS+JXe0lHMXVOHs1dRpL4qVt8FYKKsTXleGY1DlfRDTDol
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:01:23.2340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e958d29-0d7e-4eda-3421-08decb107e65
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997718
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Jun 2026 19:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20037

meta-ti / na / 20260615185347.3206644-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202606151035
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 15 Jun 2026 13:53:47 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5507c36a780c341cede736033c6dc48e8=
180e45d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202606151035
- Commit SHA: 9859d582984a87b42db107127e829c976f315ee3

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




