Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8477BE66892
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 20:58:42 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26093.1766177916533481656
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 12:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BC0yik1y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.63, mailfrom: praneeth@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwPAq+wLeCFJgc5zFKyjQTwJfifQ01kGeMM3CUfOjqBNRldg5UtXoCszYLdIrvSaZp9NducUrB0SxtFJ94WSh0EikkwUMPAnM9NG98PysHl72+rUMkVOha7eILbIZhklICt7bognQLdYWegy/fTAcuX/+1l+eyjUmspJveoMoyC+Ty8re8N+Z8eXa9j47DW5dxh64kcrvUj6pYVUSNWk4ag7BaznUJYdSjLmDsr4BoSY/nm8+z8PKLQoSJpYd3LVhTB/yHL52w64LVk4ZZnmHvHE8lz597bX4Ic/iwvRakp1uFCAiI1EQJEAbOqhLxamALfYc3+IanFAjswC67WWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9+OlI0cypA/2oQozTMZ6ijG03hUWAHChOCtJ+6i4n0=;
 b=bA+4zxfYupUjop7d8w67Ncy/vI5TW7U02W4Q8iujAP6xr7iSnadc72MztEG8WahILx+n4EdJqOeVShvEFdx0D9poA0SX5X7qZwCduHSk/6Y6iUOBRZWs4Q08lK3KM9o/geSegTP58efty9qJeShzDkqZkCkOQpPuCSB3QDi3O+o4ofZ94alY5STXItt/ahjThh5OSPYroCu82dmw3fAHg5P0vzChenPqrjB5abuuBwhgiN9yNhIXLIllxqlBRyDz+cbkxz4SYmajzPBbKavURu6ndvjl2GuGtNA9doy+OM7NtXmgnUB0ema/JbDFivefYqSyEsD/f3blkf6Ri7lyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9+OlI0cypA/2oQozTMZ6ijG03hUWAHChOCtJ+6i4n0=;
 b=BC0yik1yrYvMnYcGFi7Zmh3Hh7MvMptetaPaxBdtft2aRas0fPOHD9SfWuvsTk17Mk5vIdD8NblipTzpTL5JlYDjZFOQudtNYjZ8x9PKC4JDXWy7UIVMKs02lLEjJqyBPJungfeSOjfTFogaXDryvdvUgTUkBGpplIb0ajpH7T4=
Received: from SJ0PR03CA0115.namprd03.prod.outlook.com (2603:10b6:a03:333::30)
 by SA1PR10MB6341.namprd10.prod.outlook.com (2603:10b6:806:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 20:58:33 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::3f) by SJ0PR03CA0115.outlook.office365.com
 (2603:10b6:a03:333::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Fri,
 19 Dec 2025 20:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 20:58:32 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 14:58:31 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 14:58:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 14:58:30 -0600
Received: from [10.247.22.36] (ltpw0eb5ja.dhcp.ti.com [10.247.22.36])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJKwUNf1511307;
	Fri, 19 Dec 2025 14:58:30 -0600
Message-ID: <9496e24f-a730-415f-ad0a-f72510ec8040@ti.com>
Date: Fri, 19 Dec 2025 14:58:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/4] linux-ti-staging: Add
 v6.12 recipe
To: Romain Naour <romain.naour@smile.fr>, <reatmon@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>, Bryan Brattlof
	<bb@ti.com>
