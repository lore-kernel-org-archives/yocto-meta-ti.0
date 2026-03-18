Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40DB103E190
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:48:00 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15918.1773845279337787687
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 07:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FVlfR5vq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.38, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbEvEh1lILxey7uJQJIvUgSxObLNiG0MRxWcxq/A+Bm0VE8WOnbx+HqxXgaR0OlZ6PUA8Nn6yxYOZtl3kx3yjpNgUBO8RBLxjnNgSP34hJQ+QV5P55dAklUoAqZWCFwxL7U0/dtv32sZNC6YGReK4t61d97EHVfWKFojFhkkOvGBLsVJRvY90ERYp4y1CLJCAx02Yu+coAGdN0PgNHUWYVrYDZPqRCyHBJHlXst5H4lVEGvXmweCLeGqpdd543L7MezpCv8l6qeUjZo3Fd3vQdUB/qHHNluut2H8Jfk9YhUqxqUvqwqxlF+DC8zqRtP+UVkHgPYgue9nOcXIZl16aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVbuY34YaKx6+/JUtvwnSUeVfiKD+kOXjsIzM9YWi/g=;
 b=CIM1OMfi0xKN/km0U+iZxzveNAo3sUTWaO4UrgH2q20qPxiIJnQRXDim5pYvbKLWeEalyyTF6K9I/8cPF6bsr3nlKHgoLk9yqKMs8mAEq0bMMRJHK0KLghqsJ1506038EvScCN4E7/R7qhSTGEJ++acFL+gx8KKDd0kwZDYxgkV73H64E1ped5sTNgIBGxaYeYa/K5YS2G72r1+fzsqPa4Uv1Pn7aAbmWtTGHrRvqp6mpvHnvtHaq4G5ZKryRYVYyyxOc4ifZDuzYFeuPE9yj55/AqEU81jzplveFNCp12A9o0eN5ZLFGQz7OYSZQ7/RMrs/ljxCDPJOd4zPiQnlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVbuY34YaKx6+/JUtvwnSUeVfiKD+kOXjsIzM9YWi/g=;
 b=FVlfR5vqktCQUr8+N58Da05yvej3C7rMjSxBqVer/7gbczfJshlXfMph2971D4jhsXjliOBwxbKXVSyNfHoM1dgyYsDuvTE8FpZw0TfIg5jGHHYpyl3lG6Ywjm5jdzZY2OHlyyyBbg06yp0kK6JZqizRoCfIkNPHaTL6tfcbVak=
