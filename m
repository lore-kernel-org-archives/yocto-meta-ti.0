Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B9AF4BB6E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 18:12:25 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26846.1771956736949405321
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 10:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=L4OBgcFI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.33, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUwrppV6jM+THBKLQsukmlZNktNUmtSPRoBA1679lBrPFoJQZRa8DSXwAteShN00nxjyXU9HVYmnE86+B7RGYwAGlr/0kUytYmM1MM3g+WXWfILY+lqfJ3YUK03RWQlGX3yTQWomtUyhY3UjrMM7zcBJW2H4OPNkAhrdi8cHw9IeE3kMUCmxbQAf33JaxHV4LhcbN7gMXKUA8acLKD0Fe8fsPjADV99QBPs2AWQ/jXqsfsGIvkvcQTkutt9Op7ddgr35pKJyv1hVMvI69NVRkCl4amJiNPZPVhl4VBkNKd7kN9bzeqfBhzWZdgRynqsFPES99ECb0UeHHGhKBaXMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjvZ5/y5N/FqT/PN7WUcI5u2JHw52An0r2oQwV3XHVY=;
 b=CwMJfMFiqOQhRssz8CZgFdDfe63WNJjDeDtuPtJMQpV9WuV0uBy3TQSSS1KDT6WBs7ybewiKljcEGWk9/l+Qf9rSH1HV1UiQKnl0b0n34qBjyDDr6w9Ot+duqAm24o0yXGVGzn6Of8UrOxp1jQ55JGr6r5l+LzdzQgX+LepZV7nAdffiOZZMODULE/1RLlXusCiJ0zRZuNIBJFL9x6Q4T2FfKr5M9zQ2nK+AJA8iMepg02WYut774bGW863B3b1P1PIU0wAV3UGFPGt8qXLSLmWMkPW4hbRKvzNsRhcX2JIUyh8wi+XGaDD2tFo7agAwBvU1GYZKctjQHL83podrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjvZ5/y5N/FqT/PN7WUcI5u2JHw52An0r2oQwV3XHVY=;
 b=L4OBgcFI4Kc1JhqZOdVgRTCfSMTeKKIsiFKh662XesFOHQ56RYQqOsLWFUq1aoryQqcoHfSNh7ysrjVqfHidZRr2V3T/uobSotcca1WBYw3NWWfvA6QhWafTHm/NqHaNiDlZJ+qgQwjPuDYd4y+rdfhEBOI+mulnMceYYtuwgzs=
Received: from SJ0PR05CA0164.namprd05.prod.outlook.com (2603:10b6:a03:339::19)
 by DS0PR10MB7979.namprd10.prod.outlook.com (2603:10b6:8:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:12:12 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::55) by SJ0PR05CA0164.outlook.office365.com
 (2603:10b6:a03:339::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:12:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:12:11 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:11:37 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:11:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:11:37 -0600
Received: from localhost ([10.249.32.253])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIBbcK3188607;
	Tue, 24 Feb 2026 12:11:37 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Feb 2026 12:11:37 -0600
Message-ID: <DGNE84W70NUT.2CHW91HOHCJ9J@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/3] meta-beagle: move all beagle board
 configurations
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <rs@ti.com>, <afd@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>, <robertcnelson@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-2-rs@ti.com>
 <98cd7118-98f0-459b-9192-ed22dd51f577@ti.com>
