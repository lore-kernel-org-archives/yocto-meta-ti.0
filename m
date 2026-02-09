Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38ADE7E0D0
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 18:11:28 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1101.1770660684134470590
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 10:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AdpdZpp+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.10, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRFlYTiGburH0xOueGPGRhsTwzbUnc3w4JZ+L0mFlgma746vRbXhUp3YVfPeZvDdr2tZ/sSnOeVi5T4NtoZIOPvi16xkPO1HnCM8FOjrmPhnloym1To8WQewQxGAeGECcc8nuHYApHgZH8J6erAkXWBZigegJyctRBwnCl6u87NOCuTKYgE7xGvEwq6ccXYERoe0EJMgrZZW83JNB2OgluDN5BhpdaZI8vo0Kspn//JBqJZJMpY41znTUyXt/MthvcUrncPjfH0bGNVwMI0HOoDD6bserBitYLApXcCm623l8nNDjs6uqNjhnmC+q9sUluLln0wyLZKYxvGYIhVBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9XnMqzmmM0cHqaUG2kj6ZiSo/jhYzGuG16ZGGBy/us=;
 b=it2NBk0xBoxgA+Ut8jsEiwcTaTFlL3JfQPDMZxCIrlOWbvU8xfnhO679m7hNx6ocBvWpeu4H3n3YLgk1dKViLlrjtk6YcOcEI+UqiCx6gQYfFQ7DMo6O25FZp2iZhKje/RjK0xAOGzRRJCezmx9I/FdmcRZKSxSbdjcHYMbC1bbyzkJP8bEu6FZ6EXS1rOXbepgBTblTEaNB6Khwq3dazNzQHrEIpZB8WPU5LA+d45NIkQdK8d+aDPkfsnnavrWVboFDmMT5GQ9KD8t4Obf9a2ITPRvttPcqWJWV3MoiTd3MzdtXeECZoocnv3czY0iBkhB3kauKR4q4eBZTVzXWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9XnMqzmmM0cHqaUG2kj6ZiSo/jhYzGuG16ZGGBy/us=;
 b=AdpdZpp+eKKSzWBkwGUClVqWUxMdrNXZIGp9/w3scC/EoJ79efpQFoEvye3Fc5NezS1AfTk1/3R4kvCmVCDACBePcJtuY14R6zAhkX8MQU2sxtWGUdOYHANFyWLdkW+e5yDKx6KapMGXGhuUHe1R0Xfxi+/4+vs2k8Gf9AdwO4U=
