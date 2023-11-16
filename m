Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDC9C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 05:13:05 +0000 (UTC)
Received: from egress-ip12b.ess.de.barracuda.com (egress-ip12b.ess.de.barracuda.com [18.185.115.216])
 by mx.groups.io with SMTP id smtpd.web11.1074.1700111580804614404
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 21:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=iY3qtguq;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.216, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72]) by mx-outbound22-47.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 16 Nov 2023 05:12:55 +0000
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-507d2e150c2so334252e87.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 21:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1700111575; x=1700716375; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GNgsuNHpDLPmS7PhV4X7vCyt02yKNXIYDREU/+vUOc=;
        b=iY3qtguq0MoiNpS/9QJyIxTuyAIbZWvJ7YWR/1ldW+JWsW7WmA5N8t+DhZjDb5cY4r
         Y7qZQZ8dG+7q/tyxvojHjU9WdahzjvWF/bW+i960sCzufKYojjF9j4XH/T8PzUIogszO
         6a3Lp/vmNy/GLAaXebvvFdlKEcIK71kGUit+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700111575; x=1700716375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GNgsuNHpDLPmS7PhV4X7vCyt02yKNXIYDREU/+vUOc=;
        b=ScjTJ4FlI2fCfpXCRPyy2qmfHz8w80tvEFaA8knvimUKUBh4e0EJ81YyECPbyaVdCI
         NccAhrUXOcEvZJKGvL7P6yWqj9g2Y+nYRyZV0gK5mBFNahU+OP8dOoaYOPD7TKdVJ35m
         AM5zfQB9SynZEFGwpehvynqYpmjsPXXGSlIwPfwWnTnQVK5LBf2oyizy9j26Rf2Y64JJ
         VTRb6R3j2rtUD7astCiyPhrgZrrNWspyRxp9iyLMYBy3J/GdmFM4Ynb29HcWqS/ntc5N
         PQnKZEbRGxGE5vsGqEsx4aOIL2qk8wsFZnMu+27ZVIrkCUVimjtsufIILx2njB1i3gkG
         STKw==
X-Gm-Message-State: AOJu0YwJjfTx23Iov5EWiVPUctxMNZlKsCOHRn5cRCKJ911pUVAbA0fs
	TuYzGDN41UsEWSVLS/rOqHImFt2YCnPjUB2W9B9mEzhURqtbJiTmk6c9njKdKTVNmSQ0zOZ6dQZ
	EdfpoZUMjo5LA1wtK+aoIKzUmTQGlnpenr4DW7MmuWtCAXUz8xzesA2QxtWtZJVPPWnpARa5aMG
	H0jUQ=
X-Received: by 2002:ac2:5dc7:0:b0:507:9e51:a6c7 with SMTP id x7-20020ac25dc7000000b005079e51a6c7mr10578112lfq.58.1700111575295;
        Wed, 15 Nov 2023 21:12:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPaNlRLvUn7TbmI1prjENz64+M8NYibHzwfbLY9Rt5msolNa0TWSuS32sZr3IU4o9CB2NfjKubq7/fPs2Y6Vs=
X-Received: by 2002:ac2:5dc7:0:b0:507:9e51:a6c7 with SMTP id
 x7-20020ac25dc7000000b005079e51a6c7mr10578092lfq.58.1700111574790; Wed, 15
 Nov 2023 21:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20231115105842.4629-1-sinthu.raja@ti.com> <e5d72429-1930-427f-95fb-1f15a47b0ad5@ti.com>
 <a8385dac-08b0-460c-9213-4e56dd167d57@ti.com>
In-Reply-To: <a8385dac-08b0-460c-9213-4e56dd167d57@ti.com>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Thu, 16 Nov 2023 10:42:43 +0530
Message-ID: <CAEd-yTS99fpgS8rnqZGnHOnoRasEX6a1viMzPXb2HmpYM0Ov4A@mail.gmail.com>
Subject: Re: [meta-ti][kirkstone][PATCH] ti-gc320-driver: fix stdarg header
 file compilation issues
