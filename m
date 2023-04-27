Return-Path: <phil@sutherland.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65ABCC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:07:21 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.14578.1682579235278364836
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 00:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@sutherland.id.au header.s=google header.b=EkzH0Cr2;
 spf=pass (domain: sutherland.id.au, ip: 209.85.166.174, mailfrom: phil@sutherland.id.au)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-32effd5c0a8so3438385ab.1
        for <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sutherland.id.au; s=google; t=1682579234; x=1685171234;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlNn77u5OCMH6yvWYyWKFlV7bFyS7mvGtSyUZYzu+OI=;
        b=EkzH0Cr2CTDe8wBcQrfK6gWN+S9nALTp9J7QrVXx9K7+mSIZemhODhmaO7MtLfhG4w
         18mCLYOabyMYp4FCNcVKLzU+70RBjxsV/k2tLiriYtXalahxO/81Vjj3/isg2g4FfqZy
         1X78enopjzPuwdb6BDYCJ1R8g6y2onkFTw/T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682579234; x=1685171234;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlNn77u5OCMH6yvWYyWKFlV7bFyS7mvGtSyUZYzu+OI=;
        b=hBS39jMbMlKCSNExZ89WXD6eK8PqLTOdpyVKSU9++2GQ4jBlisK718v1AlhC/chiz1
         HRZORA+v2VHaXAvherFusa2J5c9PfrlNLR6C9BKg6ZXZPHvBLQ55Z5AZs3S+lBesGQKU
         NRwgLF1e0jmrzh7LIiwdrp0LZxVJk4EdczWBOMGG0jCYXZEG+ImaNDWzE1HCT3pVXbgQ
         Frd365n5XHm7I5LP1QkipCV0LCrQMZxPBx2Iw4jOgeQ1PTLUo89f8HAp674KMR5horPp
         0lrT8ksjvqe6SwESadoI5UgoqZGK5bPyEHMpQk6RZVE36/4qXxGi5s+uU9gYpgqyGYqC
         lzgg==
X-Gm-Message-State: AC+VfDxkH7h63PKoEFtpEThH4WBW9teCPf8+ypL8vsCAl3OrQsbUIweB
	pY8Mg5mhgdkbDkTCp1hbHbtfyMZXM3RTML91USBigI7Z8CJJZV8hMao=
X-Google-Smtp-Source: ACHHUZ44JelFuE4Ie38e7yHfrTDXtHwNAxLsvo7ggmhysUpZySwC6iFITYSj94NljQEs4pk27n9n2m4UBvx2929EIrM=
X-Received: by 2002:a05:6e02:4d2:b0:329:4331:1586 with SMTP id
 f18-20020a056e0204d200b0032943311586mr684127ils.28.1682579234120; Thu, 27 Apr
 2023 00:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230202034903.432697-1-raj.khem@gmail.com>
In-Reply-To: <20230202034903.432697-1-raj.khem@gmail.com>
From: Phil Sutherland <phil@sutherland.id.au>
Date: Thu, 27 Apr 2023 15:07:03 +0800
Message-ID: <CACpu_i6cS=Ns9m27DM7AYodqxYVEV61kMgzrgCzdOBpSma3J=w@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] linux-ti-staging: Fix build with gcc13
To: meta-ti@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008e7de405fa4c011e"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 07:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16439

--0000000000008e7de405fa4c011e
Content-Type: text/plain; charset="UTF-8"

I'm seeing a build failure (error below) when this patch is being applied
whilst building a 5.10 kernel for am33x on kirkstone. The issue seems to be
that the leading space on each unaltered patch line has been folded into
the following whitespace (tab or newline).
gnu patch is happy with the patch, but git is not.
Cheers
phil


| DEBUG: Executing shell function do_patch
| (1/20) 0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
| [INFO]: check of
.kernel-meta//patches//./0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
with "git am" did not pass, trying reduced context.
| [INFO]: Context reduced git-am of
.kernel-meta//patches//./0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
with "git am" did not work, trying "apply".
| error: corrupt patch at line 16
| [ERROR]: Application of
.kernel-meta//patches//./0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
failed.
|          Patch needs to be refreshed. Sample resolution script:
|              .git/rebase-apply/resolve_rejects
| ERROR: Could not apply patches for magpie.


On Thu, 2 Feb 2023 at 11:49, Khem Raj <raj.khem@gmail.com> wrote:

> Backport a patch from Linux mainline [1]
>
> Thanks Martin Jansa for figuring it out.
>
> [1] https://github.com/torvalds/linux/commit/f07788079f515
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...a-ahci-fix-enum-constants-for-gcc-13.patch | 351 ++++++++++++++++++
>  .../linux/linux-ti-staging_5.10.bb            |   1 +
>  2 files changed, 352 insertions(+)
>  create mode 100644
> meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
>
> diff --git
> a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> new file mode 100644
> index 00000000..a7bd9543
> --- /dev/null
> +++
> b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> @@ -0,0 +1,351 @@
> +From f07788079f515ca4a681c5f595bdad19cfbd7b1d Mon Sep 17 00:00:00 2001
> +From: Arnd Bergmann <arnd@arndb.de>
> +Date: Sat, 3 Dec 2022 11:54:25 +0100
> +Subject: [PATCH] ata: ahci: fix enum constants for gcc-13
> +
> +gcc-13 slightly changes the type of constant expressions that are defined
> +in an enum, which triggers a compile time sanity check in libata:
> +
> +linux/drivers/ata/libahci.c: In function 'ahci_led_store':
> +linux/include/linux/compiler_types.h:357:45: error: call to
> '__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON
> failed: sizeof(_s) > sizeof(long)
> +357 | _compiletime_assert(condition, msg, __compiletime_assert_,
> __COUNTER__)
> +
> +The new behavior is that sizeof() returns the same value for the
> +constant as it does for the enum type, which is generally more sensible
> +and consistent.
> +
> +The problem in libata is that it contains a single enum definition for
> +lots of unrelated constants, some of which are large positive (unsigned)
> +integers like 0xffffffff, while others like (1<<31) are interpreted as
> +negative integers, and this forces the enum type to become 64 bit wide
> +even though most constants would still fit into a signed 32-bit 'int'.
> +
> +Fix this by changing the entire enum definition to use BIT(x) in place
> +of (1<<x), which results in all values being seen as 'unsigned' and
> +fitting into an unsigned 32-bit type.
> +
> +Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107917
> +Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107405
> +Reported-by: Luis Machado <luis.machado@arm.com>
> +Cc: linux-ide@vger.kernel.org
> +Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> +Cc: stable@vger.kernel.org
> +Cc: Randy Dunlap <rdunlap@infradead.org>
> +Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> +Tested-by: Luis Machado <luis.machado@arm.com>
> +Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> +---
> + drivers/ata/ahci.h | 245 +++++++++++++++++++++++----------------------
> + 1 file changed, 123 insertions(+), 122 deletions(-)
> +
> +--- a/drivers/ata/ahci.h
> ++++ b/drivers/ata/ahci.h
> +@@ -24,6 +24,7 @@
> + #include <linux/libata.h>
> + #include <linux/phy/phy.h>
> + #include <linux/regulator/consumer.h>
> ++#include <linux/bits.h>
> +
> + /* Enclosure Management Control */
> + #define EM_CTRL_MSG_TYPE              0x000f0000
> +@@ -54,12 +55,12 @@ enum {
> +       AHCI_PORT_PRIV_FBS_DMA_SZ       = AHCI_CMD_SLOT_SZ +
> +                                         AHCI_CMD_TBL_AR_SZ +
> +                                         (AHCI_RX_FIS_SZ * 16),
> +-      AHCI_IRQ_ON_SG          = (1 << 31),
> +-      AHCI_CMD_ATAPI          = (1 << 5),
> +-      AHCI_CMD_WRITE          = (1 << 6),
> +-      AHCI_CMD_PREFETCH       = (1 << 7),
> +-      AHCI_CMD_RESET          = (1 << 8),
> +-      AHCI_CMD_CLR_BUSY       = (1 << 10),
> ++      AHCI_IRQ_ON_SG          = BIT(31),
> ++      AHCI_CMD_ATAPI          = BIT(5),
> ++      AHCI_CMD_WRITE          = BIT(6),
> ++      AHCI_CMD_PREFETCH       = BIT(7),
> ++      AHCI_CMD_RESET          = BIT(8),
> ++      AHCI_CMD_CLR_BUSY       = BIT(10),
> +
> +       RX_FIS_PIO_SETUP        = 0x20, /* offset of PIO Setup FIS data */
> +       RX_FIS_D2H_REG          = 0x40, /* offset of D2H Register FIS data
> */
> +@@ -77,37 +78,37 @@ enum {
> +       HOST_CAP2               = 0x24, /* host capabilities, extended */
> +
> +       /* HOST_CTL bits */
> +-      HOST_RESET              = (1 << 0),  /* reset controller;
> self-clear */
> +-      HOST_IRQ_EN             = (1 << 1),  /* global IRQ enable */
> +-      HOST_MRSM               = (1 << 2),  /* MSI Revert to Single
> Message */
> +-      HOST_AHCI_EN            = (1 << 31), /* AHCI enabled */
> ++      HOST_RESET              = BIT(0),  /* reset controller; self-clear
> */
> ++      HOST_IRQ_EN             = BIT(1),  /* global IRQ enable */
> ++      HOST_MRSM               = BIT(2),  /* MSI Revert to Single Message
> */
> ++      HOST_AHCI_EN            = BIT(31), /* AHCI enabled */
> +
> +       /* HOST_CAP bits */
> +-      HOST_CAP_SXS            = (1 << 5),  /* Supports External SATA */
> +-      HOST_CAP_EMS            = (1 << 6),  /* Enclosure Management
> support */
> +-      HOST_CAP_CCC            = (1 << 7),  /* Command Completion
> Coalescing */
> +-      HOST_CAP_PART           = (1 << 13), /* Partial state capable */
> +-      HOST_CAP_SSC            = (1 << 14), /* Slumber state capable */
> +-      HOST_CAP_PIO_MULTI      = (1 << 15), /* PIO multiple DRQ support */
> +-      HOST_CAP_FBS            = (1 << 16), /* FIS-based switching
> support */
> +-      HOST_CAP_PMP            = (1 << 17), /* Port Multiplier support */
> +-      HOST_CAP_ONLY           = (1 << 18), /* Supports AHCI mode only */
> +-      HOST_CAP_CLO            = (1 << 24), /* Command List Override
> support */
> +-      HOST_CAP_LED            = (1 << 25), /* Supports activity LED */
> +-      HOST_CAP_ALPM           = (1 << 26), /* Aggressive Link PM support
> */
> +-      HOST_CAP_SSS            = (1 << 27), /* Staggered Spin-up */
> +-      HOST_CAP_MPS            = (1 << 28), /* Mechanical presence switch
> */
> +-      HOST_CAP_SNTF           = (1 << 29), /* SNotification register */
> +-      HOST_CAP_NCQ            = (1 << 30), /* Native Command Queueing */
> +-      HOST_CAP_64             = (1 << 31), /* PCI DAC (64-bit DMA)
> support */
> ++      HOST_CAP_SXS            = BIT(5),  /* Supports External SATA */
> ++      HOST_CAP_EMS            = BIT(6),  /* Enclosure Management support
> */
> ++      HOST_CAP_CCC            = BIT(7),  /* Command Completion
> Coalescing */
> ++      HOST_CAP_PART           = BIT(13), /* Partial state capable */
> ++      HOST_CAP_SSC            = BIT(14), /* Slumber state capable */
> ++      HOST_CAP_PIO_MULTI      = BIT(15), /* PIO multiple DRQ support */
> ++      HOST_CAP_FBS            = BIT(16), /* FIS-based switching support
> */
> ++      HOST_CAP_PMP            = BIT(17), /* Port Multiplier support */
> ++      HOST_CAP_ONLY           = BIT(18), /* Supports AHCI mode only */
> ++      HOST_CAP_CLO            = BIT(24), /* Command List Override
> support */
> ++      HOST_CAP_LED            = BIT(25), /* Supports activity LED */
> ++      HOST_CAP_ALPM           = BIT(26), /* Aggressive Link PM support */
> ++      HOST_CAP_SSS            = BIT(27), /* Staggered Spin-up */
> ++      HOST_CAP_MPS            = BIT(28), /* Mechanical presence switch */
> ++      HOST_CAP_SNTF           = BIT(29), /* SNotification register */
> ++      HOST_CAP_NCQ            = BIT(30), /* Native Command Queueing */
> ++      HOST_CAP_64             = BIT(31), /* PCI DAC (64-bit DMA) support
> */
> +
> +       /* HOST_CAP2 bits */
> +-      HOST_CAP2_BOH           = (1 << 0),  /* BIOS/OS handoff supported
> */
> +-      HOST_CAP2_NVMHCI        = (1 << 1),  /* NVMHCI supported */
> +-      HOST_CAP2_APST          = (1 << 2),  /* Automatic partial to
> slumber */
> +-      HOST_CAP2_SDS           = (1 << 3),  /* Support device sleep */
> +-      HOST_CAP2_SADM          = (1 << 4),  /* Support aggressive DevSlp
> */
> +-      HOST_CAP2_DESO          = (1 << 5),  /* DevSlp from slumber only */
> ++      HOST_CAP2_BOH           = BIT(0),  /* BIOS/OS handoff supported */
> ++      HOST_CAP2_NVMHCI        = BIT(1),  /* NVMHCI supported */
> ++      HOST_CAP2_APST          = BIT(2),  /* Automatic partial to slumber
> */
> ++      HOST_CAP2_SDS           = BIT(3),  /* Support device sleep */
> ++      HOST_CAP2_SADM          = BIT(4),  /* Support aggressive DevSlp */
> ++      HOST_CAP2_DESO          = BIT(5),  /* DevSlp from slumber only */
> +
> +       /* registers for each SATA port */
> +       PORT_LST_ADDR           = 0x00, /* command list DMA addr */
> +@@ -129,24 +130,24 @@ enum {
> +       PORT_DEVSLP             = 0x44, /* device sleep */
> +
> +       /* PORT_IRQ_{STAT,MASK} bits */
> +-      PORT_IRQ_COLD_PRES      = (1 << 31), /* cold presence detect */
> +-      PORT_IRQ_TF_ERR         = (1 << 30), /* task file error */
> +-      PORT_IRQ_HBUS_ERR       = (1 << 29), /* host bus fatal error */
> +-      PORT_IRQ_HBUS_DATA_ERR  = (1 << 28), /* host bus data error */
> +-      PORT_IRQ_IF_ERR         = (1 << 27), /* interface fatal error */
> +-      PORT_IRQ_IF_NONFATAL    = (1 << 26), /* interface non-fatal error
> */
> +-      PORT_IRQ_OVERFLOW       = (1 << 24), /* xfer exhausted available
> S/G */
> +-      PORT_IRQ_BAD_PMP        = (1 << 23), /* incorrect port multiplier
> */
> +-
> +-      PORT_IRQ_PHYRDY         = (1 << 22), /* PhyRdy changed */
> +-      PORT_IRQ_DEV_ILCK       = (1 << 7), /* device interlock */
> +-      PORT_IRQ_CONNECT        = (1 << 6), /* port connect change status
> */
> +-      PORT_IRQ_SG_DONE        = (1 << 5), /* descriptor processed */
> +-      PORT_IRQ_UNK_FIS        = (1 << 4), /* unknown FIS rx'd */
> +-      PORT_IRQ_SDB_FIS        = (1 << 3), /* Set Device Bits FIS rx'd */
> +-      PORT_IRQ_DMAS_FIS       = (1 << 2), /* DMA Setup FIS rx'd */
> +-      PORT_IRQ_PIOS_FIS       = (1 << 1), /* PIO Setup FIS rx'd */
> +-      PORT_IRQ_D2H_REG_FIS    = (1 << 0), /* D2H Register FIS rx'd */
> ++      PORT_IRQ_COLD_PRES      = BIT(31), /* cold presence detect */
> ++      PORT_IRQ_TF_ERR         = BIT(30), /* task file error */
> ++      PORT_IRQ_HBUS_ERR       = BIT(29), /* host bus fatal error */
> ++      PORT_IRQ_HBUS_DATA_ERR  = BIT(28), /* host bus data error */
> ++      PORT_IRQ_IF_ERR         = BIT(27), /* interface fatal error */
> ++      PORT_IRQ_IF_NONFATAL    = BIT(26), /* interface non-fatal error */
> ++      PORT_IRQ_OVERFLOW       = BIT(24), /* xfer exhausted available S/G
> */
> ++      PORT_IRQ_BAD_PMP        = BIT(23), /* incorrect port multiplier */
> ++
> ++      PORT_IRQ_PHYRDY         = BIT(22), /* PhyRdy changed */
> ++      PORT_IRQ_DEV_ILCK       = BIT(7), /* device interlock */
> ++      PORT_IRQ_CONNECT        = BIT(6), /* port connect change status */
> ++      PORT_IRQ_SG_DONE        = BIT(5), /* descriptor processed */
> ++      PORT_IRQ_UNK_FIS        = BIT(4), /* unknown FIS rx'd */
> ++      PORT_IRQ_SDB_FIS        = BIT(3), /* Set Device Bits FIS rx'd */
> ++      PORT_IRQ_DMAS_FIS       = BIT(2), /* DMA Setup FIS rx'd */
> ++      PORT_IRQ_PIOS_FIS       = BIT(1), /* PIO Setup FIS rx'd */
> ++      PORT_IRQ_D2H_REG_FIS    = BIT(0), /* D2H Register FIS rx'd */
> +
> +       PORT_IRQ_FREEZE         = PORT_IRQ_HBUS_ERR |
> +                                 PORT_IRQ_IF_ERR |
> +@@ -162,34 +163,34 @@ enum {
> +                                 PORT_IRQ_PIOS_FIS | PORT_IRQ_D2H_REG_FIS,
> +
> +       /* PORT_CMD bits */
> +-      PORT_CMD_ASP            = (1 << 27), /* Aggressive Slumber/Partial
> */
> +-      PORT_CMD_ALPE           = (1 << 26), /* Aggressive Link PM enable
> */
> +-      PORT_CMD_ATAPI          = (1 << 24), /* Device is ATAPI */
> +-      PORT_CMD_FBSCP          = (1 << 22), /* FBS Capable Port */
> +-      PORT_CMD_ESP            = (1 << 21), /* External Sata Port */
> +-      PORT_CMD_HPCP           = (1 << 18), /* HotPlug Capable Port */
> +-      PORT_CMD_PMP            = (1 << 17), /* PMP attached */
> +-      PORT_CMD_LIST_ON        = (1 << 15), /* cmd list DMA engine
> running */
> +-      PORT_CMD_FIS_ON         = (1 << 14), /* FIS DMA engine running */
> +-      PORT_CMD_FIS_RX         = (1 << 4), /* Enable FIS receive DMA
> engine */
> +-      PORT_CMD_CLO            = (1 << 3), /* Command list override */
> +-      PORT_CMD_POWER_ON       = (1 << 2), /* Power up device */
> +-      PORT_CMD_SPIN_UP        = (1 << 1), /* Spin up device */
> +-      PORT_CMD_START          = (1 << 0), /* Enable port DMA engine */
> +-
> +-      PORT_CMD_ICC_MASK       = (0xf << 28), /* i/f ICC state mask */
> +-      PORT_CMD_ICC_ACTIVE     = (0x1 << 28), /* Put i/f in active state
> */
> +-      PORT_CMD_ICC_PARTIAL    = (0x2 << 28), /* Put i/f in partial state
> */
> +-      PORT_CMD_ICC_SLUMBER    = (0x6 << 28), /* Put i/f in slumber state
> */
> ++      PORT_CMD_ASP            = BIT(27), /* Aggressive Slumber/Partial */
> ++      PORT_CMD_ALPE           = BIT(26), /* Aggressive Link PM enable */
> ++      PORT_CMD_ATAPI          = BIT(24), /* Device is ATAPI */
> ++      PORT_CMD_FBSCP          = BIT(22), /* FBS Capable Port */
> ++      PORT_CMD_ESP            = BIT(21), /* External Sata Port */
> ++      PORT_CMD_HPCP           = BIT(18), /* HotPlug Capable Port */
> ++      PORT_CMD_PMP            = BIT(17), /* PMP attached */
> ++      PORT_CMD_LIST_ON        = BIT(15), /* cmd list DMA engine running
> */
> ++      PORT_CMD_FIS_ON         = BIT(14), /* FIS DMA engine running */
> ++      PORT_CMD_FIS_RX         = BIT(4), /* Enable FIS receive DMA engine
> */
> ++      PORT_CMD_CLO            = BIT(3), /* Command list override */
> ++      PORT_CMD_POWER_ON       = BIT(2), /* Power up device */
> ++      PORT_CMD_SPIN_UP        = BIT(1), /* Spin up device */
> ++      PORT_CMD_START          = BIT(0), /* Enable port DMA engine */
> ++
> ++      PORT_CMD_ICC_MASK       = (0xfu << 28), /* i/f ICC state mask */
> ++      PORT_CMD_ICC_ACTIVE     = (0x1u << 28), /* Put i/f in active state
> */
> ++      PORT_CMD_ICC_PARTIAL    = (0x2u << 28), /* Put i/f in partial
> state */
> ++      PORT_CMD_ICC_SLUMBER    = (0x6u << 28), /* Put i/f in slumber
> state */
> +
> +       /* PORT_FBS bits */
> +       PORT_FBS_DWE_OFFSET     = 16, /* FBS device with error offset */
> +       PORT_FBS_ADO_OFFSET     = 12, /* FBS active dev optimization
> offset */
> +       PORT_FBS_DEV_OFFSET     = 8,  /* FBS device to issue offset */
> +       PORT_FBS_DEV_MASK       = (0xf << PORT_FBS_DEV_OFFSET),  /*
> FBS.DEV */
> +-      PORT_FBS_SDE            = (1 << 2), /* FBS single device error */
> +-      PORT_FBS_DEC            = (1 << 1), /* FBS device error clear */
> +-      PORT_FBS_EN             = (1 << 0), /* Enable FBS */
> ++      PORT_FBS_SDE            = BIT(2), /* FBS single device error */
> ++      PORT_FBS_DEC            = BIT(1), /* FBS device error clear */
> ++      PORT_FBS_EN             = BIT(0), /* Enable FBS */
> +
> +       /* PORT_DEVSLP bits */
> +       PORT_DEVSLP_DM_OFFSET   = 25,             /* DITO multiplier
> offset */
> +@@ -197,52 +198,52 @@ enum {
> +       PORT_DEVSLP_DITO_OFFSET = 15,             /* DITO offset */
> +       PORT_DEVSLP_MDAT_OFFSET = 10,             /* Minimum assertion
> time */
> +       PORT_DEVSLP_DETO_OFFSET = 2,              /* DevSlp exit timeout */
> +-      PORT_DEVSLP_DSP         = (1 << 1),       /* DevSlp present */
> +-      PORT_DEVSLP_ADSE        = (1 << 0),       /* Aggressive DevSlp
> enable */
> ++      PORT_DEVSLP_DSP         = BIT(1),       /* DevSlp present */
> ++      PORT_DEVSLP_ADSE        = BIT(0),       /* Aggressive DevSlp
> enable */
> +
> +       /* hpriv->flags bits */
> +
> + #define AHCI_HFLAGS(flags)            .private_data   = (void *)(flags)
> +
> +-      AHCI_HFLAG_NO_NCQ               = (1 << 0),
> +-      AHCI_HFLAG_IGN_IRQ_IF_ERR       = (1 << 1), /* ignore IRQ_IF_ERR */
> +-      AHCI_HFLAG_IGN_SERR_INTERNAL    = (1 << 2), /* ignore
> SERR_INTERNAL */
> +-      AHCI_HFLAG_32BIT_ONLY           = (1 << 3), /* force 32bit */
> +-      AHCI_HFLAG_MV_PATA              = (1 << 4), /* PATA port */
> +-      AHCI_HFLAG_NO_MSI               = (1 << 5), /* no PCI MSI */
> +-      AHCI_HFLAG_NO_PMP               = (1 << 6), /* no PMP */
> +-      AHCI_HFLAG_SECT255              = (1 << 8), /* max 255 sectors */
> +-      AHCI_HFLAG_YES_NCQ              = (1 << 9), /* force NCQ cap on */
> +-      AHCI_HFLAG_NO_SUSPEND           = (1 << 10), /* don't suspend */
> +-      AHCI_HFLAG_SRST_TOUT_IS_OFFLINE = (1 << 11), /* treat SRST timeout
> as
> ++      AHCI_HFLAG_NO_NCQ               = BIT(0),
> ++      AHCI_HFLAG_IGN_IRQ_IF_ERR       = BIT(1), /* ignore IRQ_IF_ERR */
> ++      AHCI_HFLAG_IGN_SERR_INTERNAL    = BIT(2), /* ignore SERR_INTERNAL
> */
> ++      AHCI_HFLAG_32BIT_ONLY           = BIT(3), /* force 32bit */
> ++      AHCI_HFLAG_MV_PATA              = BIT(4), /* PATA port */
> ++      AHCI_HFLAG_NO_MSI               = BIT(5), /* no PCI MSI */
> ++      AHCI_HFLAG_NO_PMP               = BIT(6), /* no PMP */
> ++      AHCI_HFLAG_SECT255              = BIT(8), /* max 255 sectors */
> ++      AHCI_HFLAG_YES_NCQ              = BIT(9), /* force NCQ cap on */
> ++      AHCI_HFLAG_NO_SUSPEND           = BIT(10), /* don't suspend */
> ++      AHCI_HFLAG_SRST_TOUT_IS_OFFLINE = BIT(11), /* treat SRST timeout as
> +                                                       link offline */
> +-      AHCI_HFLAG_NO_SNTF              = (1 << 12), /* no sntf */
> +-      AHCI_HFLAG_NO_FPDMA_AA          = (1 << 13), /* no FPDMA AA */
> +-      AHCI_HFLAG_YES_FBS              = (1 << 14), /* force FBS cap on */
> +-      AHCI_HFLAG_DELAY_ENGINE         = (1 << 15), /* do not start
> engine on
> ++      AHCI_HFLAG_NO_SNTF              = BIT(12), /* no sntf */
> ++      AHCI_HFLAG_NO_FPDMA_AA          = BIT(13), /* no FPDMA AA */
> ++      AHCI_HFLAG_YES_FBS              = BIT(14), /* force FBS cap on */
> ++      AHCI_HFLAG_DELAY_ENGINE         = BIT(15), /* do not start engine
> on
> +                                                       port start (wait
> until
> +                                                       error-handling
> stage) */
> +-      AHCI_HFLAG_NO_DEVSLP            = (1 << 17), /* no device sleep */
> +-      AHCI_HFLAG_NO_FBS               = (1 << 18), /* no FBS */
> ++      AHCI_HFLAG_NO_DEVSLP            = BIT(17), /* no device sleep */
> ++      AHCI_HFLAG_NO_FBS               = BIT(18), /* no FBS */
> +
> + #ifdef CONFIG_PCI_MSI
> +-      AHCI_HFLAG_MULTI_MSI            = (1 << 20), /* per-port MSI(-X) */
> ++      AHCI_HFLAG_MULTI_MSI            = BIT(20), /* per-port MSI(-X) */
> + #else
> +       /* compile out MSI infrastructure */
> +       AHCI_HFLAG_MULTI_MSI            = 0,
> + #endif
> +-      AHCI_HFLAG_WAKE_BEFORE_STOP     = (1 << 22), /* wake before DMA
> stop */
> +-      AHCI_HFLAG_YES_ALPM             = (1 << 23), /* force ALPM cap on
> */
> +-      AHCI_HFLAG_NO_WRITE_TO_RO       = (1 << 24), /* don't write to read
> ++      AHCI_HFLAG_WAKE_BEFORE_STOP     = BIT(22), /* wake before DMA stop
> */
> ++      AHCI_HFLAG_YES_ALPM             = BIT(23), /* force ALPM cap on */
> ++      AHCI_HFLAG_NO_WRITE_TO_RO       = BIT(24), /* don't write to read
> +                                                       only registers */
> +-      AHCI_HFLAG_IS_MOBILE            = (1 << 25), /* mobile chipset, use
> ++      AHCI_HFLAG_IS_MOBILE            = BIT(25), /* mobile chipset, use
> +
>  SATA_MOBILE_LPM_POLICY
> +                                                       as default
> lpm_policy */
> +-      AHCI_HFLAG_SUSPEND_PHYS         = (1 << 26), /* handle PHYs during
> ++      AHCI_HFLAG_SUSPEND_PHYS         = BIT(26), /* handle PHYs during
> +                                                       suspend/resume */
> +-      AHCI_HFLAG_IGN_NOTSUPP_POWER_ON = (1 << 27), /* ignore -EOPNOTSUPP
> ++      AHCI_HFLAG_IGN_NOTSUPP_POWER_ON = BIT(27), /* ignore -EOPNOTSUPP
> +                                                       from
> phy_power_on() */
> +-      AHCI_HFLAG_NO_SXS               = (1 << 28), /* SXS not supported
> */
> ++      AHCI_HFLAG_NO_SXS               = BIT(28), /* SXS not supported */
> +
> +       /* ap->flags bits */
> +
> +@@ -258,22 +259,22 @@ enum {
> +       EM_MAX_RETRY                    = 5,
> +
> +       /* em_ctl bits */
> +-      EM_CTL_RST              = (1 << 9), /* Reset */
> +-      EM_CTL_TM               = (1 << 8), /* Transmit Message */
> +-      EM_CTL_MR               = (1 << 0), /* Message Received */
> +-      EM_CTL_ALHD             = (1 << 26), /* Activity LED */
> +-      EM_CTL_XMT              = (1 << 25), /* Transmit Only */
> +-      EM_CTL_SMB              = (1 << 24), /* Single Message Buffer */
> +-      EM_CTL_SGPIO            = (1 << 19), /* SGPIO messages supported */
> +-      EM_CTL_SES              = (1 << 18), /* SES-2 messages supported */
> +-      EM_CTL_SAFTE            = (1 << 17), /* SAF-TE messages supported
> */
> +-      EM_CTL_LED              = (1 << 16), /* LED messages supported */
> ++      EM_CTL_RST              = BIT(9), /* Reset */
> ++      EM_CTL_TM               = BIT(8), /* Transmit Message */
> ++      EM_CTL_MR               = BIT(0), /* Message Received */
> ++      EM_CTL_ALHD             = BIT(26), /* Activity LED */
> ++      EM_CTL_XMT              = BIT(25), /* Transmit Only */
> ++      EM_CTL_SMB              = BIT(24), /* Single Message Buffer */
> ++      EM_CTL_SGPIO            = BIT(19), /* SGPIO messages supported */
> ++      EM_CTL_SES              = BIT(18), /* SES-2 messages supported */
> ++      EM_CTL_SAFTE            = BIT(17), /* SAF-TE messages supported */
> ++      EM_CTL_LED              = BIT(16), /* LED messages supported */
> +
> +       /* em message type */
> +-      EM_MSG_TYPE_LED         = (1 << 0), /* LED */
> +-      EM_MSG_TYPE_SAFTE       = (1 << 1), /* SAF-TE */
> +-      EM_MSG_TYPE_SES2        = (1 << 2), /* SES-2 */
> +-      EM_MSG_TYPE_SGPIO       = (1 << 3), /* SGPIO */
> ++      EM_MSG_TYPE_LED         = BIT(0), /* LED */
> ++      EM_MSG_TYPE_SAFTE       = BIT(1), /* SAF-TE */
> ++      EM_MSG_TYPE_SES2        = BIT(2), /* SES-2 */
> ++      EM_MSG_TYPE_SGPIO       = BIT(3), /* SGPIO */
> + };
> +
> + struct ahci_cmd_hdr {
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 4c23a28c..6e600d16 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -34,6 +34,7 @@ KERNEL_GIT_URI = "git://
> git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "https"
>  SRC_URI +=
> "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>
>  file://init_disassemble_info-signature-changes-causes-compile-failures.patch
> \
> +            file://0001-ata-ahci-fix-enum-constants-for-gcc-13.patch \
>              file://defconfig"
>
>  FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15719):
> https://lists.yoctoproject.org/g/meta-ti/message/15719
> Mute This Topic: https://lists.yoctoproject.org/mt/96693848/189126
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> phil@sutherland.id.au]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008e7de405fa4c011e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m seeing a build failure (error below) when this pat=
ch is being applied whilst building a 5.10 kernel for am33x on kirkstone. T=
he issue seems to be that the leading space on each unaltered patch line=C2=
=A0has been folded into the following whitespace (tab or newline).=C2=A0<di=
v>gnu patch is happy with the patch, but git is not.=C2=A0<br><div>Cheers</=
div><div>phil</div><div><br><div><br><font face=3D"monospace">| DEBUG: Exec=
uting shell function do_patch<br>| (1/20) 0001-ata-ahci-fix-enum-constants-=
for-gcc-13.patch<br>| [INFO]: check of .kernel-meta//patches//./0001-ata-ah=
ci-fix-enum-constants-for-gcc-13.patch with &quot;git am&quot; did not pass=
, trying reduced context.<br>| [INFO]: Context reduced git-am of .kernel-me=
ta//patches//./0001-ata-ahci-fix-enum-constants-for-gcc-13.patch with &quot=
;git am&quot; did not work, trying &quot;apply&quot;.<br>| error: corrupt p=
atch at line 16<br>| [ERROR]: Application of .kernel-meta//patches//./0001-=
ata-ahci-fix-enum-constants-for-gcc-13.patch failed.<br>| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Patch needs to be refreshed. Sample resolution script:<br>=
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.git/rebase-apply/resolve=
_rejects<br>| ERROR: Could not apply patches for magpie</font>.<br></div></=
div></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 2 Feb 2023 at 11:49, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Backport a patch from Linux mainline=
 [1]<br>
<br>
Thanks Martin Jansa for figuring it out.<br>
<br>
[1] <a href=3D"https://github.com/torvalds/linux/commit/f07788079f515" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/torvalds/linux/commit/=
f07788079f515</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...a-ahci-fix-enum-constants-for-gcc-13.patch | 351 +++++++++++++++++=
+<br>
=C2=A0.../linux/<a href=3D"http://linux-ti-staging_5.10.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-ti-staging_5.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 352 insertions(+)<br>
=C2=A0create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ah=
ci-fix-enum-constants-for-gcc-13.patch<br>
<br>
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-=
constants-for-gcc-13.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-at=
a-ahci-fix-enum-constants-for-gcc-13.patch<br>
new file mode 100644<br>
index 00000000..a7bd9543<br>
--- /dev/null<br>
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constan=
ts-for-gcc-13.patch<br>
@@ -0,0 +1,351 @@<br>
+From f07788079f515ca4a681c5f595bdad19cfbd7b1d Mon Sep 17 00:00:00 2001<br>
+From: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_blank"=
>arnd@arndb.de</a>&gt;<br>
+Date: Sat, 3 Dec 2022 11:54:25 +0100<br>
+Subject: [PATCH] ata: ahci: fix enum constants for gcc-13<br>
+<br>
+gcc-13 slightly changes the type of constant expressions that are defined<=
br>
+in an enum, which triggers a compile time sanity check in libata:<br>
+<br>
+linux/drivers/ata/libahci.c: In function &#39;ahci_led_store&#39;:<br>
+linux/include/linux/compiler_types.h:357:45: error: call to &#39;__compile=
time_assert_302&#39; declared with attribute error: BUILD_BUG_ON failed: si=
zeof(_s) &gt; sizeof(long)<br>
+357 | _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER=
__)<br>
+<br>
+The new behavior is that sizeof() returns the same value for the<br>
+constant as it does for the enum type, which is generally more sensible<br=
>
+and consistent.<br>
+<br>
+The problem in libata is that it contains a single enum definition for<br>
+lots of unrelated constants, some of which are large positive (unsigned)<b=
r>
+integers like 0xffffffff, while others like (1&lt;&lt;31) are interpreted =
as<br>
+negative integers, and this forces the enum type to become 64 bit wide<br>
+even though most constants would still fit into a signed 32-bit &#39;int&#=
39;.<br>
+<br>
+Fix this by changing the entire enum definition to use BIT(x) in place<br>
+of (1&lt;&lt;x), which results in all values being seen as &#39;unsigned&#=
39; and<br>
+fitting into an unsigned 32-bit type.<br>
+<br>
+Link: <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107917" re=
l=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cg=
i?id=3D107917</a><br>
+Link: <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107405" re=
l=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cg=
i?id=3D107405</a><br>
+Reported-by: Luis Machado &lt;<a href=3D"mailto:luis.machado@arm.com" targ=
et=3D"_blank">luis.machado@arm.com</a>&gt;<br>
+Cc: <a href=3D"mailto:linux-ide@vger.kernel.org" target=3D"_blank">linux-i=
de@vger.kernel.org</a><br>
+Cc: Damien Le Moal &lt;<a href=3D"mailto:damien.lemoal@opensource.wdc.com"=
 target=3D"_blank">damien.lemoal@opensource.wdc.com</a>&gt;<br>
+Cc: <a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable@vge=
r.kernel.org</a><br>
+Cc: Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org" target=3D"_b=
lank">rdunlap@infradead.org</a>&gt;<br>
+Signed-off-by: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" target=
=3D"_blank">arnd@arndb.de</a>&gt;<br>
+Tested-by: Luis Machado &lt;<a href=3D"mailto:luis.machado@arm.com" target=
=3D"_blank">luis.machado@arm.com</a>&gt;<br>
+Signed-off-by: Damien Le Moal &lt;<a href=3D"mailto:damien.lemoal@opensour=
ce.wdc.com" target=3D"_blank">damien.lemoal@opensource.wdc.com</a>&gt;<br>
+---<br>
+ drivers/ata/ahci.h | 245 +++++++++++++++++++++++----------------------<br=
>
+ 1 file changed, 123 insertions(+), 122 deletions(-)<br>
+<br>
+--- a/drivers/ata/ahci.h<br>
++++ b/drivers/ata/ahci.h<br>
+@@ -24,6 +24,7 @@<br>
+ #include &lt;linux/libata.h&gt;<br>
+ #include &lt;linux/phy/phy.h&gt;<br>
+ #include &lt;linux/regulator/consumer.h&gt;<br>
++#include &lt;linux/bits.h&gt;<br>
+ <br>
+ /* Enclosure Management Control */<br>
+ #define EM_CTRL_MSG_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x000f0000<br>
+@@ -54,12 +55,12 @@ enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AHCI_PORT_PRIV_FBS_DMA_SZ=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D AHCI_CMD_SLOT_SZ +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AH=
CI_CMD_TBL_AR_SZ +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(A=
HCI_RX_FIS_SZ * 16),<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_IRQ_ON_SG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 31),<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_ATAPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 5),<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 6),<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_PREFETCH=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 7),<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 8),<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_CLR_BUSY=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 10),<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_IRQ_ON_SG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(31),<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_ATAPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(5),<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(6),<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_PREFETCH=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
7),<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(8),<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_CMD_CLR_BUSY=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
10),<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0RX_FIS_PIO_SETUP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 0x20, /* offset of PIO Setup FIS data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0RX_FIS_D2H_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 0x40, /* offset of D2H Register FIS data */<br>
+@@ -77,37 +78,37 @@ enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HOST_CAP2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0x24, /* host capabilities, extended */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* HOST_CTL bits */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D (1 &lt;&lt; 0),=C2=A0 /* reset controller; self-clear */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_IRQ_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D (1 &lt;&lt; 1),=C2=A0 /* global IRQ enable */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_MRSM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D (1 &lt;&lt; 2),=C2=A0 /* MSI Revert to Single Message */<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 HOST_AHCI_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 31), /* AHCI enabled */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D BIT(0),=C2=A0 /* reset controller; self-clear */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_IRQ_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D BIT(1),=C2=A0 /* global IRQ enable */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_MRSM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D BIT(2),=C2=A0 /* MSI Revert to Single Message */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_AHCI_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(31), /* AHCI enabled */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* HOST_CAP bits */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SXS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 5),=C2=A0 /* Supports External SATA */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_EMS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 6),=C2=A0 /* Enclosure Management support */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_CCC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 7),=C2=A0 /* Command Completion Coalescing */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_PART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 13), /* Partial state capable */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 14), /* Slumber state capable */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_PIO_MULTI=C2=A0 =C2=A0 =C2=A0 =3D (1 &lt;&l=
t; 15), /* PIO multiple DRQ support */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_FBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 16), /* FIS-based switching support */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 17), /* Port Multiplier support */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_ONLY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 18), /* Supports AHCI mode only */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_CLO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 24), /* Command List Override support */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_LED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 25), /* Supports activity LED */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_ALPM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 26), /* Aggressive Link PM support */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SSS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 27), /* Staggered Spin-up */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_MPS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 28), /* Mechanical presence switch */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SNTF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 29), /* SNotification register */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_NCQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 30), /* Native Command Queueing */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP_64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D (1 &lt;&lt; 31), /* PCI DAC (64-bit DMA) support */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SXS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(5),=C2=A0 /* Supports External SATA */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_EMS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(6),=C2=A0 /* Enclosure Management support */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_CCC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(7),=C2=A0 /* Command Completion Coalescing */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_PART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(13), /* Partial state capable */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(14), /* Slumber state capable */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_PIO_MULTI=C2=A0 =C2=A0 =C2=A0 =3D BIT(15), =
/* PIO multiple DRQ support */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_FBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(16), /* FIS-based switching support */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(17), /* Port Multiplier support */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_ONLY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(18), /* Supports AHCI mode only */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_CLO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(24), /* Command List Override support */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_LED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(25), /* Supports activity LED */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_ALPM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(26), /* Aggressive Link PM support */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SSS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(27), /* Staggered Spin-up */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_MPS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(28), /* Mechanical presence switch */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_SNTF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(29), /* SNotification register */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_NCQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(30), /* Native Command Queueing */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP_64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D BIT(31), /* PCI DAC (64-bit DMA) support */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* HOST_CAP2 bits */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_BOH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 0),=C2=A0 /* BIOS/OS handoff supported */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_NVMHCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 1),=C2=A0 /* NVMHCI supported */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_APST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 2),=C2=A0 /* Automatic partial to slumber */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_SDS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 3),=C2=A0 /* Support device sleep */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_SADM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 4),=C2=A0 /* Support aggressive DevSlp */<br>
+-=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_DESO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 5),=C2=A0 /* DevSlp from slumber only */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_BOH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(0),=C2=A0 /* BIOS/OS handoff supported */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_NVMHCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
1),=C2=A0 /* NVMHCI supported */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_APST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(2),=C2=A0 /* Automatic partial to slumber */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_SDS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(3),=C2=A0 /* Support device sleep */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_SADM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(4),=C2=A0 /* Support aggressive DevSlp */<br>
++=C2=A0 =C2=A0 =C2=A0 HOST_CAP2_DESO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(5),=C2=A0 /* DevSlp from slumber only */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* registers for each SATA port */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_LST_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 0x00, /* command list DMA addr */<br>
+@@ -129,24 +130,24 @@ enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_DEVSLP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0x44, /* device sleep */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PORT_IRQ_{STAT,MASK} bits */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_COLD_PRES=C2=A0 =C2=A0 =C2=A0 =3D (1 &lt;&l=
t; 31), /* cold presence detect */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_TF_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (1 &lt;&lt; 30), /* task file error */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_HBUS_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 29), /* host bus fatal error */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_HBUS_DATA_ERR=C2=A0 =3D (1 &lt;&lt; 28), /*=
 host bus data error */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_IF_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (1 &lt;&lt; 27), /* interface fatal error */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_IF_NONFATAL=C2=A0 =C2=A0 =3D (1 &lt;&lt; 26=
), /* interface non-fatal error */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_OVERFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 24), /* xfer exhausted available S/G */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_BAD_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 23), /* incorrect port multiplier */<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_PHYRDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (1 &lt;&lt; 22), /* PhyRdy changed */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_DEV_ILCK=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 7), /* device interlock */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_CONNECT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 6), /* port connect change status */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_SG_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 5), /* descriptor processed */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_UNK_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 4), /* unknown FIS rx&#39;d */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_SDB_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 3), /* Set Device Bits FIS rx&#39;d */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_DMAS_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 2), /* DMA Setup FIS rx&#39;d */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_PIOS_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 1), /* PIO Setup FIS rx&#39;d */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_D2H_REG_FIS=C2=A0 =C2=A0 =3D (1 &lt;&lt; 0)=
, /* D2H Register FIS rx&#39;d */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_COLD_PRES=C2=A0 =C2=A0 =C2=A0 =3D BIT(31), =
/* cold presence detect */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_TF_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 BIT(30), /* task file error */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_HBUS_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
29), /* host bus fatal error */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_HBUS_DATA_ERR=C2=A0 =3D BIT(28), /* host bu=
s data error */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_IF_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 BIT(27), /* interface fatal error */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_IF_NONFATAL=C2=A0 =C2=A0 =3D BIT(26), /* in=
terface non-fatal error */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_OVERFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
24), /* xfer exhausted available S/G */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_BAD_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
23), /* incorrect port multiplier */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_PHYRDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 BIT(22), /* PhyRdy changed */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_DEV_ILCK=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
7), /* device interlock */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_CONNECT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
6), /* port connect change status */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_SG_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
5), /* descriptor processed */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_UNK_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
4), /* unknown FIS rx&#39;d */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_SDB_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
3), /* Set Device Bits FIS rx&#39;d */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_DMAS_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
2), /* DMA Setup FIS rx&#39;d */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_PIOS_FIS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
1), /* PIO Setup FIS rx&#39;d */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_IRQ_D2H_REG_FIS=C2=A0 =C2=A0 =3D BIT(0), /* D2H=
 Register FIS rx&#39;d */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_IRQ_FREEZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D PORT_IRQ_HBUS_ERR |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_IRQ_IF_ERR |<br>