Received: from CH5P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::18)
 by CY8PR10MB6851.namprd10.prod.outlook.com (2603:10b6:930:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:11:22 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::43) by CH5P223CA0007.outlook.office365.com
 (2603:10b6:610:1f3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:11:20 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:10:51 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:10:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:10:51 -0600
Received: from [172.24.235.46] (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IAn1E2458100;
	Mon, 9 Feb 2026 12:10:50 -0600
Message-ID: <4266855a-a162-4315-8536-2c5e47c079e7@ti.com>
Date: Mon, 9 Feb 2026 23:40:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
To: <ivitro@gmail.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <vitor.soares@toradex.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
 <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|CY8PR10MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: c55c145c-6fbb-4727-57b7-08de6806a066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|4022899009|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mMPahsSf1UVEuJofJc098prcnaep2wctGxjmb6cucGXohBrzaq3T1E6SCqBl?=
 =?us-ascii?Q?He5mCt/zm1gLrjjb7jbeW0De6BPmQqIF4WEIPmYSk5+NzmtxBThnnj5G/VE9?=
 =?us-ascii?Q?9D//NeNAKglSwfstEK8EcJSyjvUib7ONzyaoC+G8qDjyOa6rEN+MxcpwQOLW?=
 =?us-ascii?Q?w0tSFhFbA/A5dCeNmT3+QnfFK2XhXx2y8uSMxnS4gXgEBNobRwUvDeGoaTnU?=
 =?us-ascii?Q?AxFBr2zoV7EPk1pt+fuQHpEQeW2/1odnM1LY2F0zwEIYJMauUSYnQIHeNQy2?=
 =?us-ascii?Q?KsjgmkWW1zpgdYQvqeU6sDEH6myNNvpJURQw8Qm4B+JdWk6JXjC6JXmM122u?=
 =?us-ascii?Q?pHMJZKeBgJGATDQNwPTk0XdzQIjJ19F8r7WnIuiZ5P4ewHEadyVu/U357Mh1?=
 =?us-ascii?Q?xUaiEk10dR3lKgh11dwH+JRjK3J2RERPt9SehnmNlooCZ71Am4h5eWpImqVP?=
 =?us-ascii?Q?OtCpKA0z2vq2F3/w9r1m5ISOKhyW/MxzdZdVBz7XItL1mjdROZ6Xg/K/C0gZ?=
 =?us-ascii?Q?MUzlrKIq130mxAHRHPkJ9FlLLEhgKxOUzzm+8b0N4K1eLwJExVwIb0cZrJz2?=
 =?us-ascii?Q?PiUOG29kesYBlcYJiE3mLCrwYSrHpSlvEey5CgW4/TMrHBqdbymlCw1eZXK2?=
 =?us-ascii?Q?d1HZ1zMorRZ9DiCpAY1SysllvjfyRQFv1ovCE/PcU+DRAtBq4sJ+kEHCJrJE?=
 =?us-ascii?Q?GhNFFbuR2EKvIdCSPHNlJN6UhpKh5BWDobRFE7JKqV2kLCy9Jw0+YV0yKOSs?=
 =?us-ascii?Q?EhX63xmFzq07ymDJaLGTTp+Jt3M9QQqaJWeW4QioKCMreOIpSegFb59V0esf?=
 =?us-ascii?Q?PN/DAgRq8DJY/fMZyCo91HN8CDuL7iDsB6uj3FfaCWwH4cYX587mD4O+ILSW?=
 =?us-ascii?Q?W57Laj4WqSGIbsRkLqD7A3NQaPTK4TeGN4GhItO6lg8S6OIlm64T49wqY9ly?=
 =?us-ascii?Q?dEB/gl91Gud49FhE/rz6C/NvEvTyhcTuStFJPL1uWSEIz045KZMJpzSQo0sT?=
 =?us-ascii?Q?TK6Nr0qnokFPcY0R390R0vIHK2u4DlitxEUtOuIJqtSmqtNvq+zmm4PoMFgg?=
 =?us-ascii?Q?tH5We6Ew1gdvOrw7ASkqzwigzLk1Vxp7DjmT1yRpD6kg4S3vzE+n3hi7XQYK?=
 =?us-ascii?Q?3O5oB9cBhCKlwMthAnrnp262osWG7a4KDWzT7CATuwmgv1Ig3qULfZPugzJR?=
 =?us-ascii?Q?a2CLLkerh6hjor9FlKo2YqE7RKxsoL0OEjxeozAff2X5w3kZc8shqk0WwqAX?=
 =?us-ascii?Q?BZoHrlBYbZu7oEzqK6L/C4DL+oKqVRmoutYTOb5r+ih9lYD36ek1dNhfR9xz?=
 =?us-ascii?Q?DvAgN8mkvjTbUAvYGS/k5fgrxHhKKhnmQw04Nl9uhjmeZ+x2yiLQsRVbWoUX?=
 =?us-ascii?Q?JkecWO5LzSj46f+EW62qYhZNM/UyBoew4+cPvq8rCzYVraVkdCrp4n0utNnV?=
 =?us-ascii?Q?nJBCDs7gNChkCUiczE07AYJgIpkIopbYs2wV6URfJmrjQJ52l3G8VrnGld8E?=
 =?us-ascii?Q?5rkLAXvzgrdyaW6YNnnKnT+6r6NDnYbd8QqEafh5YQ/tOCob08KBrliqVvs0?=
 =?us-ascii?Q?v6HGhFvnSQMcVMrD1TdZ818xDpQT1eeOhewWzJhzXa4Y4iHoDRS72n1fKx96?=
 =?us-ascii?Q?dA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(4022899009)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OnK0b61AfGcwjuzr37GMDQ5aEG+es6a/Lb0N5L07t3xJnyKzOs4Q0Ta66QC2xvfahuSph1YXI3tM62jjCjDXYR3PEmItgj/XuFm43K6TjZJkxjEN7SUhsmqQSDbab15qBVvpV0ox+b8QQneA/8JkueRHXLC7mKHxHJOMVlYEpuEtdHamvELkfPIYGnNNlErc1cnI3LEGQ5WstwGjuSd1JQrxexDscTfGdXaFCguHCL/DL/uFcjarXJxezMv9Q/n7hlaaEEkdj3sEuRcobmw9wbrmj0j7ki8RvuV8upuxfAYdkhwMB0t/Qb+/ojd7pZiLwI0RCNEcSPh0rqKg/SGaazPNHouaEqtqFpX2aqxQcOCELBXUE8CowbpUzfj1Np2aD62iRuZLp0rn+w6jpdxBFXfTa/jvPW2yLDFmfXhUdK9qhUJSZ5lXqFyYZYwanOYi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:11:20.2287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c55c145c-6fbb-4727-57b7-08de6806a066
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6851
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Feb 2026 18:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19476

Hey Vitor,

On 09/02/26 22:01, Vitor Soares via lists.yoctoproject.org wrote:
> On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
>>
>> On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org wrote:
>>> Hi meta-ti maintainers,
>>>
>>> We've hit an issue where selecting a BSP version (e.g. TI_PREFERRED_BSP=
 =3D
>>> "mainline") also forces initramfs integration via ti-soc.inc (lines 32-=
49).
>>> The
>>> bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditionally s=
et
>>> BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BOOT_FILES=
.
>>>
>>> This means we can't use bsp-mainline without also pulling in ti-core-
>>> initramfs =E2=80=94
>>> even when our images don't need it.
>>>
>>> Since we can't use bsp-mainline, we also lose the correct override cont=
ext
>>> for
>>> other components. For example, we end up having to manually override al=
l the
>>> mesa-pvr.inc virtual providers in our machine config to use upstream me=
sa =E2=80=94
>>> something that bsp-mainline would handle naturally.
>>>
>>> The root issue is that initramfs integration (an image-level concern) i=
s
>>> tied to
>>> BSP version selection (a machine-level concern) in ti-soc.inc.
>>>
>>> A possible fix would be to move the initramfs logic to an image class (=
e.g.
>>> ti-
>>> image.bbclass) that images explicitly opt into. This would be a breakin=
g
>>> change
>>> for images relying on the current automatic behavior, but it would prop=
erly
>>> separate these concerns.
>> I recognize what you are saying as an issue.
>>
>> We are in the process of moving to require an initramfs for all of our
>> platforms as we transition to using modules for kernel features that the
>> upstream kernel is unwilling to turn on by default (to keep the kernel
>> small).=C2=A0 We have been turning these features on by default in our v=
endor
>> kernel, and we moving away from that.
>>
>> So there is a need to balance our need to make sure that everything is
>> in place at the BSP level, and the need for downstream customers in
>> distro layers to build upon that initramfs and include their own changes=
.
>>
>> As I see it, we have two options.
>>
>> 1) Provide a mechanism to extend the ti-core-initramfs recipe to allow
>> you to put more stuff in there.
>>
>> 2) Go the class route and make it so that your initramfs (using the
>> class) would make sure to include ALL of the needed modules into your
>> initramfs and still register your initramfs with the images.
>>
>> Can you point me at the recipe that your initramfs is using so that we
>> can get an example of usage so we can plan for the best solution?
>>
>>
> Thanks for the quick response.
>
> For context: we don't plan to use initramfs (at least not currently) - ou=
r
> images boot directly to rootfs. The issue is that selecting bsp-mainline =
forces
> initramfs integration we don't need, and prevents us from benefiting from=
 bsp-
> mainline's other configurations.

Can you please explain more on the part of how initramfs integration is=20
hampering other configs to get in. Also, what are those configurations.

Regards,
Moteen

> Proposed solution:
> Move initramfs logic from ti-soc.inc to classes/ti-image.bbclass, and ima=
ges
> that need initramfs explicitly inherit ti-image. This separates machine-l=
evel
> BSP selection from image-level features (standard Yocto pattern). Breakin=
g
> change: your reference images need inherit ti-image added.
>
> Thoughts?
>
>
>>> Would this approach be welcome? We're happy to contribute patches.
>>>
>>> Best regards,
>>> Vitor Soares
>>> Toradex
>>>
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19475): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19475
> Mute This Topic: https://lists.yoctoproject.org/mt/117717310/9997635
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [m-shah@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

