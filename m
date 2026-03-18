Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B86C107760E
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 19:32:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22759.1773862353881996292
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 12:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 369F140CCC;
	Wed, 18 Mar 2026 19:32:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6QYRbzua-l5; Wed, 18 Mar 2026 19:32:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7F5EB40BD6;
	Wed, 18 Mar 2026 19:32:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B8DE17A5D6; Wed, 18 Mar 2026 15:32:20 -0400 (EDT)
Date: Wed, 18 Mar 2026 15:32:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-tripathi1@ti.com
Cc: Jon Cormier <jcormier@criticallink.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com, rs@ti.com, praneeth@ti.com, kamlesh@ti.com,
	vishalm@ti.com, k-malarvizhi@ti.com, vigneshr@ti.com, afd@ti.com
Subject: Re: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM
 support
Message-ID: <20260318193220.GN11121@denix.org>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
 <20260317195210.GB11121@denix.org>
 <CADL8D3YiVyFD_89BH67ioe1PUOtszGtoHZAPkvP4Syucc=Y=Jg@mail.gmail.com>
 <94e2affb-ddc2-4a84-aec2-708b4a53ce89@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <94e2affb-ddc2-4a84-aec2-708b4a53ce89@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 19:32:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19766

On Wed, Mar 18, 2026 at 08:17:38PM +0530, Shiva Tripathi via lists.yoctop=
roject.org wrote:
>=20
>=20
> On 3/18/26 19:42, Jon Cormier wrote:
> > I am following this discussion as its pretty relevant to us trying to
> > get a full end to end secure boot implementation.
> >=20
> > On Tue, Mar 17, 2026 at 3:52=E2=80=AFPM Denys Dmytriyenko <denis@deni=
x.org> wrote:
> >>
> >> Sorry for the delay and thanks for waiting!
> >>
> >> Below are some high-level questions and comments I've got reviewing =
your
> >> patches.
>=20
> Hi Denys, Jon
> Thanks for the review. Adding my comments below:

Hi Shiva,

Thank you for your response and confirming many of my assumptions!


> >>
> >>
> >> On Fri, Mar 06, 2026 at 10:07:32PM +0530, Shiva Tripathi via lists.y=
octoproject.org wrote:
> >>> This patch series adds LUKS full disk encryption support using firm=
ware TPM
> >>> (fTPM) for TI K3 platforms. The implementation provides hardware-ba=
cked
> >>> encryption with keys sealed by TPM running in OP-TEE and stored in =
eMMC RPMB.
> >>
> >> What are the HW requirements for this implementation?
> >> Does it work on any K3 platform, even GP, or does it require an HS v=
ariant?
> >> What about eMMC requirement?
> >>
>=20
> Yes eMMC with RPMB is mandatory for this implementation to work since
> the TPM sealed key (handle 0x81080001) is stored in RPMB, leveraging th=
e
> replay-attack protection. Since OPTEE FTPM is enabled for K3 [1], this
> implementation is applicable for all K3 platforms (GP and HS both
> inclusive).

> It would make more sense to use it for HS devices with authenticated bo=
ot=20
> chain present,

Ok, yes, this last tidbit is quite important, and it clarifies many of my=
=20
questions/comments - thanks for spelling it out. It also gets referred la=
ter=20
in the discussion.


> and fTPM based encryption providing a
> better security model.
>=20
> [1]:
> https://github.com/YoeDistro/meta-ti/blob/master/meta-ti-bsp/conf/machi=
ne/include/k3.inc#L41
>=20
>=20
> >>
> >>> Background:
> >>> TI K3 platforms do not have integrated discrete TPM hardware. To pr=
ovide
> >>> TPM 2.0 functionality, this implementation uses firmware TPM (fTPM)=
 - a
> >>> Trusted Application running in OP-TEE secure world. The fTPM provid=
es
> >>> standard TPM 2.0 interfaces while leveraging ARM TrustZone for isol=
ation
> >>> and eMMC RPMB (Replay Protected Memory Block) for secure persistent=
 storage.