+@@ -162,34 +163,34 @@ enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_IRQ_PIOS_FIS | PORT_IRQ_D=
2H_REG_FIS,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PORT_CMD bits */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ASP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 27), /* Aggressive Slumber/Partial */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ALPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 26), /* Aggressive Link PM enable */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ATAPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 24), /* Device is ATAPI */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_FBSCP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 22), /* FBS Capable Port */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ESP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 21), /* External Sata Port */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_HPCP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D (1 &lt;&lt; 18), /* HotPlug Capable Port */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 17), /* PMP attached */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_LIST_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 15), /* cmd list DMA engine running */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_FIS_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (1 &lt;&lt; 14), /* FIS DMA engine running */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_FIS_RX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (1 &lt;&lt; 4), /* Enable FIS receive DMA engine */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_CLO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 3), /* Command list override */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_POWER_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 2), /* Power up device */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_SPIN_UP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 1), /* Spin up device */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 (1 &lt;&lt; 0), /* Enable port DMA engine */<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (0xf=
 &lt;&lt; 28), /* i/f ICC state mask */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_ACTIVE=C2=A0 =C2=A0 =C2=A0=3D (0x1 &lt;=
&lt; 28), /* Put i/f in active state */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_PARTIAL=C2=A0 =C2=A0 =3D (0x2 &lt;&lt; =
28), /* Put i/f in partial state */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_SLUMBER=C2=A0 =C2=A0 =3D (0x6 &lt;&lt; =
28), /* Put i/f in slumber state */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ASP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(27), /* Aggressive Slumber/Partial */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ALPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(26), /* Aggressive Link PM enable */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ATAPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(24), /* Device is ATAPI */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_FBSCP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(22), /* FBS Capable Port */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ESP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(21), /* External Sata Port */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_HPCP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D BIT(18), /* HotPlug Capable Port */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(17), /* PMP attached */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_LIST_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
15), /* cmd list DMA engine running */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_FIS_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 BIT(14), /* FIS DMA engine running */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_FIS_RX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 BIT(4), /* Enable FIS receive DMA engine */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_CLO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(3), /* Command list override */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_POWER_ON=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
2), /* Power up device */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_SPIN_UP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
1), /* Spin up device */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 BIT(0), /* Enable port DMA engine */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (0xf=
u &lt;&lt; 28), /* i/f ICC state mask */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_ACTIVE=C2=A0 =C2=A0 =C2=A0=3D (0x1u &lt=
;&lt; 28), /* Put i/f in active state */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_PARTIAL=C2=A0 =C2=A0 =3D (0x2u &lt;&lt;=
 28), /* Put i/f in partial state */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_CMD_ICC_SLUMBER=C2=A0 =C2=A0 =3D (0x6u &lt;&lt;=
 28), /* Put i/f in slumber state */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PORT_FBS bits */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_FBS_DWE_OFFSET=C2=A0 =C2=A0 =C2=A0=3D 16, =
