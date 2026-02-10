Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5652AEB271A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 21:12:32 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3898.1770757944169203600
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 13:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CCuE2MII;
 spf=pass (domain: list.ti.com, ip: 52.101.56.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOScgWRrKfncy2zc4KXt3/x7BE+9jb8rXt825/VLuH33DELeFSE0VbzBKUP0ijU8tqx1DamM7MsWlY73CHq0K9+PtQ2shQfcbEEWfWmZQTEP/W+Wi07e5ySX53OCFpoDJhmtGMNr+9E8TflJYQMcLUKj0o3Z385cNEG7JxInulfMx4Zy0W+dxfUyi/B5uNpP5ayT0PouBIRF0HXLiiKPSm17HSfrxZRC6FV/whKeh+m8ERr3slFnk/JaHKMS9lWwQaKdMNyro3lGdmXmzktK6WiG9plpCRilQWXCvHqEPfiftmepy+dEFRKkD9QJuoQzaxfj8Wvg/Jmd/PC7CGES0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c7IpDh2ZKzbTi9PThxyMUCRrbaIexcSttLk42UGgE8=;
 b=KzAHTrorGDcVhO0UiygNUY3GfNcqT0NKpA4ibxjJDDIZzthQz7+eo2AMtLsyt3prvji/LO8dQWGr7MQlj6V77Meeokxzs1jLMptsScbVtxMnwEPOd0ReJG0wg6uJDLrJDoV60/G66SnVdQuLXPPGYmfghQyCo7jLU86G2lKdf/oDxH3I5RgJEK1D5D1/Qe/vNlI17N1U9YitzgnR2zF1Juon/0JQn68etPpoghZHhbw00FSElx+zgxE1WL08v2Y/aZbhhmtaRLGbcVzjpR0/3zfMPxVSypqs8+eHe+d6cVd/rAxgufVrSih7B3OgvAo76pY8rD70n3e1Rmq+DHpv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c7IpDh2ZKzbTi9PThxyMUCRrbaIexcSttLk42UGgE8=;
 b=CCuE2MII1eEyA4MyfwkEH/Iri/Oe/XeHnzjp9ApbRBYnHWoQzl/SqNlinlOmm5bjMTYpCXuX/UFSPVqtiTpEdToJrqDeip61VN/bfJkg8eebZImgdqpO96h2alOExiSshLqReaRcWy8AjG8RzuyZLlOzB+MCkHtP6gTDbNjNso2yHxMwMTM4p2RQL1xOfsOTYw6zRmbYVcLT7sdMOqMHTp+cp0YTjvRQwjvxDgj6nRHLxNQPufTpRWc4fCuANeUGDSG2v4FuH88i/VPdC+6v7wdojHgqeKpnQq/3x6ugRHEhTW9OgyjeuM+mzhX2V87EKfHll23uv0bsz8ysKLrhyw==
Received: from BN1PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:e1::22)
 by CH0PR10MB5084.namprd10.prod.outlook.com (2603:10b6:610:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:12:19 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::18) by BN1PR12CA0017.outlook.office365.com
 (2603:10b6:408:e1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 21:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Tue, 10 Feb 2026 21:12:17 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 15:12:17 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 15:12:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 15:12:17 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ALCHr6442278;
	Tue, 10 Feb 2026 15:12:17 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 30451138B5A; Tue, 10 Feb 2026 15:12:17 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] ti-core-initramfs: pull correct VIRTUAL_RUNTIME components