Received: from SJ0PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:33f::16)
 by PH7PR10MB6180.namprd10.prod.outlook.com (2603:10b6:510:1f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 14:47:55 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::72) by SJ0PR05CA0041.outlook.office365.com
 (2603:10b6:a03:33f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Wed,
 18 Mar 2026 14:47:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 14:47:53 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:47:43 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:47:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 09:47:42 -0500
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IEld9j1002883;
	Wed, 18 Mar 2026 09:47:39 -0500
Message-ID: <94e2affb-ddc2-4a84-aec2-708b4a53ce89@ti.com>
Date: Wed, 18 Mar 2026 20:17:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM
 support
To: Jon Cormier <jcormier@criticallink.com>, Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<vigneshr@ti.com>, <afd@ti.com>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
 <20260317195210.GB11121@denix.org>
 <CADL8D3YiVyFD_89BH67ioe1PUOtszGtoHZAPkvP4Syucc=Y=Jg@mail.gmail.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <CADL8D3YiVyFD_89BH67ioe1PUOtszGtoHZAPkvP4Syucc=Y=Jg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|PH7PR10MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5c34eb-8ba6-485e-c471-08de84fd5620
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Ita+JA+VYSDTHRElmX665xdrZCYJ4T4/soj3ukgE3r6jbWlp4f98YUvsQhXY28KdJxiHHwuB0oVLx03y2nlOLGDFoXcN6tvOW5m5I53jh/aanFalKE7Pro/m4MTRKQ2iN3jHvHMpkqSrWNs2wtEcxlHxJBcOJeFr73kjU/sMupiR5jt1ODXdUBg0s66TAUSAp3uusFMRVMQM8pomi5Oih9WwYWlqe1UhhNCAk0SHKcoU+fYsV+SgzwaaEIcmAP0NLkpjllSUJtKR6bRyDadHtKkAgacYJ8AJTMwAklAPwaiN/Hf3vMpH67E7AqpbmVwGhTEDyTS/y+YaHD59RwzWYgjoctYop2rhcVnaKHwM32OJDwD3KEDxJSTmResgds8tV380k2HCKxFRITH9wUgoBeaqVNH0elJ1fiXYfQAJ11idBNXxk+4tS09bjibZqwS+zdBgyptpJWQeY2gwAcF6XaPxzOeH1NIHUeTcINxDsHcwmEI2b+/61wYt6qvZ0CH5oFHIwyeO/PN5TD0OEmjimaf8jjotPMdML+S1Fw/Ry5Vn0ahCNnQAsozxavxdAnQvIvjJs11ORcPpTFgnaz8iDHI28sijff7JiOEwzqIaJBYNa1qRBM+xV4n6l493/0ql2+4GRqhEHPWKUr23po2gwAKdL0dpufRm3AVt84brVkyLeufYGcdOLj2BA6a196jFEudbRi9t3HSIUoU7PULdxeQ+AVPJae0YdIWLvJU10Uk=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L0kkdx20MhFLm0Rbbgfdn3EjQxHjCzEZ+Gxr+DORx+mA2faQKesnIxgZvXOKVuKOylVrcerC+ALn3B3YdZQTYO6ZZjmNi2MizZLj3LOU6Gn/GHxc+/VI6ZJVPj9aCpA0oc0vIaL92UAq4mlXJJYhqm3W7UtOolv8LNgxuutR4gifhd8negpQ0qSoKsLqj0ZUBGYBe7LOCHbBhU/6+UbAWZ3cko+nFV9I8i8LYduK5R79ieCU0RqxBxb7NzygPLPNQ6r8BGaInrIWP6qtcgQdzYtZpqXbZZH372FfzX2YJpJvHsI7UBIvg+3kYzOXiQp2JVmReOtKmdwfs9SC77lP6O1OMZNI3r2lQYO0EHbRIHMvER7DooLIXKND0A7XRlq7fmhPs7rheEY5oH3Ku99LwZUB9E3fs+C1Yc5EF4HYAoUqNqCQCwbvHzX7uJd7uwvf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:47:53.8476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5c34eb-8ba6-485e-c471-08de84fd5620
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 14:48:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19758



On 3/18/26 19:42, Jon Cormier wrote:
> I am following this discussion as its pretty relevant to us trying to
> get a full end to end secure boot implementation.
>=20
> On Tue, Mar 17, 2026 at 3:52=E2=80=AFPM Denys Dmytriyenko <denis@denix.or=
g> wrote:
>>
>> Sorry for the delay and thanks for waiting!
>>
>> Below are some high-level questions and comments I've got reviewing your
>> patches.

Hi Denys, Jon
Thanks for the review. Adding my comments below:

>>
>>
>> On Fri, Mar 06, 2026 at 10:07:32PM +0530, Shiva Tripathi via lists.yocto=
project.org wrote:
>>> This patch series adds LUKS full disk encryption support using firmware=
 TPM
>>> (fTPM) for TI K3 platforms. The implementation provides hardware-backed
>>> encryption with keys sealed by TPM running in OP-TEE and stored in eMMC=
 RPMB.
>>
>> What are the HW requirements for this implementation?
>> Does it work on any K3 platform, even GP, or does it require an HS varia=
nt?
>> What about eMMC requirement?
>>

Yes eMMC with RPMB is mandatory for this implementation to work since
the TPM sealed key (handle 0x81080001) is stored in RPMB, leveraging the
replay-attack protection. Since OPTEE FTPM is enabled for K3 [1], this
implementation is applicable for all K3 platforms (GP and HS both
inclusive). It would make more sense to use it for HS devices with
authenticated boot chain present, and fTPM based encryption providing a
better security model.

[1]:
https://github.com/YoeDistro/meta-ti/blob/master/meta-ti-bsp/conf/machine/i=
nclude/k3.inc#L41


>>
>>> Background:
>>> TI K3 platforms do not have integrated discrete TPM hardware. To provid=
e
>>> TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - a
>>> Trusted Application running in OP-TEE secure world. The fTPM provides
>>> standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolatio=
n
>>> and eMMC RPMB (Replay Protected Memory Block) for secure persistent sto=
rage.
>>>
>>> Key features:
>>> - Conditional builds: Enabled via DISTRO_FEATURES +=3D "luks" with MACH=
INE_FEATURES as 'optee-ftpm'
>>
>> Why is it being added to meta-ti? This seems heavily distro-specific, ma=
ybe
>> even product-specific...
>>
>> Moreover, there are run-time dependencies on TPM packages that are not i=
n any
>> of the layers that meta-ti depends on.
>>
>> In order to enable this feature, you'd need to add a corresponding layer=
 to
>> bblayers.conf - should this at a minimum go into a dynamic-layer?
>>
>>

The reason to keep it in meta-ti is, optee-ftpm recipes and TI K3 OP-TEE
integration are already in meta-ti-bsp. This LUKS module implementation
is K3-specific, relies on TI's OP-TEE implementation and uses K3
hardware features.

Agree, we can move it to dynamic-layers/security. I'll shorty send the
v6 patches with this change.

>>> - No impact on default SDK builds
>>
>> Since this is disabled by default, this never gets built by the CI/CD an=
d
>> hence, there's no way to ensure future changes don't break this.
>> Arguably, there are other features that are not enabled by default
>> (jailhouse, falcon), so it may be a moot point...
>>

Agree with your concern, we are planning to automate testing for this
feature starting from am62x platforms. But it's not there in place today.

>>
>>> - In-place encryption on first boot
>>> - TPM persistent handle for key storage (0x81080001)
>>> - Secure key storage in eMMC RPMB via OP-TEE
>>> - Security model similar to CIP Core
>>>
>>> Use case:
>>> This is designed for K3 platforms requiring secure boot and encrypted
>>
>> How are you protecting boot partition from getting tampered with?
>> Besides encrypting rootfs, are there any other Secure Boot steps taken t=
o
>> protect the boot flow from a MITM attack?
> The guides for secure booting u-boot and the kernel are pretty decent.
> But currently it gets a bit fuzzy when it gets to securing the
> filesystem.  And integrating that with Yocto.  The current guide
> instead of encrypting in place, copies the unencrypted rootfs data
> into a new encrypted partition during first boot.  And the encryption
> key isn't protected at all. So this does seem like a positive step
> forward.
> https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/11_02_08_02/expo=
rts/docs/linux/Foundational_Components/System_Security/Auth_boot.html

Boot partition isn't protected in this implementation. This is
data-at-rest encryption only. For a complete secure boot flow, this
should be combined with TI's secure boot (ROM =E2=86=92 SPL =E2=86=92 U-Boo=
t =E2=86=92 FIT image
verification), as highlighted by Jon.