/* FBS device with error offset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_FBS_ADO_OFFSET=C2=A0 =C2=A0 =C2=A0=3D 12, =
/* FBS active dev optimization offset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_FBS_DEV_OFFSET=C2=A0 =C2=A0 =C2=A0=3D 8,=
=C2=A0 /* FBS device to issue offset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_FBS_DEV_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (0xf &lt;&lt; PORT_FBS_DEV_OFFSET),=C2=A0 /* <a href=3D"http://FBS.DEV" re=
l=3D"noreferrer" target=3D"_blank">FBS.DEV</a> */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_FBS_SDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 2), /* FBS single device error */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_FBS_DEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 1), /* FBS device error clear */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_FBS_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D (1 &lt;&lt; 0), /* Enable FBS */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_FBS_SDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(2), /* FBS single device error */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_FBS_DEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(1), /* FBS device error clear */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_FBS_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D BIT(0), /* Enable FBS */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PORT_DEVSLP bits */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_DEVSLP_DM_OFFSET=C2=A0 =C2=A0=3D 25,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DITO multiplier offset */<br>
+@@ -197,52 +198,52 @@ enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_DEVSLP_DITO_OFFSET =3D 15,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DITO offset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_DEVSLP_MDAT_OFFSET =3D 10,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Minimum assertion time */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PORT_DEVSLP_DETO_OFFSET =3D 2,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* DevSlp exit timeout */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_DEVSLP_DSP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (1 &lt;&lt; 1),=C2=A0 =C2=A0 =C2=A0 =C2=A0/* DevSlp present */<br>
+-=C2=A0 =C2=A0 =C2=A0 PORT_DEVSLP_ADSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 0),=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Aggressive DevSlp enable */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_DEVSLP_DSP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 BIT(1),=C2=A0 =C2=A0 =C2=A0 =C2=A0/* DevSlp present */<br>
++=C2=A0 =C2=A0 =C2=A0 PORT_DEVSLP_ADSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
0),=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Aggressive DevSlp enable */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* hpriv-&gt;flags bits */<br>
+ <br>
+ #define AHCI_HFLAGS(flags)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .priv=
ate_data=C2=A0 =C2=A0=3D (void *)(flags)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_NCQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D (1 &lt;&lt; 0),<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IGN_IRQ_IF_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D (1 &lt;&lt; 1), /* ignore IRQ_IF_ERR */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IGN_SERR_INTERNAL=C2=A0 =C2=A0 =3D (1 &lt=
;&lt; 2), /* ignore SERR_INTERNAL */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_32BIT_ONLY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D (1 &lt;&lt; 3), /* force 32bit */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_MV_PATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D (1 &lt;&lt; 4), /* PATA port */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D (1 &lt;&lt; 5), /* no PCI MSI */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D (1 &lt;&lt; 6), /* no PMP */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_SECT255=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D (1 &lt;&lt; 8), /* max 255 sectors */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_YES_NCQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D (1 &lt;&lt; 9), /* force NCQ cap on */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_SUSPEND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D (1 &lt;&lt; 10), /* don&#39;t suspend */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_SRST_TOUT_IS_OFFLINE =3D (1 &lt;&lt; 11),=
 /* treat SRST timeout as<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_NCQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D BIT(0),<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IGN_IRQ_IF_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D BIT(1), /* ignore IRQ_IF_ERR */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IGN_SERR_INTERNAL=C2=A0 =C2=A0 =3D BIT(2)=
