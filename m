Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28C5CD3445
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:21:11 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5900.1762975266769843894
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 11:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=f8uzIH7G;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.18, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDZedPR8R8y6HiKPgIclOyNdPbv6Nk8j9tThdOwFm/tAAGDy5ahPCgqZjfA1sfihVNdT2ySTIpPD5uHy16JtJhNqMWuqrtdfMd3Z4xcBrj1T30vt3QTJHcwHaGIMxC26kPmGt9+fVp950hdjR16N3IcoWYKPhPTjB9oMApwTOvFV5KCqJ8x7cUzf43bhdps60aAkTHfQ/ImVX8zzVdxWlN1MtkyRA0eV0Codhjz1qv8BEzHoAWpbH5U/OcFE0CG9ObBAgDh8bPz7HFSksYMtGYnM0r+VtsLRvarYm+jt2JH+WYttwjTblIrBMKaJFyLBiHVO5XJy8DkURyyz4x8cUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Re59wbclbdlz5QD3MPj+Ejz42R4/AgUWY8xvzl2GVqY=;
 b=mvnhVRIj55lTtbuhyUxW/6pJDh/3Ma+mg5OqVFYAb8PhoFt7JE7uAI/XK1lddxrhMrrQofyMraNW313bYayA7ulxWrOlGAZm6IP3kUq9YKsyVOTqnCCq4/s2gFc5t1q5yc2KlNMhc45zGa/FJA73PT77LzdzY6m4p1TJ/v+CFvxibBh+6cO4Y+KzZ4NdJ/bJVqOBA0INwLZQFs3PBAevoLJTmFH12ClfVHEESRkHCOfISSldDfTLYN5Ub2Bkq3xy6IJvIMpzLF2hMFMXKWxenqwwyHbDYAsQTXCcsG4cFx2a5rpt7C1pPlRZS1fjBneKKtv/iQpIVXKCD/czI6Dp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re59wbclbdlz5QD3MPj+Ejz42R4/AgUWY8xvzl2GVqY=;
 b=f8uzIH7Gt8VRzCAF9irXK9v9HYYMCrkJlMjfoaTJqyVMFqVJpLM+nqbKNKcghCa5b+XW3E6P0f529Z3C94PDugw8lldne/F9565sLkAvxDk4y5+ZGsde3gPx+HjIiN5t4Q+PmW2rNm4RNB4Xop42Jm3R51XjXTq26df5UzyhOx8=