> >>>
> >>> Key features:
> >>> - Conditional builds: Enabled via DISTRO_FEATURES +=3D "luks" with =
MACHINE_FEATURES as 'optee-ftpm'
> >>
> >> Why is it being added to meta-ti? This seems heavily distro-specific=
, maybe
> >> even product-specific...
> >>
> >> Moreover, there are run-time dependencies on TPM packages that are n=
ot in any
> >> of the layers that meta-ti depends on.
> >>
> >> In order to enable this feature, you'd need to add a corresponding l=
ayer to
> >> bblayers.conf - should this at a minimum go into a dynamic-layer?
> >>
> >>
>=20
> The reason to keep it in meta-ti is, optee-ftpm recipes and TI K3 OP-TE=
E
> integration are already in meta-ti-bsp. This LUKS module implementation
> is K3-specific, relies on TI's OP-TEE implementation and uses K3
> hardware features.
>=20
> Agree, we can move it to dynamic-layers/security. I'll shorty send the
> v6 patches with this change.

+1


> >>> - No impact on default SDK builds
> >>
> >> Since this is disabled by default, this never gets built by the CI/C=
D and
> >> hence, there's no way to ensure future changes don't break this.
> >> Arguably, there are other features that are not enabled by default
> >> (jailhouse, falcon), so it may be a moot point...
> >>
>=20
> Agree with your concern, we are planning to automate testing for this
> feature starting from am62x platforms. But it's not there in place toda=
y.

+1


> >>
> >>> - In-place encryption on first boot
> >>> - TPM persistent handle for key storage (0x81080001)
> >>> - Secure key storage in eMMC RPMB via OP-TEE
> >>> - Security model similar to CIP Core
> >>>
> >>> Use case:
> >>> This is designed for K3 platforms requiring secure boot and encrypt=
ed
> >>
> >> How are you protecting boot partition from getting tampered with?
> >> Besides encrypting rootfs, are there any other Secure Boot steps tak=
en to
> >> protect the boot flow from a MITM attack?
> > The guides for secure booting u-boot and the kernel are pretty decent=
.
> > But currently it gets a bit fuzzy when it gets to securing the
> > filesystem.  And integrating that with Yocto.  The current guide
> > instead of encrypting in place, copies the unencrypted rootfs data
> > into a new encrypted partition during first boot.  And the encryption
> > key isn't protected at all. So this does seem like a positive step
> > forward.
> > https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/11_02_08_02/=
exports/docs/linux/Foundational_Components/System_Security/Auth_boot.html
>=20
> Boot partition isn't protected in this implementation. This is
> data-at-rest encryption only. For a complete secure boot flow, this
> should be combined with TI's secure boot (ROM =E2=86=92 SPL =E2=86=92 U=
-Boot =E2=86=92 FIT image
> verification), as highlighted by Jon.
>=20
> Secure Boot + LUKS: Protects against boot tampering + data theft

Yes, as I suspected and/or assumed - good to get this confirmed.


> >>> storage, such as industrial automation, automotive, and IoT gateway=
s where
> >>> discrete TPM chips are cost-prohibitive but security requirements d=
emand
> >>> hardware-backed encryption.
> >>>
> >>> Testing:
> >>> - Tested on AM62x platform with kernel 6.18
> >>> - First boot: Successful in-place LUKS encryption
> >>
> >> Have you considered pre-encrypting the image during the build and th=
en
> >> only changing the key, if needed, on the first boot?
> > Would that be any faster?  I'd assume re-encrypting with a new key
> > would take just as long if not more than encrypting once.
>=20
> I have followed the CIP core's security model approach here, which does
> in-place encryption to avoid shipping images with shared encryption key=
.
>=20
> I think approach you are suggesting would make use of updating LUKS
> keyslots (dummy with TPM key) but i am not very confident about it at
> moment - on speed and any new security attack surface it exposes.

Correct, pre-encrypt rootfs at build with some initial key (should be set=
=20
externally by a customer) and then on first boot add a new device-specifi=
c=20
key from TPM to a new slot and remove the initial key slot. No re-encrypt=
ion=20
of the entire rootfs is required and it's a common practice.

