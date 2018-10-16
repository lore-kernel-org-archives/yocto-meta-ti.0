Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8CCAE00950; Tue, 16 Oct 2018 11:53:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.222.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B076E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:53:10 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id q5-v6so14839090qki.6
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vwPMvE1vDeHu0ccIwnYuc99RwZz9AdkKj7pncySE+qw=;
	b=TIEdDwBd8IYEL/MJbENTN1JU+NUQ29kwozuZ4L7fOX83TpGjttbuVy1JH/x9GOYhJf
	RC7QFo6wjleUX43XoRZW6kz1YYh/gQmpOoi0dPZ7d9Jwxt6Oa1CmLm4SlwBaJewiV3eq
	sm6t7Btp3E2L9MfK5LWJKP01gBS+2EOylBRWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vwPMvE1vDeHu0ccIwnYuc99RwZz9AdkKj7pncySE+qw=;
	b=dn+fKs2pRxJTzoDsTWEyVG2v9nH5DSoSxgo3GBlFsatgGl0yDxWn0FH7+e5zk1gAkq
	jNEQGNHkIXmpay9n7JSa9VZf4NER5DrrCPVUrAaGde9wfQCDvH2guToXU9H8j+Ix2+la
	7TlPdLFRUpMGNFTeasJrr+gaxl8+Kq8FzG+h0ICvqWFJYx6V1Ce6PBF9qYjkM3wgM6MA
	Fm9dndxkqAkvd2f53PDxvFoYEMTWWECgUlpgatXXrOqSdhpf+tip8XJo7SXccG/+vvmn
	i9IWSDuju3UvkiwwuMqz6+pXOKUIYSypGQ/27W3NEhmCrwLQanpezCom1kdJA0d3Mwa/
	dIWQ==
X-Gm-Message-State: ABuFfoibHjqgpXCSvKYF0hE7EnDShgfmtJbPt+5GJmr/Q9aXi76pFmyy
	CoYakObpVM2IHzBj9XoOQJHY2Q==
X-Google-Smtp-Source: ACcGV62M6MMDh2l+ZIjygw6v8acpN//C14WVkEVsfwSds6AZ1R6eN7w9HgnCQTRSbBSNPiOw0nBCUQ==
X-Received: by 2002:a37:d656:: with SMTP id
	t83-v6mr379077qki.151.1539715990319; 
	Tue, 16 Oct 2018 11:53:10 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm12767987qtf.14.2018.10.16.11.53.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 11:53:09 -0700 (PDT)
Date: Tue, 16 Oct 2018 14:53:07 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181016185307.GN1032@bill-the-cat>
References: <20181016074745.39972-1-raj.khem@gmail.com>
	<20181016163938.GH1032@bill-the-cat>
	<CAMKF1srMCRsi_xEqUV417X36jEwQYsn=z0DDZAUeyf6BH+WLkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srMCRsi_xEqUV417X36jEwQYsn=z0DDZAUeyf6BH+WLkQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 16 Oct 2018 18:53:12 -0000
X-Groupsio-MsgNum: 11384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSnC4ZPPfhCvD8sN"
Content-Disposition: inline