Received: from BY3PR10CA0018.namprd10.prod.outlook.com (2603:10b6:a03:255::23)
 by IA0PR10MB6772.namprd10.prod.outlook.com (2603:10b6:208:43b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 19:21:04 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::19) by BY3PR10CA0018.outlook.office365.com
 (2603:10b6:a03:255::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 19:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 19:21:00 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:20:56 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:20:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 13:20:56 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACJKuuS3179325;
	Wed, 12 Nov 2025 13:20:56 -0600
Message-ID: <64c335c2-dd83-412e-ba62-38bff16e243a@ti.com>
Date: Wed, 12 Nov 2025 13:20:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti][scarthgap][PATCH] ti-img-rogue-*:
 Migrate GPU driver version 24.2 -> 25.2
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>
References: <20251112174942.3548570-1-a-christidis@ti.com>
 <20251112181807.GU3125@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20251112181807.GU3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|IA0PR10MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b305b72-8c1a-4b24-3995-08de22209d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8sOlk7LHTnWwoD87TsPCocUo9V0LiZnMMQLua22QtpiyNHpDvhHlb8WOEfrE?=
 =?us-ascii?Q?D3l3/g40l57oHgARI4Wa8wxgoRpDS/t/rIVERGZKzX0GzOco8fFdX9qSHcb7?=
 =?us-ascii?Q?bZEYHoTopU/ED0S5VZ/AQGAoiyVbtFBsac7XZ7HNMZj6Ru0RrxCILpuDLoj1?=
 =?us-ascii?Q?74RZ21vlgp6+i1X7zo0T9wf19AOX+cBBlP0GSt5zhgBLz28YOPvcAUIZtbYO?=
 =?us-ascii?Q?IsxkNtBMDMudpYh01Hw4cJwXh3kI5UHIBltIDOMLAK0nTDE+7GOZImUjFI5J?=
 =?us-ascii?Q?s1105TBTflNNO56AvCtE3lD+A9BgTKlhB1TXv24mbV0Ft8RI8Vizkkp4ApwN?=
 =?us-ascii?Q?2bJ6rtrRmF5DOC+FmCvZYrQsTsoeHaTvKz8r0B8SEHJNSZBooyULdWoXCOqB?=
 =?us-ascii?Q?u1EvNk+sptdHGVtkDUILTYvOFjk0N1vGaDoBsx2q91yo8J7AlvJwNArwWKau?=
 =?us-ascii?Q?jKnRDKptLUwECr9V9rpV+EcZfFFtReseSmMLKphDYcewzbYXC2nck6/SIZLS?=
 =?us-ascii?Q?xkLYpXFZ9/4WKqGuzU25FrS4TaauruGbrpsbJ7QBDHD3gcpX/pUFEPREv0D5?=
 =?us-ascii?Q?/4PmK5ZyDoqPHDt3POcETc5VlNo+I+ZgxPXE5QzDirAbjDMUwRVBu22GP4ww?=
 =?us-ascii?Q?x9jFxbQbSabNotGtSLs+ruUBWJN8VNHRWZ9+IRON6nCMu3njBUTRYLg8ypSC?=
 =?us-ascii?Q?0GkA/yrFoJxPvwRkXgKXIdcgG9RXukxN5kDwmJtUn1d+ntek8ENn88x3Xzbg?=
 =?us-ascii?Q?LJ61VLBf6OKUNlb7HH8XwFU0QY5bmKD4CIMckFU9O8vG5xW2T+qqzYermmaB?=
 =?us-ascii?Q?BS+s/1ka8K1eiuYkmXsfj9TU68G7sRYRzUi4k9zqWZvZhGpz/Z92E8AbwhgB?=
 =?us-ascii?Q?3/P3o3JHl3uvv6E/zq5sK7zM7RcajMoLsbMpdTt03AHNQhD8EFRYmwFA7Bst?=
 =?us-ascii?Q?iQZzwe8yyGiwqZ3XP+rFW+X5issdBtbYhTKndS6Hvp6m5cluSqD73OLU9SuQ?=
 =?us-ascii?Q?nRD3sKwzyRZ6J3m5LmHoea7aoMVGPo2U8T1vRjcq9sPLhdG19xKDGRXxR1NV?=
 =?us-ascii?Q?PVSeb+SUtmwP//XwON/q8jiPlo1902GqmXJRnMZuMsXYIshVRaxxicTMQ25j?=
 =?us-ascii?Q?5VUwnsFqJPwohtL0TF93k//cO26/GyASCkNhUdFUaWQ6lSKI17hpYL1ODAe6?=
 =?us-ascii?Q?/vYfQp1o7KyV/sljFqhteJGf62v8SVqBNGw2V7O30SeZ2o0iJPz68+ZPg2y8?=
 =?us-ascii?Q?Nemj71xGTOL7t5BNPcSTBe3AoRuBaJrhK3nAmje7M/MI5KGQW6myPsyDnO+I?=
 =?us-ascii?Q?LCSkfGBRnazsvKblPCMqXIxmeP0d2yAWODgIxP2IggqYqKC1/Zm+j6g051Lw?=
 =?us-ascii?Q?c5EzFD/2mC5SKZqRLeCdNqD9Rl3NojSDjCVXn+Ckb/Y6iyCVfJaA1pxO1zTw?=
 =?us-ascii?Q?WmDmdsh2UvIN/Wnvfu9j5dUT3NjmQ1sGROjL2WUZAxd0zgktC0o7/HxRm6vh?=
 =?us-ascii?Q?pQ/7+FdO72x1djL7sUQ/tuPmkxoAxxgZgWYJ?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:21:00.8837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b305b72-8c1a-4b24-3995-08de22209d79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6772
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 19:21:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19252

Dear Denys,

Ok will do, sending v2 shortly.
Only changes I made to the recipe are regarding PR and SRCREV.

Kind Regards,

Antonios