To: Ryan Eatmon <reatmon@ti.com>
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, detheridge@ti.com, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denis@denix.org>, Sinthu Raja <sinthu.raja@ti.com>, 
	"Pothukuchi, Vijay" <vijayp@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BESS-ID: 1700111575-305679-4239-33930-1
X-BESS-VER: 2019.1_20231114.2339
X-BESS-Apparent-Source-IP: 209.85.167.72
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVmbmRqZAVgZQ0Cg50SjNyMLI0N
	zEzMwoxdjIPMU8xSQpxdggLdk01SJJqTYWAAMpEgdBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.252171 [from 
	cloudscan11-163.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Nov 2023 05:13:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17303

On Thu, Nov 16, 2023 at 12:23=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote=
:
>
>
>
> On 11/15/2023 11:39 AM, Bajjuri, Praneeth wrote:
> > updating denys email id
> >
> > On 11/15/2023 4:58 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> >> From: Sinthu Raja <sinthu.raja@ti.com>
> >>
> >> The stdarg header file location is changed to linux/stdarg.h. Add patc=
h
> >> to fix the compilation issue and also add fix to import DMA_BUF namspa=
ce
> >> to load the dma_buf modules
> >>
> >> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >> ---
> >>   ...tdarg-header-file-compilation-issues.patch | 43 +++++++++++++++++=
++
> >>   ...F-namespace-to-load-the-dma_buf-modu.patch | 28 ++++++++++++
> >>   .../ti-gc320-driver_5.0.11.p7.bb              |  4 +-
> >
> > Why not patch it at
> > https://git.ti.com/cgit/graphics/ti-gc320-driver/
> >
> > and have a branch ti-5.0.11.p7-k6.1 ?
> >
> > and only do SRCREV update and rename the bb recipe?
>
>
> Agreed.  This is the better way of doing it.  We do not want to carry
> any more patches in meta-ti that are not yocto build requirements
> specific.  This patch should go into the upstream repo on a new branch
> like Praneeth said.

Agreed, will make the changes as suggested.
>
>
> >
> >>   3 files changed, 74 insertions(+), 1 deletion(-)
> >>   create mode 100644
> >> meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-=
file-compilation-issues.patch
> >>   create mode 100644
> >> meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-nam=
espace-to-load-the-dma_buf-modu.patch
> >>
> >> diff --git
> >> a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-heade=
r-file-compilation-issues.patch b/meta-ti-bsp/recipes-bsp/gc320-drivers/fil=
es/0001-km-Fix-stdarg-header-file-compilation-issues.patch
> >> new file mode 100644
> >> index 00000000..9262fe6a
> >> --- /dev/null
> >> +++
> >> b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-heade=
r-file-compilation-issues.patch
> >> @@ -0,0 +1,43 @@
> >> +From 466a0f62d4ca9fd8eeea3fc060f4f1a9584f4af5 Mon Sep 17 00:00:00 200=
1
> >> +From: Sinthu Raja <sinthu.raja@ti.com>
> >> +Date: Tue, 14 Nov 2023 12:45:29 +0530
> >> +Subject: [PATCH 1/2] km: Fix stdarg header file compilation issues
> >> +
> >> +The location of the stdarg.h is changed to linux/stdarg.h. Fix the sa=
me
> >> +by updating the stdarg header location.
> >> +
> >> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >> +---
> >> + hal/os/linux/kernel/gc_hal_kernel_debug.h   | 2 +-
> >> + hal/os/linux/kernel/gc_hal_kernel_debugfs.h | 2 +-
> >> + 2 files changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_debug.h
> >> b/hal/os/linux/kernel/gc_hal_kernel_debug.h
> >> +index 54782fd..cac5528 100755
> >> +--- a/hal/os/linux/kernel/gc_hal_kernel_debug.h
> >> ++++ b/hal/os/linux/kernel/gc_hal_kernel_debug.h
> >> +@@ -59,7 +59,7 @@
> >> + #include <gc_hal_kernel_linux.h>
> >> + #include <linux/spinlock.h>
> >> + #include <linux/time.h>
> >> +-#include <stdarg.h>
> >> ++#include <linux/stdarg.h>
> >> +
> >> + #ifdef __cplusplus
> >> + extern "C" {
> >> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
> >> b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
> >> +index 9a15d77..a960272 100755
> >> +--- a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
> >> ++++ b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
> >> +@@ -53,7 +53,7 @@
> >> +
> >> **********************************************************************=
*******/
> >> +
> >> +
> >> +-#include <stdarg.h>
> >> ++#include <linux/stdarg.h>
> >> +
> >> + #ifndef __gc_hal_kernel_debugfs_h_
> >> + #define __gc_hal_kernel_debugfs_h_
> >> +--
> >> +2.36.1
> >> +
> >> diff --git
> >> a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-n=
amespace-to-load-the-dma_buf-modu.patch b/meta-ti-bsp/recipes-bsp/gc320-dri=
vers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch
> >> new file mode 100644
> >> index 00000000..f95599ef
> >> --- /dev/null
> >> +++
> >> b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-n=
amespace-to-load-the-dma_buf-modu.patch
> >> @@ -0,0 +1,28 @@
> >> +From e7d20324dcfed1b57e09d9e1498fad666e91665e Mon Sep 17 00:00:00 200=
1
> >> +From: Sinthu Raja <sinthu.raja@ti.com>
> >> +Date: Tue, 14 Nov 2023 12:53:00 +0530
> >> +Subject: [PATCH 2/2] km: import DMA_BUF namespace to load the dma_buf
> >> modules
> >> +
> >> +The DMA BUF module is added to the namespace. To load the graphics
> >> +driver with dma_buf module import the DAM_BUF namespace
> >> +
> >> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> >> +---
> >> + hal/os/linux/kernel/gc_hal_kernel_probe.c | 1 +
> >> + 1 file changed, 1 insertion(+)
> >> +
> >> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_probe.c
> >> b/hal/os/linux/kernel/gc_hal_kernel_probe.c
> >> +index 877b5a2..430c67e 100755
> >> +--- a/hal/os/linux/kernel/gc_hal_kernel_probe.c
> >> ++++ b/hal/os/linux/kernel/gc_hal_kernel_probe.c
> >> +@@ -73,6 +73,7 @@
> >> + #define _GC_OBJ_ZONE    gcvZONE_DRIVER
> >> +
> >> + MODULE_DESCRIPTION("Vivante Graphics Driver");
> >> ++MODULE_IMPORT_NS(DMA_BUF);
> >> + MODULE_LICENSE("GPL");
> >> +
> >> + static struct class* gpuClass;
> >> +--
> >> +2.36.1
> >> +
> >> diff --git
> >> a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> >> b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> >> index a56810d4..e38d9f49 100644
> >> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
> >> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
> >> @@ -15,7 +15,9 @@ BRANCH =3D "ti-${PV}-k5.10"
> >>   SRCREV =3D "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
> >> -SRC_URI =3D
> >> "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=3Dhttps;br=
anch=3D${BRANCH}"
> >> +SRC_URI =3D
> >> "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=3Dhttps;br=
anch=3D${BRANCH} \
> >> +       file://0001-km-Fix-stdarg-header-file-compilation-issues.patch=
 \
> >> +
> >> file://0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch=
"
> >>   S =3D "${WORKDIR}/git/src"
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#17299):
> >> https://lists.yoctoproject.org/g/meta-ti/message/17299
> >> Mute This Topic: https://lists.yoctoproject.org/mt/102602692/2167429
> >> Group Owner: meta-ti+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub
> >> [praneeth@ti.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS



--=20
With Regards
Sinthu Raja

