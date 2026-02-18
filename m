Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DEEE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 20:26:41 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.863.1771446398506273085
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 12:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=bR/nS3OH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.13, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBXYyqVTh43iUvrpo63zSgtKJ+zVqnrjSKHBhg9OcSCETMooxviYPpyQ4BQOqbZxE1B/uzY/RFNtanUVU7wb6+C6wPbJ1VtvqTDwZMwWBfQUbr4+sQ750mjheJHbkPP/YyDV+7u/Kt4xACZA/eeYU6yYwSBqaUn2OyATkuTl9fGJLFRX4YneqRVV4RpwGm0iltq+mxYcr3LkCo95uPlwPiCHN29DVFgDpfRREksJA9c7wArVx3nD2WraUVsvQ8GvXHPNZ/JSfIexPJfqRDD1W4T9Pmabl5aVhW7/77HDxYba2EeXTO5y9tX23dEv5t+574VVY+iS/WU7FRnUGn5DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sHCzw1TLkQBSAUSQGQu5dMUIKDLK7UuAc23DUZW4mI=;
 b=P0UA57ChUhwm/ULDjxOEhuTGKtGVHBj/tHcxyYoAJ5qoQ+TE0ihyiy9UI650ZF/l1AWlAvfM+mMy7pdfOb26DjTdW9+m0lw/xQGhjnK8ePzvA3F6tO/j26jenKOheNqrS0pJ6eQsBt3T4irzpjdufDSBUOQK8AVRqmj5rimYezti037vUks6j3vI/DssDi/O2JnbU6Roh6LTUTqNB2vm5gzrdXAmp04F5SwhCMhoVdzq9QjMuoKNq0O/7bcJQhLeIvpOEC22nJ0utrjnDzBD7pQbKryHpOZkiKicQgNbI09S9Dsp5cxSsMEvauEL/lklRSzDBnpxRc+exW0tSTKOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sHCzw1TLkQBSAUSQGQu5dMUIKDLK7UuAc23DUZW4mI=;
 b=bR/nS3OHY0qwFQob8aRetxQmPNlRG6uv3y8/8M56rBQUVX/D6fnHyG2U1KBeQD4unWCAnSpq/eI0q6crVfzFweZmqy9BjSwy81qJSlD68o6bvU7/+SW2Ml01J7Rknr3KlZqjv2QGn3gOiV9LBwmiwoJyP7oeQoTK/m8SVP9yWPQ=
