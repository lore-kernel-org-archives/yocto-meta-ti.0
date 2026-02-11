Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED72EEB5967
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 05:15:24 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12408.1770786915755439257
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 21:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iJDkQRxD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.71, mailfrom: m-chawdhry@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJVDTTT4JWhCG7U3YVHZhOOgjy0vAOwibz55vexypDNwo5Qr069WpCnN7ykVCYAxVoLcJCVS+U/ifLnUyfR6r4ZZkSg4dLOlHHcBgltJBtY6b6Kns6SvB1tz3PynHyZ0K4yjiJ6WmMsLIFhp9+zxIsQCeWr55MX+mASEpMrmv+MGWhctQMaXGDOfe+4KYOouSkEsdy5ZIyNuf98fUhk15IyV2xOciFPQfsF7/mL2w1fs/rhCfR2hL6GRtyD22rDtC0YoHdqROT/7PI6orYtOXXZPF03ZmpkC7HlG7zpxUfBu4krIGOozvpi/FrRJEvGsHiCRAAwHJkZK3V/wDQJDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeSxXlQwkMljFDdMOglbInrJRNO0UM6/rnmz2eQQ17k=;
 b=um8fnxXM1IgQi+a3VPLcNnsKf35gZdEaJUcc8Mt6XNAKknTskRJJqFoVMcYmMg7ByYtSWoRsI+vvRjt0odssZe9z7lDzt6ppLO0TqhE4e7+FY/9DkK04o2KUmlYkpGvgeSSRSIYJnmcvWisD7XVcBhckkDqpZy+tlVU/g1jZM08mKqPIlWkpXyh45kmqw0l1BA7z9YSYe0scLhsbqXGLtXtOuzBq8TE85nfmADP3GPocxOh0r2WStYfuCY3fyJkeo58xN6PDp7Bc2mef5Mf9xaMsi2GxKpXGquW3B0aI1DODt99wTFp0NgalWrxHxFhERJvSJdcmaiwCO1Lv8npd8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeSxXlQwkMljFDdMOglbInrJRNO0UM6/rnmz2eQQ17k=;
 b=iJDkQRxD9f02ZdoTGFJAudZPdGYLT4oaBn+Du6DetgHyPrmpKG+4VpnyNw9QxSJJjQyllvAZ7TD4Uql0GlPBI//4hGOV2PSDQBN2GkbNuhvnub5uR+eac0LkopKgQHvaJrfIx9Teo+XKIeCWVm7MMnUVb1RWOZmHhNwh0k1jIaE=
