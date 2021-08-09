Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.28270.1628538938465365472
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 12:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BTiZbfxG;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id o13so19740162qkk.9
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Aug 2021 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H1ZVP1e2X9cht89SVChkMpjv3zzQc/rdc6wYWohv4KQ=;
        b=BTiZbfxG65DnqJv2+Fa3MrJWpsWVJXZtCQZnQKtJSozAAoQiT/nnCMrjJYROvzXRVc
         x2fxPadQMu75cg7EsGTM5PjC4iSHxW0mgidCkg34jFPx6oz6YVOsj92e9wszweHFBZsx
         ZxI3DMro8u4j4QfWIEwliReEpI1FiOjspK6GeCtUKBuqkC7dbNc6yuiqrIhVQJgpu5Xz
         tOZgu00+cK2CaieEl5A9qTmzjKKfM/K1JFDZS1iPnvoEzBsRJxP7msstuiAg1Uur1DEM
         fW2HGFDIQ9FHKO1duyOQpd0LE4CXiwVtYnKA1e5PeTo95an8KNVFNI9Kvq7GrBrtEAoG
         RzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H1ZVP1e2X9cht89SVChkMpjv3zzQc/rdc6wYWohv4KQ=;
        b=f6F6E1JzjckbMzNZJdf1nMWfL0bUvFHKKNUG6vx/9ZkL6BkHVw+da01AebiBETkxoo
         ScUg8ymuAtXXBR5NYjHaBZE2az9x5na6b+Dk10kG/isev+nD/TmQrb6AE9vGvtEYzaeN
         LshqBDjLS+cRqDAL1L2YUf6VJxzLjiTRnWJm3g5pniAWXiJK7ub4IF/ONPIdpmLfCJ55
         uGtuQ1TowpTSAf4f7k/OLL5mJ72p2iXvuNg4y8j0/fo4g5i4ujtA4jJz0TgrbgGTQpA1
         KogJRocb6Ggdv7/0u5yZmWJUoo5Dyj4/0iuqxHOtIlA6AQxX5U6HH4AfjZO8IUCj9IOg
         818g==
X-Gm-Message-State: AOAM533pU+S0zBVQNbkkyg6QhQvijCDYsGsV/xcu2gD7P1CHfU16+thL
	7d+1+VbiB/09Fr6EtyLfgLU/CdY9exjVYwwQijE=
X-Google-Smtp-Source: ABdhPJwMYmELYc3cfRQCi2SJ7KO4U8Cdn9sj97XnNoX9WfW1BOpnH0ETPTSrMBqnxC5p5ZFPZhJxt05HXd2CJW96Pq4=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr24278386qkg.381.1628538937355;
 Mon, 09 Aug 2021 12:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210809193931.1080811-1-raj.khem@gmail.com> <20210809195304.GG1528@denix.org>
In-Reply-To: <20210809195304.GG1528@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Aug 2021 12:55:26 -0700
Message-ID: <CAMKF1srnyeRGuJkUSrNXXKACPkaRk+8cJLHiqT0jjehs4GLUwg@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH 1/2] layer: Convert to using new override syntax
To: denis@denix.org
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dd31ce05c925c43f"

--000000000000dd31ce05c925c43f
Content-Type: text/plain; charset="UTF-8"

Yes I am :) and I now remember that I had to consider machine overrides so
ignore this for now


On Mon, Aug 9, 2021 at 12:53 PM Denys Dmytriyenko <denis@denix.org> wrote:

