Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.349.1643837547271640200
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 13:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CE5D340C82;
	Wed,  2 Feb 2022 21:32:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMlkzWBxgptX; Wed,  2 Feb 2022 21:32:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4E0C40AB7;
	Wed,  2 Feb 2022 21:32:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 64630174738; Wed,  2 Feb 2022 16:32:22 -0500 (EST)
Date: Wed, 2 Feb 2022 16:32:22 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2 00/12] Adding support for j721s2
Message-ID: <20220202213222.GD26229@denix.org>
References: <20220202183322.29360-1-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220202183322.29360-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 02, 2022 at 12:33:10PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> *** BLURB HERE ***

Nice BLURB! :)

Anyway, the series looks fine to me. Of course, patches 5, 6 and 7 could have 
been squashed, but that's not critical.

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> Hari Nagalla (1):
>   recipes-ti/ti-rtos-bin: Fix unavailable binary path
> 
> Nishanth Menon (8):
>   machine: Add j721s2 evm configuration
>   optee-os: Add support for alternate console
>   trusted-firmware-a: Add support for alternate console
>   recipes-bsp/ti-rtos: Use target_c7x_0 instead of just c7x
>   ti-rtos-bin: Add j721s2
>   recipes-bsp/ti-rtos: Define the TARGET and ALTERNATE_TARGET as well.
>   recipies-ti: ti-rtos-firmware: Fixup typo for rtos firmware
>   recipes-bsp: Add cnm-wave-fw firmware recipe
> 
> Praneeth Bajjuri (2):
>   ti-linux-fw: Bump up TIFS and DM to v2022.01
>   Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot
>     images"
> 
> Ryan Eatmon (1):
>   cnm-wave-fw: Fix name of firmware for j721s2
> 
>  conf/machine/j721s2-evm-k3r5.conf             | 11 ++++
>  conf/machine/j721s2-evm.conf                  | 22 +++++++
>  recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    | 42 ++++++++++++
>  .../ipc-lld/ipc-lld-examples-rtos_git.bb      |  4 +-
>  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         |  4 +-
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  9 +--
>  ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 28 ++++++--
>  .../trusted-firmware-a_%.bbappend             |  2 +
>  recipes-bsp/u-boot/u-boot-ti.inc              |  6 ++
>  recipes-kernel/linux/kernel-rdepends.inc      |  3 +
>  recipes-security/optee/optee-os_%.bbappend    |  2 +
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 59 ++++++++++++++++-
>  13 files changed, 175 insertions(+), 81 deletions(-)
>  create mode 100644 conf/machine/j721s2-evm-k3r5.conf
>  create mode 100644 conf/machine/j721s2-evm.conf
>  create mode 100644 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>  delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
> 
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