--aSnC4ZPPfhCvD8sN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 11:13:44AM -0700, Khem Raj wrote:
> On Tue, Oct 16, 2018 at 9:39 AM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Oct 16, 2018 at 12:47:43AM -0700, Khem Raj wrote:
> > > Fixes errors e.g.
> > >
> > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > fit in region `.sram'
> > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 byt=
es
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 73 +++++++++++++++++=
++
> > >  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 +
> > >  2 files changed, 75 insertions(+)
> > >  create mode 100644 recipes-bsp/u-boot/files/0001-am335x_evm_defconfi=
g-Reduce-SPL-.rodata-size.patch
> > >
> > > diff --git a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduc=
e-SPL-.rodata-size.patch b/recipes-bsp/u-boot/files/0001-am335x_evm_defconf=
ig-Reduce-SPL-.rodata-size.patch
> > > new file mode 100644
> > > index 00000000..47597b28
> > > --- /dev/null
> > > +++ b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.=
rodata-size.patch
> > > @@ -0,0 +1,73 @@
> > > +From 56dce6462e60e2aa5b87c97c5a2c43a4d834e251 Mon Sep 17 00:00:00 20=
01
> > > +From: "Kemal R. Shakir" <kemal@ti.com>
> > > +Date: Wed, 3 Oct 2018 15:56:37 +0300
> > > +Subject: [PATCH 1/1] am335x_evm_defconfig: Reduce SPL `.rodata' size
> > > +
> > > +---
> > > + configs/am335x_evm_defconfig | 54 +++++++++++++++++++++++++++++++++=
+++
> > > + 1 file changed, 54 insertions(+)
> > > +
> > > +diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defco=
nfig
> > > +index 4908099431..568a4f535e 100644
> > > +--- a/configs/am335x_evm_defconfig
> > > ++++ b/configs/am335x_evm_defconfig
> > > +@@ -63,3 +63,57 @@ CONFIG_DYNAMIC_CRC_TABLE=3Dy
> > > + CONFIG_SPL_TINY_MEMSET=3Dy
> > > + CONFIG_RSA=3Dy
> > > + CONFIG_LZO=3Dy
> > > ++
> > > ++#
> > > ++# SPL / TPL
> > > ++#
> > > ++CONFIG_SUPPORT_SPL=3Dy
> > > ++CONFIG_SPL=3Dy
> > > ++CONFIG_SPL_BOARD_INIT=3Dy
> > > ++# CONFIG_SPL_BOOTROM_SUPPORT is not set
> > > ++CONFIG_SPL_RAW_IMAGE_SUPPORT=3Dy
> > > ++CONFIG_SPL_LEGACY_IMAGE_SUPPORT=3Dy
> > > ++CONFIG_SPL_SYS_MALLOC_SIMPLE=3Dy
> > > ++# CONFIG_TPL_SYS_MALLOC_SIMPLE is not set
> > > ++CONFIG_SPL_STACK_R=3Dy
> > > ++CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=3D0x100000
> > > ++CONFIG_SPL_SEPARATE_BSS=3Dy
> > > ++# CONFIG_SPL_DISPLAY_PRINT is not set
> > > ++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=3Dy
> > > ++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=3D0x300
> > > ++# CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION is not set
> > > ++# CONFIG_SPL_CRC32_SUPPORT is not set
> > > ++# CONFIG_SPL_MD5_SUPPORT is not set
> > > ++# CONFIG_SPL_SHA1_SUPPORT is not set
> > > ++# CONFIG_SPL_SHA256_SUPPORT is not set
> > > ++# CONFIG_SPL_FIT_IMAGE_TINY is not set
> > > ++# CONFIG_SPL_CPU_SUPPORT is not set
> > > ++# CONFIG_SPL_CRYPTO_SUPPORT is not set
> > > ++# CONFIG_SPL_HASH_SUPPORT is not set
> > > ++# CONFIG_SPL_DMA_SUPPORT is not set
> > > ++# CONFIG_SPL_ENV_SUPPORT is not set
> > > ++CONFIG_SPL_EXT_SUPPORT=3Dy
> > > ++# CONFIG_SPL_FPGA_SUPPORT is not set
> > > ++CONFIG_SPL_I2C_SUPPORT=3Dy
> > > ++# CONFIG_SPL_MMC_WRITE is not set
> > > ++# CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT is not set
> > > ++CONFIG_SPL_MTD_SUPPORT=3Dy
> > > ++CONFIG_SPL_MUSB_NEW_SUPPORT=3Dy
> > > ++CONFIG_SPL_NET_SUPPORT=3Dy
> > > ++CONFIG_SPL_NET_VCI_STRING=3D"AM335x U-Boot SPL"
> > > ++# CONFIG_SPL_NO_CPU_SUPPORT is not set
> > > ++# CONFIG_SPL_NOR_SUPPORT is not set
> > > ++# CONFIG_SPL_XIP_SUPPORT is not set
> > > ++# CONFIG_SPL_ONENAND_SUPPORT is not set
> > > ++CONFIG_SPL_OS_BOOT=3Dy
> > > ++# CONFIG_SPL_PCI_SUPPORT is not set
> > > ++# CONFIG_SPL_PCH_SUPPORT is not set
> > > ++# CONFIG_SPL_POST_MEM_SUPPORT is not set
> > > ++CONFIG_SPL_POWER_SUPPORT=3Dy
> > > ++# CONFIG_SPL_RAM_SUPPORT is not set
> > > ++# CONFIG_SPL_RTC_SUPPORT is not set
> > > ++# CONFIG_SPL_SATA_SUPPORT is not set
> > > ++# CONFIG_SPL_THERMAL is not set
> > > ++# CONFIG_SPL_USB_HOST_SUPPORT is not set
> > > ++# CONFIG_SPL_USB_GADGET_SUPPORT is not set
> > > ++# CONFIG_SPL_YMODEM_SUPPORT is not set
> >
> > The original patch isn't yours, but, what?  Apply this patch, run 'make
> > am335x_evm_defconfig savedefconfig', copy 'defconfig' back over to
> > configs/am335x_evm_defconfig and see what actually changed vs top of
> > tree.  We really want to know what you're now turning off compared with
> > the regular config and perhaps look into why that's now overflowing, and
> > with what compiler?  That's some rather large growth.  Thanks!
>=20
> I can try that now that I have it in buildable state, but since master
> works fine on both
> accounts ( defconfig and sram issue) I will see when I can get to it.

