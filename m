Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E2EC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 23:27:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8178.1737588438220341153
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 15:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 86CFE40C83;
	Wed, 22 Jan 2025 23:27:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t87BN3JZ7MvP; Wed, 22 Jan 2025 23:27:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D78D40A46;
	Wed, 22 Jan 2025 23:27:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 00BDA16418F; Wed, 22 Jan 2025 18:27:11 -0500 (EST)
Date: Wed, 22 Jan 2025 18:27:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
	denys@konsulko.com, u-kumar1@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [scarthgap][PATCH] linux-ti-staging: Add
 config-fragments for v6.12 Kernel
Message-ID: <20250122232711.GV21836@denix.org>
References: <20250121175625.4114041-1-b-padhi@ti.com>
 <7ea61ec8-e499-48d7-9fb5-f5159c6bc82d@ti.com>
 <f829641b-ae91-4b31-9077-9547f05a670b@ti.com>
 <4f841008-3741-4e52-8373-34ea10f78b53@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4f841008-3741-4e52-8373-34ea10f78b53@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 23:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18226

On Wed, Jan 22, 2025 at 11:39:14AM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
> On 1/22/25 11:10 AM, Ryan Eatmon wrote:
> >
> >
> >On 1/22/2025 10:50 AM, Andrew Davis wrote:
> >>On 1/21/25 11:56 AM, Beleswar Padhi wrote:
> >>>ti-linux-kernel tree has several prune config fragments for ARM/ARM6=
4/RT
> >>>configurations. Enable the prune config fragments here.
> >>>
> >>>Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> >>>---
> >>>=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/defconfig=A0=A0=A0=
=A0=A0=A0=A0 | 2 +-
> >>>=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig=A0=A0=
=A0=A0 | 2 +-
> >>>=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig=A0=
 | 2 +-
> >>>=A0 .../recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig=A0=
 | 2 +-
> >>>=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig=A0=A0=
=A0=A0 | 2 +-
> >>>=A0 .../recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig=A0=
 | 2 +-
> >>>=A0 .../linux/linux-ti-staging-rt-6.12/ti33x/defconfig=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> >>>=A0 .../linux/linux-ti-staging-rt-6.12/ti43x/defconfig=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> >>>=A0 8 files changed, 8 insertions(+), 8 deletions(-)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defcon=
fig
> >>>index 9d579e41..24b53cf7 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Dmulti_v7_defconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/=
k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/=
defconfig
> >>>index fd07b34e..ef1d3efd 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defc=
onfig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defc=
onfig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Ddefconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_arm64_prune.config
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/=
ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/=
ti33x/defconfig
> >>>index 9d579e41..e6a967e1 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/d=
efconfig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/d=
efconfig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Dmulti_v7_defconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/co=
nfigs/no_smp.config
> >>
> >>We are running into some issues with the no_smp.config, seems some ke=
rnel
> >>sysfs items relating to CPU counts are misbehaving (Chirag has more d=
etails
> >>if anyone is interested). Disabling SMP is not well tested in general=
 anymore
> >>as it is often enabled by default even for single-core systems. The v=
ery small
> >>performance change is not worth the lack of testing and instability c=
aused
> >>by going with non-standard configurations IMHO.
> >>
> >>Everything else here looks good, but could we drop no_smp.config for =
now
> >>and take up a debate on adding it in at a later time?
> >>
> >>This also has the side benefit of reducing our kernel builds from 6 v=
ariations
> >>to just 4 (arm32/64 x rt/non-rt).
> >
> >We only have 4 now... the no_smp was just added to ti33 and ti43 for b=
ackwards compat to fix some issues.=A0=A0 But we never did additional ker=
nel builds because of it...
> >
> >What were the 6 variations you were referring to?
> >
>=20
> multi_v7_defconfig + ti_multi_v7_prune.config
> multi_v7_defconfig + ti_multi_v7_prune.config + no_smp.config
> multi_v7_defconfig + ti_multi_v7_prune.config + ti_rt.config
> multi_v7_defconfig + ti_multi_v7_prune.config + no_smp.config + ti_rt.c=
onfig
> defconfig + ti_arm64_prune.config
> defconfig + ti_arm64_prune.config + ti_rt.config
>=20
> These are the variations, so without no_smp.config there would
> only be 2 kernels across all am3/4/5, one with and one without RT.
>=20
> On the side I've been working to make the kernel build into
> one for all of aarch64 (i.e. one package in aarch64-oe-linux
> vs kernel for each and every platform). Would like to do the
> same for armv7.

FWIW, the way it is now being handled in OE-Core is with genericarm64 mac=
hine=20
to target Arm System Ready devices. And BeaglePlay is currently the Refer=
ence=20
Platform for this use case. Basically, OE-Core builds a generic kernel th=
at=20
can run on any Aarch64 device...

But it is not ideal though, as it completely ignores everything that come=
s=20
before the kernel (SYSFW/PM/DM/RM/SCI/FS, SPLs, TF-A, OPTEE, U-boot, DTs.=
..),=20
treating them as black box firmware blobs, which are very machine-specifi=
c.

But it seems too fragile to me - luckily meta-ti builds and assembles all=
=20
those pieces for every device. Getting something that combines the best o=
f=20
both worlds would be challenging, but interesting...


> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/=
ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/=
ti43x/defconfig
> >>>index 9d579e41..e6a967e1 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/d=
efconfig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/d=
efconfig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Dmulti_v7_defconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/co=
nfigs/no_smp.config
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.=
12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/=
defconfig
> >>>index 9d579e41..43089dc8 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Dmulti_v7_defconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/co=
nfigs/ti_rt.config
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.=
12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.=
12/k3/defconfig
> >>>index fd07b34e..47d78664 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/d=
efconfig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/d=
efconfig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Ddefconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_arm64_prune.config kernel/confi=
gs/ti_rt.config
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.=
12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt=
-6.12/ti33x/defconfig
> >>>index 9d579e41..5de2b229 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33=
x/defconfig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33=
x/defconfig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Dmulti_v7_defconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/co=
nfigs/ti_rt.config kernel/configs/no_smp.config
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.=
12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt=
-6.12/ti43x/defconfig
> >>>index 9d579e41..5de2b229 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43=
x/defconfig
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43=
x/defconfig
> >>>@@ -1,2 +1,2 @@
> >>>=A0 use-kernel-config=3Dmulti_v7_defconfig
> >>>-config-fragment=3D
> >>>+config-fragment=3Dkernel/configs/ti_multi_v7_prune.config kernel/co=
nfigs/ti_rt.config kernel/configs/no_smp.config