Secure Boot + LUKS: Protects against boot tampering + data theft

>>
>>
>>> storage, such as industrial automation, automotive, and IoT gateways wh=
ere
>>> discrete TPM chips are cost-prohibitive but security requirements deman=
d
>>> hardware-backed encryption.
>>>
>>> Testing:
>>> - Tested on AM62x platform with kernel 6.18
>>> - First boot: Successful in-place LUKS encryption
>>
>> Have you considered pre-encrypting the image during the build and then
>> only changing the key, if needed, on the first boot?
> Would that be any faster?  I'd assume re-encrypting with a new key
> would take just as long if not more than encrypting once.

I have followed the CIP core's security model approach here, which does
in-place encryption to avoid shipping images with shared encryption key.

I think approach you are suggesting would make use of updating LUKS
keyslots (dummy with TPM key) but i am not very confident about it at
moment - on speed and any new security attack surface it exposes.

Would it be fine to take the in-place encryption approach time being ?
We can do more analysis on the method you are suggesting and improve
going ahead.


>>
>> How long does it take to encrypt the rootfs on the first boot? I would i=
magine
>> it being very expensive operation to encrypt and overwrite the entire
>> partition.
>>
>> Also, have you considered binding the key to a PCR, so it is not easily
>> extractable during a MITM attack?
>>
>> Anyway, I'm guessing this is just a sample implementation of this one
>> particular feature - encrypted rootfs - and not a complete Secure Boot r=
eady
>> for production...
>>

