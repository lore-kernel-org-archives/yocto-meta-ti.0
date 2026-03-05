Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC82FF33A82
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:03:04 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46192.1772722978442788789
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bZuOPYlm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.61, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/3iDskCVi8Iws/0NbhP7pXUFLDRty9Fo/5H/jfUIUiukmaekfKzpFS4rq9WANLPchV9eHd1UfqPByNxUDEl4vSi5xjKjGtPJhHROU1pxxCd78hJf+Z2q94KBe1lohsoOVso9ocqjNcaqysL7njMS0YJYttsJeXP4z6zLGH1saznS3lxPL9h/zzmyFP3DVOfz9u1LcFQaqFu7i/XUbQnd1HileG7lvJ7aFF3zTfOYqWt3LEnQTCmC1cyG8wlO7duYBIgIMA+0ekhGk6sICVcHTrjsMUV0AUFm59nGg1kKr2oBxUHbPm0aW7xrW3eqebWYRT1mcVehBGZzmSw3YsW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quD26Es82O5i4GNs48oIdgtuBgoYmbj6aPKqUIvh12A=;
 b=MuP+k73OugA7YMy30SOavVm7slhnHPT0ZsBMyMR2QtcSMTX0dYyf8lSPrqwt0HEHoqrS065+lfAAtbC3UCBb/a8jTWwuWLK8JKuY+e8P9kZFfV0znLeZrlnH1XUEY24tzQ3E8YD5sEq36bpqIIZoj6Gmsk91wJB0BgBhVDyOD5rcUwaKHhgbG8LNqSIHWekLXDDSZCRTRDg0Bu788J9r2EQxkXy4KT1hqzapa8ahm3gsz1B4S3GU3eoOGhZ9SZnFoDVLWhdg92JR+VqckyL76ysyfOYy2tkJHx5rHWBFAQ7n9CBN0E6XA/wK9SOC04jEvsr31U26nqUvicPGkSnzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quD26Es82O5i4GNs48oIdgtuBgoYmbj6aPKqUIvh12A=;
 b=bZuOPYlmJlanajb0g76nSRQvRvmfwRZCQKbRCmCw0pWsg7NcehgS/kUpxirvj8U2LUha1X8KKIU515EM2RGkJhcbLPI/rQ4EI5Q8VzBhlNcS+9uX+P9kkDEzOBsKAlVvVw84W00S2mFoD92u2Vap5lNZa8MnFSplcbM4P2r0qWo=