, /* ignore SERR_INTERNAL */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_32BIT_ONLY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D BIT(3), /* force 32bit */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_MV_PATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D BIT(4), /* PATA port */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D BIT(5), /* no PCI MSI */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_PMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D BIT(6), /* no PMP */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_SECT255=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D BIT(8), /* max 255 sectors */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_YES_NCQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D BIT(9), /* force NCQ cap on */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_SUSPEND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D BIT(10), /* don&#39;t suspend */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_SRST_TOUT_IS_OFFLINE =3D BIT(11), /* trea=
t SRST timeout as<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link offline */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_SNTF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D (1 &lt;&lt; 12), /* no sntf */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_FPDMA_AA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D (1 &lt;&lt; 13), /* no FPDMA AA */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_YES_FBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D (1 &lt;&lt; 14), /* force FBS cap on */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_DELAY_ENGINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D (1 &lt;&lt; 15), /* do not start engine on<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_SNTF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D BIT(12), /* no sntf */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_FPDMA_AA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D BIT(13), /* no FPDMA AA */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_YES_FBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D BIT(14), /* force FBS cap on */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_DELAY_ENGINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D BIT(15), /* do not start engine on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port start (wait until<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error-handling stage) */<br=
>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_DEVSLP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D (1 &lt;&lt; 17), /* no device sleep */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_FBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D (1 &lt;&lt; 18), /* no FBS */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_DEVSLP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D BIT(17), /* no device sleep */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_FBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D BIT(18), /* no FBS */<br>
+ <br>
+ #ifdef CONFIG_PCI_MSI<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_MULTI_MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D (1 &lt;&lt; 20), /* per-port MSI(-X) */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_MULTI_MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D BIT(20), /* per-port MSI(-X) */<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* compile out MSI infrastructure */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AHCI_HFLAG_MULTI_MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D 0,<br>
+ #endif<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_WAKE_BEFORE_STOP=C2=A0 =C2=A0 =C2=A0=3D (=
1 &lt;&lt; 22), /* wake before DMA stop */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_YES_ALPM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (1 &lt;&lt; 23), /* force ALPM cap on */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_WRITE_TO_RO=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D (1 &lt;&lt; 24), /* don&#39;t write to read<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_WAKE_BEFORE_STOP=C2=A0 =C2=A0 =C2=A0=3D B=
IT(22), /* wake before DMA stop */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_YES_ALPM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D BIT(23), /* force ALPM cap on */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_WRITE_TO_RO=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D BIT(24), /* don&#39;t write to read<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only registers */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IS_MOBILE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D (1 &lt;&lt; 25), /* mobile chipset, use<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IS_MOBILE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D BIT(25), /* mobile chipset, use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATA_MOBILE_LPM_POLICY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as default lpm_policy */<br=
>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_SUSPEND_PHYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D (1 &lt;&lt; 26), /* handle PHYs during<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_SUSPEND_PHYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D BIT(26), /* handle PHYs during<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suspend/resume */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IGN_NOTSUPP_POWER_ON =3D (1 &lt;&lt; 27),=
 /* ignore -EOPNOTSUPP<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_IGN_NOTSUPP_POWER_ON =3D BIT(27), /* igno=
re -EOPNOTSUPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from phy_power_on() */<br>
+-=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_SXS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D (1 &lt;&lt; 28), /* SXS not supported */<br>
++=C2=A0 =C2=A0 =C2=A0 AHCI_HFLAG_NO_SXS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D BIT(28), /* SXS not supported */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ap-&gt;flags bits */<br>
+ <br>
+@@ -258,22 +259,22 @@ enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0EM_MAX_RETRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 5,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* em_ctl bits */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D (1 &lt;&lt; 9), /* Reset */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_TM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D (1 &lt;&lt; 8), /* Transmit Message */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_MR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D (1 &lt;&lt; 0), /* Message Received */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_ALHD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D (1 &lt;&lt; 26), /* Activity LED */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_XMT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D (1 &lt;&lt; 25), /* Transmit Only */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_SMB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D (1 &lt;&lt; 24), /* Single Message Buffer */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_SGPIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 19), /* SGPIO messages supported */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_SES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D (1 &lt;&lt; 18), /* SES-2 messages supported */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_SAFTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D (1 &lt;&lt; 17), /* SAF-TE messages supported */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_CTL_LED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D (1 &lt;&lt; 16), /* LED messages supported */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D BIT(9), /* Reset */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_TM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D BIT(8), /* Transmit Message */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_MR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D BIT(0), /* Message Received */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_ALHD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D BIT(26), /* Activity LED */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_XMT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D BIT(25), /* Transmit Only */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_SMB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D BIT(24), /* Single Message Buffer */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_SGPIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(19), /* SGPIO messages supported */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_SES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D BIT(18), /* SES-2 messages supported */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_SAFTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D BIT(17), /* SAF-TE messages supported */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_CTL_LED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D BIT(16), /* LED messages supported */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* em message type */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_LED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 (1 &lt;&lt; 0), /* LED */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_SAFTE=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 1), /* SAF-TE */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_SES2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D (1 &=
lt;&lt; 2), /* SES-2 */<br>
+-=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_SGPIO=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1 &=
lt;&lt; 3), /* SGPIO */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_LED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 BIT(0), /* LED */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_SAFTE=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
1), /* SAF-TE */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_SES2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D BIT(=
2), /* SES-2 */<br>
++=C2=A0 =C2=A0 =C2=A0 EM_MSG_TYPE_SGPIO=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BIT(=
3), /* SGPIO */<br>
+ };<br>
+ <br>
+ struct ahci_cmd_hdr {<br>
diff --git a/meta-ti-bsp/recipes-kernel/linux/<a href=3D"http://linux-ti-st=
aging_5.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-ti-staging_5.10.b=
b</a> b/meta-ti-bsp/recipes-kernel/linux/<a href=3D"http://linux-ti-staging=
_5.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-ti-staging_5.10.bb</a>=
<br>
index 4c23a28c..6e600d16 100644<br>
--- a/meta-ti-bsp/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_5=
.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-ti-staging_5.10.bb</a><b=
r>
+++ b/meta-ti-bsp/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_5=
.10.bb" rel=3D"noreferrer" target=3D"_blank">linux-ti-staging_5.10.bb</a><b=
r>
@@ -34,6 +34,7 @@ KERNEL_GIT_URI =3D &quot;git://<a href=3D"http://git.ti.c=
om/git/ti-linux-kernel/ti-linux-kernel.git" rel=3D"noreferrer" target=3D"_b=
lank">git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git</a>&quot;<br>
=C2=A0KERNEL_GIT_PROTOCOL =3D &quot;https&quot;<br>
=C2=A0SRC_URI +=3D &quot;${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL=
};branch=3D${BRANCH} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init_disassemble_inf=
o-signature-changes-causes-compile-failures.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ata-ahci-fix-enum-co=
nstants-for-gcc-13.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig&quot;<br>
<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D &quot;/${KERNEL_IMAGEDES=
T}/*.itb&quot;<br>
-- <br>
2.39.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15719): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15719" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15719</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96693848/1891=
26" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
96693848/189126</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:phil@sutherland.id.au" target=3D"_blank">phil@=
sutherland.id.au</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008e7de405fa4c011e--