In-Reply-To: <98cd7118-98f0-459b-9192-ed22dd51f577@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|DS0PR10MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 75480c74-59bc-4c79-33ed-08de73d03b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T21FTEQvMU1hdEcyYUFKMmRUcHNHWS80dnBjTTM3b29HMGpEYWRlUS9IRGNN?=
 =?utf-8?B?S2NhRk5odktzcTNHd1g2Q29IV1psaVZsY25lSHZTSngyWUIyT1dKL1NvN2FY?=
 =?utf-8?B?ZUpFTTdlRlg0N2lBR21wRjdISk5qQmd5MXdGSmQvTi9SY25GRWhETVBURnVU?=
 =?utf-8?B?RWJRS0xwcWcwcVIzZ1ovWWY3bFZJcWNva2x0NWtseHdBOU1jM2VjZHcrSU1r?=
 =?utf-8?B?dCt2R1pnemltV0VpbldubDBYK0pueVVjNkhOVXJPS1VBb2l4ZGl2cE5ra1Vn?=
 =?utf-8?B?Nmk3d0tTR09QSWhJLzFzRGYyVUViR3VsSVJPNGp1K3Zkejk3TTlRZVZheFVO?=
 =?utf-8?B?eDNMV2ZLSnFWcHEzUjlIbzBGRnBTRVpwUzRRODVabGlpclhvdWttNHVKVzhy?=
 =?utf-8?B?TEF3UmczUGlneE9jREN5OTBlN3diZEl1TWpHWjhXNVZPanNZUlpDUXlYZUM1?=
 =?utf-8?B?SXJWZUMvTGk4TVY5dndOUkdkRFVERncwMnVkTUI2K1RyNE1lVlViOTdOcW1G?=
 =?utf-8?B?eHRBN0gvZndIT3lmMnNrNDMrSUs1TWJDWXJEaUEzVk5QcS9ybUVtWWxtMXJL?=
 =?utf-8?B?ZFg3bVh3VmJ1RzlNc3ZZSTd5dXNZbmpQZ0QxVFZUOG9TOFB0OVpoZFkrVm5C?=
 =?utf-8?B?VG5DclB0QTlPcDBpQlhSSThhdko1eGlTZTYrdVoyVEFqRTRFNFB2ZU9yTmZs?=
 =?utf-8?B?dGdjZW1wdFFCanRWUnJhajJJZVROYnZLR0ZyNHQ1aDBKcnJPdzMrZllwNGxw?=
 =?utf-8?B?RjJKc2RCWXRyeDNuY0tRTDdlS3VORWFvUERxOXNWaUtpUDdsYjNnd1AzNlp0?=
 =?utf-8?B?T21wOHV0ZVcrREk2MzZ5ZWNMaGdvY0hwSW1jOGlxVDV0WmVMWTJ6ZTNXUlpq?=
 =?utf-8?B?Z1FYcjFTYTRmQzVWYzRIcVVSYVdBeWFYdFhHbmdydlhoSVVKVWRzN20rU040?=
 =?utf-8?B?Q2d5WGgyT1Z2ZjFaNWJIRy9ubW55Wlg3bEZwTzJhRTl0U2JYY042aVBuS1BF?=
 =?utf-8?B?TkFNcUZ4Q3IvbVVMWndoaHd1RXJwbnJVbVh2SDNkR3lzOUkwZk9XL203dU1y?=
 =?utf-8?B?a01QZEJVWUw2bTMxelFmbUorNFdzZitkUU11MFNVVDVHTGdMd2Rqc2JNTHN0?=
 =?utf-8?B?alFhNWhYbGl1N1Q0aVpZRG5TdDNUZDBGdmdDcW9udnprTjhpaTkyNkJjRVVo?=
 =?utf-8?B?ZVowUy81M1Jiam51dS9RTTFmSzlySTFVODAwYWpERVB3TWltVzkxaUg0K2Q1?=
 =?utf-8?B?RUkrVlQ4UTdlbG9SNXFlTUZaSGVFVThOQThkdy92TWZEZkJxQU1JMDFzOTEx?=
 =?utf-8?B?OUhPc0JvVDZ5bk1iTGJIeERFb2RTdElkTjNwT0NvSmpkRkFNM2dqVnQ2MUFy?=
 =?utf-8?B?Nkp4VUJITVByaENXQ2ZjMDd3TmIxbkRzWkNKbzI5UUExSHNBTlpRWGQyTUY0?=
 =?utf-8?B?cXRpNXpFcWEyU2k3V0hOdVZkWE00R2daTUJUVnFKVjJFUjA5a0RoTCttYTJn?=
 =?utf-8?B?cEFvTHFOMHNIWmtOUWN6a1BSQlZQRDJaWmx1MXlNcTMvWFFRMExrMFNoazNp?=
 =?utf-8?B?aDhIY2NEbHVUTnVKaktIOTJ5NVBXcmFsSE8renlLMFp0ZHdvU1ZnVUs0Tlda?=
 =?utf-8?B?V00xQ0t5QThyT2lnd05sSWRlazdaR3ZoWVNoSEdUNUFXTE42Vlhqam8vQktx?=
 =?utf-8?B?WWszQngySldOTWw5eEJpS05aYjRTL1ZPREpUQ2lrUTdudkZkdHhUMTM3WGQx?=
 =?utf-8?B?TDkxSVlMS1RPbEZsWTJDRm9FWEtJbk5MSnQwSGN0dUF4ck1PUGJpZU4wTTZH?=
 =?utf-8?B?TGt6bzZka1laSUEwdk1vZUs4RVhNcXp5ZnNQbHZjR0cwN2h1NXI0TkovWTRo?=
 =?utf-8?B?QkdhRmNHU1FPZHRwcXZ2Q0NsVHBQZlJCSE1aTFJqcW1nVmN2TDRUdERDMFhj?=
 =?utf-8?B?Skd1SHZSc1VicXJlOHFLTFBXVlRoc0FhV2xqeFZJdmJ2RUFXcEtJTGZIYXpp?=
 =?utf-8?B?cUJJTGR1S3ZxT3JwVjN6Sk95a1BTbjhaVCtWeE50bkVqYkEzNVNtak5tRkZP?=
 =?utf-8?B?bG5LOWhBb1IvOUFUVjAxV1VEOFdQN3VVcGRTYTJ2Y05Jd2p5QkF4RTJrdmlo?=
 =?utf-8?B?MkNrVFhuMDJ4aUMwL05jY0JHdnhZM2l0aHpDUjYrZGtwblA1WXp1aVBHZTls?=
 =?utf-8?B?NFJuNFFHT0FnYjJ6OVR2VzNTT2l4ZkdJY2dabENtN2xHRUQ2dGE0enNRZE04?=
 =?utf-8?B?NXNWekpaaURiWmdyeHhlN2pSMGlRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wTULI2gyo9xfFEVrsz3Mt98dBGiBtRWYRaZeArBoRBpszRlVIY923Gjl0FBnQc2zlgrQ2lC7Zp32kUlHIVCbcnETRcZmOgfBN04kpa8DusATllJiXax0CGogP97UUX37SaJJmYNArblvTEOzBqMmnnoXcmmZxGq4Sz/OxaFn6U3gG6qlmw5LnbnSNP08FMIoiY2w2sKO8dbR7gAPPEp48cXvfwT62pnYEu5g2chxmGKr/3AmwZTUWehyqfW8PWbMDHP51fYbR4lqg1vuR7pdTLQ8Lm8TiuOhzLkT6VF2aFgvLjfK4QkaokGDeIMFRW3p4cLG131iWgHtDtzZRv1TCYJo69PVGxGRCsRyZ0sc3kRS3EYf45KPvU99KC2hedqaK/2twaAmwB3nolUIxnG6vnLiqXMU3+PJrDMpRE9AVj+LGjISruVbYl1mq7a5ahC8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:12:11.4868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75480c74-59bc-4c79-33ed-08de73d03b2f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7979
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 18:12:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19584