Received: from CH0PR04CA0054.namprd04.prod.outlook.com (2603:10b6:610:77::29)
 by IA4PR10MB8469.namprd10.prod.outlook.com (2603:10b6:208:561::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 05:15:13 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::ba) by CH0PR04CA0054.outlook.office365.com
 (2603:10b6:610:77::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 05:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 05:15:12 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 23:15:12 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 23:15:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 23:15:12 -0600
Received: from [172.24.27.39] (ltd1nqfk3.dhcp.ti.com [172.24.27.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61B5F9A61048151;
	Tue, 10 Feb 2026 23:15:10 -0600
Message-ID: <a7f05551-8180-4430-a9bb-652625b88b9b@ti.com>
Date: Wed, 11 Feb 2026 10:45:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	"Denys Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Shiva
 Tripathi <s-tripathi1@ti.com>
References: <20260206054157.1848713-1-m-chawdhry@ti.com>
 <59e2acdb-b42a-4fa5-91a3-4b1d6b48bafd@ti.com>
Content-Language: en-US
From: "Chawdhry, Manorit" <m-chawdhry@ti.com>
In-Reply-To: <59e2acdb-b42a-4fa5-91a3-4b1d6b48bafd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|IA4PR10MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed8871a-0f07-4a1b-4b7c-08de692c88e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2V+ku0FLIoHklD+lCrT409fA2OoBqo47frdqQVlrnC5lUPLEfn5CtCu1JeH5?=
 =?us-ascii?Q?s/OPjt4D8J7LqlsOAxg/CgfY7I/+AuqnoER7kAWtv1OXTa9TUfDnT4nSc8ED?=
 =?us-ascii?Q?8xEl3s7i0ChDOCOmYojltPWd0d8/gLVT48sF+26FmOYNLTMgS6RSNs0CO/0S?=
 =?us-ascii?Q?5JJ1PTWxFTf/TEIxHNu0vAFFhS9dzpfjIaWFnj26IEvrmjV/OcnlGCyySndH?=
 =?us-ascii?Q?lTNmWcKvSA3f5d1VV4sQ7seFH0EWcosfmDOQz73moyvU/9GAMs8Kn3jJUCSJ?=
 =?us-ascii?Q?nDt8B/U5eqMi48NA8C0KrKe+bvwEcVG5HayQdRh4fZB91uv93KEw+sF+DLE0?=
 =?us-ascii?Q?jW4HqBZw+j8bEZhMxNizzi/07ZcsSuOMPMEJmU55VT75cgOcfIinR0cirlQl?=
 =?us-ascii?Q?GNUL6BCTDzBR1TMlMc+hgrAA6nhZFLmfs0Bbfe+YK0qBnxASFn1pqXs+p8Hb?=
 =?us-ascii?Q?6pc9DV+XdDg4uUy5ZVwnijA60Jsd9RfYx0JraM14PQXnPSEdco5Y2JvAZx5h?=
 =?us-ascii?Q?AxUhlx0jrBzNb8r8zpnBddHDqJbuWZuuLW6jGnfkXncHdjSL5ptVn8Pw9Dxk?=
 =?us-ascii?Q?5qevdMx5EqRbAx1Eu3QZQ2Q/tdFlaMX2JHxusls79eIkSMKYx/9aDsdCSh5D?=
 =?us-ascii?Q?vWYGOLncOGT/46Riq+B2s4zmR1XrPLgRJ3F7x4m5Y3GyXgJbKL+6m0IIhM0I?=
 =?us-ascii?Q?YWAO1icYwwwunX5M0e5rCsG7PYLOzSnJV/lRLqi6PiSYQibtu+x4WQzJH1M+?=
 =?us-ascii?Q?/5R+S8zxwt9kYNXLuo21v5Y6zc1DKbiMMwCWPyifLgI/3WIWOjnw3hPd8Ubh?=
 =?us-ascii?Q?ncthGWiejqzjZCeaTqXp/EWhyRZqRHuN/5qd0IFrxh0PzOc7sqjCKXwgAEft?=
 =?us-ascii?Q?Mz6wMsWEqt1ZGlnewD/APxXTuOsusFeROnpNKWq2W5R+GbmumLKSzLI9l+Uk?=
 =?us-ascii?Q?BVonVK1c+DEtNumb73tNiLdTguDh7MoUg6uJEph7YE8sPef5+tXhLdjEnUJv?=
 =?us-ascii?Q?o5+dTc4mOQyCOoYAFSSKCnzeDWFR/k+ih/NB/uMkq/HKnJZM5649H8VlotCS?=
 =?us-ascii?Q?XVfQkejqOF4Pne39u/Rnxcdv5caAYBVQcKXIs+DXDvqk2nE0mzvwxqYbatzX?=
 =?us-ascii?Q?kszvPmzfG4890YRRyLnfCk49+zUfEZLbKtPWwCD4uIJHr5+VGDGn3qSW2cLR?=
 =?us-ascii?Q?501EDvjyLn7imcecK5KzJnOTvcDJRS832wQQDbctec0JKZr6MJyX1f4hHTbd?=
 =?us-ascii?Q?1iMdZYLDRK66FAL1HYkaYp0EU/jlRDnHmSQngYSvci4+VeKADLZ2VDrDwM1S?=
 =?us-ascii?Q?pcsJfj8nrKmhStC3453u8NVS2DU3QdptiLf1gAtqOamHjDogpe0IhaqAmRhe?=
 =?us-ascii?Q?Cb4FiEwLmLNw/XNe/cHWv0NLaEhgUpsTrfwyTrYo4rcLypEbZ4H6lHCdKPVx?=
 =?us-ascii?Q?GqbY5+ut79YhLlgl9rYMbbZZb2ZwGQVsoAqFtaUbAw1KlFqfH+Nlyy+JmyhG?=
 =?us-ascii?Q?qGCKbuagLHuvieABjoeD6mpzCPYonYJ2Vj7yCQmcHTLHt0/nG0a00qwoDmOD?=
 =?us-ascii?Q?TzGJoO+pOQOgdKR/3o1DB7+5t1jyfDqWVgTaxx6IAqUYTjH3ybjiSe31yZDt?=
 =?us-ascii?Q?60ojRMEHucVDYCFNAZI/h6SUnFbmej2zBSWQje0gkOOA7ZLuT4KuQqKQMFvq?=
 =?us-ascii?Q?RQkQbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CUZq7APRbUOZjcRPc4Lh6mo1gj3TRrnLAuDLsWw8rbF4mZ6AjyPOBtxuQV9PlbBgMce/Gb82R1L2cjDtDS8MqOCmBri1ZcKv9nGn2/qLbQsNAAf8g2lQ+2MdiiRM0CAOnkCcXY6VRyxIOQ/n4SPEctLSuQtzU8GsFUG7dtSoWuNqSOV1Ic6cYKrlw1nvRFEF8DZw5ixe5DBsLB4fR/WwuGcg5BGN67TX4JT1IbDTjm1wTM7EohUQOLI1MzP2/6gIGrAuadMLObqJ1BsdhLfeZ0lPGzf8J7ykoQfgCgbDOCjOHp1jcLTlJoXe1JOegcRDcxPPPXD/FyoueEqTpv//jJRZTQZXLxT8iSDmwAX6TDDibD4oanw8ckiJ6cMhftJ3zyo6iFzIURNyZChk87I59UMF9ALm56TMWdkUTZjBpoFIYaowb5xn2xmbSAuX8Mt8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 05:15:12.8472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed8871a-0f07-4a1b-4b7c-08de692c88e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8469
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 05:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19481



On 2/10/2026 9:44 PM, Ryan Eatmon wrote:
>=20
> This fails to build for scarthgap.=C2=A0 Did you do a test build?
>=20
> It looks like the SHA for optee-test is not right.
>=20
> There is a single letter wrong.=C2=A0 Not sure how that happened.
>=20
>=20

Ah, missed running explicit ones for the other recipes, somehow=20
misunderstood that optee-os target would run the tests for all...

Would send a next revision ( and try to fix it for master as well )

Thanks and regards,
Manorit

