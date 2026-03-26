Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1BE109E54F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 05:07:19 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40969.1774501629286699792
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 22:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VM1QarI9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.38, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIsQmCHC59A1PFTfmvaYcajInURVVcGbzUydHpce8hvLDmz6XllTwkMV6SWMoEbbL1PgBk0BLkWotmlMTgP8TR3Rs2J4X6cwuJmm/zsYLX+hrFLAqEmAqtVgSkRgILynxm9m5Ghi1yQS4VIcvDArUVtUhDqCTpQDjXQ1A68h7cN9V8hF5GrSwsMsxBpsPGId8MwhLEwUnlrjGq8Fp/RrK0hjEUczT2G/hBAZXMrwpDBl4Cavh8QXZyE5ChXQ/9/NgCjLzKJRBLTgTTQjlI7ou8Oj8VJ6g4pkIveTqtlUtKHmpzBXS/PFDwQMGl9lwv5ckxLwIzRxjzMDXYM9CNsxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUyYKV0JwEgSDb3hc2h3W1x7Eq8y6qcvEbv8d/1K15w=;
 b=gwNRMPdDXTRxZpIh/2ryA6n5WmX9O0F+deOOEBgi3mz9XxETuIVbYo3rvUxDG57VY9UDF8GSL3NqMtqzGtC9Y8d3uE4kMryVHeQUwerobO1i7UhQxh4Ym6sN2wQFRuUE7Bsfy8fMI8+OnN7yQEKeSn8a7gMfxIPAp5wcJTg0o7Tkw1PVfTAFjRhU1zpsZNAZAy8609aUZzjyTP8T3LCFTh8QjCOQJ/utfQ5rVN05XeRD8zSZGqQr+O+vM1VMWki/CxeMJtRDo/rXa5p52QIS5FosK6OIv37MIL2qXVd3d1MpVLzw7wqgS4D1i6/MJCBGB6eMe2WPG8ZFcc4lbjKwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUyYKV0JwEgSDb3hc2h3W1x7Eq8y6qcvEbv8d/1K15w=;
 b=VM1QarI9ZloP7pMl8VwjhJmdWTjay2yQ18y7Pndd+3kU23JGH3H2iCItHu7Jvp6T7a5BPsQ0UGSDmpIDXE1gNN23EIVFM7kDN/coYSiCgl8QlrhZ5vVVhwZyw/eUAR0G+R6AxJZxR/XlJNILbjIAi1BQXSybOqkpuyOCjCxek8A=
