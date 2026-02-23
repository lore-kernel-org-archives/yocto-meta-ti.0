Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33075EEC28E
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:49:05 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6415.1771883339908266340
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 13:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=otgqGUzD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.2, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxiCSotld3u+bAy1kxjAytXLYn/mLPjF/oG+qOtFtieb+QimnpL3EGtbDwtfLS3J9lcNZGgqpOAOfeA2SyMpiPDwDCLSvUqQCBHDaAKtTm9uOkSz5dzDtJ7ydLzsLx4WaC2HGZ0uKjdk2IUzECJduMNisPwkJ9W7265XQptr2k745t0XQB4kuV+uaCAfqlkp+arug+0Pp2eQSj8hVLnx1LLEk9WHCCqWG8bDODttzuuOtExqb49gjiL9PIJQ4kvmtg692T8uG/6ZD4Ks8RY4ZmQ5NnFfpgacYOBbNFJ7wDtQCCU6jlddwiaKkz0V8zvwLy/I5b1xTeOahs/vNpjo4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1tii+GuQi+dQoCYusVkdqjxapdepg37smH1S6zyojk=;
 b=Mn9xC4xpjNcZVVBkTJyD9VnRiXe2M1lVXmuWw10qRYJxunOdzJuofydAG9lv7nSNIFpfI16L2mGm5iOG9JBjIp5TsPEzqihBGtE2ukqbiiKk8orDJVkv7JqUxxC8SzsTDvjfPQHVVelc4/7DxZ36TTE5WvO6tw4zBgCxS9yGwqDPs9SVbw1Gmo8v8iKAO1TZVsILIAECupnQsCxs+0Mc36WdUKOvx9p+lEwM9TRhl2vXc7KEl7HkmVBMZSOi30/JeW3sh3T8c8U+/EhovemegSXg06EqMSVU32inno8ZQckfpNcWjBG93DTj53XE3jZo4pvzfs2f58HzodESdFj+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1tii+GuQi+dQoCYusVkdqjxapdepg37smH1S6zyojk=;
 b=otgqGUzDes6iPTkcfw0A3SILcrmGpBEF5E9AJT9MjeZ7HC17huNfWVWqSl8JhLegmUB9L9Gi6+XqW7rv9T3adGIz3UdiqPKqqbWOOoTU45v9wJg0/r3fF7tRtBfDkpIJ9SmMT0/zp90kA4Am8Addyr121dpWNWiGoSgiTC6j63w=