References: <20241004151857.24578-1-reatmon@ti.com>
 <cdc9c53a-4299-41b6-8da7-a65577dc11c2@smile.fr>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <cdc9c53a-4299-41b6-8da7-a65577dc11c2@smile.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SA1PR10MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 2932988b-7d03-4070-b1eb-08de3f415ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DeTWa60IisHzftTj0iwYotp/Rqmpf3y3d0qcmcKEvBCn6Ds+BI4HJbZWafO1?=
 =?us-ascii?Q?1gGslaJhLny/HkPc5fxOeDEpjIXzNC1Rzyok3qPdo3HfOgc+D8kl6xozteIT?=
 =?us-ascii?Q?qoGOVWhUafFKAm39sXSOVKA+w8t34MRuJhI35NgUyHOa0M291bb7fgMVXhBG?=
 =?us-ascii?Q?f2u/smTL0Aq73+hToPdaHP8meVupuEWpZ0p/ah3Wk+HXh0D40bpesthtiFfY?=
 =?us-ascii?Q?iCqxsaYlou8G8M5nTSj0mr3hFrjYxD+qxgjn/UVKpYo2YLLA+n0jlq8fmskS?=
 =?us-ascii?Q?nF+cj6aNK3N+XI18oxlk372FdssA61sIaAJN3wQ+1/VJerCRDwCgteLguOoX?=
 =?us-ascii?Q?9lPyC+u2HVLNFBT5ewKrJNKKicUvwMpBWhjxaAg3Z55NWdbjrZ/qxF18puwb?=
 =?us-ascii?Q?0qXNO9VDxg+UqdGBdWox+PmCi+XUFX9Hp821AMSgnCtEP7MLePsdS+QBLjPi?=
 =?us-ascii?Q?lNQvDnPDxXJh7ASpUlKbvF09gnl8SRf+lTgH1D9f2eJbmCbAoi+EvedKVB5t?=
 =?us-ascii?Q?QQSTZ2iAjT10FXwwbPPV0RnxpGktKcHUl95T3+giH3LbLTq9UajlgXpxyPxU?=
 =?us-ascii?Q?eIh93fIwPgfhirOH+/VxYuJyXQTN2P4RK15igSEMMvnAmpxe11V3PzBV4WJU?=
 =?us-ascii?Q?qbYlCDtC8sRF3VFwwkL3Ic2s6sG7bPq+VEDt/N4tCBog5jO3lgZLILpNKdlY?=
 =?us-ascii?Q?oT3ONlCaCrRAa7H3S3sqVqgWmC8xSsMZdU3uGtywdd4Vw3YDO6krmnqzAJoJ?=
 =?us-ascii?Q?Ey81AabgmY/bJYPzTTYB4EJ6qGrInf7DpZjWZdt7RLWHvGJJMIreWD14Jtfe?=
 =?us-ascii?Q?lpq+Q5IS7pgb4a0IRbDDdO7uZT+bzmB67RctL4ceC5YXD4GwKWcEgF9+0VBz?=
 =?us-ascii?Q?w+Agiq5rR1RVecwRBNUwPtM1Mfn44QDECbDAPmKQj9JFpA/pH7vVtNTPzk1f?=
 =?us-ascii?Q?kA+WwKiRxjB4RjG5KblXtFOVABcWJqAXB2oGI3LJYFTMGMYml6UoGVgd9zwJ?=
 =?us-ascii?Q?nVg+mcwQY1C2f12KoKysoAvimpEbtxdehbW0Wh99egBWMMsU6XQmYyTSMtEh?=
 =?us-ascii?Q?kILHLpXSDDNYIQ5dsE+FvaOG1jq9HRnLAKWr7JV/i9wKAJgaB5lUuRDfGxad?=
 =?us-ascii?Q?2bERiwtRftFOASwIn/M8DhEKp3fP6dwL3X9POVWqEVpcDP4rm0LoYzXaX0KF?=
 =?us-ascii?Q?S+pVGHSCIYDfmLobn+KnpRHwb47Deq+s2N6SQr/qhleeur8HvMW14xqIvLLW?=
 =?us-ascii?Q?eGS+UmqJB7SML6qSvzdkmUdgV+002zFRZ4Ghw4beLNLpcvLYupAE7HRHGkMe?=
 =?us-ascii?Q?fpHvbYKrOPi+vwZpnu50ka3+O2AqahXI7WJ6/oLENWhUua+/sCH/NanJFHYN?=
 =?us-ascii?Q?i3CU3Ih9+9ptSMFi5TLyDENGfLWNXCuu+UaIe/f1UQDQW7s2r94TJPR7chDU?=
 =?us-ascii?Q?Mbqwr5UU8rMAOGZ3KSyoTBfmDptyjUYdSDIekBxbGloywzC3JU9OrBzZyVRD?=
 =?us-ascii?Q?Nn0JJEoQRp9wM4odChlwkI/6Xaszm0EBiJyW?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:58:32.5206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2932988b-7d03-4070-b1eb-08de3f415ea1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6341
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 20:58:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19379