Date: Tue, 10 Feb 2026 15:12:17 -0600
Message-ID: <20260210211217.3652436-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260210205940.18081-1-denis@denix.org>
References: <20260210205940.18081-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|CH0PR10MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 8311c74f-cb85-422f-8661-08de68e9128b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y5fJinsEa1+UHya4KrjdryvNpiyH+nGpVO8CBKOEalRyaUOBU7FLC+9Sb8cE?=
 =?us-ascii?Q?OTNp0BIt9eAXh8Zkp0jQfMvQar+kj2HXgU8v1Wwu9/5DlO795lYfUTy724wQ?=
 =?us-ascii?Q?XnoZCjlA3rsVRO7ERx07PfQof+aby1zfKuOSGe9uhWmKO1UoRlHq4b96opmq?=
 =?us-ascii?Q?VLaW42c5pZMmy/fKOMAalQD22fZrgss56fcDgzAAVBHr1TMkdvYNTcC7jnva?=
 =?us-ascii?Q?Bu4Z4onlz5k7Ri6AWHrL2fXgiGiksdFZhMw2+zGdtQhA9GW5b4wWgjLlIBNg?=
 =?us-ascii?Q?hQ65OpGc4r7p7tdIExDSlNwJ7Fl/faoMQu2gbJaqHhQfHw5JXtIMLy5OeimQ?=
 =?us-ascii?Q?tgqp4NmaWS7LXZlqHwAH31aLOPpSA2/kSw6WiPz4mS1tyX6w0xu5CqhZMuDb?=
 =?us-ascii?Q?FJppF5XlWkQlDy9iSH0ckdV0Ug1MLqQePNIG81KVVqWfH7ldotl0hvaHFIhz?=
 =?us-ascii?Q?kXleWcsb18DIv9rwzA1OOWHqx+4nF/qqN0YO/3eHmLN7YEqx/8MHQ2Fk3DM4?=
 =?us-ascii?Q?lVZWKR63w5F9qXrMxrlMSNvQhX41Qic+cdKh+LzQPXayAHyQ2NRa34BnjzLO?=
 =?us-ascii?Q?ebjDgFfHHgvo/YYceDqtlSqaL5qrLNcAZMvihmELJ1qcO3jKpAvyQ0vPWyTR?=
 =?us-ascii?Q?pDbw6Z2nHvtren7V8n3fgTbMjpMiVhG2JAxosu58qsZuRnIT2McMkBrcM+nI?=
 =?us-ascii?Q?AyV1WjsQ5fxEkXTRoQcERRgkT1ZbSjOdUgxTu00pJPlNShDl8BmiPr8noQDw?=
 =?us-ascii?Q?tGBzIIJkgvdAadL8Gii6dXZTM3dy2J0gPZlA/TWs+CoK+wMnWC+cq5MzkR7g?=
 =?us-ascii?Q?BA+CQpaEwjp2MIa4d2kBS9LcxKxHZ9mNF46m6PaesjKVkOFbSNVibFIm+Pvs?=
 =?us-ascii?Q?QOOxwT7oLmeTBEVk0lllyajyNXLLYmQ81MFBbM4hkdachUqs4XDD3BPKRRSn?=
 =?us-ascii?Q?TRHRGQealy+kaQi2JOJgDiJtIUNstFDF3HzEDAoaQYMXmuQfjmrn5n3Cy4lK?=
 =?us-ascii?Q?GCYh0uI3lK5cCHJjR/13MZdgFWiNVJXKAxiAdtUkBSh/Kho/nnji0vTvCSmT?=
 =?us-ascii?Q?KVpWDRW6bIKJTJJSvwAjx+j6QZSXGrwSrIfE4SZgeBA1Nl4+7LdRhKubVdiB?=
 =?us-ascii?Q?BdEJokggoMd7fpztI6TUnQYQ+D5mWCLOGaq+0UIW0jO/ayj48xh7C8mW5R8r?=
 =?us-ascii?Q?chN9epB2bV06Ifis9Sddv+fUv51v333ATG0oUXkfKzP9XoG8tQT6s14T9WK9?=
 =?us-ascii?Q?JvRJfaqCp/eGwGlkBj3T571wHa3xlR2ffcwAGI0ykJGVAuMjZZs6ZnovoHsg?=
 =?us-ascii?Q?dp4xlWo56UzkzbqmX2a+z1jtWAXZWnHzTptD8wGc5dy+KlHCoBBJOOycP8Ej?=
 =?us-ascii?Q?jpGWhCPS2EG1A2h7jax3VQIg7RpMCp4QvalC9yT6cDodsmt9tUbt2EiimDAg?=
 =?us-ascii?Q?A4XZMjVP9WsGyHzjFeWQhp0PtIHiaVXyCBll5Qj3V3av8+3ViWmH2TtNV3lE?=
 =?us-ascii?Q?1tAKlWhzFoBBjhmykWWwkLtGQnFqvPfANYX2XRxlGeRhpoXM3Gjd/FvpQ8F3?=
 =?us-ascii?Q?5GEYIGIaZam1/z5yNv+ZI6FKVaHUEe0rkNl8rqy46XsrEvPD/qVlSXsMA01k?=
 =?us-ascii?Q?OlNWBbInXloeqCYu3UDsxqV6bvZHM8nRg7RSjDC6hkeu/SaQOuvQNwgjIZ7o?=
 =?us-ascii?Q?FhzF5Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9xqaYYcx9+tkaWekbCmYaSAvqVpONruGR3CIKZFhAnw/GVKa1FYEESD2s17vxQgG1EXZBBbUh5AXjNXEAlkgT0Mu1n22atLqhlvHHTLF4jfeji+vvHWq4sxQlAHMlgZgM/Q47ui37+cvUdM7BG4Gv1+RSFWbBPVt3S9Q0yC3XUrCozraWhS2xUTNmV5s2W+dG73S1gyMbYGGFz9f/yMgXG3GHdequ9XEY/TtCdzGwQ9hNofOMxsE08rG2XfuLYc+0LeGx8/f/JY7m/+y8dJ2MwBh76yjTU3xXl/1rv0KBd7vYluXIfb8cpV/HsWT1RBLiyjA1+y/wyVSgsZVXzXPl+U5vrJocTxo8Fd7r3hbdug1dnbXcln2O0C3JS0qddXZm5xShLFdIBNmK97nk9L8Anx3YoCJJiaTM3qogouKmFy2Oyf1C1EKWzSrDKI/1qdC
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:12:17.9753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8311c74f-cb85-422f-8661-08de68e9128b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5084
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Feb 2026 21:12:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19480

meta-ti / na / 20260210205940.18081-1-denis

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
WARN - [master][PATCH] ti-core-initramfs: pull correct VIRTUAL_RUNTIME comp=
onents
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
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
- Patch Series: [master][PATCH] ti-core-initramfs: pull correct VIRTUAL_RUN=
TIME components
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue, 10 Feb 2026 15:59:40 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 520a366e4e470b35ba5913154a54ca617=
68d2fa0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: d572a42481cd986ed1911e97c2fb00d667d43dd8

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




