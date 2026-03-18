Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3054210775E4
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:12:55 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18206.1773850372092936376
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 09:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=IyTbM7zf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.67, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scb/2uBx6vJrP4DtPhAOY7M0eEQtT8ujkR2RmnYZUsm08XFC05t4NOA0NuEk/ESdkIRexia96TGRpLh9N8cBj1Q/1QmDauSLvioLdNe7yCMeb5umbmNemfn1nab+djVORlg1phrDvZmAePN6wJ1kgYR0Q2RGi7C1fLdKI5RZGEJUTpzYPzIAMLJgwioPswvFSV+LCygbN+auj0VJ55rD/sJv8tzAkwfp/FzRwO+JK1fpR56MHG0yKzLREkAc3mWG8KB9NYUA+LPjSXGurD5xmiSBn+XpDYTArKIv1/qSAFi7AOnWeLEfnn0ZvZyDSWSniY29yYu+XGlT11tvbzfySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc1iIFL14E6JJEUq7whlDNpITSyOY7fsO6lbkqbT3vw=;
 b=Y51zIcZed4RfnC4tDYFpdO/BBKM7qPWnilG8AaBOO7UlEkAmCVU/aRbHmdjuWGwC/FUrKDXgNS60Ft9IzQuQuuSW3KnJoD4X6qvzOIUBfzLH3clHmpxfLTtv2i8gipUPHHMDWUFDBGxBikHy1kUQxQVASY9diwDsk+pn/IBdCAA0lC1ZOMT09lk3404zE/3aPV13gNyatVJt9VSN29Vn+ykaE+Z46eoh71IyZzITi8WOq+dnFYwSBns7ZiT2EYJ8JiPxpzpg2wM9dqjecf1rWv47zjv6G+n+ya1ukpPmDi4WAZdZ6kwS+M6B/DBVpguw8mfTY/d04/29bPnpy0LrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc1iIFL14E6JJEUq7whlDNpITSyOY7fsO6lbkqbT3vw=;
 b=IyTbM7zfTVveLjBsm3rI1cgpy9Yj6JKUBzX3g0YYK4Vi2lh9c+G0sEIj3PnN/96wxrg8WxNyDCroIRm0d3Zxuf+fwIEGfXoMjWDHxzuJRgwz7ocgiiQQVAxFqYwdth2tuI3rs+u4ZLFb8zsp8Z1ilOujMQjwbMnrUXwndKcMn3M=