Received: from CH0PR03CA0239.namprd03.prod.outlook.com (2603:10b6:610:e7::34)
 by IA3PR10MB8017.namprd10.prod.outlook.com (2603:10b6:208:512::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 20:26:35 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::7) by CH0PR03CA0239.outlook.office365.com
 (2603:10b6:610:e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 20:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 20:26:33 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 14:26:32 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 14:26:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 14:26:32 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IKQWRR968088;
	Wed, 18 Feb 2026 14:26:32 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Feb 2026 14:26:32 -0600
Message-ID: <DGIDC68RNEK5.2JNKHZBAO1FQP@ti.com>
Subject: Re: [meta-ti] [scarthgap] meta-ti-bsp: ti-img-rogue-driver: Avoid
 TMPDIR in debug paths
From: Randolph Sapp <rs@ti.com>
To: <w.egorov@phytec.de>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260217094614.1925493-1-w.egorov@phytec.de>
In-Reply-To: <20260217094614.1925493-1-w.egorov@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|IA3PR10MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 475c2ac0-a5eb-4317-7d2f-08de6f2c0237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UHduekZBQ0VRdGZXaXB2UmFmUUNkY0pFSklOTWQzV1ZUck9HeFRFOCtNZklQ?=
 =?utf-8?B?WFRJcmJQREovSXp6VG5rVERWNjJPSXdGM09ZRGI4bWxkdHd3Mk12d3pwbEcr?=
 =?utf-8?B?azFGbnpKY1UreUNHeWZkNmZzZGtpU3pheElWZ2YwOUtIMUlsZm9VdGVKTlhL?=
 =?utf-8?B?aWM2b242ZnRHRlRPQkdCYUw2dGpmRFlVb29ZMTF0RWw4ZmthVUkvcGdIRzBM?=
 =?utf-8?B?SkRsZTJoSTlibi9yVFNaWEhGRUJ6NnB1UU54WDZ1ekNlb3FPbllYYXZpbGt5?=
 =?utf-8?B?VnBaQnJXdEdKSmNOcWJkc3ZPMlpGV1lOWTF2Z1ViRDFmakhkcU5qazNyNE1L?=
 =?utf-8?B?SkdRVmdwNW1nZGNNVEJ1RnRyYk1FWXI4NzJXOWVaZk54VDdhNGJ0STZ2QkJ2?=
 =?utf-8?B?MjFuUUFGeTFOSVRKTmNQWVByMWZPdWV4N0podkxIdXBEU2h2RE95bTZmVFli?=
 =?utf-8?B?S1J0TlVvS3dWd0lub1F0UytKNEZYVmVVR3puLzhPZWZwdE5CTVc2dzVMZ0JH?=
 =?utf-8?B?TEVkL01Fb0RHOU1weGtaeGtJT1dYeGhqakJPZDVMVVBaVkNvVVp1QmQxSG04?=
 =?utf-8?B?bjJIL1kvRDVyWHhRRFFNaGZEY0VFQ1o5eTZBVjhlbmh3S1dMZDRzOEZHMEh5?=
 =?utf-8?B?NTJ3MSs4YnAzK2FSTVVlbWpNR2lNM1ZvM1Nwcm5mUmhjT3N4Z2EvYnRSRXN5?=
 =?utf-8?B?RVJsNlM0YTJaQmZtRk50Z0R4c1I5cUsvZlgwaFlCVk5LajZXbm9kYXVUWmVR?=
 =?utf-8?B?NFZTaWlXQnU2MWg0UTlSMlg1dG10STcrUndva3k1S1JCWGN3djkyOHQwMGhL?=
 =?utf-8?B?M21yS1IzbTcvdjFJaklyREtCRlRncm9UZ2IxdUx1RGVLNU4yZngzUE1RcHdi?=
 =?utf-8?B?clFxb2k2YXo2SDRxSlVxZWVPd1VGcFFKY3JzKy9uUEgrTkhEVkZDNXh0NERw?=
 =?utf-8?B?UXVpNmcyMmJuRWtad0gweXBPekhlMEdZY0ZVM2JxVTZmWU5mTVFGZnBUamlm?=
 =?utf-8?B?NnV0M3BwTDVweWMxV0hRY2gzYWJtdXpib25YNys4VmE3d2c5Y1ZWSjQ1dGVY?=
 =?utf-8?B?MnZvUG53eElyUUxxcjN6U3BvR2kxN0VnRGRReWp5VVlQVXQ0ZUhtNyt3bmdo?=
 =?utf-8?B?c1RWSEJPckcvNGhFTmgzZGZ6RzRQQW1mZ2g2ZzZ1alcvcUZ5UFFhcFpYcGZV?=
 =?utf-8?B?Vyt2TE90VHZCLzRtRWtHUFI5dk1vSW51K1gvWTFES2xRenpyeUxLaFBmbWJz?=
 =?utf-8?B?K0Jrd2Z3cnRUaWR4SFZtaHN0eXZKcjNnSmVHaHVQbko4R2dMZm9VNGtvaEpE?=
 =?utf-8?B?WWxMd2VYOFpKN3Bqbm1sdkw0N05LOFJlMHY3N2UwdDRTZVp1bmdROUlKVGYv?=
 =?utf-8?B?MzdBa3VvQ3l2L3p6NFVUOXg0OFVibE1kMm96dExsaWNBMlAzRFoyWTFJL0w0?=
 =?utf-8?B?ZlI1bW9RLzNVUnZjWFAyQVcrMEtHUDR5TmJRaktwaThWblFJUHZoVTBDVlp6?=
 =?utf-8?B?V1NGZWtVZEdXWXE0b3hrVFN1dnplRXlJYWI3MGZ3WjA0dHdIekxnSW1pd0Ex?=
 =?utf-8?B?bVZXcHBKR292RmVrN3JUWFVXVFRBZWY3Rm5qUUhQYXBEYjBqeURMQ0MwcUpx?=
 =?utf-8?B?Q25vOVZFL0VpVU1EY0lLbWN4R1pHd1dLTWtrRS9DT3dQSVN3eDBaTmdQM2pG?=
 =?utf-8?B?NXYwNmoyeTRneDBCUWkxVlBMeDZxa0FydmM3aDFleFdiOEpXdWJsamovVUJo?=
 =?utf-8?B?S0xubllrU240aWgwSGVZK2x0WlJpUzV3aFkyV0VTdkpOblJ5ekJyT3pCSFFP?=
 =?utf-8?B?c1pmNVA1d2VLaU5DMDUwK1FTd0NVYk1NcDYyU2c2VTV4MzRoUkVuWlRDTzNX?=
 =?utf-8?B?bitsYkVLNFYwNFI3NG9VWlFnWTFnbC8rRk1KUlp6REF2eTFtVGVwTjdpaTI4?=
 =?utf-8?B?Sm1hQUpzOGIxNkpxcVczcTRXRXFSWEM0UlJBN0QzVFFaSDFMdjByT3R5SmR6?=
 =?utf-8?B?dXNHTy9lMWNrVzRDbWlRNy9TTEc2TU9oTWk3L0lVSkxJOXEzYkg2TXEzT3Z5?=
 =?utf-8?B?R2VkOW5qRGVSdForNUhIbjhvQnk5eGJyTjRLOVhwQ3BDbEUza3RMKzdLaTlI?=
 =?utf-8?B?WVVxZlFiN25yUWZ3ZzNZbzJaVm82eVRobVdJUVdoc0EyTzVNMVF5Z3hZdEs1?=
 =?utf-8?B?NDVhSjQyeVBhTE8xdUVGbERKQ2orNkttcStwMEtNSUtNWXgrdHkzYTNyZ2Ur?=
 =?utf-8?B?TmF6RDhURmlmYzFkc1JzNjYxc3BnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lHgRCcqQw7+56cftJ2CD0Rcjh03Fq0aHf0YripxpeephEeO9DLoMUJfzVYhmVVQIBCQo1mjQVrPLni+U7/h9NZazm+w3tSO+X8T/VCH+gjUMMX0/ms9tmIb1qaphwH6Vi2AqmxJgauNwT4+Kcs1675CaKKKZ7KT/591D5hVBD9pS79cs+kldIGk6HJhkbwpRLRonDdF6a/X/xsWBhr1ePoAMzY7dCFkS1ILOgPCqybUEdE9gVsqdtVuVblD7gF79+RV+LvTtbtwegHi9bZMpair1iQYC6osXFEDfhBrJPllwpI2+AIOxNO7EDTrqJQKmKOSQSDfWpV7J3u3Hz8PYI9QkOYJSwFmRC1zleBdDW+9c1sHZewsOYSr7raBtsTfGhxdz9njvCFhOJHPK+ZUAV8iG4ZIXgOJClAqsD5O35aHF1oqw2JgSuVQ0NJlR70F3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:26:33.8686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 475c2ac0-a5eb-4317-7d2f-08de6f2c0237
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8017
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 20:26:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19543

On Tue Feb 17, 2026 at 3:46 AM CST, Wadim Egorov via lists.yoctoproject.org=
 wrote:
> Build module with KBUILD_OUTPUT to avoid TMPDIR in debug info
> (buildpaths QA). Also bump SRCREV to include upstream path/prefix-map fix=
es.
>
> Fixes the following warning:
>
> WARNING: ti-img-rogue-driver-25.2.6850647-r0 do_package_qa: QA Issue: Fil=
e /usr/lib/modules/6.12.57-g7af20799-g7af207992070/updates/.debug/pvrsrvkm.=
ko in package ti-img-rogue-driver-dbg contains reference to TMPDIR [buildpa=
ths]
>
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  .../powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb  | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
25.2.6850647.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driv=
er_25.2.6850647.bb
> index 0f50026a..54c80480 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.68=
50647.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.68=
50647.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue=
-driver.git;protocol=3Dhttps;
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV =3D "a838ac0074db640ebd1b64be6364417b1bbca3cd"
> +SRCREV =3D "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
> =20
>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> @@ -31,7 +31,12 @@ TARGET_PRODUCT:j722s =3D "j722s_linux"
>  PVR_BUILD =3D "release"
>  PVR_WS =3D "lws-generic"
> =20
> -EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUI=
LD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
> +EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${KBUILD_OUTPUT}" BUILD=3D${PVR_BUILD} P=
VR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
> +
> +do_compile() {
> +    unset CC
> +    oe_runmake
> +}
> =20
>  do_install() {
>      make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PV=
R_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_pref=
ix} PREFIX=3D${STAGING_DIR_HOST} modules_install

Worth noting that this is just a backport of some functionality provided by=
:
a349aed7 (ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2, 2025-11-=
17)

It should be fine. There were no functional changes to the kernel module
function between those two SRCREVs. It was all just Yocto specific build
modifications.

Reviewed-by: Randolph Sapp <rs@ti.com>

