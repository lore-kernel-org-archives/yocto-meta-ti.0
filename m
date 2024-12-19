Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEFEE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:38:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.140681.1734647877561474635
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 14:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 851F940C6B;
	Thu, 19 Dec 2024 22:37:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KN05T0M1_W8; Thu, 19 Dec 2024 22:37:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4A2C340AC9;
	Thu, 19 Dec 2024 22:37:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7A915164140; Thu, 19 Dec 2024 17:37:52 -0500 (EST)
Date: Thu, 19 Dec 2024 17:37:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap][PATCH 00/13] Add meta-beagle layer
Message-ID: <20241219223752.GK23825@denix.org>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 22:38:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18161

On Thu, Dec 19, 2024 at 03:53:49PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Backport of the meta-beagle patches from master.

Are there any changes here from my backport to scarthgap I posted yesterday? 
Or is it just a re-post?


> Denys Dmytriyenko (12):
>   conf/machine: rename beagleplay machine to beagleplay-ti
>   meta-beagle: create a separate layer for Beagle platforms
>   meta-beagle: layer.conf: add lz4c to host tools list
>   conf/machine: move "bb_org" BSP settings to meta-beagle
>   conf/machine: split beagleplay config between meta-ti-bsp and
>     meta-beagle
>   conf/machine: move remaining Beagle platforms to meta-beagle
>   u-boot-bb_org, linux-bb_org: move "bb_org" providers to meta-beagle
>   linux-bb.org: update Beagle BSP to 6.1.83
>   conf/machine: add BeagleY-AI platform
>   linux-bb.org, u-boot-bb.org: rename recipes with version
>   beagle-bsp, linux-bb.org, u-boot-bb.org: add support for 6.6 BSP
>   linux-bb.org_6.6: disable FORTIFY_SOURCE for now
> 
> Ryan Eatmon (1):
>   meta-beagle: Add SECURITY file
> 
>  {meta-ti-extras => meta-beagle}/COPYING.MIT   | 24 ++---
>  {meta-ti-extras => meta-beagle}/README        | 10 +-
>  {meta-ti-bsp => meta-beagle}/SECURITY         |  0
>  meta-beagle/conf/layer.conf                   | 17 ++++
>  .../conf/machine/beagle-x15.conf              |  5 +-
>  .../conf/machine/beaglebone-ai64-k3r5.conf    | 11 ++-
>  .../conf/machine/beaglebone-ai64.conf         | 22 +++--
>  .../conf/machine/beaglebone.conf              |  5 +-
>  meta-beagle/conf/machine/beagleplay-k3r5.conf | 11 +++
>  meta-beagle/conf/machine/beagleplay.conf      | 78 +++++++++++++++
>  meta-beagle/conf/machine/beagley-ai-k3r5.conf | 16 ++++
>  meta-beagle/conf/machine/beagley-ai.conf      | 25 +++++
>  .../conf/machine/include/beagle-bsp.inc       | 43 +++++++++
>  .../u-boot/u-boot-bb.org_2023.04.bb           |  7 +-
>  .../u-boot/u-boot-bb.org_2024.10.bb           | 12 +++
>  .../linux/linux-bb.org-6.1}/defconfig         |  0
>  .../linux/linux-bb.org-6.6}/defconfig         |  0
>  .../linux/linux-bb.org-6.6/no-fortify.cfg     |  1 +
>  .../recipes-kernel/linux/linux-bb.org_6.1.bb  | 19 ++--
>  .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 71 ++++++++++++++
>  ...play-k3r5.conf => beagleplay-ti-k3r5.conf} |  1 -
>  meta-ti-bsp/conf/machine/beagleplay-ti.conf   | 49 ++++++++++
>  meta-ti-bsp/conf/machine/beagleplay.conf      | 96 -------------------
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 21 +---
>  ...void-64-bit-division-in-ioc_timer_fn.patch | 56 -----------
>  ...-gcc13-keep-large-values-in-a-new-en.patch | 54 -----------
>  26 files changed, 382 insertions(+), 272 deletions(-)
>  copy {meta-ti-extras => meta-beagle}/COPYING.MIT (86%)
>  copy {meta-ti-extras => meta-beagle}/README (82%)
>  copy {meta-ti-bsp => meta-beagle}/SECURITY (100%)
>  create mode 100644 meta-beagle/conf/layer.conf
>  rename {meta-ti-bsp => meta-beagle}/conf/machine/beagle-x15.conf (89%)
>  rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64-k3r5.conf (66%)
>  rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64.conf (65%)
>  rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone.conf (92%)
>  create mode 100644 meta-beagle/conf/machine/beagleplay-k3r5.conf
>  create mode 100644 meta-beagle/conf/machine/beagleplay.conf
>  create mode 100644 meta-beagle/conf/machine/beagley-ai-k3r5.conf
>  create mode 100644 meta-beagle/conf/machine/beagley-ai.conf
>  create mode 100644 meta-beagle/conf/machine/include/beagle-bsp.inc
>  rename meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb => meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb (61%)
>  create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
>  copy {meta-ti-bsp/recipes-kernel/linux/linux-bb.org => meta-beagle/recipes-kernel/linux/linux-bb.org-6.1}/defconfig (100%)
>  rename {meta-ti-bsp/recipes-kernel/linux/linux-bb.org => meta-beagle/recipes-kernel/linux/linux-bb.org-6.6}/defconfig (100%)
>  create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg
>  rename meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb => meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb (76%)
>  create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
>  rename meta-ti-bsp/conf/machine/{beagleplay-k3r5.conf => beagleplay-ti-k3r5.conf} (88%)
>  create mode 100644 meta-ti-bsp/conf/machine/beagleplay-ti.conf
>  delete mode 100644 meta-ti-bsp/conf/machine/beagleplay.conf
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
> 
> -- 
> 2.17.1