Received: from SJ0PR03CA0233.namprd03.prod.outlook.com (2603:10b6:a03:39f::28)
 by BY5PR10MB4260.namprd10.prod.outlook.com (2603:10b6:a03:202::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:48:57 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::db) by SJ0PR03CA0233.outlook.office365.com
 (2603:10b6:a03:39f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 21:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 21:48:56 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 15:48:56 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 15:48:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 15:48:56 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NLmtOQ1542726;
	Mon, 23 Feb 2026 15:48:55 -0600
Message-ID: <168758af-25fd-48ce-9c5e-87573562058b@ti.com>
Date: Mon, 23 Feb 2026 15:48:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] optee: Update to 4.9.0 tag
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260212221955.3319340-1-reatmon@ti.com>
 <20260223180946.GP11121@denix.org>
 <1896FBA74F1F90D0.1454197@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1896FBA74F1F90D0.1454197@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|BY5PR10MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: aac51cd1-6e07-4d04-bf10-08de7325587e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X9ID1TP89yhlYsSyypW+3QWzCqr5Wm5ioA9RUiorO3iUtiWU4ANqswgR0oer?=
 =?us-ascii?Q?q3qKLKGBb7WExDWintbebB4nnDrMjcmXY3sGfIbIYEAYt8IAoLCFoixJsbq+?=
 =?us-ascii?Q?kIZ7DtZWgiyXos72ch0CQ8h3Mvs5X19qPuIri1oI96QDXgdz2OjkPhilCAZp?=
 =?us-ascii?Q?a7gDHkWq6Tb7u+UxnjTEE+Bxd2DdsPCvDxq0I6nd5+MrxVEtTVzyNoCxA0a9?=
 =?us-ascii?Q?nVzXr/EHyhLMkmgtZXhL9TgW5wEqNnvnbA+799al/7rtQZsGtI7G8j1LvXn0?=
 =?us-ascii?Q?CJMHzecAiT0RhVeyqiYWSDHFmFFqe7Twk73kdcvDECf0XlBiQlsOMEVPP6Rh?=
 =?us-ascii?Q?EbosOoHs/RbnTZKWmSfxvRCZs0c96EGW78hIO8sOUvCvwk+ZRbkgRPQp5aRi?=
 =?us-ascii?Q?S1ZNV0NRm9BQKkTs23fp78UpADSv+Fjh6+CZ4p0O6YDDWy8n8/GyP743LTmv?=
 =?us-ascii?Q?xDDRAdSq2pQcXWXMTQ2QfzTjl8ycR0mdKa+D8OtyQVq4YQqD/wsdx2PHO/Ti?=
 =?us-ascii?Q?HKXbvi88rvggijQe4dO/Egl2wTMf6QGLhhEKk98YDWkbQU0lE9O9fupUjWkM?=
 =?us-ascii?Q?2XfHpgXqH1sctpEHdNIo3AZHPm6aqqrG3jKhYtdImpvzi3AnI7ThAncV0Jux?=
 =?us-ascii?Q?kY9lEb2rz2z+Gz7kt5De5Bbad66mSnXsgbcCpy/u/hUDzBvLv0g3TcxW7qfy?=
 =?us-ascii?Q?LNCRulxFfxg/D29fN9+b9P/AR+KIf5pifhC20i1+MWqWFB2ZvwLQ/t7P7cgi?=
 =?us-ascii?Q?XP4XRzmYEDbrXCevMigw4Ewum0g/Eor/vHRtodDxW2Dwxa83bEqK58pDe2g9?=
 =?us-ascii?Q?LdqEf1oLThgaYWLHJYcBzNszWnx2VAzHz4xAuLwwrWroMzgvfG3KyGBTgB8h?=
 =?us-ascii?Q?Tzok7LubvljCBR27HAD/S8rFXHMlOdELGZ33b+3cP4gajh5wCUcO7822SV0Q?=
 =?us-ascii?Q?rSQfc8h879aHOGFwr7/dL0tkBMCCjVfYJ/lEnK2iuz1WJ2OFHYcbkXfaUeQm?=
 =?us-ascii?Q?iUOYfAusKwDapKMMTk00tp2VfenprUG/sb15xtnj9Lgan3pSWnCVPIgpDzwf?=
 =?us-ascii?Q?BMdfN7swjDI054QqwuCBDhXF2S/8jRqzlrp9kenN5PVD9WP5OnXc/E1mmLCu?=
 =?us-ascii?Q?4hF14xsM0Y6Drapq+4MRE4JnLcOfwQQ7OQVixxSxwG1GnD7w47yfVHk2B3YV?=
 =?us-ascii?Q?ZmiL+eoKNS7U8CTTEHIxocrC8wqoWGp/n37mCmT8qdFEPebCZmvf8h9Yvvo/?=
 =?us-ascii?Q?SVwb/CT+rf3zfldaiaVIAq0gBF/BpW2zyQgkyLYpb0VPA43Wc1y9r7dYsxYG?=
 =?us-ascii?Q?Dnki8syAaq+FKDsmI+sxci0vuohTGtFkYXS3FAtOQz+f+ZMbyp8k1TT4mhqM?=
 =?us-ascii?Q?cI2QMfm8kBh+f2ZXsZYc9g0Q+EIO8Yb/INh9nlSOgeTWnAgY2t3sAYuRZl47?=
 =?us-ascii?Q?huPOzC/lUffZinyDab1DujnM4x99zKzXlTWlxKA578IdGAVP+BikBLYTC/vw?=
 =?us-ascii?Q?P3ifycHJomK0G9kmbRSYse7vHzniPmFVmaNaHnHJDTLbLrq7SeaaHrHazKqG?=
 =?us-ascii?Q?m9O8D4NQjXUxHw8neUATUU8CHK4mFHRW5zen9FrgNvV9+APctG+14RmYrF5G?=
 =?us-ascii?Q?0tHSBseladTGgMlnvBlltTBHdoSDMqEtwgpmmp3zIXWAOrU1xYDWqxlFzEq0?=
 =?us-ascii?Q?APa7Gw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	toIvhghe8ZC8vb9XdZDhTZA1Ms61EVeGK2nG0hYKOfuB1WjrpM9+ejinoHqULhmTpOLMsynRgJkK8p5Vz05oc8ZBrcLjtJbGkERpLGvUorGpHZOPkhPYW4ONddCJubGr8+v2tjoGHrg+FF6eXjUxxjCTj6+AeugEFY9dolDPWHa03CA24Zi6fHNFowFAUlqAZGT6rxrhSGWpfA93zecyEwMQRULNsdyZhaTvw8fbyID0JqkM+Yfx3VRrma1+50lVLAJQSxIOg13+Xj33Edqb2UyRMRvofrH9J3bZB+KozHcj/TG8dLwGYwJ/o1ZI1VYFsA/QrYE3MyREv4CmvfRCemeiimI2+4Xy5cEs5cILRorD5wc/m5LCeVVPdDlaQFq2qGEK5w+9MJoo6/Fla0Ztjj52XDoKq+ZECyCDYxilmVxzEqK7P5727CaVGwK/KgUV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:48:56.7449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aac51cd1-6e07-4d04-bf10-08de7325587e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4260
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 21:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19566



