Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79B9CD37BD
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:51:32 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6683.1762977087512068302
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 11:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QMS/CKe0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.15, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reWylbRztwTjv5of3nbds2lsirJtwlafwD9adSZzJH5q/x9HLjwvWHqzzbF90rBbPZLr83oBrfsStwpn5m0kYG7KSjW7WQCdbuidfWWbLFdMkKsymY9dmbq7PT33fV8wK4hjA40nvRWkugcIOwJNrWEYCZ+SotsPj1tGRIpkvWzMhFw/qygDloen3zKEnu3myR/IPGyYr7dzkTDw8lWZlYzME7Tb2JgBOqd2UOGM6nl3Cp0xWiKMNCcWcheDkFxLvOqohaWSp1xOdQS2z8v1Rf5qC+Xj5x7MxR4gr3iNUxww6JBgoj0zzghSz60bmnOzAdME3TBSqNdLyf0Y0C5+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBd/46QPJ6qbfiRhzmi4vmnbwGZ2c3Kj2RldisSM4wQ=;
 b=idQTGpz4s19X2Xo92H9BeHTY5PBG0rHTzIV58F92/qdrz76WI3RLGkNLCOOosqEzkDPUWJgesA71JcqAN8HiTcgQTdKniQD+9Rawj1zuHwPIzPCWAfnGGmDNUf3TWAJn2v5f4KPwEY5fuuFz8hD65CNXubjDBPcM0bmADZPi/YqZjzXCD9uEpBytxw46dPjCkSen+Z9+d4rDb7bMkq76YSyz9tv/BaooTo5JgcVirmZCz/tMY6scmjMnXYBBT2MQLtvYL/Ch5gFUB0uMP1VP9LzFHjbnNjbRg+WlYaVFSgl1wNSNCEjz39AErdqHkv9YowG1Cup6tNuT1LEFVKK6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBd/46QPJ6qbfiRhzmi4vmnbwGZ2c3Kj2RldisSM4wQ=;
 b=QMS/CKe0KeLFQ6meTXtglB4WvvuNcYaOaWCiUluOuzKd2Hqhuf+3GAEpN3k3Jkui/sY//69oTtWgUTE8SQn0HWBcdYZ2a52p5QqQg+4QutZPjksxa5FSVT3k4sHaQfwtJuujl1Q7j5PyLpDfHuy86+/jl8W38Fo7KeMotvpaRms=
Received: from BN0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:408:e7::31)
 by CY8PR10MB6682.namprd10.prod.outlook.com (2603:10b6:930:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 19:51:25 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::52) by BN0PR03CA0056.outlook.office365.com
 (2603:10b6:408:e7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 19:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 19:51:23 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:51:19 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:51:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 13:51:18 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACJpIHu3213562;
	Wed, 12 Nov 2025 13:51:18 -0600
Message-ID: <ec81de5a-1efa-4be1-9df4-b37dda704656@ti.com>
Date: Wed, 12 Nov 2025 13:51:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti][scarthgap][PATCH v2] ti-img-rogue-*:
 Migrate GPU driver version 24.2 -> 25.2
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>
References: <20251112193005.3655764-1-a-christidis@ti.com>
 <20251112194220.GV3125@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20251112194220.GV3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|CY8PR10MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ea67e3-e1b1-4178-c35d-08de2224dbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bCKzom7+ZYZwUQJoTlZS1IzHzyzYXrRbBXTPTKsDDq3YFYTlT69irofGyBCD?=
 =?us-ascii?Q?rUMB4ga5rWrpJTUelG2lKdzhV4Kqvfhs7AT0EtQ6QOS2S4w+DkigUXb/7IkC?=
 =?us-ascii?Q?z/3u5n6lVxBn2hnQTxMcILTAT7ZMUnzsshkKcAMdREoqqsoLevcom3DbCxdk?=
 =?us-ascii?Q?nEFhY6BpP+IBHfRlrT7uifmPxFmnn4k8MuGDpTdxcCfad961OVgggGg89k1l?=
 =?us-ascii?Q?bb9IuZr4e2dK6iew4ENcmECT7W8WvM3lW/+otJb8daoUWwZ+08euJGpw72WU?=
 =?us-ascii?Q?ArSG4Tgzjw5vy29g7iKPO1ha2b7vF+sZUUX3TtRZbASGlBw5XYd6kOrMJe2n?=
 =?us-ascii?Q?QiM18ZJzaDr+npGkx9oiHLzLHJTa+YyMRugi/OoTN4vxRNSTySLkVwfvzXy1?=
 =?us-ascii?Q?sF4fjdXLBFzmW5uL4bM3FUpP59cwsR+Biym3cNjsnE5DJ7Vg2pNVGnGzQT7z?=
 =?us-ascii?Q?OXTU5urS3pkb2+2CY1ngecquQ+Ta+c0pPJIE98F7ijJqYkTaqcOk1JyoMIsk?=
 =?us-ascii?Q?ZTxqmPVcPMPcUZN7xITFy1fBfFf5Tsjjb+4zO5HbOuBfQOI5NIAP1e6M2AMM?=
 =?us-ascii?Q?ahOgO9reiCs00RSCC23qXELBlb5Sk8Zxye3DInC5SaYxE614wyGI+v7arGQf?=
 =?us-ascii?Q?U6Np9QGaI1oPJ8zAGFIJI+tg1XcCyqnKriHxZm0iK0UQrA1A5QjOkbBkYtt1?=
 =?us-ascii?Q?BboBSAytibDfrZH7V8ocOqLma3H/Gr8rV9tZTSa3GEOF6esGkUNrPKXUd47Y?=
 =?us-ascii?Q?L6ZZ1zckaxFuIxlpB6v0s8+S4HuYKg6a+TjZPk8JxxkqX3+w1cS33tAmV50z?=
 =?us-ascii?Q?j6rrdCpophMMEF/9PrILN54uAftsHXsa74A0KsonHKM9TXEYAFUuQm5uqZnt?=
 =?us-ascii?Q?11jg1A1oj58mgQbwzQMD6AjgPU8iOeIWpVM3fhi5ymmp93KjtjoF8Xip+Bwp?=
 =?us-ascii?Q?eYs07bo3pxu0tDNLtp8imtJc7ptCq/nQ3DSACRuTvQxd5XAMzAVVj1fF5M/f?=
 =?us-ascii?Q?YR9mlG4U+pVd4oQr1vAinqJGKmblo/KeF75NfhvmqoU+utYlurSfgh5OAlXe?=
 =?us-ascii?Q?hIGFpyqWSnTUB3jmOZCMFjA4V0iq6xXfypyGPnoBvWuiNlVBniy0kRagBk4H?=
 =?us-ascii?Q?amJbvYLncfInR48l/0UcZHSaFlqi73++OrRgnwh2h5ge1Z4Aphj4j1/Iiwuu?=
 =?us-ascii?Q?kbukk3/r7wLa5VdWTVEcOL7Lj2NpMNdunxmOnLu5pk1beHR7iQqszm1LwRGq?=
 =?us-ascii?Q?tqHKrOOENwPEC1MgqzHVEyJN7WbeMHAWskvw+bQCoi3ltyLs10GOAhVDkDpf?=
 =?us-ascii?Q?uh3pPe9ev2LmNCUBqfqybSNhqFbJoa5tohVkrXTRG89JMUBhNFPIcRbAEs2k?=
 =?us-ascii?Q?FXESAbv3NCIImff6tE1JzzMm5NawlbyqATrrW7S4SJe6VcjUGFTty95gqy1M?=
 =?us-ascii?Q?/aazw7xrtgPd03tMEBFalsvhu5PXn3zvR8lYFAs2sK/VpN1N0XxZP2+UCGfQ?=
 =?us-ascii?Q?MJW0jY2PEwk6TzF0eU4NW+Xt/X+bGPUtO0qPPTCQsCdzIUTUJuG+35aFPUQI?=
 =?us-ascii?Q?jXm2vpeFbhSsXuHNogQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:51:23.2954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ea67e3-e1b1-4178-c35d-08de2224dbbf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6682
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 19:51:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19258

