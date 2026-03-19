Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369FF109024E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:35:23 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.454.1773938119168515765
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 09:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=H/L7JgNi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.3, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufjedZhFEmmGgwDuQ/DHVw5BXgNwHu3Zj8j43m7MNtWwAgG6F1Xc3aecDlgMeSibVMq8mek/7Lv5mitcs2OV/ugB29uYTwzmD26lUgIaUJulhi/sftjoIMeiLk4CU9notSWjGrInJFmZDrnLddnHqXKjLP3dVGzSH2Gng5AUYlutcJRC8shuK6yi6RYiYBgpAUAyhAJL+44QK4EhwxCvNYfIdbDvDMHnvHdc9Jmn5HEgj5ykJ56TuhfvIxePPGgghelSy14rDAWqKoBg9aR58fId1AB5nUTyOKQ1rdh3Rxc+uo+U/XOl9BCxtR2vINYmNiJ9/jtCH8/ohLPpU8G5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s8APaCxcswI+xosJ73Faa7NQZSowgg5GDAnR6+/jz0=;
 b=BS9hg9Q09LXb0m5bIELDUoCGZpYiJf63nKOC0bGWzFYS6QwuRkDOib/WkPvLmCz7w/4h+7bIlvAF4bpDXOT1G3W52Y4c3pkungm6CjZXjh/WxMH5gFBze/b1wiT6kjsepDXzevZqgluC8DxB7tFJ06BiTsXRrLWlEHKwa3YIZPkO2wNRtx9cvqJnWN1zaeo1ah1U2x13sJw8dn5pqsOi+JHwfmVaS5mwXO6NfHv4vqhviS4sBB47rRsfedn9t35qTp7q8/90fDRKuiFuMIOmhgo0ARIqtAmouoZ79ZQg97Oj9tkCD6P7wXsI7wihHLQG6f5v4uFwr+RiK7yvRij0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s8APaCxcswI+xosJ73Faa7NQZSowgg5GDAnR6+/jz0=;
 b=H/L7JgNiuUja+u+YM6dMEPmVl5CpNsJeJiAyPV34FqmCeW6okB0ODXHUwaNngMDBBZWdhv0s0BnK6EI03E6obEoLT7NfEKs+8VQEalMZk4AWAdomrvPkDdOIDHSnnajxZLo5Iy/iksbgwyMaYtiQM/y2CA7wYs/NBtH0mQs0WD0=
Received: from MN2PR14CA0015.namprd14.prod.outlook.com (2603:10b6:208:23e::20)
 by DM6PR10MB4298.namprd10.prod.outlook.com (2603:10b6:5:21f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 16:35:14 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::a6) by MN2PR14CA0015.outlook.office365.com
 (2603:10b6:208:23e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 16:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 16:35:13 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:35:11 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:35:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 11:35:10 -0500
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JGZ7BR2371140;
	Thu, 19 Mar 2026 11:35:08 -0500
Message-ID: <bd78a2fc-97c8-4609-9f34-ca45b77f8fb5@ti.com>
Date: Thu, 19 Mar 2026 22:05:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v7 3/3] conf: Enable dynamic security
 layer for LUKS
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <vigneshr@ti.com>, <afd@ti.com>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
 <20260319103533.2431033-4-s-tripathi1@ti.com>
 <d9e195a7-5735-410c-be03-734eff2a7497@ti.com>
 <20260319145527.GP11121@denix.org>
 <b3cbeafa-b864-4435-9984-907138dd0ed6@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <b3cbeafa-b864-4435-9984-907138dd0ed6@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DM6PR10MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: a40226ae-9c6d-4aee-df9a-08de85d57eb4
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	9gZMMlZWpuCmRp4hJBiJ8hWGW70h15kdR+5hCzyy3TNguqOAZViZxFAzk/b0zIwl6X+FDCO06BSU0B7hfwJLAOyEuxskoQf7K+kW3PZlvXLgHJ4DuEuF9ICp5MUQiT4eStnk9jYPmCYxvbUDvjr1FKs4ewFTmmxXo6Y6wlQTskwk/tqa/CF6gmkfuXv7PrxYZv1cMLxGOkK9ebd/TflPPiAnxm2M1l7yQMP69cyfo4RUtiaoDg17P2o5ckATneWA1l/GxrHrRn6aMZqhT/JKhO5cpy/OryReqUJzEjTJOC9H04SIcF5Rh1QuYL9HxE0deafIU+EXN/N4O20GeoODflwvyX1YsmT4cjhKWzi6ZD84lx5Fc6mJA/dsIL5vVto7uWMKgh+EaizEKYuY4x0ZM10NvT3TdoEsN/+c9LPrLb6bAJGDgH/+hdefr9uh3bszT9tHtEvuH5bsKxapDoyTYATFiYS/0HDHxdzaJtC1exRgKWGu4BpGaUNERpLoAJVF6oUFyq43FPsEYL9eoh8LYA4C+lSI4CrTOzW0hYFSZaJghjeefVwV4iVOgq8XGp8bqaOq2N1KC/Yz+z1dH6xrfaMoT8qOz2WEtHXQclAumBeOx/B/YJPAbgUqSRnkuY+9CqUDdspiWYYDr0JwJJqWTmhm4hpuql5uzRuNnopJmGGRggQWMrSc2YDv7UmqAoonZQKP5T2nEkN8uqojK5Nc+t4uDzWc/WiXQ0aKxqvpBRyLIT3g8rk7IDYe757BTNQQqK3prFvEGZB1XHPCl+WYJQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JeSOsw8MUY+47Y05O/Cg0B3Q20HnLhUx3zXAepwKEQLXeJagtbouzSOpS2qwsH1JeLloqBXMVJIEMfywFM+xXwBq7qxwAVKxIZEAkoRGwgnTvg6gZterqUjsWiDAXfqTCCqaTuH9p3BroKDVnQ4E4I2nekcp5GaEPSfsLeeCoRmfbXXHlc03WBwJRx2WJyZKUYUroFnJjALxyJVfPXdlQ7Goi1emHXWUL4M1DJP8mf9WZBbSZXmjJ+lFny708hO9JlTYjxnnXc+J+gOTcgeUMJot9dX+XV3oGqXShYOx9ODeVRqHwVJ+x1JwoUdaQKjMljWM3WG6vPXV/GecYWSQKWwJEG3Rv9HJNS8vt/pMuUzpQHXEBO3v7zQhMaf53DYpo3QcSCKvvhNkRswcs6+Qws4B1TSh5PkoNh/TsciUA0dtNUq76DuDuQXeVqw6ARow
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:35:13.2234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a40226ae-9c6d-4aee-df9a-08de85d57eb4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4298
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 16:35:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19781



