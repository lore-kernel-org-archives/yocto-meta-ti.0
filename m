Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716ABFA1FDC
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 17:44:54 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88649.1776879890853174621
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 10:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gooFzsME;
 spf=pass (domain: ti.com, ip: 40.93.198.15, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT9sxCiBqaHdAyB2hWPG9Q8m3XpaLUjgNFCFoMN6k0gTwgBmVsw87bj+mTWDiEfw5y7vM8SOtQrFP5U6nAhNdJAcz6wby9L+UiEhv3ZDy+ZlFg0ixqZ64GPd/pDq8QnBxK+cNjjOUxYG1NonA8N/4Q5fwlOzqynWl7WVq98JNOQEO+vHdxU8xrP47egisqf90mZ8qABCbr1r30VIFWwVe3hcxu0msU2C2ky+ZOlcccnkr2ZIK8C/w5pZI8krMplUuaXdqqUspaJpWGwl878Ep5sABPPMU76Gb0tN3cEKtA/PU7kzRZTlvUJSXWJFjURXZzoK1DCzoelQE6R3ff/tUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLqLJIO14MtVj05tCOy1DlgfX5N7N2yU6Jv0c+My/X0=;
 b=hmjncoYj8P0vIj6Umpy7MyiG3KuuW7GTFmCm4yowRL1/UNH+iUQk5Kp/B1JEBzh/fTIrjeSuFmQf+XkhtlupEIF8QQF1kcVgJCc9CZ9ZuL5ta+9sCAQWFkpiiSjl4EuF991PZ4FfyRbuZyrcuDfHv8fElFvoJx/sW49oP6rCh7Iy5R9eWi5fsu+DuT7CXk4AoY+AEdsXuO/xGwx0B09AZJ0Czez6i1K8qWU+s6zpswuyohYIMWgLk1UdGf1GxTy+xpZe1JvUJhUGZvIzSOof7DyIEWFTAS7TCrHCA6XKdz2fdgIyf1Ay0367CxUslBrm4B4oCdOs0VxbaEqzY3OTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLqLJIO14MtVj05tCOy1DlgfX5N7N2yU6Jv0c+My/X0=;
 b=gooFzsME1hhkBh3U1eDVv5dJpAzs3BkX07lgiiIimuY2rhMfQlzsSM5M/4cSePbzp+WK0TAU8Drg/AbSSXGKiQGLwWumFyn4fdTa4w8wXJkLyCzN9f2MiCggNarioCi92E2LqHTqR8Mxkye1e9g38GaeiswVNJJU32VIG2cjjnI=
Received: from SA9PR11CA0024.namprd11.prod.outlook.com (2603:10b6:806:6e::29)
 by SA1PR10MB7830.namprd10.prod.outlook.com (2603:10b6:806:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 17:44:45 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::7b) by SA9PR11CA0024.outlook.office365.com
 (2603:10b6:806:6e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 17:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 17:44:44 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 12:44:40 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 12:44:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 12:44:40 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63MHieIR2595157;
	Wed, 22 Apr 2026 12:44:40 -0500
Message-ID: <34b97b71-e4bf-4cd8-ad14-2aa909aeb4c2@ti.com>
Date: Wed, 22 Apr 2026 12:44:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] am62lxx-evm: Override serial console to
 ttyS0 only
To: <gehariprasath@ti.com>, <y-hegde@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <rs@ti.com>, <jm@ti.com>,
	<reatmon@ti.com>
References: <20260422062227.4098420-1-y-hegde@ti.com>
 <1bcfb891-a9c4-4371-9ccf-3bdec183e4e0@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1bcfb891-a9c4-4371-9ccf-3bdec183e4e0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SA1PR10MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2b6c89-b3c0-4fd4-433a-08dea096d743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|82310400026|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Y5Qr5LfK4U7dij1bGSXeKvkl6c7mlu/LSl5SLsiEN4oKH0ryagYxAy/ynBJYIGe5vh11sKDPfq6psBRRo6JYJq0QW+KH2rh1HvNN6U6wxGgdRe22hRrh8jFBv/abd4Z5BHbg01xxTbl3wf1yLxu4A6vGCgEd2lFBgyNPFT0x54UzX7pfD+TtYbATdhe9WyHcrvFSr5/qtBo5h6ZL4uSeIWN/tErwUo7YhAaJnHa05fNLeH/vq1qz+6dZfM0DV39thDhueZZjPdqplvu13Ap1FvJPLI3qzZui+oJuFFKJxMGS3Cjt90tLNqHn2bPPd/KOxZwtzpfpN+gEqN+lMmle/bKQljFvJDzhK2lCxdMb2v37pjNXwoo9vHIwQbqr4PY1ODSCqu9UfiRQKvbBV0WfdMedDBkwFXCqP41DRpR9vH7WJOnSkBw7DE/1QWvFQxYG0YrZkm6owLxE9UCZzzBbFRU5wpjvq1eBBIRcHbST1weGHCjKj87PvXg+dDwhTcTaBzfkmNovIaF37+znQ24mj10rrLYjt36LBq/2vGgrxLtnfDyVIVvEy42BMNosnLfs1NX3XZauTYYUEGXTFUscp9FDWZc3JpAvMtGzUGYdkYOdVqhxCGbT/81fM+FsyokLMi5ZMLXqR2kvlDXim4o4Z3VKnivcMpkbKoundi2v195B8NPgo8yDxCY2tPgzacO+dJdZsi5FhAtnyIj9yv7CPbp/dmxPo/rGX3/V/yL5rYM=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(4022899009)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vI0tYakzeufchw6rLobIe5gEa4o6UB6PTHRNNVsRP9mEkYOq4KGng88ZR8wTI471So4y9RYlc5pzKPSA9gxRbUbCuj24dyb/NUvPgkHwchHe1m3DMeCcAlF+wQ5LGeukmmSAM5COU+xB5IgK6y+m8QeaVoFf2gFndEJDe9K8zF0Bezaxk9+XbVm64kNzZoyIV7e/N+OUBiZ16a16KW9yWBEwMhRou/0E61zk9OTj0MQGw7Afh7nUfnIjxOXS/l61WqqaVmM0SVt3tVqrz1/KmOj14msmcyxKL6gpCZ+RGbtA1B39ztl5Wu9r0W/EdGMdxpvtvU4S9kc1MlKrcwICclWJQPqmAXvcPuBXn26Gg6FXtJz+tDWcgfrHOwAxgD7k0ZWcAdyUld9OAauhk2Wilr7KH/6RNF0OIRMMvQ/o/BJmpiTbAYroI5dEhKO0IGZ8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 17:44:44.9504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2b6c89-b3c0-4fd4-433a-08dea096d743
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7830
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 17:44:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19870

On 4/22/26 1:53 AM, Hari Prasath via lists.yoctoproject.org wrote:
> On 22/04/26 11:52 am, Yogesh Hegde via lists.yoctoproject.org wrote:
>> The am62lxx-evm board only has ttyS0 available. The k3 default
>> SERIAL_CONSOLES inherited includes ttyS2, which causes
>> systemd to wait indefinitely for a console that never appears,
>> significantly increasing boot time and degrading user experience.
>>
>> Override SERIAL_CONSOLES to specify only ttyS0, allowing the boot
>> process to proceed normally without waiting for unavailable consoles.
>>
>> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
>=20
> Assuming this is only an am62lxx-evm only constraint and not at a SoC lev=
el, this override in machine conf looks good to me.
>=20

AM62L does not have ttyS2, so this is needed for all AM62L based boards.

So this might be good to move to include/am62lxx.inc.

Andrew

> Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>=20
>=20
>> ---
>>
>> Boot time is increased from 33s to 2m18s.
>> Boot time is measured from power on to TI LVGL demo
>> running on HDMI Display.
>>
>> Logs:
>>
>> root@am62lxx-evm:~# systemd-analyze critical-chain ti-lvgl-demo.service
>> The time when unit became active or started is printed after the "@" cha=
racter.
>> The time the unit took to start is printed after the "+" character.
>> ti-lvgl-demo.service @1min 32.588s
>> `-multi-user.target @1min 32.577s
>> =C2=A0=C2=A0 `-getty.target @1min 32.575s
>> =C2=A0=C2=A0=C2=A0=C2=A0 `-serial-getty@ttyS0.service @13.002s
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-systemd-user-sessions.service @10=
.847s +660ms
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-network.target @10.58=
2s
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-systemd-n=
etworkd.service @8.748s +1.799s
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 `-network-pre.target @8.735s
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 `-iptables.service @7.477s +920ms
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 `-basic.target @7.363s
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-dbus-broker.service @6.661s +466ms
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-dbus.socket @6.310s +434=
us
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-sysinit.targ=
et @6.263s
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-=
systemd-vconsole-setup.service @18.198s +391ms
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 `-systemd-journald.socket @2.781s +335us
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 `-system.slice @1.282s
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `--.slice @1.282s
>>
>> =C2=A0From the time analysis log, `getty.target` takes 1min 32 secs to b=
ootup due to
>> serial-getty@ttyS2.service failed. This service fails because there is n=
o
>> hardware associated with ttyS2.
>>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/con=
f/machine/am62lxx-evm.conf
>> index 677d6955..edfb4057 100644
>> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> @@ -4,6 +4,8 @@
>> =C2=A0 require conf/machine/include/am62lxx.inc
>> +SERIAL_CONSOLES =3D "115200;ttyS0"
>> +
>> =C2=A0 IMAGE_FSTYPES +=3D "ubifs ubi"
>> =C2=A0 MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 12000"
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19864): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19864
> Mute This Topic: https://lists.yoctoproject.org/mt/118950880/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


