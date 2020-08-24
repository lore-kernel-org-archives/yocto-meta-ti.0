Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.51.1598290258473435378
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CAFCC40C4D;
	Mon, 24 Aug 2020 17:30:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVwd-vELFtsW; Mon, 24 Aug 2020 17:30:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B419E40A55;
	Mon, 24 Aug 2020 17:30:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CB467172DF3;
	Mon, 24 Aug 2020 13:30:55 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 00/14] rtos,pdk,csl: revert RTOS tools and components updates due to issues
Date: Mon, 24 Aug 2020 13:30:35 -0400
Message-Id: <1598290249-23943-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

There were subtle underlying issues reported with earlier RTOS tools (BIOS, XDC, CGT...)
and source components (PDK, CSL, NDK/NS...) updates on some legacy platform.

Following recommendation to downgrade them to previous stable versions used in zeus/thud

Denys Dmytriyenko (14):
  Revert "common-csl-ip: update to 07.00.00.34"
  Revert "common-csl-ip: update to REL.CORESDK.07.00.00.24"
  Revert "ti-pdk-fetch: update to 07.00.00.34"
  Revert "ti-pdk-fetch: update to REL.CORESDK.07.00.00.24 tag"
  Revert "HACK: ipumm: Temporary work-around for linker error with XDC
    tools upgrade"
  Revert "edma3-lld: update to the latest"
  Revert "gcc-arm, gcc-aarch64: upgrade baremetal gcc compilers to
    9.2-2019.12"
  Revert "ti-cgt-arm: upgrade 18.12.5 -> 20.2.0"
  Revert "ti-cgt7x: upgrade 1.2.0 -> 1.3.0"
  Revert "ti-xdctools: upgrade 3.55.02.22 -> 3.61.00.16"
  Revert "ti-ns: upgrade 2.60.01.06 -> 2.75.00.17"
  Revert "ti-ndk: upgrade 3.61.01.01 -> 3.75.01.01"
  Revert "ti-sysbios: upgrade 6.76.03.01 -> 6.82.01.19"
  rtos,pdk,csl: bump PE where versions went backwards due to reverts

 classes/ti-pdk-fetch.bbclass                       |  6 +--
 classes/ti-pdk.bbclass                             |  4 +-
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |  8 ++--
 recipes-bsp/edma3-lld/edma3-lld.inc                |  3 +-
 ...01-HACK-ipumm-Workaround-for-linker-error.patch | 48 ----------------------
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  6 +--
 ...bios_6.82.01.19.bb => ti-sysbios_6.76.03.01.bb} |  9 ++--
 .../devtools/gcc-aarch64-none-elf_9.2-2019.12.bb   | 38 -----------------
 ...r.bb => gcc-arm-none-eabi-native_4.9.2015q3.bb} | 40 ++++++------------
 ...or.bb => gcc-arm-none-eabi_7-2018-q2-update.bb} | 36 ++++++----------
 .../gcc-linaro-baremetal-aarch64-native.bb         | 23 +++++++++++
 recipes-ti/devtools/gcc-linaro-baremetal-native.bb | 23 +++++++++++
 ...{ti-cgt-arm_20.2.0.bb => ti-cgt-arm_18.12.5.bb} |  6 ++-
 .../{ti-cgt7x_1.3.0.bb => ti-cgt7x_1.2.0.bb}       | 10 +++--
 ...ols_3.61.00.16.bb => ti-xdctools_3.55.02.22.bb} |  7 +++-
 recipes-ti/includes/ti-paths.inc                   |  6 +--
 .../{ti-ndk_3.75.01.01.bb => ti-ndk_3.61.01.01.bb} |  9 ++--
 .../{ti-ns_2.75.00.17.bb => ti-ns_2.60.01.06.bb}   | 10 +++--
 18 files changed, 120 insertions(+), 172 deletions(-)
 delete mode 100644 recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch
 rename recipes-ti/bios/{ti-sysbios_6.82.01.19.bb => ti-sysbios_6.76.03.01.bb} (49%)
 delete mode 100644 recipes-ti/devtools/gcc-aarch64-none-elf_9.2-2019.12.bb
 copy recipes-ti/devtools/{gcc-arm-none-eabi_9-2019-q4-major.bb => gcc-arm-none-eabi-native_4.9.2015q3.bb} (11%)
 rename recipes-ti/devtools/{gcc-arm-none-eabi_9-2019-q4-major.bb => gcc-arm-none-eabi_7-2018-q2-update.bb} (24%)
 create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
 create mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb
 rename recipes-ti/devtools/{ti-cgt-arm_20.2.0.bb => ti-cgt-arm_18.12.5.bb} (80%)
 rename recipes-ti/devtools/{ti-cgt7x_1.3.0.bb => ti-cgt7x_1.2.0.bb} (84%)
 rename recipes-ti/devtools/{ti-xdctools_3.61.00.16.bb => ti-xdctools_3.55.02.22.bb} (47%)
 rename recipes-ti/ndk/{ti-ndk_3.75.01.01.bb => ti-ndk_3.61.01.01.bb} (37%)
 rename recipes-ti/ns/{ti-ns_2.75.00.17.bb => ti-ns_2.60.01.06.bb} (42%)

-- 
2.7.4