Received: from MW4PR03CA0133.namprd03.prod.outlook.com (2603:10b6:303:8c::18)
 by CH3PR10MB7458.namprd10.prod.outlook.com (2603:10b6:610:15a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:02:53 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::49) by MW4PR03CA0133.outlook.office365.com
 (2603:10b6:303:8c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Thu,
 5 Mar 2026 15:02:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:02:48 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:02:37 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:02:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:02:37 -0600
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625F2Ybv2041372;
	Thu, 5 Mar 2026 09:02:35 -0600
Message-ID: <f8729f43-ccb5-4b2a-8000-c34df63c2386@ti.com>
Date: Thu, 5 Mar 2026 20:32:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v3 3/3] machine: Add encrypted boot
 configuration
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
 <20260304193824.2495898-4-s-tripathi1@ti.com>
 <818eb2a5-f0b7-4af8-9eb6-98f88da62488@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <818eb2a5-f0b7-4af8-9eb6-98f88da62488@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|CH3PR10MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c1d920-5b25-44db-d350-08de7ac84439
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|376014|36860700016;
X-Microsoft-Antispam-Message-Info: 
	032iE/l0vtXDjP72srRVhK8GUB4f/iOSzbZ67/EVThezsJV2bRxUpkghbxxdg1BkGkFo9jA02BVYrebl+Dxklgy2DoqJzchgDYwLZpsSaM7Rp8Dr8nBqop2Afkid1ucCpKdZf5GW6a7cKQdRLFTMYzzc+NujkkAbBcsz9qvKAHA2VOfD/6qARwBcc6RqHxgghsG5Lq15FbWFNd0jxxYXjWUC+VsqSJfNVn3a7DYCbXAne8T4FRxAqimVqaKVJQaBAen8rIHCSqtjBBJITgF/xzMNHdUJD6uWmKC9ZNYl6l4zFTCEiWYy8t/cQYT7rUxMWiB4ktJgpem6ql/o9Hh4sTIWTTSngxn6A6iMpyPvAoKk4urXMbathaJ3NuHY5M72x9NIIMk4xI/GE9w4coNW0xBzmOa8CP0FPJisBcX4TwQQRS1MAojjQE9nyU8zHZyhUZwONKDwgnYl7f1CAgL6MO//pUbtkXZT48fmjy8OKTTtFuXIvyho2tkQgdkRnhGeyUn3yPiGr7n5vB/MI5gdNL/eTKKpaDiGVdy5aa5r8FdQVIEzH2b70C5czIDk6+REnhMnl/PmHTaRHWUFH7Ln4UPhubIWSgra/yo9J3H9ifTiBnWoPHgM5s8oOyLWVqjDKRTk4zBtx1NF+1Vn+iKWtxEYEfbyIH8u0AQL7pxgX+6g8x1oGZ5Y9DsCdoICza/76TNDimQixVGEnIPUDf1XtEJsMPL5iEr/NJU7Mrexr9zHBKwlYONJ3iMB0DJxgcoJ8OKIZpldY4/WVVNXyMusYg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Cn3DX8SFL+fulO6d0vfz+0hsvyHmHL2iJy+iFbJnBo3y00LULCgUtzZuyK9vzpXZ4Ps9Jy/BSgkjkSvNk7tYW+eGYrU3VPvpcNCOSp2EULQ/KDvW7wcHqGMXpDU99KktWtFcOq5ZRNgzNdUnJc2MtYFSu+apWP22k557nXRH40yJzz3YKOOrO32VG0Ac9F4EkA9xpbu65dn+c16yo8q8plQHcnC2nbWouga46RqAC20aPizuexFwINCFXP9vUo02McW/Ir3XomV3kfJPtmUXbhOzegYJ7AmJR2y0xCJjsPJD9P1+cWRUpPIGb1ngyHY+ShPa6ik9cNN4J/8WnNUdXIxqHKIxDk/NfThH5O0aznacRJw9JQs7DZANdsH7Xb0EG8fWQrxLJ5x924EuRjvPKncc/VEgrCbAkOrDaaO6hiv8l+fj4QgLyyB7y2IdTo6l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:02:48.8592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c1d920-5b25-44db-d350-08de7ac84439
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7458
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:03:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19652



On 3/5/26 02:14, Ryan Eatmon wrote:
>=20
>=20
> On 3/4/2026 1:38 PM, Shiva Tripathi wrote:
>> Add encrypted-boot-common.inc for machines supporting LUKS encryption
>> with fTPM. Triggers ti-core-initramfs build and overrides IMAGE_FILE
>> to use uncompressed cpio.
>>
>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>> ---
>> =C2=A0 .../machine/include/encrypted-boot-common.inc=C2=A0=C2=A0=C2=A0 |=
 16 ++++++++++++++++
>> =C2=A0 1 file changed, 16 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boo=
t-
>> common.inc
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/encrypted-boot-
>> common.inc b/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
>> new file mode 100644
>> index 00000000..10a5cb86
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
>> @@ -0,0 +1,16 @@
>> +# Common logic for encrypted boot with TPM-sealed LUKS keys
>> +#
>> +# This include file enables ti-core-initramfs with LUKS encryption
>> support
>> +# via the initramfs-module-luks-ftpm hook module.
>> +#
>> +# To use this in custom image, add to your image bbappend:
>> +#=C2=A0=C2=A0 require conf/machine/include/encrypted-boot-common.inc
>> +#
>> +# This will activate when MACHINE_FEATURES contains 'luks-encryption'
>> +
>> +TI_CORE_INITRAMFS_EXTRA_INSTALL:append =3D
>> "${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', ' ', '',
>> d)}"
>=20
> This line does absolutely nothing and is not needed.
>=20
>> +
>> +TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if
>> d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or
>> d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or
>> bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'true',
>> 'false', d) else '0'}"
>> +
>> +# Override to use uncompressed cpio (U-Boot can't decompress XZ format)
>> +TI_CORE_INITRAMFS_IMAGE_FILE =3D
>> "${TI_CORE_INITRAMFS_IMAGE}.cpio;initramfs.cpio"
>=20
> You misunderstood.=C2=A0=C2=A0 This file should not exist.=C2=A0 All of t=
his should be
> in the existing conf/machine/include/ti-core-initramfs.inc file.=C2=A0 Yo=
u
> are just adding a single option to the existing settings for
> TI_CORE_INITRAMFS_ENABLED.

Thanks for the clarification, makes sense. Will fix this and remove
encrypted-boot-common.inc.

Thanks,
Shiva

>=20
>=20
>=20