Almost always final products will have to be powered on and tested at the=
=20
factory, before shipping, hence the initial build key will be inactive.


> Would it be fine to take the in-place encryption approach time being ?
> We can do more analysis on the method you are suggesting and improve
> going ahead.

I'm fine with leaving it for later.


> >>
> >> How long does it take to encrypt the rootfs on the first boot? I wou=
ld imagine
> >> it being very expensive operation to encrypt and overwrite the entir=
e
> >> partition.
> >>
> >> Also, have you considered binding the key to a PCR, so it is not eas=
ily
> >> extractable during a MITM attack?
> >>
> >> Anyway, I'm guessing this is just a sample implementation of this on=
e
> >> particular feature - encrypted rootfs - and not a complete Secure Bo=
ot ready
> >> for production...
> >>
>=20
> I see "17.4 MiB/s" as the encryption speed. For a minimal image (~ 315
> MiB) it takes around 17 seconds.
>=20
> Binding key to PCR would be a next phase improvement. We haven't enable=
d
> measured boot too yet, in the current series keys are sealed to TPM.

+1


> Yes, the whole idea of this implementation is to give a reference to
> users who want to use hardware backed solution with RPMB and fTPM and
> perform disk encryption. They'll have to analyze their security model
> requirements and fine tune this reference implementation.

+1


> Thanks,
> Shiva

And thank you for addressing the feedback and providing additional detail=
s.

--=20
Denys


> >>
> >>> - Subsequent boots: Successful TPM unsealing and boot
> >>>
> >>> The series is structured as follows:
> >>> 1. Kernel configuration for LUKS and crypto support
> >>> 2. LUKS encryption initramfs module with fTPM key management
> >>> 3. Initramfs generation trigger and packagegroup with dual gating
> >>>
> >>> ---
> >>> Changes in v5:
> >>> - change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES=
 'luks'
> >>> - implement dual gating using existing MACHINE_FEATURES 'optee-ftpm=
'
> >>> - optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW,=
 PCBC, SHA256_ARM64
> >>> - packagegroup-ti-core-initramfs.bb changes moved to patch 3 from p=
atch2
> >>> - Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-=
s-tripathi1@ti.com/
> >>>
> >>> Changes in v4:
> >>> - remove encrypted-boot-common.inc and use existing ti-core-initram=
fs.inc
> >>> - Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-=
s-tripathi1@ti.com/
> >>>
> >>> Changes in v3:
> >>>  - remove separate sdimage.wks for encrypted boot, default works
> >>>  - update encrypted-boot-common.inc to use existing hook for adding=
 TI_CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
> >>>  - add logic to verify if partition has enough space for LUKS heade=
r before starting encryption
> >>>
> >>> Changes in v2:
> >>> - changes to use existing ti-core-initramfs instead of adding separ=
ate
> >>> - cleanup in previous init script as per comments in v1
> >>> - /usr/bin/busybox logs updated to echo, mesg, info
> >>> - WORKDIR changed to UNPACKDIR
> >>> - Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-=
s-tripathi1@ti.com/
> >>>
> >>> Shiva Tripathi (3):
> >>>   linux-ti-staging: Add LUKS encryption config
> >>>   initramfs: Add LUKS encryption module with fTPM
> >>>   ti-core-initramfs: Enable initramfs for LUKS encryption
> >>>
> >>>  .../machine/include/ti-core-initramfs.inc     |   2 +-
> >>>  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
> >>>  .../linux/linux-ti-staging_6.18.bb            |   9 +
> >>>  .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++=
++++
> >>>  .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
> >>>  .../packagegroup-ti-core-initramfs.bb         |   3 +
> >>>  6 files changed, 417 insertions(+), 1 deletion(-)
> >>>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-stagi=
ng-6.18/luks-ftpm.cfg
> >>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-modu=
le-luks-ftpm/luksftpm
> >>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-modu=
le-luks-ftpm_1.0.bb
> >>>
> >>> --
> >>> 2.34.1

