Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52FE6E00950; Tue, 16 Oct 2018 11:14:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B673E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:14:00 -0700 (PDT)
Received: by mail-qt1-f195.google.com with SMTP id e22-v6so26870068qto.6
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=urmWnbLGmTc98xOhkkvjim+PaxK4rDf4F9YgIHfJjBw=;
	b=RG5s08F1pOUHlxmk9+UIEpel4GCy2yGmsPWKAChXuw6uxWvsanfTYuihgKCdC42kAy
	wFwImA+R6v8sDT48CJJQt2sBxPQD79ktYscN1KyxkhlCls6No/iVHt/XZptJtOfQM9IY
	BluTZlzg1eCr3zxRYAL8HaNwbBWY38fP4cJCAIJNSGSt0+q13SixgSODxQ1EMjHoNT/q
	aLMJaYvieg1n1v4bNkskE4IT5wJp2/XKkT6N2oIYllK+E2kUegelE6jyg1nqT2Bl13JP
	24N26MDsbSCT519t0KUn1qfDaM/C/8bKJLzdywb+64wYXCqTgUP7i15/x1fgq4jUTwv0
	TWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=urmWnbLGmTc98xOhkkvjim+PaxK4rDf4F9YgIHfJjBw=;
	b=jNVKYGqI8qdf3tmkG+a52izNlAQ2x7wziFwP3rufKzZb2Bu1EmX8SbJxl3nsCveNeo
	sH6Izg7NGJbPzTJ1kH37NVAG6sOge4DjVR4cYLN5OcHt1Dg6ZKK0n3JWD7oCAA5bxGyu
	0jgT8B+yoOYjhiTPG0U3lqvMu4C2WLY/FaCzMneb4xHcLDdJ7zPIkfTLbf+idUuYW4dk
	GwafUHCL+obmlmfGQmC2VgVJ/lELMa8P2FN+qMptkKFu3atKUlg/OzIACilOzj+EACN+
	rxcEIag0rYnJj2mH6ij296LQJ1/uSihQhrTGlrAsxCi5lQ2tLV+8BWenI9C2PicgIUYw
	JOgg==
X-Gm-Message-State: ABuFfoham0G1/x54tJc8yDU+CRMXBTZUVSl+0aCxyqgq/BOKbnAPeczK
	iflnvwymRY9vsICgHi2aMWEBBemLi1FyqqaV0BvaDg==
X-Google-Smtp-Source: ACcGV62hr09GWcUDVRyDlU2ROXwkPgXbysDOkNMoDzznkjOofEKQ1Y3d0DdyK9vpPz3oWlVgzc8OLluDV3iTQTkgAjo=
X-Received: by 2002:a0c:ad47:: with SMTP id v7mr18753537qvc.228.1539713639315; 
	Tue, 16 Oct 2018 11:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20181016074745.39972-1-raj.khem@gmail.com>
	<20181016163938.GH1032@bill-the-cat>