On 11/12/25 12:18 PM, Denys Dmytriyenko wrote:
> Please send it as a diff between 24 and 25 recipes so it's easier to=20
> review. You need to pass --find-copies/-C and maybe=20
> --find-copies-harder flags. On Wed, Nov 12, 2025 at 11:=E2=80=8A49:=E2=80=
=8A42AM=20
> -0600, Antonios Christidis via lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg w=
rote:=E2=80=8A
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfP1k07CkZFPPK=
D3A7oOCBt5qxYDdV8ErObvlYmxWuuUSzDNu1eO6i0xLQxCulupu7rZbrx$>=20
>
> ZjQcmQRYFpfptBannerEnd
> Please send it as a diff between 24 and 25 recipes so it's easier to revi=
ew.
> You need to pass --find-copies/-C and maybe --find-copies-harder flags.
>
>
> On Wed, Nov 12, 2025 at 11:49:42AM -0600, Antonios Christidis via lists.y=
octoproject.org wrote:
> > From: Antonios Christidis <a-christidis@ti.com>
> >=20
> > New recipes for GPU DDK 25.2. Update DSP configuration files with new
> > preferred recipe versions.
> >=20
> > Recipes regarding DDK 24.2 will still stay present, as scarthgap
> > supports kernel 6.6 and DDK 24.2 is the latest support.
> >=20
> > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > ---
> >  .../conf/machine/include/beagle-bsp.inc       |   2 +-
> >  meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   2 +-
> >  .../ti-img-rogue-driver_25.2.6850647.bb       |  40 +++++
> >  .../ti-img-rogue-umlibs_25.2.6850647.bb       | 155 ++++++++++++++++++
> >  4 files changed, 197 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogu=
e-driver_25.2.6850647.bb
> >  create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_25.2.6850647.bb
> >=20
> > diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-bea=
gle/conf/machine/include/beagle-bsp.inc
> > index 448e2086..e7788bd5 100644
> > --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
> > +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
> > @@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 =3D ""
> >  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
> >  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
> >  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-img-rogue-driver"
> > -BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "24%"
> > +BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "25%"
> >  BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 =3D "24%"
> > =20
> >  # GC320 support requires out-of-tree drivers not yet available in bb.o=
rg 6.12
> > diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/=
conf/machine/include/ti-bsp.inc
> > index dc0473de..fb36cbea 100644
> > --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> > +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> > @@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2025.01%"
> >  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-sgx-ddk-km"
> >  BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 =3D "1.17%"
> >  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-img-rogue-driver"
> > -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "24%"
> > +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "25%"
> >  BSP_MESA_PVR_VERSION:bsp-ti-6_12 =3D "24%"
> > =20
> >  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-drive=
r_25.2.6850647.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_25.2.6850647.bb
> > new file mode 100644
> > index 00000000..0f50026a
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.=
6850647.bb
> > @@ -0,0 +1,40 @@
> > +SUMMARY =3D  "Kernel drivers for the PowerVR Rogue GPU found in the TI=
 SoCs"