> Khem,
>
> Aren't you supposed to be on vacation this week? :)
>
> NAK for this patch, as I see too many mistakes - some overrides for SOC
> families are missed and some non-overrides, like "makefile_armv7" are
> incorrectly converted. And you are about a week late, anyway... :)
>
> --
> Denys
>
>
> On Mon, Aug 09, 2021 at 12:39:30PM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  classes/ti-pdk-fetch.bbclass                  |   2 +-
> >  classes/ti-pdk.bbclass                        |  18 +--
> >  conf/machine/am3517-evm.conf                  |   2 +-
> >  conf/machine/am37x-evm.conf                   |   2 +-
> >  conf/machine/am65xx-evm-k3r5-sr2.conf         |   2 +-
> >  conf/machine/am65xx-hs-evm-k3r5-sr2.conf      |   2 +-
> >  conf/machine/beagleboard.conf                 |   2 +-
> >  conf/machine/beaglebone.conf                  |   2 +-
> >  conf/machine/include/am64xx.inc               |   2 +-
> >  conf/machine/include/am65xx.inc               |   2 +-
> >  conf/machine/include/c66x.inc                 |   2 +-
> >  conf/machine/include/davinci.inc              |   2 +-
> >  conf/machine/include/dra7xx.inc               |   2 +-
> >  conf/machine/include/j7.inc                   |   2 +-
> >  conf/machine/include/k2e.inc                  |   2 +-
> >  conf/machine/include/k2g.inc                  |   2 +-
> >  conf/machine/include/k2hk.inc                 |   2 +-
> >  conf/machine/include/k2l.inc                  |   2 +-
> >  conf/machine/include/k3.inc                   |   2 +-
> >  conf/machine/include/k3r5.inc                 |   6 +-
> >  conf/machine/include/keystone.inc             |   2 +-
> >  conf/machine/include/omap-a15.inc             |   2 +-
> >  conf/machine/include/omap3.inc                |   2 +-
> >  conf/machine/include/omap4.inc                |   2 +-
> >  conf/machine/include/omapl1.inc               |   2 +-
> >  conf/machine/include/omapl137.inc             |   2 +-
> >  conf/machine/include/omapl138.inc             |   2 +-
> >  conf/machine/include/ti33x.inc                |   2 +-
> >  conf/machine/include/ti43x.inc                |   2 +-
> >  conf/machine/omap3evm.conf                    |   2 +-
> >  conf/multiconfig/k3r5-sr2.conf                |   2 +-
> >  conf/multiconfig/k3r5.conf                    |   2 +-
> >  recipes-bsp/abefw/abefw_1.0.14.bb             |   2 +-
> >  recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb     |   2 +-
> >  recipes-bsp/aif2-lld/aif2-lld-test_git.bb     |   2 +-
> >  recipes-bsp/aif2-lld/aif2-lld_git.bb          |   2 +-
> >  recipes-bsp/alsa-state/alsa-state.bbappend    |   2 +-
> >  .../audk2g-addon/audk2g-addon-rtos_git.bb     |   2 +-
> >  recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb       |   2 +-
> >  recipes-bsp/board-rtos/board-rtos_git.bb      |  20 +--
> >  recipes-bsp/boot-monitor/boot-monitor_git.bb  |   2 +-
> >  recipes-bsp/bt-fw/bt-fw_git.bb                |   2 +-
> >  .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |   2 +-
> >  recipes-bsp/cal-lld/cal-lld-rtos_git.bb       |   6 +-
> >  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb   |   2 +-
> >  recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb   |   2 +-
> >  recipes-bsp/cmem/cmem-mod_git.bb              |   4 +-
> >  recipes-bsp/cmem/cmem_git.bb                  |   4 +-
> >  .../common-csl-ip/common-csl-ip-rtos_git.bb   |  10 +-
> >  .../common-csl-ip/common-csl-ip_git.bb        |   2 +-
> >  .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb  |  16 +--
> >  recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb     |   4 +-
> >  recipes-bsp/cppi-lld/cppi-lld-test_git.bb     |   6 +-
> >  recipes-bsp/cppi-lld/cppi-lld_git.bb          |   8 +-
> >  .../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        |   6 +-
> >  recipes-bsp/cuia/cuia_1.0.0.13.bb             |   2 +-
> >  recipes-bsp/dfe-lld/dfe-lld-test_git.bb       |   2 +-
> >  recipes-bsp/dfe-lld/dfe-lld_git.bb            |   2 +-
> >  recipes-bsp/dspdce-fw/dspdce-fw_git.bb        |   6 +-
> >  recipes-bsp/dsptop/debugss-module-drv_git.bb  |   4 +-
> >  recipes-bsp/dsptop/dsptop_git.bb              |   4 +-
> >  recipes-bsp/dsptop/libulm_git.bb              |   4 +-
> >  .../dsptop/temperature-module-drv_git.bb      |   4 +-
> >  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb   |  10 +-
> >  recipes-bsp/edma3-lld/edma3-lld_git.bb        |   6 +-
> >  recipes-bsp/emac-lld/emac-lld-rtos_git.bb     |  12 +-
> >  recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb      |   2 +-
> >  .../faultmanagement-rtos_git.bb               |   4 +-
> >  recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb     |   2 +-
> >  .../formfactor/formfactor_0.0.bbappend        |   2 +-
> >  recipes-bsp/fvid2/fvid2-rtos_git.bb           |   6 +-
> >  .../ti-gc320-driver_5.0.11.p7.bb              |   2 +-
> >  recipes-bsp/goodix-fw/goodix-fw_git.bb        |   2 +-
> >  recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb     |   8 +-
> >  recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb     |   6 +-
> >  recipes-bsp/hplib/hplib-mod_git.bb            |   2 +-
> >  recipes-bsp/hplib/hplib-test_git.bb           |   2 +-
> >  recipes-bsp/hplib/hplib_git.bb                |   4 +-
> >  recipes-bsp/hyplnk-lld/hyplnk-lld-rtos_git.bb |   2 +-
> >  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   6 +-
> >  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   6 +-
> >  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb       |  14 +-
> >  recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb     |   6 +-
> >  .../icss-emac-lld/icss-emac-lld-rtos_git.bb   |   8 +-
> >  .../icss-emac-lld/icss-emac-lld-test_git.bb   |   6 +-
> >  .../icss-emac-lld/icss-emac-lld_git.bb        |   2 +-
> >  recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb |   6 +-
> >  .../ipc-lld/ipc-lld-examples-rtos_git.bb      |  24 ++--
> >  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb         |  12 +-
> >  recipes-bsp/ipc-lld/ipc-lld-rtos_git.bb       |   6 +-
> >  recipes-bsp/ipc-lld/ipc-lld.inc               |   2 +-
> >  recipes-bsp/ipumm-fw/ipumm-fw_git.bb          |   6 +-
> >  recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb     |   2 +-
> >  recipes-bsp/iqn2-lld/iqn2-lld_git.bb          |   2 +-
> >  recipes-bsp/mad-utils/mad-utils-rtos_git.bb   |   6 +-
> >  recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb   |  12 +-
> >  recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb   |   4 +-
> >  recipes-bsp/mmap-lld/mmap-lld-test_git.bb     |   8 +-
> >  recipes-bsp/mmap-lld/mmap-lld_git.bb          |   4 +-
> >  recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb   |  12 +-
> >  recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb    |   2 +-
> >  recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb    |   2 +-
> >  recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb     |   2 +-
> >  recipes-bsp/nwal-lld/nwal-lld-test_git.bb     |   2 +-
> >  recipes-bsp/nwal-lld/nwal-lld_git.bb          |   2 +-
> >  recipes-bsp/osal/osal-rtos_git.bb             |   6 +-
> >  recipes-bsp/osal/osal-test_git.bb             |   2 +-
> >  recipes-bsp/osal/osal_git.bb                  |   2 +-
> >  recipes-bsp/pa-lld/pa-lld-rtos_git.bb         |   4 +-
> >  recipes-bsp/pa-lld/pa-lld-test_git.bb         |   6 +-
> >  recipes-bsp/pa-lld/pa-lld_git.bb              |   4 +-
> >  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb     |   2 +-
> >  recipes-bsp/pktlib/pktlib-rtos_git.bb         |   4 +-
> >  recipes-bsp/pktlib/pktlib_git.bb              |   2 +-
> >  recipes-bsp/pm-lld/pm-lld-rtos_git.bb         |  16 +--
> >  .../ti-img-rogue-driver_1.13.5776728.bb       |   2 +-
> >  .../ti-sgx-ddk-km_1.17.4948957.bb             |   4 +-
> >  recipes-bsp/pru/pru-icss_git.bb               |  38 +++---
> >  recipes-bsp/pru/pru-pwm-fw_git.bb             |   4 +-
> >  recipes-bsp/pru/pru-swuart-fw_git.bb          |   6 +-
> >  .../pru/ti-pru-sw-edma-driver_1.00.00.bb      |   6 +-
> >  .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |   4 +-
> >  recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb  |   4 +-
> >  recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb     |   4 +-
> >  recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb    |   4 +-
> >  recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb    |   4 +-
> >  recipes-bsp/pruss-lld/pruss-lld-apps_git.bb   |   6 +-
> >  recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb   |  10 +-
> >  recipes-bsp/pruss-lld/pruss-lld-test_git.bb   |   2 +-
> >  recipes-bsp/pruss-lld/pruss-lld_git.bb        |   2 +-
> >  recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb        |   4 +-
> >  recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb     |   4 +-
> >  recipes-bsp/qmss-lld/qmss-lld-test_git.bb     |   6 +-
> >  recipes-bsp/qmss-lld/qmss-lld_git.bb          |   8 +-
> >  recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb  |   2 +-
> >  recipes-bsp/rm-lld/rm-lld-rtos_git.bb         |   2 +-
> >  recipes-bsp/rm-lld/rm-lld_git.bb              |   8 +-
> >  recipes-bsp/sa-lld/sa-lld-rtos_git.bb         |   6 +-
> >  recipes-bsp/sa-lld/sa-lld-test_git.bb         |   4 +-
> >  recipes-bsp/sa-lld/sa-lld_git.bb              |   2 +-
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb   |  18 +--
> >  .../serdes-diag/serdes-diag-rtos_git.bb       |   2 +-
> >  recipes-bsp/serdes-fw/serdes-fw_git.bb        |   2 +-
> >  recipes-bsp/spi-lld/spi-lld-rtos_git.bb       |  12 +-
> >  recipes-bsp/srio-lld/srio-lld-rtos_git.bb     |   4 +-
> >  recipes-bsp/srio-lld/srio-lld.inc             |   2 +-
> >  .../starterware/starterware-rtos_git.bb       |   4 +-
> >  recipes-bsp/starterware/starterware_git.bb    |   2 +-
> >  recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb   |   4 +-
> >  .../ti-ocf-crypto-module_1.0.bb               |   6 +-
> >  recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb |   4 +-
> >  recipes-bsp/ti-sci-fw/ti-sci-fw_0.1.1.50.bb   |   2 +-
> >  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  14 +-
> >  .../traceframework/traceframework-rtos_git.bb |   2 +-
> >  .../traceframework/traceframework_git.bb      |   4 +-
> >  .../transport-rtos/bmet-eth-rtos_git.bb       |   2 +-
> >  .../transport-rtos/nimu-icss-rtos_git.bb      |  10 +-
> >  recipes-bsp/transport-rtos/nimu-rtos_git.bb   |  28 ++--
> >  .../transport-rtos/timesync-rtos_git.bb       |   4 +-
> >  .../trusted-firmware-a_%.bbappend             |   4 +-
> >  recipes-bsp/u-boot/u-boot-ti.inc              |  26 ++--
> >  recipes-bsp/uart-lld/uart-lld-rtos_git.bb     |  14 +-
> >  recipes-bsp/udma-lld/udma-lld-rtos_git.bb     |   6 +-
> >  .../uio-module-drv/uio-module-drv-test_git.bb |  12 +-
> >  .../uio-module-drv/uio-module-drv_git.bb      |   6 +-
> >  recipes-bsp/usb-lld/usb-lld-rtos_git.bb       |   8 +-
> >  recipes-bsp/vis-fw/vis_01.50.07.15.bb         |   8 +-
> >  recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb      |   2 +-
> >  recipes-bsp/vps-lld/vps-lld-rtos_git.bb       |   6 +-
> >  recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb |   2 +-
> >  recipes-bsp/x-load/x-load.inc                 |   2 +-
> >  recipes-bsp/x-load/x-load_1.46-psp.bb         |   4 +-
> >  recipes-bsp/x-load/x-load_git.bb              |   4 +-
> >  .../wl18xx-calibrator_8.7.3.bb                |   2 +-
> >  .../wl18xx-target-scripts_8.7.3.bb            |   2 +-
> >  recipes-connectivity/wlconf/wlconf_8.7.3.bb   |   4 +-
> >  .../init-ifupdown/init-ifupdown_1.0.bbappend  |   2 +-
> >  recipes-core/udev/eudev_%.bbappend            |   8 +-
> >  recipes-devtools/gdbc6x/gdbc6x_git.bb         |   4 +-
> >  recipes-devtools/gdbc6x/gdbserver-c6x_git.bb  |   4 +-
> >  .../gdbc6x/gdbserverproxy-module-drv_git.bb   |   4 +-
> >  .../libgal/ti-gc320-libs_5.0.11.p7.bb         |   4 +-
> >  .../ti-img-rogue-umlibs_1.13.5776728.bb       |  38 +++---
> >  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  36 +++---
> >  recipes-kernel/kselftests/kselftests_4.10.bb  | 122 +++++++++---------
> >  recipes-kernel/linux/bundle-devicetree.inc    |   2 +-
> >  recipes-kernel/linux/kernel-rdepends.inc      |  40 +++---
> >  recipes-kernel/linux/linux-ti-mainline_git.bb |  12 +-
> >  .../linux/linux-ti-staging-rt_5.10.bb         |   2 +-
> >  .../linux/linux-ti-staging-rt_5.4.bb          |   2 +-
> >  .../linux/linux-ti-staging-systest_5.10.bb    |   2 +-
> >  .../linux/linux-ti-staging-systest_5.4.bb     |   2 +-
> >  recipes-kernel/linux/linux-ti-staging_5.10.bb |   8 +-
> >  recipes-kernel/linux/linux-ti-staging_5.4.bb  |   8 +-
> >  recipes-kernel/linux/ti-uio.inc               |  32 ++---
> >  recipes-security/optee/optee-os_%.bbappend    |  22 ++--
> >  recipes-ti/beagleboard/beaglebone-capes.bb    |   2 +-
> >  .../beagleboard/beaglebone-getting-started.bb |   4 +-
> >  recipes-ti/beagleboard/gadget-init.bb         |  10 +-
> >  recipes-ti/bios/ti-biosutils_1.02.02.bb       |   2 +-
> >  recipes-ti/bios/ti-sysbios.inc                |   6 +-
> >  .../ti-codec-engine_3.24.00.08.bb             |   4 +-
> >  recipes-ti/ctoolslib/libaet_git.bb            |   4 +-
> >  .../gcc-arm-baremetal_7-2018-q2-update.bb     |   6 +-
> >  .../gcc-linaro-baremetal-aarch64-native.bb    |   8 +-
> >  .../devtools/gcc-linaro-baremetal-native.bb   |   8 +-
> >  recipes-ti/devtools/ti-cg-xml_2.61.00.bb      |   4 +-
> >  recipes-ti/devtools/ti-cgt-arm_18.12.5.bb     |   8 +-
> >  recipes-ti/devtools/ti-cgt-pru_2.3.2.bb       |  16 +--
> >  recipes-ti/devtools/ti-cgt470.inc             |   2 +-
> >  recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb      |   6 +-
> >  recipes-ti/devtools/ti-cgt6x_8.3.2.bb         |  22 ++--
> >  recipes-ti/devtools/ti-cgt7x_1.2.0.bb         |   8 +-
> >  recipes-ti/devtools/ti-xdctools-common.inc    |   8 +-
> >  recipes-ti/dmai/ti-dmai.inc                   |  38 +++---
> >  recipes-ti/dmai/ti-dmai_svn.bb                |   6 +-
> >  recipes-ti/dsplib/dsplib.inc                  |   8 +-
> >  .../ti-framework-components.inc               |   6 +-
> >  recipes-ti/imglib/imglib-c66x.inc             |   8 +-
> >  recipes-ti/includes/ti-staging.inc            |   4 +-
> >  recipes-ti/includes/ti-unpack.inc             |   4 +-
> >  .../ipc/ipc-transport-common-rtos_git.bb      |   2 +-
> >  recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb |   4 +-
> >  recipes-ti/ipc/ipc-transport-qmss.inc         |   2 +-
> >  recipes-ti/ipc/ipc-transport-srio-rtos_git.bb |   4 +-
> >  recipes-ti/ipc/ipc-transport-srio.inc         |   2 +-
> >  recipes-ti/ipc/ti-ipc-examples-linux_git.bb   |   6 +-
> >  recipes-ti/ipc/ti-ipc-examples.inc            |   4 +-
> >  recipes-ti/ipc/ti-ipc-examples_git.bb         |   6 +-
> >  recipes-ti/ipc/ti-ipc-rtos.inc                |   8 +-
> >  recipes-ti/ipc/ti-ipc-rtos_git.bb             |  22 ++--
> >  recipes-ti/ipc/ti-ipc_git.bb                  |  10 +-
> >  recipes-ti/linuxutils/ti-linuxutils.inc       |  14 +-
> >  .../linuxutils/ti-linuxutils_2.26.01.02.bb    |   2 +-
> >  recipes-ti/mathlib/mathlib.inc                |   8 +-
> >  recipes-ti/mpm-transport/mpm-transport_git.bb |  12 +-
> >  .../multiprocmgr/multiprocmgr-rtos_git.bb     |  12 +-
> >  .../multiprocmgr/multiprocmgr-test_git.bb     |  10 +-
> >  recipes-ti/multiprocmgr/multiprocmgr_git.bb   |   4 +-
> >  recipes-ti/ndk/ti-ndk.inc                     |   6 +-
> >  recipes-ti/ns/ti-ns.inc                       |   6 +-
> >  recipes-ti/openmp-rtos/openmp-rtos_git.bb     |  12 +-
> >  recipes-ti/osal/ti-osal.inc                   |   6 +-
> >  recipes-ti/swtools/swtools_git.bb             |   8 +-
> >  .../ti-pdk-build/ti-pdk-build-rtos_git.bb     |   4 +-
> >  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    |  20 +--
> >  recipes-ti/udma/udma_git.bb                   |   4 +-
> >  .../uio-test-pruss/uio-test-pruss_git.bb      |   8 +-
> >  recipes-ti/vlib/vlib-c66x.inc                 |   6 +-
> >  recipes-ti/xdais/ti-xdais.inc                 |   6 +-
> >  recipes-ti/xdais/ti-xdais_6.26.01.03.bb       |   2 +-
> >  251 files changed, 833 insertions(+), 833 deletions(-)
> >
> > diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> > index cacd71a4..e4c55e33 100644
> > --- a/classes/ti-pdk-fetch.bbclass
> > +++ b/classes/ti-pdk-fetch.bbclass
> > @@ -18,7 +18,7 @@ TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
> >  S = "${@'${WORKDIR}/git/${TI_PDK_COMP_PATH}'.rstrip('/')}"
> >
> >  # Hard-link only required sources from PDK
> > -python do_unpack_append() {
> > +python do_unpack:append() {
> >      if len(d.getVar('TI_PDK_COMP') or '') > 0:
> >          import shutil
> >
> > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > index 68314215..21dd3ade 100644
> > --- a/classes/ti-pdk.bbclass
> > +++ b/classes/ti-pdk.bbclass
> > @@ -5,14 +5,14 @@ inherit perlnative
> >
> >  DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios
> common-csl-ip-rtos libxml-simple-perl-native gcc-arm-baremetal-native
> ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
> >
> > -DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
> > -DEPENDS_remove_ti33x = "ti-cgt6x-native"
> > -DEPENDS_remove_ti43x = "ti-cgt6x-native"
> > -DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> > -DEPENDS_remove_am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
> > -DEPENDS_append_am65xx = " ti-cgt-arm-native
> gcc-linaro-baremetal-aarch64-native"
> > -DEPENDS_remove_j7 = "gcc-arm-baremetal-native"
> > -DEPENDS_append_j7 = " ti-cgt-arm-native
> gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
> > +DEPENDS:append_omap-a15 = " ti-cgt-arm-native"
> > +DEPENDS:remove_ti33x = "ti-cgt6x-native"
> > +DEPENDS:remove_ti43x = "ti-cgt6x-native"
> > +DEPENDS:append_omapl1 = " ti-cgt-arm-native"
> > +DEPENDS:remove_am65xx = "gcc-arm-baremetal-native ti-cgt6x-native"
> > +DEPENDS:append_am65xx = " ti-cgt-arm-native
> gcc-linaro-baremetal-aarch64-native"
> > +DEPENDS:remove_j7 = "gcc-arm-baremetal-native"
> > +DEPENDS:append_j7 = " ti-cgt-arm-native
> gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
> >
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build"
> > @@ -141,4 +141,4 @@ do_install () {
> >      fi
> >  }
> >
> > -FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> > +FILES:${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> > diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
> > index c20e2f6a..f194c648 100644
> > --- a/conf/machine/am3517-evm.conf
> > +++ b/conf/machine/am3517-evm.conf
> > @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
> >  MACHINE_FEATURES += "touchscreen ethernet"
> >
> >  IMAGE_FSTYPES += "ubi tar.xz"
> > -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> > +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
> >
> >  SERIAL_CONSOLES = "115200;ttyS2"
> >  USE_VT = "2"
> > diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> > index a512c8d0..9750fe64 100644
> > --- a/conf/machine/am37x-evm.conf
> > +++ b/conf/machine/am37x-evm.conf
> > @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
> >  MACHINE_FEATURES += "touchscreen ethernet"
> >
> >  IMAGE_FSTYPES += "ubi tar.xz"
> > -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> > +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
> >
> >  KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
> >
> > diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf
> b/conf/machine/am65xx-evm-k3r5-sr2.conf
> > index c0b3cd51..e74dd3ab 100644
> > --- a/conf/machine/am65xx-evm-k3r5-sr2.conf
> > +++ b/conf/machine/am65xx-evm-k3r5-sr2.conf
> > @@ -5,7 +5,7 @@
> >  # Booting SR2 requires different SYSFW, the rest is handled at runtime
> >
> >  require conf/machine/am65xx-evm-k3r5.conf
> > -SOC_FAMILY_append = ":k3r5-sr2"
> > +SOC_FAMILY:append = ":k3r5-sr2"
> >
> >  SYSFW_SOC = "am65x_sr2"
> >  SYSFW_SYMLINK = "sysfw.itb"
> > diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > index ef1b6fbe..ff1645e4 100644
> > --- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > +++ b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
> > @@ -5,7 +5,7 @@
> >  # Booting SR2 requires different SYSFW, the rest is handled at runtime
> >
> >  require conf/machine/am65xx-hs-evm-k3r5.conf
> > -SOC_FAMILY_append = ":k3r5-sr2"
> > +SOC_FAMILY:append = ":k3r5-sr2"
> >
> >  SYSFW_SOC = "am65x_sr2"
> >  SYSFW_SYMLINK = "sysfw.itb"
> > diff --git a/conf/machine/beagleboard.conf
> b/conf/machine/beagleboard.conf
> > index ee51fd66..06777795 100644
> > --- a/conf/machine/beagleboard.conf
> > +++ b/conf/machine/beagleboard.conf
> > @@ -8,7 +8,7 @@ require conf/machine/include/omap3.inc
> >  MACHINE_GUI_CLASS = "bigscreen"
> >
> >  IMAGE_FSTYPES += "tar.xz ubi"
> > -EXTRA_IMAGECMD_jffs2 = "-lnp"
> > +EXTRA_IMAGECMD:jffs2 = "-lnp"
> >
> >  KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb
> omap3-beagle-xm-ab.dtb"
> >
> > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > index 896a9d73..dcb14cc9 100644
> > --- a/conf/machine/beaglebone.conf
> > +++ b/conf/machine/beaglebone.conf
> > @@ -13,7 +13,7 @@ MACHINE_GUI_CLASS = "bigscreen"
> >
> >  SERIAL_CONSOLES = "115200;ttyS0"
> >
> > -IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
> > +IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"
> >
> >  # Refine the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_BOARDS = "bbbAM335x"
> > diff --git a/conf/machine/include/am64xx.inc
> b/conf/machine/include/am64xx.inc
> > index 95fdc79d..18e3757a 100644
> > --- a/conf/machine/include/am64xx.inc
> > +++ b/conf/machine/include/am64xx.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/k3.inc
> > -SOC_FAMILY_append = ":am64xx"
> > +SOC_FAMILY:append = ":am64xx"
> >
> >  MACHINE_FEATURES += "screen touchscreen"
> >
> > diff --git a/conf/machine/include/am65xx.inc
> b/conf/machine/include/am65xx.inc
> > index 8516ca4c..2838c58f 100644
> > --- a/conf/machine/include/am65xx.inc
> > +++ b/conf/machine/include/am65xx.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/k3.inc
> > -SOC_FAMILY_append = ":am65xx"
> > +SOC_FAMILY:append = ":am65xx"
> >
> >  MACHINE_FEATURES += "screen touchscreen gpu"
> >
> > diff --git a/conf/machine/include/c66x.inc
> b/conf/machine/include/c66x.inc
> > index e35f2eda..33a657f1 100644
> > --- a/conf/machine/include/c66x.inc
> > +++ b/conf/machine/include/c66x.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/keystone.inc
> > -SOC_FAMILY_append = ":c66x"
> > +SOC_FAMILY:append = ":c66x"
> >
> >  # HACK: The c66x family is composed of devices with only DSP cores, and
> no ARM
> >  #       cores. The Linux kernel is not supported on these machines.
> > diff --git a/conf/machine/include/davinci.inc
> b/conf/machine/include/davinci.inc
> > index 62ca6887..d2681740 100644
> > --- a/conf/machine/include/davinci.inc
> > +++ b/conf/machine/include/davinci.inc
> > @@ -17,6 +17,6 @@ UBOOT_LOADADDRESS = "0x80008000"
> >  EXTRA_IMAGEDEPENDS += "u-boot"
> >
> >  SERIAL_CONSOLES ?= "115200;ttyS0"
> > -EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
> > +EXTRA_IMAGECMD:jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
> >
> >  MACHINE_FEATURES = "kernel26 serial ethernet usbhost usbgadget mmc alsa"
> > diff --git a/conf/machine/include/dra7xx.inc
> b/conf/machine/include/dra7xx.inc
> > index 857e1b35..a02421d9 100644
> > --- a/conf/machine/include/dra7xx.inc
> > +++ b/conf/machine/include/dra7xx.inc
> > @@ -1,4 +1,4 @@
> >  require conf/machine/include/omap-a15.inc
> > -SOC_FAMILY_append = ":dra7xx"
> > +SOC_FAMILY:append = ":dra7xx"
> >
> >  MACHINE_FEATURES += "pci"
> > diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
> > index d3eda1a8..cf5f6a94 100644
> > --- a/conf/machine/include/j7.inc
> > +++ b/conf/machine/include/j7.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/k3.inc
> > -SOC_FAMILY_append = ":j7"
> > +SOC_FAMILY:append = ":j7"
> >
> >  OPTEEMACHINE = "k3-j721e"
> >  OPTEEOUTPUTMACHINE = "k3"
> > diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc
> > index 6797fb29..a6d58bb3 100644
> > --- a/conf/machine/include/k2e.inc
> > +++ b/conf/machine/include/k2e.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/keystone.inc
> > -SOC_FAMILY_append = ":k2e"
> > +SOC_FAMILY:append = ":k2e"
> >
> >  # Set the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_SOCS = "k2e"
> > diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc
> > index 7bcc412b..be40d9e7 100644
> > --- a/conf/machine/include/k2g.inc
> > +++ b/conf/machine/include/k2g.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/keystone.inc
> > -SOC_FAMILY_append = ":k2g"
> > +SOC_FAMILY:append = ":k2g"
> >
> >  # Set the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_SOCS = "k2g"
> > diff --git a/conf/machine/include/k2hk.inc
> b/conf/machine/include/k2hk.inc
> > index 2d2dd6a0..456fda75 100644
> > --- a/conf/machine/include/k2hk.inc
> > +++ b/conf/machine/include/k2hk.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/keystone.inc
> > -SOC_FAMILY_append = ":k2hk"
> > +SOC_FAMILY:append = ":k2hk"
> >
> >  # Set the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_SOCS = "k2h k2k"
> > diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.inc
> > index 997bcbe2..b6a4bc7d 100644
> > --- a/conf/machine/include/k2l.inc
> > +++ b/conf/machine/include/k2l.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/keystone.inc
> > -SOC_FAMILY_append = ":k2l"
> > +SOC_FAMILY:append = ":k2l"
> >
> >  # Set the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_SOCS = "k2l"
> > diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> > index e0970698..20ab7a9e 100644
> > --- a/conf/machine/include/k3.inc
> > +++ b/conf/machine/include/k3.inc
> > @@ -1,7 +1,7 @@
> >  # TI K3 Aarch64 profile for Cortex-A53/A72 cores
> >
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":k3"
> > +SOC_FAMILY:append = ":k3"
> >
> >  require conf/machine/include/arm/arch-arm64.inc
> >
> > diff --git a/conf/machine/include/k3r5.inc
> b/conf/machine/include/k3r5.inc
> > index a32accae..93f08c04 100644
> > --- a/conf/machine/include/k3r5.inc
> > +++ b/conf/machine/include/k3r5.inc
> > @@ -1,7 +1,7 @@
> >  # TI K3 Armv7 profile for Cortex-R5F cores
> >
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":k3r5"
> > +SOC_FAMILY:append = ":k3r5"
> >
> >  # The closest of existing tunes for Cortex-R5F
> >  DEFAULTTUNE = "armv7athf"
> > @@ -20,5 +20,5 @@ UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> >  UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> >  UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> >
> > -PACKAGECONFIG_pn-u-boot-ti-staging = ""
> > -PACKAGECONFIG_pn-u-boot-ti-mainline = ""
> > +PACKAGECONFIG:pn-u-boot-ti-staging = ""
> > +PACKAGECONFIG:pn-u-boot-ti-mainline = ""
> > diff --git a/conf/machine/include/keystone.inc
> b/conf/machine/include/keystone.inc
> > index e7ea9758..83dca19d 100644
> > --- a/conf/machine/include/keystone.inc
> > +++ b/conf/machine/include/keystone.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":keystone"
> > +SOC_FAMILY:append = ":keystone"
> >
> >  DEFAULTTUNE ?= "armv7athf-neon"
> >  require conf/machine/include/tune-cortexa15.inc
> > diff --git a/conf/machine/include/omap-a15.inc
> b/conf/machine/include/omap-a15.inc
> > index e491d2b5..553835c8 100644
> > --- a/conf/machine/include/omap-a15.inc
> > +++ b/conf/machine/include/omap-a15.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":omap-a15"
> > +SOC_FAMILY:append = ":omap-a15"
> >
> >  DEFAULTTUNE ?= "armv7athf-neon"
> >  require conf/machine/include/tune-cortexa15.inc
> > diff --git a/conf/machine/include/omap3.inc
> b/conf/machine/include/omap3.inc
> > index 5696c82d..ab069b00 100644
> > --- a/conf/machine/include/omap3.inc
> > +++ b/conf/machine/include/omap3.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":omap3"
> > +SOC_FAMILY:append = ":omap3"
> >
> >  DEFAULTTUNE ?= "armv7athf-neon"
> >  require conf/machine/include/tune-cortexa8.inc
> > diff --git a/conf/machine/include/omap4.inc
> b/conf/machine/include/omap4.inc
> > index cbca267c..b6f43744 100644
> > --- a/conf/machine/include/omap4.inc
> > +++ b/conf/machine/include/omap4.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":omap4"
> > +SOC_FAMILY:append = ":omap4"
> >
> >  DEFAULTTUNE ?= "armv7athf-neon"
> >  require conf/machine/include/tune-cortexa9.inc
> > diff --git a/conf/machine/include/omapl1.inc
> b/conf/machine/include/omapl1.inc
> > index 9942c944..d0262c3f 100644
> > --- a/conf/machine/include/omapl1.inc
> > +++ b/conf/machine/include/omapl1.inc
> > @@ -1,2 +1,2 @@
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":omapl1"
> > +SOC_FAMILY:append = ":omapl1"
> > diff --git a/conf/machine/include/omapl137.inc
> b/conf/machine/include/omapl137.inc
> > index 5d8a6dd8..6dd49418 100644
> > --- a/conf/machine/include/omapl137.inc
> > +++ b/conf/machine/include/omapl137.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/omapl1.inc
> > -SOC_FAMILY_append = ":omapl137"
> > +SOC_FAMILY:append = ":omapl137"
> >
> >  # Set the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_SOCS = "omapl137"
> > diff --git a/conf/machine/include/omapl138.inc
> b/conf/machine/include/omapl138.inc
> > index 999cbc3a..f73517d0 100644
> > --- a/conf/machine/include/omapl138.inc
> > +++ b/conf/machine/include/omapl138.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/omapl1.inc
> > -SOC_FAMILY_append = ":omapl138"
> > +SOC_FAMILY:append = ":omapl138"
> >
> >  # Set the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_SOCS = "omapl138"
> > diff --git a/conf/machine/include/ti33x.inc
> b/conf/machine/include/ti33x.inc
> > index 6dfda754..3da2aba5 100644
> > --- a/conf/machine/include/ti33x.inc
> > +++ b/conf/machine/include/ti33x.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":ti33x"
> > +SOC_FAMILY:append = ":ti33x"
> >
> >  DEFAULTTUNE ?= "armv7athf-neon"
> >  require conf/machine/include/tune-cortexa8.inc
> > diff --git a/conf/machine/include/ti43x.inc
> b/conf/machine/include/ti43x.inc
> > index b1a27f93..eaed1812 100644
> > --- a/conf/machine/include/ti43x.inc
> > +++ b/conf/machine/include/ti43x.inc
> > @@ -1,5 +1,5 @@
> >  require conf/machine/include/ti-soc.inc
> > -SOC_FAMILY_append = ":ti43x"
> > +SOC_FAMILY:append = ":ti43x"
> >
> >  DEFAULTTUNE ?= "armv7athf-neon"
> >  require conf/machine/include/tune-cortexa9.inc
> > diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
> > index 01808b68..dc56d57a 100644
> > --- a/conf/machine/omap3evm.conf
> > +++ b/conf/machine/omap3evm.conf
> > @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS = "smallscreen"
> >  MACHINE_FEATURES += "touchscreen ethernet"
> >
> >  IMAGE_FSTYPES += "jffs2 tar.xz"
> > -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> > +EXTRA_IMAGECMD:jffs2 = "-lnp -e 0x20000 -s 2048"
> >
> >  SERIAL_CONSOLES = "115200;ttyS0"
> >  USE_VT = "0"
> > diff --git a/conf/multiconfig/k3r5-sr2.conf
> b/conf/multiconfig/k3r5-sr2.conf
> > index 17082141..e933b9cc 100644
> > --- a/conf/multiconfig/k3r5-sr2.conf
> > +++ b/conf/multiconfig/k3r5-sr2.conf
> > @@ -1,3 +1,3 @@
> >  require k3r5.conf
> >
> > -MACHINE_append = "-sr2"
> > +MACHINE:append = "-sr2"
> > diff --git a/conf/multiconfig/k3r5.conf b/conf/multiconfig/k3r5.conf
> > index 8c8f0c3f..deb07210 100644
> > --- a/conf/multiconfig/k3r5.conf
> > +++ b/conf/multiconfig/k3r5.conf
> > @@ -2,4 +2,4 @@ MAINMACHINE := "${MACHINE}"
> >
> >  DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
> >
> > -MACHINE_append = "-k3r5"
> > +MACHINE:append = "-k3r5"
> > diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/
> abefw_1.0.14.bb
> > index 302bdcde..a6cc624a 100644
> > --- a/recipes-bsp/abefw/abefw_1.0.14.bb
> > +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> > @@ -20,4 +20,4 @@ do_install() {
> >          cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
> >  }
> >
> > -FILES_${PN} += "/lib/firmware/omap4_abe_new"
> > +FILES:${PN} += "/lib/firmware/omap4_abe_new"
> > diff --git a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> > index 962965b0..048a2430 100644
> > --- a/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> > +++ b/recipes-bsp/aif2-lld/aif2-lld-rtos_git.bb
> > @@ -6,7 +6,7 @@ require recipes-bsp/aif2-lld/aif2-lld.inc
> >
> >  PR = "${INC_PR}.0"
> >
> > -DEPENDS_append = " qmss-lld-rtos \
> > +DEPENDS:append = " qmss-lld-rtos \
> >                     cppi-lld-rtos \
> >  "
> >
> > diff --git a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> > index 9180b953..d4328621 100644
> > --- a/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> > +++ b/recipes-bsp/aif2-lld/aif2-lld-test_git.bb
> > @@ -6,7 +6,7 @@ include aif2-lld.inc
> >
> >  PR = "${INC_PR}.0"
> >
> > -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}
> AIF2_SRC_DIR=${WORKDIR}/git"
> > +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}
> AIF2_SRC_DIR=${WORKDIR}/git"
> >
> >  do_compile () {
> >      oe_runmake clean DEVICE=k2hk
> > diff --git a/recipes-bsp/aif2-lld/aif2-lld_git.bb
> b/recipes-bsp/aif2-lld/aif2-lld_git.bb
> > index 4a640f1b..d9283a3a 100644
> > --- a/recipes-bsp/aif2-lld/aif2-lld_git.bb
> > +++ b/recipes-bsp/aif2-lld/aif2-lld_git.bb
> > @@ -6,7 +6,7 @@ include aif2-lld.inc
> >
> >  PR = "${INC_PR}.0"
> >
> > -EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> > +EXTRA_OEMAKE = "-f makefile:armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
> >
> >  do_compile () {
> >      oe_runmake lib DEVICE=k2hk
> > diff --git a/recipes-bsp/alsa-state/alsa-state.bbappend
> b/recipes-bsp/alsa-state/alsa-state.bbappend
> > index 72d991c7..4fc41d05 100644
> > --- a/recipes-bsp/alsa-state/alsa-state.bbappend
> > +++ b/recipes-bsp/alsa-state/alsa-state.bbappend
> > @@ -1 +1 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> > diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> > index 0cb9ff17..e40fb43c 100644
> > --- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> > +++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
> > @@ -25,7 +25,7 @@ PR = "r0"
> >
> >  S = "${WORKDIR}/git/ti/addon/audk2g"
> >
> > -DEPENDS_append = " ti-sysbios \
> > +DEPENDS:append = " ti-sysbios \
> >              gpio-lld-rtos \
> >              i2c-lld-rtos \
> >              board-rtos \
> > diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> > index 62cee07b..d808267b 100644
> > --- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> > +++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
> > @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  PR = "r0"
> >
> >
> > -DEPENDS_append = " qmss-lld-rtos \
> > +DEPENDS:append = " qmss-lld-rtos \
> >                     cppi-lld-rtos \
> >  "
> >
> > diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb
> b/recipes-bsp/board-rtos/board-rtos_git.bb
> > index a6547d38..485b0656 100644
> > --- a/recipes-bsp/board-rtos/board-rtos_git.bb
> > +++ b/recipes-bsp/board-rtos/board-rtos_git.bb
> > @@ -16,24 +16,24 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> >  PR = "r0"
> >
> > -DEPENDS_append = " i2c-lld-rtos \
> > +DEPENDS:append = " i2c-lld-rtos \
> >                     spi-lld-rtos \
> >                     uart-lld-rtos \
> >                     osal-rtos \
> >  "
> >
> > -DEPENDS_append_omap-a15 = " ti-ndk \
> > +DEPENDS:append_omap-a15 = " ti-ndk \
> >                              mmcsd-lld-rtos \
> >                              pm-lld-rtos \
> >  "
> >
> > -DEPENDS_append_am57xx-evm = " gpio-lld-rtos \
> > +DEPENDS:append_am57xx-evm = " gpio-lld-rtos \
> >                                icss-emac-lld-rtos \
> >                                pruss-lld-rtos \
> >  "
> >
> >
> > -DEPENDS_append_ti33x = " gpio-lld-rtos \
> > +DEPENDS:append_ti33x = " gpio-lld-rtos \
> >                           gpmc-lld-rtos \
> >                           icss-emac-lld-rtos \
> >                           mmcsd-lld-rtos \
> > @@ -42,7 +42,7 @@ DEPENDS_append_ti33x = " gpio-lld-rtos \
> >                           ti-ndk \
> >  "
> >
> > -DEPENDS_append_ti43x = " gpio-lld-rtos \
> > +DEPENDS:append_ti43x = " gpio-lld-rtos \
> >                           gpmc-lld-rtos \
> >                           icss-emac-lld-rtos \
> >                           mmcsd-lld-rtos \
> > @@ -51,13 +51,13 @@ DEPENDS_append_ti43x = " gpio-lld-rtos \
> >                           ti-ndk \
> >  "
> >
> > -DEPENDS_append_dra7xx = " pm-lld-rtos \
> > +DEPENDS:append_dra7xx = " pm-lld-rtos \
> >                            mmcsd-lld-rtos \
> >  "
> >
> > -DEPENDS_append_am65xx = " sciclient-rtos \
> > +DEPENDS:append_am65xx = " sciclient-rtos \
> >  "
> > -DEPENDS_append_j7 = " udma-lld-rtos \
> > +DEPENDS:append_j7 = " udma-lld-rtos \
> >                            sciclient-rtos \
> >                            mmcsd-lld-rtos \
> >  "
> > @@ -71,6 +71,6 @@ INHIBIT_PACKAGE_STRIP = "1"
> >  export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
> >  export DEST_ROOT="${S}"
> >
> > -XDCPATH_append =
> ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
> > +XDCPATH:append =
> ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
> >
> > -INSANE_SKIP_${PN} = "arch"
> > +INSANE_SKIP:${PN} = "arch"
> > diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > index 9c436d1c..dee180ff 100644
> > --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > @@ -23,7 +23,7 @@ FLOATABI = "${@bb.utils.contains("TUNE_FEATURES",
> "vfp", bb.utils.contains("TUNE
> >
> >  EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc
> ${TOOLCHAIN_OPTIONS} ${FLOATABI}" LD="${TARGET_PREFIX}gcc
> ${TOOLCHAIN_OPTIONS} ${FLOATABI}""
> >
> > -FILES_${PN} = "/boot"
> > +FILES:${PN} = "/boot"
> >
> >  inherit deploy
> >
> > diff --git a/recipes-bsp/bt-fw/bt-fw_git.bb b/recipes-bsp/bt-fw/
> bt-fw_git.bb
> > index f3d740b1..ea42c168 100644
> > --- a/recipes-bsp/bt-fw/bt-fw_git.bb
> > +++ b/recipes-bsp/bt-fw/bt-fw_git.bb
> > @@ -21,4 +21,4 @@ do_install() {
> >      oe_runmake "DEST_DIR=${D}" "BASE_LIB_DIR=${base_libdir}" install
> >  }
> >
> > -FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
> > +FILES:${PN} += "${base_libdir}/firmware/ti-connectivity/*"
> > diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> > index 6d857f7f..ccaa3e6d 100644
> > --- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> > +++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> > @@ -25,4 +25,4 @@ do_install() {
> >       install -m 0644 ${S}/cadence/${TARGET}
> ${D}${base_libdir}/firmware/cadence/${TARGET}
> >  }
> >
> > -FILES_${PN} = "${base_libdir}/firmware"
> > +FILES:${PN} = "${base_libdir}/firmware"
> > diff --git a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> b/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> > index f3c780f6..aef21899 100644
> > --- a/recipes-bsp/cal-lld/cal-lld-rtos_git.bb
> > +++ b/recipes-bsp/

--000000000000dd31ce05c925c43f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes I am :) and I now remember that I had to consider mac=
hine overrides so ignore this for now</div><div dir=3D"auto"><br></div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Aug 9, 2021 at 12:53 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@de=
nix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Khem,<br>
<br>
Aren&#39;t you supposed to be on vacation this week? :)<br>
<br>
NAK for this patch, as I see too many mistakes - some overrides for SOC <br=
>
families are missed and some non-overrides, like &quot;makefile_armv7&quot;=
 are <br>
incorrectly converted. And you are about a week late, anyway... :)<br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Mon, Aug 09, 2021 at 12:39:30PM -0700, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 classes/ti-pdk-fetch.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 classes/ti-pdk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 +--<br>
&gt;=C2=A0 conf/machine/am3517-evm.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/am37x-evm.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/am65xx-evm-k3r5-sr2.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/am65xx-hs-evm-k3r5-sr2.conf=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/beagleboard.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/beaglebone.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/am64xx.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/am65xx.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/c66x.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/davinci.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/dra7xx.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/j7.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/k2e.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/k2g.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/k2hk.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/k2l.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/k3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/k3r5.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 conf/machine/include/keystone.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/omap-a15.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/omap3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/omap4.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/omapl1.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/omapl137.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/omapl138.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/ti33x.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/include/ti43x.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/machine/omap3evm.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/multiconfig/k3r5-sr2.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 conf/multiconfig/k3r5.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/abefw/<a href=3D"http://abefw_1.0.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">abefw_1.0.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aif2-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aif2-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">aif2-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/alsa-state/alsa-state.bbappend=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 .../audk2g-addon/<a href=3D"http://audk2g-addon-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">audk2g-addon-rtos_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/bcp-lld/<a href=3D"http://bcp-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">bcp-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/board-rtos/<a href=3D"http://board-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">board-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 20 +--<br>
&gt;=C2=A0 recipes-bsp/boot-monitor/<a href=3D"http://boot-monitor_git.bb" =
rel=3D"noreferrer" target=3D"_blank">boot-monitor_git.bb</a>=C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/bt-fw/<a href=3D"http://bt-fw_git.bb" rel=3D"norefer=
rer" target=3D"_blank">bt-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../cadence-mhdp-fw/<a href=3D"http://cadence-mhdp-fw_git.bb" re=
l=3D"noreferrer" target=3D"_blank">cadence-mhdp-fw_git.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/cal-lld/<a href=3D"http://cal-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cal-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/cm3-pm-firmware/<a href=3D"http://amx3-cm3_git.bb" r=
el=3D"noreferrer" target=3D"_blank">amx3-cm3_git.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/cmb-addon/<a href=3D"http://cmb-addon-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">cmb-addon-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/cmem/<a href=3D"http://cmem-mod_git.bb" rel=3D"noref=
errer" target=3D"_blank">cmem-mod_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/cmem/<a href=3D"http://cmem_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cmem_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../common-csl-ip/<a href=3D"http://common-csl-ip-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">common-csl-ip-rtos_git.bb</a>=C2=A0 =C2=
=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 .../common-csl-ip/<a href=3D"http://common-csl-ip_git.bb" rel=3D=
"noreferrer" target=3D"_blank">common-csl-ip_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../common-csl-ip/<a href=3D"http://csl-rti-dwwdtest-fw_git.bb" =
rel=3D"noreferrer" target=3D"_blank">csl-rti-dwwdtest-fw_git.bb</a>=C2=A0 |=
=C2=A0 16 +--<br>
&gt;=C2=A0 recipes-bsp/cppi-lld/<a href=3D"http://cppi-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cppi-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/cppi-lld/<a href=3D"http://cppi-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cppi-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/cppi-lld/<a href=3D"http://cppi-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">cppi-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../cpsw9g-eth-fw/<a href=3D"http://cpsw9g-eth-fw_git.bb" rel=3D=
"noreferrer" target=3D"_blank">cpsw9g-eth-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/cuia/<a href=3D"http://cuia_1.0.0.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">cuia_1.0.0.13.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/dfe-lld/<a href=3D"http://dfe-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">dfe-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/dfe-lld/<a href=3D"http://dfe-lld_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dfe-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/dspdce-fw/<a href=3D"http://dspdce-fw_git.bb" rel=3D=
"noreferrer" target=3D"_blank">dspdce-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/dsptop/<a href=3D"http://debugss-module-drv_git.bb" =
rel=3D"noreferrer" target=3D"_blank">debugss-module-drv_git.bb</a>=C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/dsptop/<a href=3D"http://dsptop_git.bb" rel=3D"noref=
errer" target=3D"_blank">dsptop_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/dsptop/<a href=3D"http://libulm_git.bb" rel=3D"noref=
errer" target=3D"_blank">libulm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../dsptop/<a href=3D"http://temperature-module-drv_git.bb" rel=
=3D"noreferrer" target=3D"_blank">temperature-module-drv_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/edma3-lld/<a href=3D"http://edma3-lld-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">edma3-lld-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
&gt;=C2=A0 recipes-bsp/edma3-lld/<a href=3D"http://edma3-lld_git.bb" rel=3D=
"noreferrer" target=3D"_blank">edma3-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/emac-lld/<a href=3D"http://emac-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">emac-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 recipes-bsp/fatfs-rtos/<a href=3D"http://fatfs-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">fatfs-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../<a href=3D"http://faultmanagement-rtos_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">faultmanagement-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/fftc-lld/<a href=3D"http://fftc-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">fftc-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../formfactor/formfactor_0.0.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/fvid2/<a href=3D"http://fvid2-rtos_git.bb" rel=3D"no=
referrer" target=3D"_blank">fvid2-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../<a href=3D"http://ti-gc320-driver_5.0.11.p7.bb" rel=3D"noref=
errer" target=3D"_blank">ti-gc320-driver_5.0.11.p7.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/goodix-fw/<a href=3D"http://goodix-fw_git.bb" rel=3D=
"noreferrer" target=3D"_blank">goodix-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/gpio-lld/<a href=3D"http://gpio-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">gpio-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-bsp/gpmc-lld/<a href=3D"http://gpmc-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">gpmc-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/hplib/<a href=3D"http://hplib-mod_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">hplib-mod_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/hplib/<a href=3D"http://hplib-test_git.bb" rel=3D"no=
referrer" target=3D"_blank">hplib-test_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/hplib/<a href=3D"http://hplib_git.bb" rel=3D"norefer=
rer" target=3D"_blank">hplib_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/hyplnk-lld/<a href=3D"http://hyplnk-lld-rtos_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">hyplnk-lld-rtos_git.bb</a> |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/hyplnk-lld/<a href=3D"http://hyplnk-lld-test_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">hyplnk-lld-test_git.bb</a> |=C2=A0 =
=C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/hyplnk-lld/<a href=3D"http://hyplnk-lld_git.bb" rel=
=3D"noreferrer" target=3D"_blank">hyplnk-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/i2c-lld/<a href=3D"http://i2c-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">i2c-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 14 +-<br>
&gt;=C2=A0 recipes-bsp/ibl-boot/<a href=3D"http://ibl-boot-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ibl-boot-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../icss-emac-lld/<a href=3D"http://icss-emac-lld-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">icss-emac-lld-rtos_git.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../icss-emac-lld/<a href=3D"http://icss-emac-lld-test_git.bb" r=
el=3D"noreferrer" target=3D"_blank">icss-emac-lld-test_git.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../icss-emac-lld/<a href=3D"http://icss-emac-lld_git.bb" rel=3D=
"noreferrer" target=3D"_blank">icss-emac-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/iolink-lld/<a href=3D"http://iolink-lld-rtos_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">iolink-lld-rtos_git.bb</a> |=C2=A0 =
=C2=A06 +-<br>
&gt;=C2=A0 .../ipc-lld/<a href=3D"http://ipc-lld-examples-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ipc-lld-examples-rtos_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 24 ++--<br>
&gt;=C2=A0 recipes-bsp/ipc-lld/<a href=3D"http://ipc-lld-fw_git.bb" rel=3D"=
noreferrer" target=3D"_blank">ipc-lld-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 recipes-bsp/ipc-lld/<a href=3D"http://ipc-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ipc-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/ipc-lld/ipc-lld.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/ipumm-fw/<a href=3D"http://ipumm-fw_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">ipumm-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/iqn2-lld/<a href=3D"http://iqn2-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">iqn2-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/iqn2-lld/<a href=3D"http://iqn2-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">iqn2-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/mad-utils/<a href=3D"http://mad-utils-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">mad-utils-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/mcasp-lld/<a href=3D"http://mcasp-lld-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">mcasp-lld-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 12 +-<br>
&gt;=C2=A0 recipes-bsp/mcbsp-lld/<a href=3D"http://mcbsp-lld-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">mcbsp-lld-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/mmap-lld/<a href=3D"http://mmap-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mmap-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-bsp/mmap-lld/<a href=3D"http://mmap-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">mmap-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/mmcsd-lld/<a href=3D"http://mmcsd-lld-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">mmcsd-lld-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 12 +-<br>
&gt;=C2=A0 recipes-bsp/netcp-pa-fw/<a href=3D"http://netcp-pa-fw_git.bb" re=
l=3D"noreferrer" target=3D"_blank">netcp-pa-fw_git.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/netcp-sa-fw/<a href=3D"http://netcp-sa-fw_git.bb" re=
l=3D"noreferrer" target=3D"_blank">netcp-sa-fw_git.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/nwal-lld/<a href=3D"http://nwal-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">nwal-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/nwal-lld/<a href=3D"http://nwal-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">nwal-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/nwal-lld/<a href=3D"http://nwal-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nwal-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/osal/<a href=3D"http://osal-rtos_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">osal-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/osal/<a href=3D"http://osal-test_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">osal-test_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/osal/<a href=3D"http://osal_git.bb" rel=3D"noreferre=
r" target=3D"_blank">osal_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/pa-lld/<a href=3D"http://pa-lld-rtos_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pa-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pa-lld/<a href=3D"http://pa-lld-test_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pa-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/pa-lld/<a href=3D"http://pa-lld_git.bb" rel=3D"noref=
errer" target=3D"_blank">pa-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pcie-lld/<a href=3D"http://pcie-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">pcie-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/pktlib/<a href=3D"http://pktlib-rtos_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pktlib-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pktlib/<a href=3D"http://pktlib_git.bb" rel=3D"noref=
errer" target=3D"_blank">pktlib_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/pm-lld/<a href=3D"http://pm-lld-rtos_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pm-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 16 +--<br>
&gt;=C2=A0 .../<a href=3D"http://ti-img-rogue-driver_1.13.5776728.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-img-rogue-driver_1.13.5776728.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../<a href=3D"http://ti-sgx-ddk-km_1.17.4948957.bb" rel=3D"nore=
ferrer" target=3D"_blank">ti-sgx-ddk-km_1.17.4948957.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pru/<a href=3D"http://pru-icss_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">pru-icss_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 +++---<br>
&gt;=C2=A0 recipes-bsp/pru/<a href=3D"http://pru-pwm-fw_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">pru-pwm-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pru/<a href=3D"http://pru-swuart-fw_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">pru-swuart-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../pru/<a href=3D"http://ti-pru-sw-edma-driver_1.00.00.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-pru-sw-edma-driver_1.00.00.bb</a>=C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../prueth-fw/<a href=3D"http://prueth-fw-am65x-sr2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">prueth-fw-am65x-sr2_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/prueth-fw/<a href=3D"http://prueth-fw-am65x_git.bb" =
rel=3D"noreferrer" target=3D"_blank">prueth-fw-am65x_git.bb</a>=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/prueth-fw/<a href=3D"http://prueth-fw_5.6.15.bb" rel=
=3D"noreferrer" target=3D"_blank">prueth-fw_5.6.15.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pruhsr-fw/<a href=3D"http://pruhsr-fw_2.17.25.bb" re=
l=3D"noreferrer" target=3D"_blank">pruhsr-fw_2.17.25.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pruprp-fw/<a href=3D"http://pruprp-fw_2.17.25.bb" re=
l=3D"noreferrer" target=3D"_blank">pruprp-fw_2.17.25.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/pruss-lld/<a href=3D"http://pruss-lld-apps_git.bb" r=
el=3D"noreferrer" target=3D"_blank">pruss-lld-apps_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/pruss-lld/<a href=3D"http://pruss-lld-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">pruss-lld-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
&gt;=C2=A0 recipes-bsp/pruss-lld/<a href=3D"http://pruss-lld-test_git.bb" r=
el=3D"noreferrer" target=3D"_blank">pruss-lld-test_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/pruss-lld/<a href=3D"http://pruss-lld_git.bb" rel=3D=
"noreferrer" target=3D"_blank">pruss-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/prusw-fw/<a href=3D"http://prusw-fw_3.2.9.bb" rel=3D=
"noreferrer" target=3D"_blank">prusw-fw_3.2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/qmss-lld/<a href=3D"http://qmss-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">qmss-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/qmss-lld/<a href=3D"http://qmss-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">qmss-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/qmss-lld/<a href=3D"http://qmss-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">qmss-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-bsp/qmss-pdsp-fw/<a href=3D"http://qmss-pdsp-fw_git.bb" =
rel=3D"noreferrer" target=3D"_blank">qmss-pdsp-fw_git.bb</a>=C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/rm-lld/<a href=3D"http://rm-lld-rtos_git.bb" rel=3D"=
noreferrer" target=3D"_blank">rm-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/rm-lld/<a href=3D"http://rm-lld_git.bb" rel=3D"noref=
errer" target=3D"_blank">rm-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-bsp/sa-lld/<a href=3D"http://sa-lld-rtos_git.bb" rel=3D"=
noreferrer" target=3D"_blank">sa-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/sa-lld/<a href=3D"http://sa-lld-test_git.bb" rel=3D"=
noreferrer" target=3D"_blank">sa-lld-test_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/sa-lld/<a href=3D"http://sa-lld_git.bb" rel=3D"noref=
errer" target=3D"_blank">sa-lld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/sciclient/<a href=3D"http://sciclient-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">sciclient-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 18 +--<br>
&gt;=C2=A0 .../serdes-diag/<a href=3D"http://serdes-diag-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">serdes-diag-rtos_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/serdes-fw/<a href=3D"http://serdes-fw_git.bb" rel=3D=
"noreferrer" target=3D"_blank">serdes-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/spi-lld/<a href=3D"http://spi-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">spi-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 recipes-bsp/srio-lld/<a href=3D"http://srio-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">srio-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/srio-lld/srio-lld.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../starterware/<a href=3D"http://starterware-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">starterware-rtos_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/starterware/<a href=3D"http://starterware_git.bb" re=
l=3D"noreferrer" target=3D"_blank">starterware_git.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/tcp3d-lld/<a href=3D"http://tcp3d-lld-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">tcp3d-lld-rtos_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../<a href=3D"http://ti-ocf-crypto-module_1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">ti-ocf-crypto-module_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw-source_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">ti-sci-fw-source_git.bb</a> |=C2=A0 =
=C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_0.1.1.50.bb" r=
el=3D"noreferrer" target=3D"_blank">ti-sci-fw_0.1.1.50.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/ti-sci-fw/<a href=3D"http://ti-sci-fw_git.bb" rel=3D=
"noreferrer" target=3D"_blank">ti-sci-fw_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 14 +-<br>
&gt;=C2=A0 .../traceframework/<a href=3D"http://traceframework-rtos_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">traceframework-rtos_git.bb</a> |=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../traceframework/<a href=3D"http://traceframework_git.bb" rel=
=3D"noreferrer" target=3D"_blank">traceframework_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../transport-rtos/<a href=3D"http://bmet-eth-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">bmet-eth-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../transport-rtos/<a href=3D"http://nimu-icss-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">nimu-icss-rtos_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 10 +-<br>
&gt;=C2=A0 recipes-bsp/transport-rtos/<a href=3D"http://nimu-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">nimu-rtos_git.bb</a>=C2=A0 =C2=A0|=C2=
=A0 28 ++--<br>
&gt;=C2=A0 .../transport-rtos/<a href=3D"http://timesync-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">timesync-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../trusted-firmware-a_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/u-boot/u-boot-ti.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 26 ++--<br>
&gt;=C2=A0 recipes-bsp/uart-lld/<a href=3D"http://uart-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">uart-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 14 +-<br>
&gt;=C2=A0 recipes-bsp/udma-lld/<a href=3D"http://udma-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">udma-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../uio-module-drv/<a href=3D"http://uio-module-drv-test_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">uio-module-drv-test_git.bb</a> |=C2=
=A0 12 +-<br>
&gt;=C2=A0 .../uio-module-drv/<a href=3D"http://uio-module-drv_git.bb" rel=
=3D"noreferrer" target=3D"_blank">uio-module-drv_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/usb-lld/<a href=3D"http://usb-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">usb-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-bsp/vis-fw/<a href=3D"http://vis_01.50.07.15.bb" rel=3D"=
noreferrer" target=3D"_blank">vis_01.50.07.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-bsp/vpdma-fw/<a href=3D"http://vpdma-fw_03-2012.bb" rel=
=3D"noreferrer" target=3D"_blank">vpdma-fw_03-2012.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/vps-lld/<a href=3D"http://vps-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">vps-lld-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-bsp/wl18xx-fw/<a href=3D"http://wl18xx-fw_8.9.0.0.86.bb"=
 rel=3D"noreferrer" target=3D"_blank">wl18xx-fw_8.9.0.0.86.bb</a> |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/x-load/x-load.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-bsp/x-load/<a href=3D"http://x-load_1.46-psp.bb" rel=3D"=
noreferrer" target=3D"_blank">x-load_1.46-psp.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-bsp/x-load/<a href=3D"http://x-load_git.bb" rel=3D"noref=
errer" target=3D"_blank">x-load_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../<a href=3D"http://wl18xx-calibrator_8.7.3.bb" rel=3D"norefer=
rer" target=3D"_blank">wl18xx-calibrator_8.7.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../<a href=3D"http://wl18xx-target-scripts_8.7.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">wl18xx-target-scripts_8.7.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-connectivity/wlconf/<a href=3D"http://wlconf_8.7.3.bb" r=
el=3D"noreferrer" target=3D"_blank">wlconf_8.7.3.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
&gt;=C2=A0 .../init-ifupdown/init-ifupdown_1.0.bbappend=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 recipes-core/udev/eudev_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-devtools/gdbc6x/<a href=3D"http://gdbc6x_git.bb" rel=3D"=
noreferrer" target=3D"_blank">gdbc6x_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-devtools/gdbc6x/<a href=3D"http://gdbserver-c6x_git.bb" =
rel=3D"noreferrer" target=3D"_blank">gdbserver-c6x_git.bb</a>=C2=A0 |=C2=A0=
 =C2=A04 +-<br>
&gt;=C2=A0 .../gdbc6x/<a href=3D"http://gdbserverproxy-module-drv_git.bb" r=
el=3D"noreferrer" target=3D"_blank">gdbserverproxy-module-drv_git.bb</a>=C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../libgal/<a href=3D"http://ti-gc320-libs_5.0.11.p7.bb" rel=3D"=
noreferrer" target=3D"_blank">ti-gc320-libs_5.0.11.p7.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../<a href=3D"http://ti-img-rogue-umlibs_1.13.5776728.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-img-rogue-umlibs_1.13.5776728.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 +++---<br>
&gt;=C2=A0 .../libgles/<a href=3D"http://ti-sgx-ddk-um_1.17.4948957.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-sgx-ddk-um_1.17.4948957.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 36 +++---<br>
&gt;=C2=A0 recipes-kernel/kselftests/<a href=3D"http://kselftests_4.10.bb" =
rel=3D"noreferrer" target=3D"_blank">kselftests_4.10.bb</a>=C2=A0 | 122 +++=
++++++---------<br>
&gt;=C2=A0 recipes-kernel/linux/bundle-devicetree.inc=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 recipes-kernel/linux/kernel-rdepends.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 40 +++---<br>
&gt;=C2=A0 recipes-kernel/linux/<a href=3D"http://linux-ti-mainline_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-ti-mainline_git.bb</a> |=C2=A0 =
12 +-<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-ti-staging-rt_5.10.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-ti-staging-rt_5.10.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-ti-staging-rt_5.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">linux-ti-staging-rt_5.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-ti-staging-systest_5.10.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-ti-staging-systest_5.10.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-ti-staging-systest_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-ti-staging-systest_5.4.bb</a>=C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-kernel/linux/<a href=3D"http://linux-ti-staging_5.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-ti-staging_5.10.bb</a> |=C2=A0 =
=C2=A08 +-<br>
&gt;=C2=A0 recipes-kernel/linux/<a href=3D"http://linux-ti-staging_5.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-ti-staging_5.4.bb</a>=C2=A0 |=C2=
=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-kernel/linux/ti-uio.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++---<br>
&gt;=C2=A0 recipes-security/optee/optee-os_%.bbappend=C2=A0 =C2=A0 |=C2=A0 =
22 ++--<br>
&gt;=C2=A0 recipes-ti/beagleboard/<a href=3D"http://beaglebone-capes.bb" re=
l=3D"noreferrer" target=3D"_blank">beaglebone-capes.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../beagleboard/<a href=3D"http://beaglebone-getting-started.bb"=
 rel=3D"noreferrer" target=3D"_blank">beaglebone-getting-started.bb</a> |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/beagleboard/<a href=3D"http://gadget-init.bb" rel=3D"=
noreferrer" target=3D"_blank">gadget-init.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 recipes-ti/bios/<a href=3D"http://ti-biosutils_1.02.02.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-biosutils_1.02.02.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-ti/bios/ti-sysbios.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../<a href=3D"http://ti-codec-engine_3.24.00.08.bb" rel=3D"nore=
ferrer" target=3D"_blank">ti-codec-engine_3.24.00.08.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/ctoolslib/<a href=3D"http://libaet_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libaet_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../<a href=3D"http://gcc-arm-baremetal_7-2018-q2-update.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-arm-baremetal_7-2018-q2-update.bb</a>=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../<a href=3D"http://gcc-linaro-baremetal-aarch64-native.bb" re=
l=3D"noreferrer" target=3D"_blank">gcc-linaro-baremetal-aarch64-native.bb</=
a>=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../devtools/<a href=3D"http://gcc-linaro-baremetal-native.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-linaro-baremetal-native.bb</a>=C2=
=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/devtools/<a href=3D"http://ti-cg-xml_2.61.00.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-cg-xml_2.61.00.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/devtools/<a href=3D"http://ti-cgt-arm_18.12.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-cgt-arm_18.12.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/devtools/<a href=3D"http://ti-cgt-pru_2.3.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-cgt-pru_2.3.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 16 +--<br>
&gt;=C2=A0 recipes-ti/devtools/ti-cgt470.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-ti/devtools/<a href=3D"http://ti-cgt6x-7_7.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-cgt6x-7_7.4.16.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/devtools/<a href=3D"http://ti-cgt6x_8.3.2.bb" rel=3D"=
noreferrer" target=3D"_blank">ti-cgt6x_8.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 22 ++--<br>
&gt;=C2=A0 recipes-ti/devtools/<a href=3D"http://ti-cgt7x_1.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">ti-cgt7x_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/devtools/ti-xdctools-common.inc=C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/dmai/ti-dmai.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 +++---<br>
&gt;=C2=A0 recipes-ti/dmai/<a href=3D"http://ti-dmai_svn.bb" rel=3D"norefer=
rer" target=3D"_blank">ti-dmai_svn.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/dsplib/dsplib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../ti-framework-components.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/imglib/imglib-c66x.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/includes/ti-staging.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/includes/ti-unpack.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../ipc/<a href=3D"http://ipc-transport-common-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ipc-transport-common-rtos_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-ti/ipc/<a href=3D"http://ipc-transport-qmss-rtos_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">ipc-transport-qmss-rtos_git.bb</a> |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/ipc/ipc-transport-qmss.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-ti/ipc/<a href=3D"http://ipc-transport-srio-rtos_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">ipc-transport-srio-rtos_git.bb</a> |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/ipc/ipc-transport-srio.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-ti/ipc/<a href=3D"http://ti-ipc-examples-linux_git.bb" r=
el=3D"noreferrer" target=3D"_blank">ti-ipc-examples-linux_git.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/ipc/ti-ipc-examples.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/ipc/<a href=3D"http://ti-ipc-examples_git.bb" rel=3D"=
noreferrer" target=3D"_blank">ti-ipc-examples_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/ipc/ti-ipc-rtos.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/ipc/<a href=3D"http://ti-ipc-rtos_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">ti-ipc-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 ++--<br>
&gt;=C2=A0 recipes-ti/ipc/<a href=3D"http://ti-ipc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">ti-ipc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
&gt;=C2=A0 recipes-ti/linuxutils/ti-linuxutils.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 14 +-<br>
&gt;=C2=A0 .../linuxutils/<a href=3D"http://ti-linuxutils_2.26.01.02.bb" re=
l=3D"noreferrer" target=3D"_blank">ti-linuxutils_2.26.01.02.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 recipes-ti/mathlib/mathlib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/mpm-transport/<a href=3D"http://mpm-transport_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">mpm-transport_git.bb</a> |=C2=A0 12 +=
-<br>
&gt;=C2=A0 .../multiprocmgr/<a href=3D"http://multiprocmgr-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">multiprocmgr-rtos_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 .../multiprocmgr/<a href=3D"http://multiprocmgr-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">multiprocmgr-test_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 recipes-ti/multiprocmgr/<a href=3D"http://multiprocmgr_git.bb" r=
el=3D"noreferrer" target=3D"_blank">multiprocmgr_git.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/ndk/ti-ndk.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/ns/ti-ns.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/openmp-rtos/<a href=3D"http://openmp-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">openmp-rtos_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 recipes-ti/osal/ti-osal.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/swtools/<a href=3D"http://swtools_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">swtools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../ti-pdk-build/<a href=3D"http://ti-pdk-build-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-pdk-build-rtos_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 recipes-ti/ti-rtos-bin/<a href=3D"http://ti-rtos-firmware.bb" re=
l=3D"noreferrer" target=3D"_blank">ti-rtos-firmware.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 20 +--<br>
&gt;=C2=A0 recipes-ti/udma/<a href=3D"http://udma_git.bb" rel=3D"noreferrer=
" target=3D"_blank">udma_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../uio-test-pruss/<a href=3D"http://uio-test-pruss_git.bb" rel=
=3D"noreferrer" target=3D"_blank">uio-test-pruss_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 recipes-ti/vlib/vlib-c66x.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/xdais/ti-xdais.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 recipes-ti/xdais/<a href=3D"http://ti-xdais_6.26.01.03.bb" rel=
=3D"noreferrer" target=3D"_blank">ti-xdais_6.26.01.03.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 251 files changed, 833 insertions(+), 833 deletions(-)<br>
&gt; <br>
&gt; diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbcla=
ss<br>
&gt; index cacd71a4..e4c55e33 100644<br>
&gt; --- a/classes/ti-pdk-fetch.bbclass<br>
&gt; +++ b/classes/ti-pdk-fetch.bbclass<br>
&gt; @@ -18,7 +18,7 @@ TI_PDK_SOURCE =3D &quot;${TI_PDK_SOURCE_WORKDIR}/git=
&quot;<br>
&gt;=C2=A0 S =3D &quot;${@&#39;${WORKDIR}/git/${TI_PDK_COMP_PATH}&#39;.rstr=
ip(&#39;/&#39;)}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Hard-link only required sources from PDK<br>
&gt; -python do_unpack_append() {<br>
&gt; +python do_unpack:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if len(d.getVar(&#39;TI_PDK_COMP&#39;) or &#39;&#3=
9;) &gt; 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import shutil<br>
&gt;=C2=A0 <br>
&gt; diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass<br>
&gt; index 68314215..21dd3ade 100644<br>
&gt; --- a/classes/ti-pdk.bbclass<br>
&gt; +++ b/classes/ti-pdk.bbclass<br>
&gt; @@ -5,14 +5,14 @@ inherit perlnative<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS =3D &quot;ti-xdctools-native ti-cg-xml-native ti-sysbios=
 common-csl-ip-rtos libxml-simple-perl-native gcc-arm-baremetal-native ti-c=
gt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append_omap-a15 =3D &quot; ti-cgt-arm-native&quot;<br>
&gt; -DEPENDS_remove_ti33x =3D &quot;ti-cgt6x-native&quot;<br>
&gt; -DEPENDS_remove_ti43x =3D &quot;ti-cgt6x-native&quot;<br>
&gt; -DEPENDS_append_omapl1 =3D &quot; ti-cgt-arm-native&quot;<br>
&gt; -DEPENDS_remove_am65xx =3D &quot;gcc-arm-baremetal-native ti-cgt6x-nat=
ive&quot;<br>
&gt; -DEPENDS_append_am65xx =3D &quot; ti-cgt-arm-native gcc-linaro-baremet=
al-aarch64-native&quot;<br>
&gt; -DEPENDS_remove_j7 =3D &quot;gcc-arm-baremetal-native&quot;<br>
&gt; -DEPENDS_append_j7 =3D &quot; ti-cgt-arm-native gcc-linaro-baremetal-a=
arch64-native ti-cgt7x-native&quot;<br>
&gt; +DEPENDS:append_omap-a15 =3D &quot; ti-cgt-arm-native&quot;<br>
&gt; +DEPENDS:remove_ti33x =3D &quot;ti-cgt6x-native&quot;<br>
&gt; +DEPENDS:remove_ti43x =3D &quot;ti-cgt6x-native&quot;<br>
&gt; +DEPENDS:append_omapl1 =3D &quot; ti-cgt-arm-native&quot;<br>
&gt; +DEPENDS:remove_am65xx =3D &quot;gcc-arm-baremetal-native ti-cgt6x-nat=
ive&quot;<br>
&gt; +DEPENDS:append_am65xx =3D &quot; ti-cgt-arm-native gcc-linaro-baremet=
al-aarch64-native&quot;<br>
&gt; +DEPENDS:remove_j7 =3D &quot;gcc-arm-baremetal-native&quot;<br>
&gt; +DEPENDS:append_j7 =3D &quot; ti-cgt-arm-native gcc-linaro-baremetal-a=
arch64-native ti-cgt7x-native&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 B =3D &quot;${WORKDIR}/build&quot;<br>
&gt; @@ -141,4 +141,4 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -FILES_${PN} +=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${PDK_INSTALL_DIR_RECIPE}/packages&quot;<br>
&gt; diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.co=
nf<br>
&gt; index c20e2f6a..f194c648 100644<br>
&gt; --- a/conf/machine/am3517-evm.conf<br>
&gt; +++ b/conf/machine/am3517-evm.conf<br>
&gt; @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS =3D &quot;smallscreen&quot;<br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;touchscreen ethernet&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;ubi tar.xz&quot;<br>
&gt; -EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&gt; +EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SERIAL_CONSOLES =3D &quot;115200;ttyS2&quot;<br>
&gt;=C2=A0 USE_VT =3D &quot;2&quot;<br>
&gt; diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf=
<br>
&gt; index a512c8d0..9750fe64 100644<br>
&gt; --- a/conf/machine/am37x-evm.conf<br>
&gt; +++ b/conf/machine/am37x-evm.conf<br>
&gt; @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS =3D &quot;smallscreen&quot;<br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;touchscreen ethernet&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;ubi tar.xz&quot;<br>
&gt; -EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&gt; +EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 KERNEL_DEVICETREE =3D &quot;omap3-evm-37xx.dtb&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65=
xx-evm-k3r5-sr2.conf<br>
&gt; index c0b3cd51..e74dd3ab 100644<br>
&gt; --- a/conf/machine/am65xx-evm-k3r5-sr2.conf<br>
&gt; +++ b/conf/machine/am65xx-evm-k3r5-sr2.conf<br>
&gt; @@ -5,7 +5,7 @@<br>
&gt;=C2=A0 # Booting SR2 requires different SYSFW, the rest is handled at r=
untime<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require conf/machine/am65xx-evm-k3r5.conf<br>
&gt; -SOC_FAMILY_append =3D &quot;:k3r5-sr2&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k3r5-sr2&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&gt;=C2=A0 SYSFW_SYMLINK =3D &quot;sysfw.itb&quot;<br>
&gt; diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/conf/machine/a=
m65xx-hs-evm-k3r5-sr2.conf<br>
&gt; index ef1b6fbe..ff1645e4 100644<br>
&gt; --- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf<br>
&gt; +++ b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf<br>
&gt; @@ -5,7 +5,7 @@<br>
&gt;=C2=A0 # Booting SR2 requires different SYSFW, the rest is handled at r=
untime<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require conf/machine/am65xx-hs-evm-k3r5.conf<br>
&gt; -SOC_FAMILY_append =3D &quot;:k3r5-sr2&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k3r5-sr2&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SYSFW_SOC =3D &quot;am65x_sr2&quot;<br>
&gt;=C2=A0 SYSFW_SYMLINK =3D &quot;sysfw.itb&quot;<br>
&gt; diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.=
conf<br>
&gt; index ee51fd66..06777795 100644<br>
&gt; --- a/conf/machine/beagleboard.conf<br>
&gt; +++ b/conf/machine/beagleboard.conf<br>
&gt; @@ -8,7 +8,7 @@ require conf/machine/include/omap3.inc<br>
&gt;=C2=A0 MACHINE_GUI_CLASS =3D &quot;bigscreen&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;tar.xz ubi&quot;<br>
&gt; -EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp&quot;<br>
&gt; +EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 KERNEL_DEVICETREE =3D &quot;omap3-beagle.dtb omap3-beagle-xm.dtb=
 omap3-beagle-xm-ab.dtb&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.co=
nf<br>
&gt; index 896a9d73..dcb14cc9 100644<br>
&gt; --- a/conf/machine/beaglebone.conf<br>
&gt; +++ b/conf/machine/beaglebone.conf<br>
&gt; @@ -13,7 +13,7 @@ MACHINE_GUI_CLASS =3D &quot;bigscreen&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SERIAL_CONSOLES =3D &quot;115200;ttyS0&quot;<br>
&gt;=C2=A0 <br>
&gt; -IMAGE_INSTALL_append =3D &quot; kernel-devicetree kernel-image-zimage=
&quot;<br>
&gt; +IMAGE_INSTALL:append =3D &quot; kernel-devicetree kernel-image-zimage=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Refine the list of device targets for ti-pdk class recipes<br>
&gt;=C2=A0 TI_PDK_LIMIT_BOARDS =3D &quot;bbbAM335x&quot;<br>
&gt; diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am=
64xx.inc<br>
&gt; index 95fdc79d..18e3757a 100644<br>
&gt; --- a/conf/machine/include/am64xx.inc<br>
&gt; +++ b/conf/machine/include/am64xx.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/k3.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:am64xx&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:am64xx&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;screen touchscreen&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am=
65xx.inc<br>
&gt; index 8516ca4c..2838c58f 100644<br>
&gt; --- a/conf/machine/include/am65xx.inc<br>
&gt; +++ b/conf/machine/include/am65xx.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/k3.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:am65xx&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:am65xx&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;screen touchscreen gpu&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/conf/machine/include/c66x.inc b/conf/machine/include/c66x=
.inc<br>
&gt; index e35f2eda..33a657f1 100644<br>
&gt; --- a/conf/machine/include/c66x.inc<br>
&gt; +++ b/conf/machine/include/c66x.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/keystone.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:c66x&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:c66x&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # HACK: The c66x family is composed of devices with only DSP cor=
es, and no ARM<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0cores. The Linux kernel is not suppo=
rted on these machines.<br>
&gt; diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/d=
avinci.inc<br>
&gt; index 62ca6887..d2681740 100644<br>
&gt; --- a/conf/machine/include/davinci.inc<br>
&gt; +++ b/conf/machine/include/davinci.inc<br>
&gt; @@ -17,6 +17,6 @@ UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
&gt;=C2=A0 EXTRA_IMAGEDEPENDS +=3D &quot;u-boot&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SERIAL_CONSOLES ?=3D &quot;115200;ttyS0&quot;<br>
&gt; -EXTRA_IMAGECMD_jffs2 =3D &quot;--pad --little-endian --eraseblock=3D0=
x20000 -n&quot;<br>
&gt; +EXTRA_IMAGECMD:jffs2 =3D &quot;--pad --little-endian --eraseblock=3D0=
x20000 -n&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MACHINE_FEATURES =3D &quot;kernel26 serial ethernet usbhost usbg=
adget mmc alsa&quot;<br>
&gt; diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dr=
a7xx.inc<br>
&gt; index 857e1b35..a02421d9 100644<br>
&gt; --- a/conf/machine/include/dra7xx.inc<br>
&gt; +++ b/conf/machine/include/dra7xx.inc<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 require conf/machine/include/omap-a15.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:dra7xx&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:dra7xx&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;pci&quot;<br>
&gt; diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc=
<br>
&gt; index d3eda1a8..cf5f6a94 100644<br>
&gt; --- a/conf/machine/include/j7.inc<br>
&gt; +++ b/conf/machine/include/j7.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/k3.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:j7&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:j7&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 OPTEEMACHINE =3D &quot;k3-j721e&quot;<br>
&gt;=C2=A0 OPTEEOUTPUTMACHINE =3D &quot;k3&quot;<br>
&gt; diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.i=
nc<br>
&gt; index 6797fb29..a6d58bb3 100644<br>
&gt; --- a/conf/machine/include/k2e.inc<br>
&gt; +++ b/conf/machine/include/k2e.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/keystone.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:k2e&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k2e&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Set the list of device targets for ti-pdk class recipes<br>
&gt;=C2=A0 TI_PDK_LIMIT_SOCS =3D &quot;k2e&quot;<br>
&gt; diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.i=
nc<br>
&gt; index 7bcc412b..be40d9e7 100644<br>
&gt; --- a/conf/machine/include/k2g.inc<br>
&gt; +++ b/conf/machine/include/k2g.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/keystone.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:k2g&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k2g&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Set the list of device targets for ti-pdk class recipes<br>
&gt;=C2=A0 TI_PDK_LIMIT_SOCS =3D &quot;k2g&quot;<br>
&gt; diff --git a/conf/machine/include/k2hk.inc b/conf/machine/include/k2hk=
.inc<br>
&gt; index 2d2dd6a0..456fda75 100644<br>
&gt; --- a/conf/machine/include/k2hk.inc<br>
&gt; +++ b/conf/machine/include/k2hk.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/keystone.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:k2hk&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k2hk&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Set the list of device targets for ti-pdk class recipes<br>
&gt;=C2=A0 TI_PDK_LIMIT_SOCS =3D &quot;k2h k2k&quot;<br>
&gt; diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.i=
nc<br>
&gt; index 997bcbe2..b6a4bc7d 100644<br>
&gt; --- a/conf/machine/include/k2l.inc<br>
&gt; +++ b/conf/machine/include/k2l.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/keystone.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:k2l&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k2l&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Set the list of device targets for ti-pdk class recipes<br>
&gt;=C2=A0 TI_PDK_LIMIT_SOCS =3D &quot;k2l&quot;<br>
&gt; diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc=
<br>
&gt; index e0970698..20ab7a9e 100644<br>
&gt; --- a/conf/machine/include/k3.inc<br>
&gt; +++ b/conf/machine/include/k3.inc<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 # TI K3 Aarch64 profile for Cortex-A53/A72 cores<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:k3&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k3&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require conf/machine/include/arm/arch-arm64.inc<br>
&gt;=C2=A0 <br>
&gt; diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5=
.inc<br>
&gt; index a32accae..93f08c04 100644<br>
&gt; --- a/conf/machine/include/k3r5.inc<br>
&gt; +++ b/conf/machine/include/k3r5.inc<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 # TI K3 Armv7 profile for Cortex-R5F cores<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:k3r5&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:k3r5&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # The closest of existing tunes for Cortex-R5F<br>
&gt;=C2=A0 DEFAULTTUNE =3D &quot;armv7athf&quot;<br>
&gt; @@ -20,5 +20,5 @@ UBOOT_BINARY =3D &quot;tiboot3.${UBOOT_SUFFIX}&quot;=
<br>
&gt;=C2=A0 UBOOT_IMAGE =3D &quot;tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT=
_SUFFIX}&quot;<br>
&gt;=C2=A0 UBOOT_SYMLINK =3D &quot;tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}&q=
uot;<br>
&gt;=C2=A0 <br>
&gt; -PACKAGECONFIG_pn-u-boot-ti-staging =3D &quot;&quot;<br>
&gt; -PACKAGECONFIG_pn-u-boot-ti-mainline =3D &quot;&quot;<br>
&gt; +PACKAGECONFIG:pn-u-boot-ti-staging =3D &quot;&quot;<br>
&gt; +PACKAGECONFIG:pn-u-boot-ti-mainline =3D &quot;&quot;<br>
&gt; diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/=
keystone.inc<br>
&gt; index e7ea9758..83dca19d 100644<br>
&gt; --- a/conf/machine/include/keystone.inc<br>
&gt; +++ b/conf/machine/include/keystone.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:keystone&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:keystone&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&gt;=C2=A0 require conf/machine/include/tune-cortexa15.inc<br>
&gt; diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/=
omap-a15.inc<br>
&gt; index e491d2b5..553835c8 100644<br>
&gt; --- a/conf/machine/include/omap-a15.inc<br>
&gt; +++ b/conf/machine/include/omap-a15.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:omap-a15&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:omap-a15&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&gt;=C2=A0 require conf/machine/include/tune-cortexa15.inc<br>
&gt; diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/oma=
p3.inc<br>
&gt; index 5696c82d..ab069b00 100644<br>
&gt; --- a/conf/machine/include/omap3.inc<br>
&gt; +++ b/conf/machine/include/omap3.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:omap3&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:omap3&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&gt;=C2=A0 require conf/machine/include/tune-cortexa8.inc<br>
&gt; diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/oma=
p4.inc<br>
&gt; index cbca267c..b6f43744 100644<br>
&gt; --- a/conf/machine/include/omap4.inc<br>
&gt; +++ b/conf/machine/include/omap4.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:omap4&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:omap4&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&gt;=C2=A0 require conf/machine/include/tune-cortexa9.inc<br>
&gt; diff --git a/conf/machine/include/omapl1.inc b/conf/machine/include/om=
apl1.inc<br>
&gt; index 9942c944..d0262c3f 100644<br>
&gt; --- a/conf/machine/include/omapl1.inc<br>
&gt; +++ b/conf/machine/include/omapl1.inc<br>
&gt; @@ -1,2 +1,2 @@<br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:omapl1&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:omapl1&quot;<br>
&gt; diff --git a/conf/machine/include/omapl137.inc b/conf/machine/include/=
omapl137.inc<br>
&gt; index 5d8a6dd8..6dd49418 100644<br>
&gt; --- a/conf/machine/include/omapl137.inc<br>
&gt; +++ b/conf/machine/include/omapl137.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/omapl1.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:omapl137&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:omapl137&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Set the list of device targets for ti-pdk class recipes<br>
&gt;=C2=A0 TI_PDK_LIMIT_SOCS =3D &quot;omapl137&quot;<br>
&gt; diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/=
omapl138.inc<br>
&gt; index 999cbc3a..f73517d0 100644<br>
&gt; --- a/conf/machine/include/omapl138.inc<br>
&gt; +++ b/conf/machine/include/omapl138.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/omapl1.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:omapl138&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:omapl138&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Set the list of device targets for ti-pdk class recipes<br>
&gt;=C2=A0 TI_PDK_LIMIT_SOCS =3D &quot;omapl138&quot;<br>
&gt; diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti3=
3x.inc<br>
&gt; index 6dfda754..3da2aba5 100644<br>
&gt; --- a/conf/machine/include/ti33x.inc<br>
&gt; +++ b/conf/machine/include/ti33x.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:ti33x&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:ti33x&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&gt;=C2=A0 require conf/machine/include/tune-cortexa8.inc<br>
&gt; diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti4=
3x.inc<br>
&gt; index b1a27f93..eaed1812 100644<br>
&gt; --- a/conf/machine/include/ti43x.inc<br>
&gt; +++ b/conf/machine/include/ti43x.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 require conf/machine/include/ti-soc.inc<br>
&gt; -SOC_FAMILY_append =3D &quot;:ti43x&quot;<br>
&gt; +SOC_FAMILY:append =3D &quot;:ti43x&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br>
&gt;=C2=A0 require conf/machine/include/tune-cortexa9.inc<br>
&gt; diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf<b=
r>
&gt; index 01808b68..dc56d57a 100644<br>
&gt; --- a/conf/machine/omap3evm.conf<br>
&gt; +++ b/conf/machine/omap3evm.conf<br>
&gt; @@ -8,7 +8,7 @@ MACHINE_GUI_CLASS =3D &quot;smallscreen&quot;<br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;touchscreen ethernet&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;jffs2 tar.xz&quot;<br>
&gt; -EXTRA_IMAGECMD_jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&gt; +EXTRA_IMAGECMD:jffs2 =3D &quot;-lnp -e 0x20000 -s 2048&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SERIAL_CONSOLES =3D &quot;115200;ttyS0&quot;<br>
&gt;=C2=A0 USE_VT =3D &quot;0&quot;<br>
&gt; diff --git a/conf/multiconfig/k3r5-sr2.conf b/conf/multiconfig/k3r5-sr=
2.conf<br>
&gt; index 17082141..e933b9cc 100644<br>
&gt; --- a/conf/multiconfig/k3r5-sr2.conf<br>
&gt; +++ b/conf/multiconfig/k3r5-sr2.conf<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 require k3r5.conf<br>
&gt;=C2=A0 <br>
&gt; -MACHINE_append =3D &quot;-sr2&quot;<br>
&gt; +MACHINE:append =3D &quot;-sr2&quot;<br>
&gt; diff --git a/conf/multiconfig/k3r5.conf b/conf/multiconfig/k3r5.conf<b=
r>
&gt; index 8c8f0c3f..deb07210 100644<br>
&gt; --- a/conf/multiconfig/k3r5.conf<br>
&gt; +++ b/conf/multiconfig/k3r5.conf<br>
&gt; @@ -2,4 +2,4 @@ MAINMACHINE :=3D &quot;${MACHINE}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPLOY_DIR_IMAGE =3D &quot;${DEPLOY_DIR}/images/${MAINMACHINE}&q=
uot;<br>
&gt;=C2=A0 <br>
&gt; -MACHINE_append =3D &quot;-k3r5&quot;<br>
&gt; +MACHINE:append =3D &quot;-k3r5&quot;<br>
&gt; diff --git a/recipes-bsp/abefw/<a href=3D"http://abefw_1.0.14.bb" rel=
=3D"noreferrer" target=3D"_blank">abefw_1.0.14.bb</a> b/recipes-bsp/abefw/<=
a href=3D"http://abefw_1.0.14.bb" rel=3D"noreferrer" target=3D"_blank">abef=
w_1.0.14.bb</a><br>
&gt; index 302bdcde..a6cc624a 100644<br>
&gt; --- a/recipes-bsp/abefw/<a href=3D"http://abefw_1.0.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">abefw_1.0.14.bb</a><br>
&gt; +++ b/recipes-bsp/abefw/<a href=3D"http://abefw_1.0.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">abefw_1.0.14.bb</a><br>
&gt; @@ -20,4 +20,4 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${S}/firmware/omap4_abe_new ${D}/=
lib/firmware/<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -FILES_${PN} +=3D &quot;/lib/firmware/omap4_abe_new&quot;<br>
&gt; +FILES:${PN} +=3D &quot;/lib/firmware/omap4_abe_new&quot;<br>
&gt; diff --git a/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-rtos_git.=
bb" rel=3D"noreferrer" target=3D"_blank">aif2-lld-rtos_git.bb</a> b/recipes=
-bsp/aif2-lld/<a href=3D"http://aif2-lld-rtos_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">aif2-lld-rtos_git.bb</a><br>
&gt; index 962965b0..048a2430 100644<br>
&gt; --- a/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aif2-lld-rtos_git.bb</a><br>
&gt; +++ b/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aif2-lld-rtos_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ require recipes-bsp/aif2-lld/aif2-lld.inc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PR =3D &quot;${INC_PR}.0&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append =3D &quot; qmss-lld-rtos \<br>
&gt; +DEPENDS:append =3D &quot; qmss-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cppi-lld-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-test_git.=
bb" rel=3D"noreferrer" target=3D"_blank">aif2-lld-test_git.bb</a> b/recipes=
-bsp/aif2-lld/<a href=3D"http://aif2-lld-test_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">aif2-lld-test_git.bb</a><br>
&gt; index 9180b953..d4328621 100644<br>
&gt; --- a/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aif2-lld-test_git.bb</a><br>
&gt; +++ b/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aif2-lld-test_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ include aif2-lld.inc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PR =3D &quot;${INC_PR}.0&quot;<br>
&gt;=C2=A0 <br>
&gt; -EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} AIF2_SRC_DIR=3D${WORKDIR}/git&quot;<br>
&gt; +EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR} AIF2_SRC_DIR=3D${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_compile () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake clean DEVICE=3Dk2hk<br>
&gt; diff --git a/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld_git.bb" r=
el=3D"noreferrer" target=3D"_blank">aif2-lld_git.bb</a> b/recipes-bsp/aif2-=
lld/<a href=3D"http://aif2-lld_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>aif2-lld_git.bb</a><br>
&gt; index 4a640f1b..d9283a3a 100644<br>
&gt; --- a/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">aif2-lld_git.bb</a><br>
&gt; +++ b/recipes-bsp/aif2-lld/<a href=3D"http://aif2-lld_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">aif2-lld_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ include aif2-lld.inc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PR =3D &quot;${INC_PR}.0&quot;<br>
&gt;=C2=A0 <br>
&gt; -EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR}&quot;<br>
&gt; +EXTRA_OEMAKE =3D &quot;-f makefile:armv7 PDK_INSTALL_PATH=3D${STAGING=
_INCDIR}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_compile () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake lib DEVICE=3Dk2hk<br>
&gt; diff --git a/recipes-bsp/alsa-state/alsa-state.bbappend b/recipes-bsp/=
alsa-state/alsa-state.bbappend<br>
&gt; index 72d991c7..4fc41d05 100644<br>
&gt; --- a/recipes-bsp/alsa-state/alsa-state.bbappend<br>
&gt; +++ b/recipes-bsp/alsa-state/alsa-state.bbappend<br>
&gt; @@ -1 +1 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt; diff --git a/recipes-bsp/audk2g-addon/<a href=3D"http://audk2g-addon-r=
tos_git.bb" rel=3D"noreferrer" target=3D"_blank">audk2g-addon-rtos_git.bb</=
a> b/recipes-bsp/audk2g-addon/<a href=3D"http://audk2g-addon-rtos_git.bb" r=
el=3D"noreferrer" target=3D"_blank">audk2g-addon-rtos_git.bb</a><br>
&gt; index 0cb9ff17..e40fb43c 100644<br>
&gt; --- a/recipes-bsp/audk2g-addon/<a href=3D"http://audk2g-addon-rtos_git=
.bb" rel=3D"noreferrer" target=3D"_blank">audk2g-addon-rtos_git.bb</a><br>
&gt; +++ b/recipes-bsp/audk2g-addon/<a href=3D"http://audk2g-addon-rtos_git=
.bb" rel=3D"noreferrer" target=3D"_blank">audk2g-addon-rtos_git.bb</a><br>
&gt; @@ -25,7 +25,7 @@ PR =3D &quot;r0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git/ti/addon/audk2g&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append =3D &quot; ti-sysbios \<br>
&gt; +DEPENDS:append =3D &quot; ti-sysbios \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 board-rtos \<br>
&gt; diff --git a/recipes-bsp/bcp-lld/<a href=3D"http://bcp-lld-rtos_git.bb=
" rel=3D"noreferrer" target=3D"_blank">bcp-lld-rtos_git.bb</a> b/recipes-bs=
p/bcp-lld/<a href=3D"http://bcp-lld-rtos_git.bb" rel=3D"noreferrer" target=
=3D"_blank">bcp-lld-rtos_git.bb</a><br>
&gt; index 62cee07b..d808267b 100644<br>
&gt; --- a/recipes-bsp/bcp-lld/<a href=3D"http://bcp-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">bcp-lld-rtos_git.bb</a><br>
&gt; +++ b/recipes-bsp/bcp-lld/<a href=3D"http://bcp-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">bcp-lld-rtos_git.bb</a><br>
&gt; @@ -15,7 +15,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;=C2=A0 PR =3D &quot;r0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append =3D &quot; qmss-lld-rtos \<br>
&gt; +DEPENDS:append =3D &quot; qmss-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cppi-lld-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/recipes-bsp/board-rtos/<a href=3D"http://board-rtos_git.b=
b" rel=3D"noreferrer" target=3D"_blank">board-rtos_git.bb</a> b/recipes-bsp=
/board-rtos/<a href=3D"http://board-rtos_git.bb" rel=3D"noreferrer" target=
=3D"_blank">board-rtos_git.bb</a><br>
&gt; index a6547d38..485b0656 100644<br>
&gt; --- a/recipes-bsp/board-rtos/<a href=3D"http://board-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">board-rtos_git.bb</a><br>
&gt; +++ b/recipes-bsp/board-rtos/<a href=3D"http://board-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">board-rtos_git.bb</a><br>
&gt; @@ -16,24 +16,24 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PR =3D &quot;r0&quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append =3D &quot; i2c-lld-rtos \<br>
&gt; +DEPENDS:append =3D &quot; i2c-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0spi-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uart-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0osal-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append_omap-a15 =3D &quot; ti-ndk \<br>
&gt; +DEPENDS:append_omap-a15 =3D &quot; ti-ndk \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmcsd-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pm-lld-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append_am57xx-evm =3D &quot; gpio-lld-rtos \<br>
&gt; +DEPENDS:append_am57xx-evm =3D &quot; gpio-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 icss-emac-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pruss-lld-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append_ti33x =3D &quot; gpio-lld-rtos \<br>
&gt; +DEPENDS:append_ti33x =3D &quot; gpio-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0gpmc-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0icss-emac-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mmcsd-lld-rtos \<br>
&gt; @@ -42,7 +42,7 @@ DEPENDS_append_ti33x =3D &quot; gpio-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ti-ndk \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append_ti43x =3D &quot; gpio-lld-rtos \<br>
&gt; +DEPENDS:append_ti43x =3D &quot; gpio-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0gpmc-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0icss-emac-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mmcsd-lld-rtos \<br>
&gt; @@ -51,13 +51,13 @@ DEPENDS_append_ti43x =3D &quot; gpio-lld-rtos \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ti-ndk \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append_dra7xx =3D &quot; pm-lld-rtos \<br>
&gt; +DEPENDS:append_dra7xx =3D &quot; pm-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmcsd-lld-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -DEPENDS_append_am65xx =3D &quot; sciclient-rtos \<br>
&gt; +DEPENDS:append_am65xx =3D &quot; sciclient-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt; -DEPENDS_append_j7 =3D &quot; udma-lld-rtos \<br>
&gt; +DEPENDS:append_j7 =3D &quot; udma-lld-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sciclient-rtos \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mmcsd-lld-rtos \<br>
&gt;=C2=A0 &quot;<br>
&gt; @@ -71,6 +71,6 @@ INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt;=C2=A0 export PDK_BOARD_ROOT_PATH =3D&quot;${WORKDIR}/build&quot;<br>
&gt;=C2=A0 export DEST_ROOT=3D&quot;${S}&quot;<br>
&gt;=C2=A0 <br>
&gt; -XDCPATH_append =3D &quot;;${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_IN=
STALL_DIR}/packages&quot;<br>
&gt; +XDCPATH:append =3D &quot;;${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_IN=
STALL_DIR}/packages&quot;<br>
&gt;=C2=A0 <br>
&gt; -INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;arch&quot;<br>
&gt; diff --git a/recipes-bsp/boot-monitor/<a href=3D"http://boot-monitor_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">boot-monitor_git.bb</a> b/recip=
es-bsp/boot-monitor/<a href=3D"http://boot-monitor_git.bb" rel=3D"noreferre=
r" target=3D"_blank">boot-monitor_git.bb</a><br>
&gt; index 9c436d1c..dee180ff 100644<br>
&gt; --- a/recipes-bsp/boot-monitor/<a href=3D"http://boot-monitor_git.bb" =
rel=3D"noreferrer" target=3D"_blank">boot-monitor_git.bb</a><br>
&gt; +++ b/recipes-bsp/boot-monitor/<a href=3D"http://boot-monitor_git.bb" =
rel=3D"noreferrer" target=3D"_blank">boot-monitor_git.bb</a><br>
&gt; @@ -23,7 +23,7 @@ FLOATABI =3D &quot;${@bb.utils.contains(&quot;TUNE_F=
EATURES&quot;, &quot;vfp&quot;, bb.utils.contains(&quot;TUNE<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXTRA_OEMAKE =3D &quot;CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D&qu=
ot;${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}&quot; LD=3D&quot;${=
TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt; -FILES_${PN} =3D &quot;/boot&quot;<br>
&gt; +FILES:${PN} =3D &quot;/boot&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit deploy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/recipes-bsp/bt-fw/<a href=3D"http://bt-fw_git.bb" rel=3D"=
noreferrer" target=3D"_blank">bt-fw_git.bb</a> b/recipes-bsp/bt-fw/<a href=
=3D"http://bt-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">bt-fw_git.bb<=
/a><br>
&gt; index f3d740b1..ea42c168 100644<br>
&gt; --- a/recipes-bsp/bt-fw/<a href=3D"http://bt-fw_git.bb" rel=3D"norefer=
rer" target=3D"_blank">bt-fw_git.bb</a><br>
&gt; +++ b/recipes-bsp/bt-fw/<a href=3D"http://bt-fw_git.bb" rel=3D"norefer=
rer" target=3D"_blank">bt-fw_git.bb</a><br>
&gt; @@ -21,4 +21,4 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake &quot;DEST_DIR=3D${D}&quot; &quot;BASE_=
LIB_DIR=3D${base_libdir}&quot; install<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -FILES_${PN} +=3D &quot;${base_libdir}/firmware/ti-connectivity/*&quot=
;<br>
&gt; +FILES:${PN} +=3D &quot;${base_libdir}/firmware/ti-connectivity/*&quot=
;<br>
&gt; diff --git a/recipes-bsp/cadence-mhdp-fw/<a href=3D"http://cadence-mhd=
p-fw_git.bb" rel=3D"noreferrer" target=3D"_blank">cadence-mhdp-fw_git.bb</a=
> b/recipes-bsp/cadence-mhdp-fw/<a href=3D"http://cadence-mhdp-fw_git.bb" r=
el=3D"noreferrer" target=3D"_blank">cadence-mhdp-fw_git.bb</a><br>
&gt; index 6d857f7f..ccaa3e6d 100644<br>
&gt; --- a/recipes-bsp/cadence-mhdp-fw/<a href=3D"http://cadence-mhdp-fw_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">cadence-mhdp-fw_git.bb</a><br>
&gt; +++ b/recipes-bsp/cadence-mhdp-fw/<a href=3D"http://cadence-mhdp-fw_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">cadence-mhdp-fw_git.bb</a><br>
&gt; @@ -25,4 +25,4 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/cadence/${TARGET} ${D}$=
{base_libdir}/firmware/cadence/${TARGET}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -FILES_${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;${base_libdir}/firmware&quot;<br>
&gt; diff --git a/recipes-bsp/cal-lld/<a href=3D"http://cal-lld-rtos_git.bb=
" rel=3D"noreferrer" target=3D"_blank">cal-lld-rtos_git.bb</a> b/recipes-bs=
p/cal-lld/<a href=3D"http://cal-lld-rtos_git.bb" rel=3D"noreferrer" target=
=3D"_blank">cal-lld-rtos_git.bb</a><br>
&gt; index f3c780f6..aef21899 100644<br>
&gt; --- a/recipes-bsp/cal-lld/<a href=3D"http://cal-lld-rtos_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cal-lld-rtos_git.bb</a><br>
&gt; +++ b/recipes-bsp/</blockquote></div></div>

--000000000000dd31ce05c925c43f--