Hi Romain,

On 12/19/2025 11:31 AM, Romain Naour wrote:
> Hello,
>=20
> Le 04/10/2024 =C3=A0 17:18, Ryan Eatmon via lists.yoctoproject.org a =C3=
=A9crit=C2=A0:
>> Adding needed recipes for initial testing and development of the 6.12
>> kernel for the next LTS.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
> ...
>>   .../linux/linux-ti-staging-rt_6.12.bb         |  9 +++++
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-r=
t_6.12.bb
> ...
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.b=
b b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>> new file mode 100644
>> index 00000000..9e5c4ee4
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>> @@ -0,0 +1,9 @@
>> +require linux-ti-staging_6.12.bb
>> +
>> +KERNEL_LOCALVERSION:append =3D "-rt"
>> +
>> +# Look in the generic major.minor directory for files
>> +# This will have priority over generic non-rt path
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.12:"
>=20
> Previous linux-ti-staging-rt recipes [1] used a specific branch
> "ti-rt-linux-6.1.y" obtained by merging the TI vendor "ti-linux-6.1.y" br=
anch
> and the preempt-rt v6.1-rt branch [2].
>=20
>    BRANCH =3D "ti-rt-linux-6.1.y"
>=20
> Since preempt-rt is now merged in the kernel 6.12, indeed we can use the =
same
> kernel sources with a specific configuration fragment (hence there is no
> ti-rt-linux-6.12.y [3]).
>=20
> But the preempt-rt project still maintain a v6.12-rt branch with all rema=
ining
> patches [4]. Actually the project still recommend to apply the latest PRE=
EMPT_RT
> patches [5].
>=20
> Should the linux-ti-staging-rt recipe follow the preempt-rt stable branch=
 as before?
>=20
> Porting existing project (kirkstone 6.1 -> scarthgap 6.12) using
> linux-ti-staging-rt recipe, users may expect that this recipe still use t=
he
> preempt-rt stable branch.
>=20
> Thoughts?

Indeed when we started 6.12 LTS baseline migration, Since PREEMPT_RT is=20
part of mainline we have started using a unified kernel branch ( With=20
config fragment switch) to build RT and non RT baselines.

The preempt-rt project didnt have a 6.12 branch till august in the year at
https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/

The development and hosting of v6.12-rt including additional on the fly=20
features is something new and i hope it continue with next LTS (6.18 as=20
well)

As you can see with=20
https://patchwork.yoctoproject.org/project/ti/list/?series=3D41242 , we=20
are in process of switching development with master and next LTS yocto=20
to 6.18 baseline and we are assessing how and if RT need to be=20
maintained as linux-ti-staging-rt-6.18 recipe based on the feature=20
differences in v6.18-rt vs mainline kernel.

6.12 combination with scarthgap is in maintenance mode at this moment.
The evaluation of linux-ti-staging-rt moving forward will be for master=20
and wrynose in 2026.


>=20
> [1]
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linu=
x/linux-ti-staging-rt_6.1.bb?h=3Dkirkstone#n9
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/lo=
g/?h=3Dv6.1-rt
> [3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
> [4]
> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/lo=
g/?h=3Dv6.12-rt
> [5] https://realtime-linux.org/getting-started-with-preempt_rt-guide/
>=20
> Best regards,
> Romain
>=20
>=20
>> +
>> +include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXT=
RAS') else ''}