I see "17.4 MiB/s" as the encryption speed. For a minimal image (~ 315
MiB) it takes around 17 seconds.

Binding key to PCR would be a next phase improvement. We haven't enabled
measured boot too yet, in the current series keys are sealed to TPM.

Yes, the whole idea of this implementation is to give a reference to
users who want to use hardware backed solution with RPMB and fTPM and
perform disk encryption. They'll have to analyze their security model
requirements and fine tune this reference implementation.

Thanks,
Shiva

>>
>>> - Subsequent boots: Successful TPM unsealing and boot
>>>
>>> The series is structured as follows:
>>> 1. Kernel configuration for LUKS and crypto support
>>> 2. LUKS encryption initramfs module with fTPM key management
>>> 3. Initramfs generation trigger and packagegroup with dual gating
>>>
>>> ---
>>> Changes in v5:
>>> - change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES 'lu=
ks'
>>> - implement dual gating using existing MACHINE_FEATURES 'optee-ftpm'
>>> - optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW, PCB=
C, SHA256_ARM64
>>> - packagegroup-ti-core-initramfs.bb changes moved to patch 3 from patch=
2
>>> - Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-s-tr=
ipathi1@ti.com/
>>>
>>> Changes in v4:
>>> - remove encrypted-boot-common.inc and use existing ti-core-initramfs.i=
nc
>>> - Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-s-tr=
ipathi1@ti.com/
>>>
>>> Changes in v3:
>>>  - remove separate sdimage.wks for encrypted boot, default works
>>>  - update encrypted-boot-common.inc to use existing hook for adding TI_=
CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
>>>  - add logic to verify if partition has enough space for LUKS header be=
fore starting encryption
>>>
>>> Changes in v2:
>>> - changes to use existing ti-core-initramfs instead of adding separate
>>> - cleanup in previous init script as per comments in v1
>>> - /usr/bin/busybox logs updated to echo, mesg, info
>>> - WORKDIR changed to UNPACKDIR
>>> - Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-s-tr=
ipathi1@ti.com/
>>>
>>> Shiva Tripathi (3):
>>>   linux-ti-staging: Add LUKS encryption config
>>>   initramfs: Add LUKS encryption module with fTPM
>>>   ti-core-initramfs: Enable initramfs for LUKS encryption
>>>
>>>  .../machine/include/ti-core-initramfs.inc     |   2 +-
>>>  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
>>>  .../linux/linux-ti-staging_6.18.bb            |   9 +
>>>  .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>>>  .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
>>>  .../packagegroup-ti-core-initramfs.bb         |   3 +
>>>  6 files changed, 417 insertions(+), 1 deletion(-)
>>>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6=
.18/luks-ftpm.cfg
>>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-l=
uks-ftpm/luksftpm
>>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-l=
uks-ftpm_1.0.bb
>>>
>>> --
>>> 2.34.1
>=20
>=20
>=20