Dear Denys,

I'll wait for your review before sending a v4. As I sent the v3 before I=20
received your email reviewing v2. That is why the PR is still present.

Kind Regards,

Antonios

On 11/12/25 1:42 PM, Denys Dmytriyenko wrote:
> Thank you for the diff - it's much easier to review now! On Wed, Nov=20
> 12, 2025 at 01:=E2=80=8A30:=E2=80=8A05PM -0600, Antonios Christidis via=20
> lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > From: Antonios Christid=
is=20
> <a-christidis@=E2=80=8Ati.=E2=80=8Acom> > > New recipes for GPU
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfP1k07CkZFHFP=
DnEWfvH4F9jFQ9WgapvCuRlQFp9KyUEkiGzDJm1gH1hwq4i_hRH2QgmLS$>=20
>
> ZjQcmQRYFpfptBannerEnd
> Thank you for the diff - it's much easier to review now!
>
>
> On Wed, Nov 12, 2025 at 01:30:05PM -0600, Antonios Christidis via lists.y=
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
> > v2:
> > - Removed recipes for 24.2
> > - Update ti/beagle dsp config files to build 25.2 for kenrel 6.6=20
>
> dsp -> bsp
>
> But, in v1 you were keeping 24 around, while in v2 you are removing it. Y=
et,
> the commit message above still says 24 is remaining...
>
> Are there advantages or more importantly disadvantages of using 25 with 6=
.6?
>
>
> >  meta-beagle/conf/machine/include/beagle-bsp.inc               | 4 ++--
> >  meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 ++--
> >  ...er_24.2.6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} | 2 +-
> >  ...bs_24.2.6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} | 4 ++=
--
> >  4 files changed, 7 insertions(+), 7 deletions(-)
> >  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24=
.2.6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} (96%)
> >  rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlib=
s_24.2.6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} (98%)
>
> <snip>
>
>
> >  # GC320 support requires out-of-tree drivers not yet available in 6.6
> > diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-drive=
r_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_25.2.6850647.bb
> > similarity index 96%
> > rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_24.2.6643903.bb
> > rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_2=
5.2.6850647.bb
> > index 513429bd..0f50026a 100644
> > --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.=
6643903.bb
> > +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.=
6850647.bb
> > @@ -19,7 +19,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rog=
ue-driver.git;protocol=3Dhttps;
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
> > -SRCREV =3D "8eaff654a8871118c08cfafe53795f57e3b6b396"
> > +SRCREV =3D "a838ac0074db640ebd1b64be6364417b1bbca3cd"
> > =20
> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
> >  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> > diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-u=
mlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_25.2.6850647.bb
> > similarity index 98%
> > rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-um=
libs_24.2.6643903.bb
> > rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umli=
bs_25.2.6850647.bb
> > index 57f48fec..6dba5d7e 100644
> > --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
4.2.6643903.bb
> > +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
5.2.6850647.bb
> > @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;m=
d5=3D7232b98c1c58f99e3baa03de52
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >  COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722=
s"
> > =20
> > -PR =3D "r4"
> > +PR =3D "r0"
>
> Please remove PR completely here, since you are resetting it and it is no
> longer required to manually bump it with changes.
>
>
> >  BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
> >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> > -SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
> > +SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
> >  S =3D "${WORKDIR}/git"
> > =20
> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
> > --=20
> > 2.34.1