> > +HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver "
> > +LICENSE =3D "MIT | GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D=
0403c7dea01a2b8232261e805325fac2"
> > +
> > +inherit module
> > +
> > +PROVIDES =3D "virtual/gpudriver"
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722=
s"
> > +
> > +DEPENDS =3D "virtual/kernel"
> > +
> > +BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
> > +
> > +SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +SRCREV =3D "a838ac0074db640ebd1b64be6364417b1bbca3cd"
> > +
> > +TARGET_PRODUCT:j721e =3D "j721e_linux"
> > +TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> > +TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
> > +TARGET_PRODUCT:j742s2 =3D "j784s4_linux"
> > +TARGET_PRODUCT:am62xx =3D "am62_linux"
> > +TARGET_PRODUCT:am62pxx =3D "am62p_linux"
> > +TARGET_PRODUCT:j722s =3D "j722s_linux"
> > +PVR_BUILD =3D "release"
> > +PVR_WS =3D "lws-generic"
> > +
> > +EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_B=
UILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
> > +
> > +do_install() {
> > +    make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${=
PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_pr=
efix} PREFIX=3D${STAGING_DIR_HOST} modules_install
> > +}
> > +
> > +RRECOMMENDS:${PN} +=3D "ti-img-rogue-umlibs"
> > diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-u=
mlibs_25.2.6850647.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_25.2.6850647.bb
> > new file mode 100644
> > index 00000000..6dba5d7e
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
5.2.6850647.bb
> > @@ -0,0 +1,155 @@
> > +SUMMARY =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> > +HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs "
> > +LICENSE =3D "TI-TFL"
> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58=
f99e3baa03de5207e76f"
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722=
s"
> > +
> > +PR =3D "r0"
> > +
> > +BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
> > +SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> > +SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
> > +S =3D "${WORKDIR}/git"
> > +
> > +TARGET_PRODUCT:j721e =3D "j721e_linux"
> > +TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> > +TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
> > +TARGET_PRODUCT:j742s2 =3D "j784s4_linux"
> > +TARGET_PRODUCT:am62xx =3D "am62_linux"
> > +TARGET_PRODUCT:am62pxx =3D "am62p_linux"
> > +TARGET_PRODUCT:j722s =3D "j722s_linux"
> > +PVR_BUILD =3D "release"
> > +PVR_WS =3D "lws-generic"
> > +
> > +RDEPENDS:${PN} =3D " \
> > +    libdrm \
> > +    ti-img-rogue-driver \
> > +    ${PN}-firmware \
> > +"
> > +
> > +PACKAGECONFIG ?=3D " \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan'=
, '', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
> > +"
> > +
> > +PACKAGECONFIG[opengl] =3D ",,,,${GLES_PACKAGES}"
> > +PACKAGECONFIG[vulkan] =3D ",,,,${VULKAN_PACKAGES}"
> > +PACKAGECONFIG[opencl] =3D ",,,,${OPENCL_PACKAGES}"
> > +
> > +def get_file_list(package_list_var, d):
> > +    file_list =3D []
> > +    package_list =3D d.getVar(package_list_var)
> > +    prefix =3D f"{d.getVar('D')}/"
> > +    if package_list:
> > +        for package in package_list.split():
> > +            package_file_string =3D d.getVar(f"FILES:{package}")
> > +            if package_file_string:
> > +                for package_file in package_file_string.split():
> > +                    file_list.append(f"{prefix}{package_file}")
> > +    return " ".join(file_list)
> > +
> > +EXTRA_OEMAKE +=3D 'BUILD=3D${PVR_BUILD} TARGET_PRODUCT=3D${TARGET_PROD=
UCT} WINDOW_SYSTEM=3D${PVR_WS}'
> > +
> > +do_configure[noexec] =3D "1"
> > +do_compile[noexec] =3D "1"
> > +do_install() {
> > +    oe_runmake 'DESTDIR=3D${D}' install
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true'=
, d)}; then
> > +        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
> > +            rm -rf ${file}
> > +        done
> > +    fi
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true'=
, d)}; then
> > +        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
> > +            rm -rf ${file}
> > +        done
> > +    fi
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true'=
, d)}; then
> > +        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
> > +            rm -rf ${file}
> > +        done
> > +    fi
> > +    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'fa=
lse', d)}; then
> > +        if [ -e ${D}/lib/firmware ]; then
> > +            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
> > +        fi
> > +    fi
> > +
> > +    # clean up any empty directories
> > +    find "${D}" -empty -type d -delete
> > +
> > +    # fix permissions
> > +    chown -R root:root "${D}"
> > +}
> > +
> > +GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
> > +VULKAN_PACKAGES =3D "libvk-rogue"
> > +OPENCL_PACKAGES =3D "libopencl-rogue libopencl-rogue-tools"
> > +
> > +PACKAGES =3D " \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PAC=
KAGES'), '', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_P=
ACKAGES'), '', d)} \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_P=
ACKAGES'), '', d)} \
> > +    ${PN}-tools \
> > +    ${PN}-firmware \
> > +    ${PN} \
> > +"
> > +
> > +# Inject variables so that packages don't get Debian-renamed (which wo=
uld
> > +# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the gen=
eric
> > +# libgl name to prevent colliding with swrast libs
> > +python __anonymous() {
> > +    suffix =3D ""
> > +    if "-native" in d.getVar("PN"):
> > +        suffix =3D "-native"
> > +    for p in (("vulkan", "libvk",),
> > +              ("gles", "libgles1", "libglesv1-cm1"),
> > +              ("gles", "libgles2", "libglesv2-2"),
> > +              ("gles", "libgles3",),
> > +              ("opencl", "libopencl",)):
> > +        mlprefix =3D d.getVar("MLPREFIX")
> > +        fullp =3D mlprefix + p[1] + "-rogue" + suffix
> > +        mlprefix =3D d.getVar("MLPREFIX")
> > +        pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
> > +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> > +        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
> > +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-=
umlibs" + suffix)
> > +}
> > +
> > +# gles specific shared objects
> > +FILES:libgles1-rogue =3D "${libdir}/libGLESv1*.so*"
> > +FILES:libgles2-rogue =3D "${libdir}/libGLESv2*.so*"
> > +RDEPENDS:libgles1-rogue +=3D "mesa-megadriver"
> > +RDEPENDS:libgles2-rogue +=3D "mesa-megadriver"
> > +
> > +# vulkan specific shared objects and configs
> > +FILES:libvk-rogue =3D "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
> > +RDEPENDS:libvk-rogue +=3D "vulkan-loader wayland libdrm"
> > +
> > +# opencl specific shared objects and configs
> > +FILES:libopencl-rogue =3D "${libdir}/libPVROCL.so* ${sysconfdir}/OpenC=
L"
> > +RDEPENDS:libopencl-rogue +=3D "opencl-icd-loader"
> > +RRECOMMENDS:libopencl-rogue +=3D "libopencl-rogue-tools"
> > +FILES:libopencl-rogue-tools +=3D "${bindir}/ocl*"
> > +DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
> > +INSANE_SKIP:libopencl-rogue-tools =3D "ldflags"
> > +
> > +# optional tools and tests
> > +FILES:${PN}-tools =3D "${bindir}/"
> > +RDEPENDS:${PN}-tools =3D "python3-core libdrm ${PN}"
> > +INSANE_SKIP:${PN}-tools =3D "ldflags"
> > +
> > +# required firmware
> > +FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
> > +INSANE_SKIP:${PN}-firmware +=3D "arch"
> > +
> > +# common libraries
> > +FILES:${PN} =3D "${libdir}"
> > +
> > +RRECOMMENDS:${PN} +=3D " \
> > +    ${PN}-tools \
> > +"
> > +
> > +INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
> > --=20
> > 2.34.1