On 2/23/2026 2:56 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/23/2026 12:09 PM, Denys Dmytriyenko wrote:
>> On Thu, Feb 12, 2026 at 04:19:55PM -0600, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> From: Manorit Chawdhry <m-chawdhry@ti.com>
>>>
>>> Update optee_os, optee_client, optee_examples and optee_test to the
>>> newer 4.9.0 tag.
>>>
>>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> v2: Removed platform specific backported patches that are no longer
>>> =C2=A0=C2=A0=C2=A0=C2=A0 needed.
>>>
>>> =C2=A0 .../optee/optee-client-ti-version.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 ++------
>>> =C2=A0 .../optee/optee-examples-ti-version.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>>> =C2=A0 .../recipes-security/optee/optee-ftpm-ti-version.inc=C2=A0 |=C2=
=A0 4 ++--
>>> =C2=A0 .../recipes-security/optee/optee-os-ti-overrides.inc=C2=A0 |=C2=
=A0 9 ---------
>>> =C2=A0 .../recipes-security/optee/optee-os-ti-version.inc=C2=A0=C2=A0=
=C2=A0 | 11 ++---------
>>> =C2=A0 .../recipes-security/optee/optee-test-ti-version.inc=C2=A0 |=C2=
=A0 5 ++---
>>> =C2=A0 6 files changed, 10 insertions(+), 31 deletions(-)
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>>> index ec10cefe..68b6b262 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>>> @@ -1,6 +1,2 @@
>>> -PV =3D "4.7.0+git"
>>> -SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
>>> -
>>> -SRC_URI:remove =3D " \
>>> -   =20
>>> file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch =
\
>>> -"
>>> +PV =3D "4.9.0+git"
>>> +SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>>> index 91dd5e60..6ec2a83d 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>>> @@ -1,2 +1,2 @@
>>> -PV =3D "4.7.0+git"
>>> -SRCREV =3D "14321a0607db16099d158478b21a2b2e37b3a935"
>>> +PV =3D "4.9.0+git"
>>> +SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>>> index edc9d68e..350eb9c9 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>>> @@ -1,3 +1,3 @@
>>> -PV =3D "4.7.0+git"
>>> +PV =3D "4.9.0+git"
>>> =C2=A0 OPTEE_TA_GIT_TAG =3D "${@'branch=3Dmaster' if d.getVar('PV') =3D=
=3D 'git'=20
>>> or d.getVar('PV').endswith('+git') else 'tag=3D%s;nobranch=3D1' %=20
>>> d.getVar('PV')}"
>>> -SRCREV_optee-ta =3D "ce33372ab772e879826361a1ca91126260bd9be1"
>>> +SRCREV_optee-ta =3D "a09269b15de635e1816fe832e26adfbfb44c5455"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>>> index 30dbb430..83087030 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>>> @@ -78,12 +78,3 @@ RDEPENDS:${PN} +=3D "${PN}-ta"
>>> =C2=A0 # This is needed for bl32.elf
>>> =C2=A0 INSANE_SKIP:${PN}:append:k3 =3D " textrel"
>>> -
>>> -# LPM support patch for Jacinto platforms (J7200, J742S2, J784S4)
>>> -OPTEE_JACINTO_LPM_PATCHES =3D " \
>>> -   =20
>>> file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch =
\
>>
>> The patch file was left behind unused...
>>
>=20
> I need to add that check to PRC.

First pass... 2 patches in meta-ti, and 2 in meta-arago...  we have a=20
tiny bit of cleanup to do...  patches incoming.


>>> -"
>>> -
>>> -SRC_URI:append:j7200 =3D " ${OPTEE_JACINTO_LPM_PATCHES}"
>>> -SRC_URI:append:j742s2 =3D " ${OPTEE_JACINTO_LPM_PATCHES}"
>>> -SRC_URI:append:j784s4 =3D " ${OPTEE_JACINTO_LPM_PATCHES}"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>>> index 9b1db77b..8f75db04 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>>> @@ -1,9 +1,2 @@
>>> -PV =3D "4.7.0+git"
>>> -SRCREV =3D "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
>>> -
>>> -SRC_URI:remove =3D " \
>>> -=C2=A0=C2=A0=C2=A0 file://0001-mk-compile.mk-remove-absolute-build-tim=
e-paths.patch \
>>> -=C2=A0=C2=A0=C2=A0 file://0001-compile.mk-use-CFLAGS-from-environment.=
patch \
>>> -=C2=A0=C2=A0=C2=A0 file://0002-link.mk-use-CFLAGS-with-version.o.patch=
 \
>>> -=C2=A0=C2=A0=C2=A0 file://0003-link.mk-generate-version.o-in-link-out-=
dir.patch \
>>> -"
>>> +PV =3D "4.9.0+git"
>>> +SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc=20
>>> b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>>> index 2d8fd8b2..15b43063 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>>> @@ -1,5 +1,4 @@
>>> =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-test:"
>>> -PV =3D "4.7.0+git"
>>> -SRCREV =3D "a15be9eca1b7e935917d834284726027dffc8cfb"
>>> -
>>> +PV =3D "4.9.0+git"
>>> +SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
>>> --=20
>>> 2.43.0
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19565): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19565
> Mute This Topic: https://lists.yoctoproject.org/mt/117783503/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