With or without this patch applied?  I really don't think this patch,
as-is, should be applied anywhere, perhaps other than as a temporary
work-around.

--=20
Tom

--aSnC4ZPPfhCvD8sN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxjOTAAoJEIf59jXTHXZSgu8P/3QJRq0sIdER/a34Rcdq0Ih2
6x/iu0MgSL9lv6GOcVsMc2RD1Y7w4UARspeUu1nZSQG4yTQCO5NGJNvEG3D9+Y28
A0sSbTFE1Mxy5Kc/TFLx2lpeo0ybaL9nL5z3F9m8KThBcUiryUlL+wzYgP2K8EZb
pT+vLjpdo4f+Q+Azd96zgSmPqrSl38pKnKvqUjANHvSoLO7J+Phrm65a9UwJylz5
PHqowha4GUIXeFohjLz2bu0uE8NU5ZaqvAXmpDahuhId4v63pOEY9SA5snx2RHzb
hiEWZYq1jzm2meULKhvWNxAW07GKbfik+1HaIbvuFsikOGn3FaX9NZjcIRz9iuW+
RubgmE4q7YO6Zo8mAntRk5sp2MRe4NW1wW3xQFr2HDJHmaPyU5CGLb65i0MyOM+/
yJvZSeop8P65DBTxa0QYuzFallnWzW4MxsvHxjH6+28m70AfEOdF3A9Qoj+bsD5Z
WGzI7dRM+Q0XAdXseMtxyWBMhSCZFp8zpoJ/6Wvw6jJXRNjSfQTCu1Wnk09ikJ13
42jwei6UVCX3o5cPGpZsuHYp/Csr1bd5HXCfZD2G3V/hJ7Nr+fncbZ4drm3LN8BZ
tiqDLjcX70nEHatQiMGuEWLOCLGy+BT1Sk5PJ650XOtqf2d4sK2NK/bk2FySejvv
KS9PNQoex+tFX2NrtLy/
=HRoh
-----END PGP SIGNATURE-----

--aSnC4ZPPfhCvD8sN--