On 3/19/26 20:28, Ryan Eatmon wrote:
>=20
>=20
> On 3/19/2026 9:55 AM, Denys Dmytriyenko wrote:
>> On Thu, Mar 19, 2026 at 08:59:24AM -0500, Ryan Eatmon via
>> lists.yoctoproject.org wrote:
>>>
>>>
>>> On 3/19/2026 5:35 AM, Shiva Tripathi wrote:
>>>> Register dynamic-layers/security in layer.conf with BBFILES_DYNAMIC
>>>> for both 'security' and 'tpm-layer' collections to conditionally
>>>> build LUKS encryption support when meta-security/meta-tpm layers
>>>> are present.
>>>>
>>>> Add meta-security to LAYERRECOMMENDS to document the optional
>>>> dependency for LUKS functionality.
>>>>
>>>> Update ti-core-initramfs.inc to auto-enable initramfs generation
>>>> when DISTRO_FEATURES contains 'luks'.
>>>>
>>>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/layer.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
>>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>>>> =C2=A0 2 files changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>>>> index f78da573..36d05b5a 100644
>>>> --- a/meta-ti-bsp/conf/layer.conf
>>>> +++ b/meta-ti-bsp/conf/layer.conf
>>>> @@ -20,10 +20,15 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
>>>> =C2=A0 LAYERRECOMMENDS_meta-ti-bsp =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openembedded-layer \
>>>> +=C2=A0=C2=A0=C2=A0 meta-security \
>>>> =C2=A0 "
>>>
>>> The layer should be same as below:=C2=A0 security and tpm-layer=C2=A0 I=
 was
>>> just using meta-security as a placeholder.
>>
>> Yeah, it's quite unfortunate that layer's collection name could be
>> different
>> from layer's directory name. Some maintainers keep them the same (e.g.
>> meta-ti-bsp), but some make them different (e.g. meta-security ->
>> security
>> and meta-tpm -> tpm-layer). It could be rather confusing...
>>
>>
>>>> =C2=A0 BBFILES_DYNAMIC +=3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openembedded-layer:${LAYERDIR}/dynamic-=
layers/openembedded-
>>>> layer/recipes*/*/*.bbappend \
>>>> +=C2=A0=C2=A0=C2=A0 security:${LAYERDIR}/dynamic-layers/security/recip=
es*/*/*.bb \
>>>> +=C2=A0=C2=A0=C2=A0 security:${LAYERDIR}/dynamic-layers/security/recip=
es*/*/
>>>> *.bbappend \
>>>> +=C2=A0=C2=A0=C2=A0 tpm-layer:${LAYERDIR}/dynamic-layers/security/reci=
pes*/*/*.bb \
>>>> +=C2=A0=C2=A0=C2=A0 tpm-layer:${LAYERDIR}/dynamic-layers/security/reci=
pes*/*/
>>>> *.bbappend \
>>
>> Moreover - is there really a need to set up security top level layer
>> here? If
>> only TPM tools are needed, then just tpm-layer should be enough, even
>> when it
>> comes from within meta-security git repository.
>>
>> E.g., we set up openembedded-layer here, but that's not meta-
>> openembedded top
>> level, but instead meta-oe sub-layer inside meta-openembedded. There are
>> sub-layers in there, which are not needed for meta-ti-bsp dependency.
>> Same
>> thought goes to tpm-layer.
>=20
> Then we would only be including the tpm-layer in the layer setup, so we
> should change the dynamic layer name to match in the second patch.
>=20
>=20

I was thinking security top layer would be providing LUKS/cryptsetup,
but on evaluating found it's not the case. Yes security can be removed,
tpm-layer is sufficient - verified after testing.

Will address these changes along with dynamic layer name change.

Thanks,
Shiva

>>
>>>> =C2=A0 "
>>>> =C2=A0 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>>> b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>>> index 9d3cc612..15c05e04 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>>> @@ -5,7 +5,7 @@
>>>> =C2=A0 #=C2=A0=C2=A0 TI_CORE_INITRAMFS_ENABLED =3D "0"
>>>> =C2=A0 #
>>>> =C2=A0
>>>> #---------------------------------------------------------------------=
---------
>>>> -TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if
>>>> d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or
>>>> d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
>>>> +TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if
>>>> d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or
>>>> d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or
>>>> bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}=
"
>>>> =C2=A0 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
>>>> =C2=A0 TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
>=20