Received: from CH2PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:52::34)
 by DM4PR10MB6885.namprd10.prod.outlook.com (2603:10b6:8:103::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 05:07:06 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::dd) by CH2PR04CA0024.outlook.office365.com
 (2603:10b6:610:52::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 05:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 05:07:04 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 00:07:04 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 00:07:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 00:07:04 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q571rT1534964;
	Thu, 26 Mar 2026 00:07:02 -0500
Message-ID: <01189ecd-02d8-489c-8cc5-fecb3531c88c@ti.com>
Date: Thu, 26 Mar 2026 10:37:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] packagegroup-ti-core-initramfs: Remove runtime managers
 from initramfs image
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <anshuld@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260325062856.2664785-1-m-shah@ti.com>
 <6f06cab4-cafb-49b7-83d1-acb73d2aced8@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <6f06cab4-cafb-49b7-83d1-acb73d2aced8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|DM4PR10MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 1993e6b6-7e11-4d41-3981-08de8af585d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	fpa4r9crlced5SNZE4NUwyJlY0bKepCxe5QVqbD1KmGTgZYapmD734ph8X/mLzc6hg59pi3Hn56PoASYNYOyrplTp70Tm7hXPo9yjaU8P3nDqWJP9n0GW87k/L9izli6S952M8atXJuBwKKhVJoRiWVB45HGVGsLWENnWv0M4fmO8cJv+Jn6RnjrCJtlWrtMPM0lXd3zs5ikyuV4UyHd7nnF4nvWBaQo2FKeiBU5PgrEWOsvEFSNSQevCvUjt0i4IM/QRdBXH/NyqKs41zs5q2USkEdXrPDKWH7q7gdTGA2cUSwRf/m8h/fZPTw+IINSmuNhVJx0gi5dPDMm79J/kTPLtPOyHp7hbeQhf3bLsSeSeVq3WBbTC3f0xePXHpwZ+yZiIijCZyf66zZdmUcs+VglZKQnX+l1ZCcVs/T5GI78Bjs9nK2RHGPaTd2bIvgC+r9c7Xh2Yc/kOcIJfsq79d2TNTmM5RnTdKmWbf3L6r5Nq5UpNKl/jwQiPTTAafn/++3SUDsReWOhvwlRjO07F30bCSEgpTeB9VLBlgYehafEmCqlKM2/TPKNzgxu5eHjcTYzwxSbCQ7NH75HJ4yB+5gFWKIGcMvH1JxuscqysOnv7lb5DUMYouNx3fi6aJLL93DVEjJ7vmuzkengTnKTJyhl28xHWdh+a7d5IND19pvHC+8n2ievte0NJx4VCKrnD/lKHQAKCKtg6aNvTPXzPBW9NerIZd907F+3JU+hmSvtwpFm99nCWxpmUtdAFGf7MlDeBidYApgtan+pOBu2Hg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aMhdcQ8q2na/w1cVAYCFWcML2qCP8GoOxIJWRbvIJmFuIB1MUlm6SvLnpOXkrCT13NUjTxhyB1dPcX7hYwTbmytZr/VvrjFiselJJCuk6XU2BLU/dSuvvWS2VTuvwC05EO9J4ncfZpJF3+A9i6usja0fdOfN+x72CC5DVqC5hTwLYCSRE1xmuPxNfxfWa4KkNPc1hUGI8Q7RysJEPrYhND8GxW5coY4rClv5O9hv0JQCY1z9avF+Yuu8TcTy2UUE+PTJ3Cio+UVByyNJmav++go9t6TjeURirEqd41QgsPmglW4ZuLEH4vHoSiYwOc1zvoAX/qY1+TnLzIVgo8ppFRx0VnsjhpDEdXyUuiORqWkcIEGvlMMH4wb6oR7NGzmdXrCPvzhdal9cpTWLvTcTEa6yANxXur5H7V6r5aH8wqhwu6CwoZl8XhTQGGJ1Rxk1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 05:07:04.8968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1993e6b6-7e11-4d41-3981-08de8af585d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6885
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 05:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19817


On 25/03/26 19:03, Ryan Eatmon wrote:
>
>
> On 3/25/2026 1:28 AM, Moteen Shah wrote:
>> Remove runtime managers since ti-core-initramfs does not requires
>> login and other services as it is being used as a read only
>> image during the boot. Modules can be probed using the udev from
>> initrams-module-udev, hence remove the init manager along with
>> others.
>
> I don't think this is going to pass muster.=C2=A0 We just added those in =
to=20
> make the initramfs function correctly with the rest of the system post=20
> boot.
>
> What is the more in depth reason you want to remove them?=C2=A0 Are they=
=20
> causing you a problem?

The aim is to reduce the size of the image further so that it can fit in=20
lesser memory devices like am62l(128MiB).
Since we do not require login support for the usecase of just probing=20
modules I removed the login manager here.
Similarly initramfs-udev will handle what we aim with this image instead=20
of having a runtime dev manager separately.

The change results in shrinking the image from 90MBs(20MBs compressed)=20
to about 25MB's (6-7 MBs compressed).

Regards,
Moteen

>
> I'll let Denys chime in more since he did the work to figure out what=20
> all we needed to add in to make it "correct".
>
>
>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> This patch will help in reducing the size of the initramfs to about 7=20
>> MB's compressed and 25 MB's uncompressed
>> Boot logs:=20
>> https://gist.github.com/Jamm02/ebdb124064e253208ee479f46edf127f
>> =C2=A0 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb | 4 --=
--
>> =C2=A0 1 file changed, 4 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb=20
>> b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> index a9eff847..f496f21a 100644
>> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> @@ -11,10 +11,6 @@ TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
>> =C2=A0 RDEPENDS:${PN} +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_base-utils} \
>> -=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_login_manager} \
>> -=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_init_manager} \
>> -=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_dev_manager} \
>> -=C2=A0=C2=A0=C2=A0 ${VIRTUAL-RUNTIME_update-alternatives} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netbase \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base-files \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base-passwd \
>