On Tue Feb 24, 2026 at 8:55 AM CST, Ryan Eatmon wrote:
>
>
> On 2/23/2026 5:57 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Move all beagle board configurations to meta-beagle. There are 2 skews
>> currently:
>>=20
>> 1. A base TI configuration setting all the default variables required to
>>     use the device with meta-ti-bsp provided packages.
>>=20
>> 2. An override that uses meta-beagle BSP components. This includes all
>>     the values defined in the TI skew as well as any meta-beagle specifi=
c
>>     configuration.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.conf     | =
0
>>   {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf | =
0
>>   {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.conf      | =
0
>>   3 files changed, 0 insertions(+), 0 deletions(-)
>>   rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.conf=
 (100%)
>>   rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3r5.=
conf (100%)
>>   rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.conf =
(100%)
>>=20
>> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-beagle/=
conf/machine/beaglebadge-ti.conf
>> similarity index 100%
>> rename from meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>> rename to meta-beagle/conf/machine/beaglebadge-ti.conf
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-bea=
gle/conf/machine/beagleplay-ti-k3r5.conf
>> similarity index 100%
>> rename from meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
>> rename to meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-beagle/c=
onf/machine/beagleplay-ti.conf
>> similarity index 100%
>> rename from meta-ti-bsp/conf/machine/beagleplay-ti.conf
>> rename to meta-beagle/conf/machine/beagleplay-ti.conf
>
> NAK.  There is nothing needed in meta-beagle to build beagleXXXX-ti=20
> since it uses the TI kernel/uboot.  So just moving it over there does=20
> not make sense.  I don't think this is the right thing to do.

Cool. I want a second opinion. Who the hell would look at a beagleplay mach=
ine
definition and not expect it to live in meta-beagle? If you bring up that t=
his
is a generic definition using only TI layers and should therefore live in
meta-ti-bsp, are we going to start adopting all customer boards that use ou=
r
Kernel and U-Boot recipes?

I don't really know what you want, but I know what Andrew wants is dumb in =
that
it manufactures a circular layer dependency. I'm not doing that.

