Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE9B103E17A
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:13:20 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15093.1773843191712988744
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 07:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=n3I2swSE;
 spf=pass (domain: criticallink.com, ip: 209.85.218.43, mailfrom: jcormier@criticallink.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b976536806cso126880366b.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 07:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773843190; cv=none;
        d=google.com; s=arc-20240605;
        b=PIlL7KRM1g2BBYRj+/xlMgkPPhF4KaQc/hd65XFPWvAN0MNzD1/L8f9vl4pO8Ln9Vv
         LJX6n7xs8u3j28LF+J38aIp/1P/GcBetrfCY2n5PDvIfVlQo7InjqBGDlBOyej2Bp9Xl
         xjtJT3dn9ji41hdA/w2ZmrCASp1VtbdzNRSXeAO9v1A5FNqv+F25drV3Di40WdGl0q1x
         ySdOolkmbeXPqM0tLSQgkSzlzpXwfVoLuhT+b9v1FrTYv0hl4ZUFHh5YVp/86qCISdrQ
         coQzLA91E5e4ew5fTgtsve8/wKExhQkElanUf7n9aQuBZMEgNfZvmbvqaBwbfx4hTc6R
         aSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=82osqqr5XDyshdQCiv149jB7QyDb+jNEPxn8Ck4yPJI=;
        fh=fvG726rXw/iC3nGvZ5O3OwTNFWdqEQG+HvQKM3Co5ls=;
        b=C/U7KUWoJTkF7CbR7i/q2hNXtcItIJj8S+7eH6HF5sZhUfPLG67PaynlRb3fJE7dUu
         mL6zgPdZqiqM6ulYXnPRah4FcOgUAEWFD84cF53fmlSSLhQm2wHLh5d8qA57n8Vx8zMe
         U2Ilt0F4WEXXl2v1VOcNyR68L0cl2YLjwCifZq1ND8vdyNAZjZ+ayxe+5xdBci8NYcVV
         PaS2ZvnxkA3iS0fh/JpipC9vZM8mPR9qqLybUnlLxfzpCsqc390mAYghd0PvIo+HVX3q
         JNrLfM6dSkEO5GBjJeaSy2f0GJqEFrxVoVB1riM44WLcKUVoQleMucKoVpBP+Ova5sKK
         4C1A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1773843190; x=1774447990; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82osqqr5XDyshdQCiv149jB7QyDb+jNEPxn8Ck4yPJI=;
        b=n3I2swSEsMlKfIx8yhZI5V6oipSf8z4TVszI4bp+O891S6EbKcjwcen28755BWTIZw
         9l9Gwr1R3/t3hgLc6y7NxVpFvvURvY+3Lok6Vk7tDYssuq4LdI50Nt6kHBViOUAa7i/Q
         jbkSSyW7n1sZSAsSoccheAl5dNOCPR0Qj5c9n5KA5QajZayGsffIyzngFptyiWy04oiw
         CWN9z9D0gHvqdtua7uI4Axn5bFdmP639jI8mseV/wsPWkpT45gnKqnwyVUdb+hspwRhQ
         WtYNaH6d4nFX+YD5dfpM40r5o8e7YiM3yGpbrnEPbllex8vqGua8jbvL2vxUb3QhXlah
         hS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773843190; x=1774447990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=82osqqr5XDyshdQCiv149jB7QyDb+jNEPxn8Ck4yPJI=;
        b=QpKIG9Y2WDdcdbXRZ6Nty/ekMiAfaYBYpWTjxr75P6ZMggTMjtxeHYqlG6r8QiNJMr
         Q0l/QoaOz/ZM/rLQp4qAB5TpEsFZXc0dyhpibzMqZP4eJSy5d5zdljejesePQjJhe9Bm
         NIGy+2N31qbtw0XUupowbvs23dgkQUma9eGp9fn2FxMf+9howGiaQnntyc/0Usd//d2M
         hGcPbKAIUDw1AkKnWY19O7atsLI8fucKxdBU26cxBImbJBsnWPD0uiQVCzsT0Wcp4aeU
         9/oYuHhHYWWGSwFqj05P1s/Uxvyw/Cy2RV+1lKts34pnr6QlXRzpMAo4nrzY9SqgVB+u
         4Urg==
X-Forwarded-Encrypted: i=1; AJvYcCXrZxerQNJ3IrG43OoaBbOf/PfTxpyzVBcQOLz1G+5NuKGQgbzP+YsENb0DZAfOxOU0aDhnhGej@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyQ5ycbREJRS14fQ+wzsFcM2ErxedUJvmMQAOgc6mCOmQ7iu99v
	YHRae+zx+ajnhHVp6pjGe1GS5JR4dax++ZYpfkgEdYU6j9NsQOBBZ0c4n0XClchzN0IqamJ7+7V
	rSefFMP6CyVM3mdpXI/N7C89MTBhvu7WbVfVQFKfL
X-Gm-Gg: ATEYQzzbRmwMOSevPuTaTJjS01i6e+CRia7Trqm7Pa7uCKcITh2V9U1hihF/JUIQprY
	aaW0Flfsg9K0pA46fdHEThTglEQMY24tkAF03UsiFoyBCBnCh9TF8pgBwRsxRM9RTquCKpkEllx
	Nj/xcgQGhc8H+iWNDCQuUZbG5yevsTXQkrOlYdQwf5wXjp4I7J8YCQy0Z0zu44zA+GUUSDOuB8V
	9xvtfyWYwUSYg4v0+zmgrxaUycznfanHpffdoal3Q5dh5Q/0gBhNP9cBjTdNqrKPts5XJU1c76D
	8vLz0w==
X-Received: by 2002:a17:907:869f:b0:b93:89cd:2bbc with SMTP id
 a640c23a62f3a-b97f4b83175mr237681266b.56.1773843189760; Wed, 18 Mar 2026
 07:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260306163735.1316257-1-s-tripathi1@ti.com> <20260317195210.GB11121@denix.org>
In-Reply-To: <20260317195210.GB11121@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 18 Mar 2026 10:12:57 -0400
X-Gm-Features: AaiRm501YPfxvMzS-GoEpmA_4NyGLWcXGypwuH0ww7cj__DouB13sy6kJpjVqS8
Message-ID: <CADL8D3YiVyFD_89BH67ioe1PUOtszGtoHZAPkvP4Syucc=Y=Jg@mail.gmail.com>
Subject: Re: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM support
To: Denys Dmytriyenko <denis@denix.org>
Cc: s-tripathi1@ti.com, meta-ti@lists.yoctoproject.org, reatmon@ti.com, 
	rs@ti.com, praneeth@ti.com, kamlesh@ti.com, vishalm@ti.com, 
	k-malarvizhi@ti.com, vigneshr@ti.com, afd@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 14:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19757

I am following this discussion as its pretty relevant to us trying to
get a full end to end secure boot implementation.

On Tue, Mar 17, 2026 at 3:52=E2=80=AFPM Denys Dmytriyenko <denis@denix.org>=
 wrote:
>
> Sorry for the delay and thanks for waiting!
>
> Below are some high-level questions and comments I've got reviewing your
> patches.
>
>
> On Fri, Mar 06, 2026 at 10:07:32PM +0530, Shiva Tripathi via lists.yoctop=
roject.org wrote:
> > This patch series adds LUKS full disk encryption support using firmware=
 TPM
> > (fTPM) for TI K3 platforms. The implementation provides hardware-backed
> > encryption with keys sealed by TPM running in OP-TEE and stored in eMMC=
 RPMB.
>
> What are the HW requirements for this implementation?
> Does it work on any K3 platform, even GP, or does it require an HS varian=
t?
> What about eMMC requirement?
>
>
> > Background:
> > TI K3 platforms do not have integrated discrete TPM hardware. To provid=
e
> > TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - a
> > Trusted Application running in OP-TEE secure world. The fTPM provides
> > standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolatio=
n
> > and eMMC RPMB (Replay Protected Memory Block) for secure persistent sto=
rage.
> >
> > Key features:
> > - Conditional builds: Enabled via DISTRO_FEATURES +=3D "luks" with MACH=
INE_FEATURES as 'optee-ftpm'
>
> Why is it being added to meta-ti? This seems heavily distro-specific, may=
be
> even product-specific...
>
> Moreover, there are run-time dependencies on TPM packages that are not in=
 any
> of the layers that meta-ti depends on.
>
> In order to enable this feature, you'd need to add a corresponding layer =
to
> bblayers.conf - should this at a minimum go into a dynamic-layer?
>
>
> > - No impact on default SDK builds
>
> Since this is disabled by default, this never gets built by the CI/CD and
> hence, there's no way to ensure future changes don't break this.
> Arguably, there are other features that are not enabled by default
> (jailhouse, falcon), so it may be a moot point...
>
>
> > - In-place encryption on first boot
> > - TPM persistent handle for key storage (0x81080001)
> > - Secure key storage in eMMC RPMB via OP-TEE
> > - Security model similar to CIP Core
> >
> > Use case:
> > This is designed for K3 platforms requiring secure boot and encrypted
>
> How are you protecting boot partition from getting tampered with?
> Besides encrypting rootfs, are there any other Secure Boot steps taken to
> protect the boot flow from a MITM attack?
The guides for secure booting u-boot and the kernel are pretty decent.
But currently it gets a bit fuzzy when it gets to securing the
filesystem.  And integrating that with Yocto.  The current guide
instead of encrypting in place, copies the unencrypted rootfs data
into a new encrypted partition during first boot.  And the encryption
key isn't protected at all. So this does seem like a positive step
forward.
https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/11_02_08_02/export=
s/docs/linux/Foundational_Components/System_Security/Auth_boot.html
>
>
> > storage, such as industrial automation, automotive, and IoT gateways wh=
ere
> > discrete TPM chips are cost-prohibitive but security requirements deman=
d
> > hardware-backed encryption.
> >
> > Testing:
> > - Tested on AM62x platform with kernel 6.18
> > - First boot: Successful in-place LUKS encryption
>
> Have you considered pre-encrypting the image during the build and then
> only changing the key, if needed, on the first boot?
Would that be any faster?  I'd assume re-encrypting with a new key
would take just as long if not more than encrypting once.
>
> How long does it take to encrypt the rootfs on the first boot? I would im=
agine
> it being very expensive operation to encrypt and overwrite the entire
> partition.
>
> Also, have you considered binding the key to a PCR, so it is not easily
> extractable during a MITM attack?
>
> Anyway, I'm guessing this is just a sample implementation of this one
> particular feature - encrypted rootfs - and not a complete Secure Boot re=
ady
> for production...
>
>
> > - Subsequent boots: Successful TPM unsealing and boot
> >
> > The series is structured as follows:
> > 1. Kernel configuration for LUKS and crypto support
> > 2. LUKS encryption initramfs module with fTPM key management
> > 3. Initramfs generation trigger and packagegroup with dual gating
> >
> > ---
> > Changes in v5:
> > - change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES 'lu=
ks'
> > - implement dual gating using existing MACHINE_FEATURES 'optee-ftpm'
> > - optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW, PCB=
C, SHA256_ARM64
> > - packagegroup-ti-core-initramfs.bb changes moved to patch 3 from patch=
2
> > - Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-s-tr=
ipathi1@ti.com/
> >
> > Changes in v4:
> > - remove encrypted-boot-common.inc and use existing ti-core-initramfs.i=
nc
> > - Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-s-tr=
ipathi1@ti.com/
> >
> > Changes in v3:
> >  - remove separate sdimage.wks for encrypted boot, default works
> >  - update encrypted-boot-common.inc to use existing hook for adding TI_=
CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
> >  - add logic to verify if partition has enough space for LUKS header be=
fore starting encryption
> >
> > Changes in v2:
> > - changes to use existing ti-core-initramfs instead of adding separate
> > - cleanup in previous init script as per comments in v1
> > - /usr/bin/busybox logs updated to echo, mesg, info
> > - WORKDIR changed to UNPACKDIR
> > - Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-s-tr=
ipathi1@ti.com/
> >
> > Shiva Tripathi (3):
> >   linux-ti-staging: Add LUKS encryption config
> >   initramfs: Add LUKS encryption module with fTPM
> >   ti-core-initramfs: Enable initramfs for LUKS encryption
> >
> >  .../machine/include/ti-core-initramfs.inc     |   2 +-
> >  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
> >  .../linux/linux-ti-staging_6.18.bb            |   9 +
> >  .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
> >  .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
> >  .../packagegroup-ti-core-initramfs.bb         |   3 +
> >  6 files changed, 417 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6=
.18/luks-ftpm.cfg
> >  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-l=
uks-ftpm/luksftpm
> >  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-l=
uks-ftpm_1.0.bb
> >
> > --
> > 2.34.1



--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