Received: from CH0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:610:b2::8)
 by SA2PR10MB4779.namprd10.prod.outlook.com (2603:10b6:806:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:12:48 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::4d) by CH0PR13CA0033.outlook.office365.com
 (2603:10b6:610:b2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend
 Transport; Wed, 18 Mar 2026 16:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 16:12:48 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 11:12:48 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 11:12:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 11:12:47 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IGClPn626223;
	Wed, 18 Mar 2026 11:12:47 -0500
Message-ID: <8b9660ac-0ced-48b2-876c-170e43f774fd@ti.com>
Date: Wed, 18 Mar 2026 11:12:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM
 support
To: Shiva Tripathi <s-tripathi1@ti.com>, Jon Cormier
	<jcormier@criticallink.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<vigneshr@ti.com>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
 <20260317195210.GB11121@denix.org>
 <CADL8D3YiVyFD_89BH67ioe1PUOtszGtoHZAPkvP4Syucc=Y=Jg@mail.gmail.com>
 <94e2affb-ddc2-4a84-aec2-708b4a53ce89@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <94e2affb-ddc2-4a84-aec2-708b4a53ce89@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SA2PR10MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0c5409-5603-41c1-86a0-08de850932b4
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1fwoQxqeoSgNbRtdIO9wJ3fKpiebpgO6ziXPYGIgkUB63x5+JUdoT7p6wWmaEeGglsLficfCAM6JL9XnhdZeTTpagL8U4auYwRIPmB+4HOPW2xbnTK4NX+8KthSAzpK49Dv82ITzmrL2yH50FACHxGwPm/qaM8bl91UmXEQel5sdYMtAARMWpBWIzP2j/AF+w6LWWfp+iLc+Gls+PgCFa+gGj8CFzwQMOvU/qZ0V/eMIC+LZhv2TYj8Gq7UMqNPiAQjJzIcotCWziRDJiojH93IOdMXFuie2O+oEqZAxZqz5L935iVwYuJ7hnPQihPtzsCshVfMDlDn3348DbT4LfcinzENu56lz5f8qdN8IFzT2A8aYKPq8RgJ9qFVko+0sgURC2WMVff/7OwbwBM2b29QvEzNQHtAPAIBAMHghkE7V15fPkEwe+gQESH7DszMdfvCuHmDjqkAIBcEfO5WU/ZD9QW0lj36Psci/v32tacSWGOpYM+ld4a28sw1aSypmvWuPZClajdjuZurg9UuOB8BeqslRTyIp3A63lFM+nMg85I/Vw5hEhQR6zYpT6UAdhOq+nb10vkF/42/5VLHgvF2rUMz74KuwmBnU0J2xQrQLq5A62JDXnrf3QGtzsyx0q/x1dfsW5W/oWVbjhLtgmxM5cnN2qaoYjk5wL6fbUi6Gq7UXg5h213L0YntJn9WwnV9ADbu1dIA5vsBlizLUKJh0MXbvFY+SWTPh0XVhpUY=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5l5npCl74h6ZjN5586aeHG2txEkcbhSyP3KxueyY3nFy9bfcH/3nrPnpvE4q8B38l/61VHbm7YWHxGEykOmqZEJ9HJYyYXdNv6KsFoxHmdpGNZEUzuksOVlFPs6KPR9gKCk50xeJdA+AS9a60pNw0eUZffjBZb82BjLz1khA7g3RFosUIdzHaloqI9tXRv82ktAdqeJV0/yPZ+U9o/VWwDxKeuGdbxsTJjko/OkfERyifFbibeq4xLhNNJ4ltBj7KQYVUGxC6dqVCp0qRY8ba93ysIAEgDdfqI+ZavYoQfVo2k2IVV6svVE5HEFXFv3din6PhZVovdAdSZVYZJOk5l4Rvg/TAKq43boZW8j9GzAUvAE0lHfPuSX02SpRsKHRVCAShBljNHOyh/96F8Ov3RW5FpChRxiSbh8e/r6joP5bnOcVQc0o0ikLGwRAaGN0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:12:48.4160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0c5409-5603-41c1-86a0-08de850932b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4779
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 16:12:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19765

On 3/18/26 9:47 AM, Shiva Tripathi wrote:
>=20
>=20
> On 3/18/26 19:42, Jon Cormier wrote:
>> I am following this discussion as its pretty relevant to us trying to
>> get a full end to end secure boot implementation.
>>
>> On Tue, Mar 17, 2026 at 3:52=E2=80=AFPM Denys Dmytriyenko <denis@denix.o=
rg> wrote:
>>>
>>> Sorry for the delay and thanks for waiting!
>>>
>>> Below are some high-level questions and comments I've got reviewing you=
r
>>> patches.
>=20
> Hi Denys, Jon
> Thanks for the review. Adding my comments below:
>=20
>>>
>>>
>>> On Fri, Mar 06, 2026 at 10:07:32PM +0530, Shiva Tripathi via lists.yoct=
oproject.org wrote:
>>>> This patch series adds LUKS full disk encryption support using firmwar=
e TPM
>>>> (fTPM) for TI K3 platforms. The implementation provides hardware-backe=
d
>>>> encryption with keys sealed by TPM running in OP-TEE and stored in eMM=
C RPMB.
>>>
>>> What are the HW requirements for this implementation?
>>> Does it work on any K3 platform, even GP, or does it require an HS vari=
ant?
>>> What about eMMC requirement?
>>>
>=20
> Yes eMMC with RPMB is mandatory for this implementation to work since
> the TPM sealed key (handle 0x81080001) is stored in RPMB, leveraging the
> replay-attack protection. Since OPTEE FTPM is enabled for K3 [1], this
> implementation is applicable for all K3 platforms (GP and HS both
> inclusive). It would make more sense to use it for HS devices with
> authenticated boot chain present, and fTPM based encryption providing a
> better security model.
>=20
> [1]:
> https://github.com/YoeDistro/meta-ti/blob/master/meta-ti-bsp/conf/machine=
/include/k3.inc#L41
>=20
>=20
>>>
>>>> Background:
>>>> TI K3 platforms do not have integrated discrete TPM hardware. To provi=
de
>>>> TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - =
a
>>>> Trusted Application running in OP-TEE secure world. The fTPM provides
>>>> standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolati=
on
>>>> and eMMC RPMB (Replay Protected Memory Block) for secure persistent st=
orage.
>>>>
>>>> Key features:
>>>> - Conditional builds: Enabled via DISTRO_FEATURES +=3D "luks" with MAC=
HINE_FEATURES as 'optee-ftpm'
>>>
>>> Why is it being added to meta-ti? This seems heavily distro-specific, m=
aybe
>>> even product-specific...
>>>
>>> Moreover, there are run-time dependencies on TPM packages that are not =
in any
>>> of the layers that meta-ti depends on.
>>>
>>> In order to enable this feature, you'd need to add a corresponding laye=
r to
>>> bblayers.conf - should this at a minimum go into a dynamic-layer?
>>>
>>>
>=20
> The reason to keep it in meta-ti is, optee-ftpm recipes and TI K3 OP-TEE
> integration are already in meta-ti-bsp.

Which means they will also be available in any layers that depend on
meta-it-bsp such as meta-arago..

> This LUKS module implementation
> is K3-specific, relies on TI's OP-TEE implementation and uses K3
> hardware features.

How does this rely on TI's OP-TEE? The API's exposed from our OP-TEE
are all standard APIs. I'm not seeing what part of this is actually
TI specific?

Andrew

>=20
> Agree, we can move it to dynamic-layers/security. I'll shorty send the
> v6 patches with this change.
>=20
>>>> - No impact on default SDK builds
>>>
>>> Since this is disabled by default, this never gets built by the CI/CD a=
nd
>>> hence, there's no way to ensure future changes don't break this.
>>> Arguably, there are other features that are not enabled by default
>>> (jailhouse, falcon), so it may be a moot point...
>>>
>=20
> Agree with your concern, we are planning to automate testing for this
> feature starting from am62x platforms. But it's not there in place today.
>=20
>>>
>>>> - In-place encryption on first boot
>>>> - TPM persistent handle for key storage (0x81080001)
>>>> - Secure key storage in eMMC RPMB via OP-TEE
>>>> - Security model similar to CIP Core
>>>>
>>>> Use case:
>>>> This is designed for K3 platforms requiring secure boot and encrypted
>>>
>>> How are you protecting boot partition from getting tampered with?
>>> Besides encrypting rootfs, are there any other Secure Boot steps taken =
to
>>> protect the boot flow from a MITM attack?
>> The guides for secure booting u-boot and the kernel are pretty decent.
>> But currently it gets a bit fuzzy when it gets to securing the
>> filesystem.  And integrating that with Yocto.  The current guide
>> instead of encrypting in place, copies the unencrypted rootfs data
>> into a new encrypted partition during first boot.  And the encryption
>> key isn't protected at all. So this does seem like a positive step
>> forward.
>> https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/11_02_08_02/exp=
orts/docs/linux/Foundational_Components/System_Security/Auth_boot.html
>=20
> Boot partition isn't protected in this implementation. This is
> data-at-rest encryption only. For a complete secure boot flow, this
> should be combined with TI's secure boot (ROM =E2=86=92 SPL =E2=86=92 U-B=
oot =E2=86=92 FIT image
> verification), as highlighted by Jon.
>=20
> Secure Boot + LUKS: Protects against boot tampering + data theft
>=20
>>>
>>>
>>>> storage, such as industrial automation, automotive, and IoT gateways w=
here
>>>> discrete TPM chips are cost-prohibitive but security requirements dema=
nd
>>>> hardware-backed encryption.
>>>>
>>>> Testing:
>>>> - Tested on AM62x platform with kernel 6.18
>>>> - First boot: Successful in-place LUKS encryption
>>>
>>> Have you considered pre-encrypting the image during the build and then
>>> only changing the key, if needed, on the first boot?
>> Would that be any faster?  I'd assume re-encrypting with a new key
>> would take just as long if not more than encrypting once.
>=20
> I have followed the CIP core's security model approach here, which does
> in-place encryption to avoid shipping images with shared encryption key.
>=20
> I think approach you are suggesting would make use of updating LUKS
> keyslots (dummy with TPM key) but i am not very confident about it at
> moment - on speed and any new security attack surface it exposes.
>=20
> Would it be fine to take the in-place encryption approach time being ?
> We can do more analysis on the method you are suggesting and improve
> going ahead.
>=20
>=20
>>>
>>> How long does it take to encrypt the rootfs on the first boot? I would =
imagine
>>> it being very expensive operation to encrypt and overwrite the entire
>>> partition.
>>>
>>> Also, have you considered binding the key to a PCR, so it is not easily
>>> extractable during a MITM attack?
>>>
>>> Anyway, I'm guessing this is just a sample implementation of this one
>>> particular feature - encrypted rootfs - and not a complete Secure Boot =
ready
>>> for production...
>>>
>=20
> I see "17.4 MiB/s" as the encryption speed. For a minimal image (~ 315
> MiB) it takes around 17 seconds.
>=20
> Binding key to PCR would be a next phase improvement. We haven't enabled
> measured boot too yet, in the current series keys are sealed to TPM.
>=20
> Yes, the whole idea of this implementation is to give a reference to
> users who want to use hardware backed solution with RPMB and fTPM and
> perform disk encryption. They'll have to analyze their security model
> requirements and fine tune this reference implementation.
>=20
> Thanks,
> Shiva
>=20
>>>
>>>> - Subsequent boots: Successful TPM unsealing and boot
>>>>
>>>> The series is structured as follows:
>>>> 1. Kernel configuration for LUKS and crypto support
>>>> 2. LUKS encryption initramfs module with fTPM key management
>>>> 3. Initramfs generation trigger and packagegroup with dual gating
>>>>
>>>> ---
>>>> Changes in v5:
>>>> - change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES 'l=
uks'
>>>> - implement dual gating using existing MACHINE_FEATURES 'optee-ftpm'
>>>> - optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW, PC=
BC, SHA256_ARM64
>>>> - packagegroup-ti-core-initramfs.bb changes moved to patch 3 from patc=
h2
>>>> - Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-s-t=
ripathi1@ti.com/
>>>>
>>>> Changes in v4:
>>>> - remove encrypted-boot-common.inc and use existing ti-core-initramfs.=
inc
>>>> - Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-s-t=
ripathi1@ti.com/
>>>>
>>>> Changes in v3:
>>>>   - remove separate sdimage.wks for encrypted boot, default works
>>>>   - update encrypted-boot-common.inc to use existing hook for adding T=
I_CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
>>>>   - add logic to verify if partition has enough space for LUKS header =
before starting encryption
>>>>
>>>> Changes in v2:
>>>> - changes to use existing ti-core-initramfs instead of adding separate
>>>> - cleanup in previous init script as per comments in v1
>>>> - /usr/bin/busybox logs updated to echo, mesg, info
>>>> - WORKDIR changed to UNPACKDIR
>>>> - Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-s-t=
ripathi1@ti.com/
>>>>
>>>> Shiva Tripathi (3):
>>>>    linux-ti-staging: Add LUKS encryption config
>>>>    initramfs: Add LUKS encryption module with fTPM
>>>>    ti-core-initramfs: Enable initramfs for LUKS encryption
>>>>
>>>>   .../machine/include/ti-core-initramfs.inc     |   2 +-
>>>>   .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
>>>>   .../linux/linux-ti-staging_6.18.bb            |   9 +
>>>>   .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++=
++
>>>>   .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
>>>>   .../packagegroup-ti-core-initramfs.bb         |   3 +
>>>>   6 files changed, 417 insertions(+), 1 deletion(-)
>>>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging=
-6.18/luks-ftpm.cfg
>>>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module=
-luks-ftpm/luksftpm
>>>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module=
-luks-ftpm_1.0.bb
>>>>
>>>> --
>>>> 2.34.1
>>
>>
>>
>=20