In-Reply-To: <20181016163938.GH1032@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 11:13:44 -0700
Message-ID: <CAMKF1srMCRsi_xEqUV417X36jEwQYsn=z0DDZAUeyf6BH+WLkQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot: reduce the SPL `.rodata' size
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2018 18:14:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 9:39 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 16, 2018 at 12:47:43AM -0700, Khem Raj wrote:
> > Fixes errors e.g.
> >
> > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > fit in region `.sram'
> > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 73 +++++++++++++++++++
> >  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 +
> >  2 files changed, 75 insertions(+)
> >  create mode 100644 recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
> >
> > diff --git a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
> > new file mode 100644
> > index 00000000..47597b28
> > --- /dev/null
> > +++ b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
> > @@ -0,0 +1,73 @@
> > +From 56dce6462e60e2aa5b87c97c5a2c43a4d834e251 Mon Sep 17 00:00:00 2001
> > +From: "Kemal R. Shakir" <kemal@ti.com>
> > +Date: Wed, 3 Oct 2018 15:56:37 +0300
> > +Subject: [PATCH 1/1] am335x_evm_defconfig: Reduce SPL `.rodata' size
> > +
> > +---
> > + configs/am335x_evm_defconfig | 54 ++++++++++++++++++++++++++++++++++++
> > + 1 file changed, 54 insertions(+)
> > +
> > +diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
> > +index 4908099431..568a4f535e 100644
> > +--- a/configs/am335x_evm_defconfig
> > ++++ b/configs/am335x_evm_defconfig
> > +@@ -63,3 +63,57 @@ CONFIG_DYNAMIC_CRC_TABLE=y
> > + CONFIG_SPL_TINY_MEMSET=y
> > + CONFIG_RSA=y
> > + CONFIG_LZO=y
> > ++
> > ++#
> > ++# SPL / TPL
> > ++#
> > ++CONFIG_SUPPORT_SPL=y
> > ++CONFIG_SPL=y
> > ++CONFIG_SPL_BOARD_INIT=y
> > ++# CONFIG_SPL_BOOTROM_SUPPORT is not set
> > ++CONFIG_SPL_RAW_IMAGE_SUPPORT=y
> > ++CONFIG_SPL_LEGACY_IMAGE_SUPPORT=y
> > ++CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> > ++# CONFIG_TPL_SYS_MALLOC_SIMPLE is not set
> > ++CONFIG_SPL_STACK_R=y
> > ++CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=0x100000
> > ++CONFIG_SPL_SEPARATE_BSS=y
> > ++# CONFIG_SPL_DISPLAY_PRINT is not set
> > ++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
> > ++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x300
> > ++# CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION is not set
> > ++# CONFIG_SPL_CRC32_SUPPORT is not set
> > ++# CONFIG_SPL_MD5_SUPPORT is not set
> > ++# CONFIG_SPL_SHA1_SUPPORT is not set
> > ++# CONFIG_SPL_SHA256_SUPPORT is not set
> > ++# CONFIG_SPL_FIT_IMAGE_TINY is not set
> > ++# CONFIG_SPL_CPU_SUPPORT is not set
> > ++# CONFIG_SPL_CRYPTO_SUPPORT is not set
> > ++# CONFIG_SPL_HASH_SUPPORT is not set
> > ++# CONFIG_SPL_DMA_SUPPORT is not set
> > ++# CONFIG_SPL_ENV_SUPPORT is not set
> > ++CONFIG_SPL_EXT_SUPPORT=y
> > ++# CONFIG_SPL_FPGA_SUPPORT is not set
> > ++CONFIG_SPL_I2C_SUPPORT=y
> > ++# CONFIG_SPL_MMC_WRITE is not set
> > ++# CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT is not set
> > ++CONFIG_SPL_MTD_SUPPORT=y
> > ++CONFIG_SPL_MUSB_NEW_SUPPORT=y
> > ++CONFIG_SPL_NET_SUPPORT=y
> > ++CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
> > ++# CONFIG_SPL_NO_CPU_SUPPORT is not set
> > ++# CONFIG_SPL_NOR_SUPPORT is not set
> > ++# CONFIG_SPL_XIP_SUPPORT is not set
> > ++# CONFIG_SPL_ONENAND_SUPPORT is not set
> > ++CONFIG_SPL_OS_BOOT=y
> > ++# CONFIG_SPL_PCI_SUPPORT is not set
> > ++# CONFIG_SPL_PCH_SUPPORT is not set
> > ++# CONFIG_SPL_POST_MEM_SUPPORT is not set
> > ++CONFIG_SPL_POWER_SUPPORT=y
> > ++# CONFIG_SPL_RAM_SUPPORT is not set
> > ++# CONFIG_SPL_RTC_SUPPORT is not set
> > ++# CONFIG_SPL_SATA_SUPPORT is not set
> > ++# CONFIG_SPL_THERMAL is not set
> > ++# CONFIG_SPL_USB_HOST_SUPPORT is not set
> > ++# CONFIG_SPL_USB_GADGET_SUPPORT is not set
> > ++# CONFIG_SPL_YMODEM_SUPPORT is not set
>
> The original patch isn't yours, but, what?  Apply this patch, run 'make
> am335x_evm_defconfig savedefconfig', copy 'defconfig' back over to
> configs/am335x_evm_defconfig and see what actually changed vs top of
> tree.  We really want to know what you're now turning off compared with
> the regular config and perhaps look into why that's now overflowing, and
> with what compiler?  That's some rather large growth.  Thanks!
>

I can try that now that I have it in buildable state, but since master
works fine on both
accounts ( defconfig and sram issue) I will see when I can get to it.

> --
> Tom

