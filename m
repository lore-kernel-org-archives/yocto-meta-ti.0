Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C308FE00950; Tue, 16 Oct 2018 09:39:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09A71E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 09:39:42 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id x8-v6so14549571qka.4
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wrLH6l3VYOK9yyjHmMJ2N/eT50rXMAIT+mgxIWwrbO0=;
	b=I+SVOpby2id8C6Uazz5bwnk1PymsMAlbbxyfCUt+zQlLUzDF9I+UEW8EvTvyDjiXxD
	3Z+UCyMFy9se3noDaQY3Q5qQhLctmrEey76ocfB+oe9el+0XiW18uieOVJ8km0EECy7Y
	I/+xhqbibNQDfESk+LqME6XzXhvRTyPkKOwE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wrLH6l3VYOK9yyjHmMJ2N/eT50rXMAIT+mgxIWwrbO0=;
	b=k3Q7sKICN2j1wzMWBcqk6L1FPXSyVfXf+0URc4Ahh6uKTtESlG7qZjG4K0VJVbGWS4
	TQMqdyK9lm5QrsRZ6FDYqp6CpHKxKebubUr4f1EPmHPdS8gFcJSvDzqeMC/6KL+w9ktN
	r1jLp0TydNUuWFwOZQZussDYpuQQymk7onktONbppwakPleuWzseyUxczq81TY2BtZnz
	NNwJf7P5pG/TAYEMzFA8hId7r7ncsuCJ2tGOw2/cXiTV9/slsv/SNVhcA0AsLwiEFZMU
	wzwz2jpqyBIZSCEPHoKhpG8lpqTfRQ/qHl1xqaWWLVck94vxpmFjISCwkHY6GBDOhurc
	ffVw==
X-Gm-Message-State: ABuFfoiDzcGSqQITuzsgq8hYGSjiK4cbss8TnP3oVGOTV3ns6NjkMNv4
	VwJ8kesIJ5Dwy8miy9uHP5qhsA==
X-Google-Smtp-Source: ACcGV61wXYdnAD0pV8YPigCZHmfZOEfaiFuw5VOZAihTKJtx6A3JEbC779ARIuCipwRR22kHWfXBNw==
X-Received: by 2002:a37:2455:: with SMTP id
	w82-v6mr21910741qkg.247.1539707981787; 
	Tue, 16 Oct 2018 09:39:41 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	o185-v6sm8314814qke.34.2018.10.16.09.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 09:39:40 -0700 (PDT)
Date: Tue, 16 Oct 2018 12:39:38 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181016163938.GH1032@bill-the-cat>
References: <20181016074745.39972-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181016074745.39972-1-raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 16 Oct 2018 16:39:43 -0000
X-Groupsio-MsgNum: 11374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y9PDtDHaFrXNoMPU"
Content-Disposition: inline

--y9PDtDHaFrXNoMPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 12:47:43AM -0700, Khem Raj wrote:
> Fixes errors e.g.
>=20
> | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> fit in region `.sram'
> | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 73 +++++++++++++++++++
>  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Re=
duce-SPL-.rodata-size.patch
>=20
> diff --git a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SP=
L-.rodata-size.patch b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-R=
educe-SPL-.rodata-size.patch
> new file mode 100644
> index 00000000..47597b28
> --- /dev/null
> +++ b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.roda=
ta-size.patch
> @@ -0,0 +1,73 @@
> +From 56dce6462e60e2aa5b87c97c5a2c43a4d834e251 Mon Sep 17 00:00:00 2001
> +From: "Kemal R. Shakir" <kemal@ti.com>
> +Date: Wed, 3 Oct 2018 15:56:37 +0300
> +Subject: [PATCH 1/1] am335x_evm_defconfig: Reduce SPL `.rodata' size
> +
> +---
> + configs/am335x_evm_defconfig | 54 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 54 insertions(+)
> +
> +diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
> +index 4908099431..568a4f535e 100644
> +--- a/configs/am335x_evm_defconfig
> ++++ b/configs/am335x_evm_defconfig
> +@@ -63,3 +63,57 @@ CONFIG_DYNAMIC_CRC_TABLE=3Dy
> + CONFIG_SPL_TINY_MEMSET=3Dy
> + CONFIG_RSA=3Dy
> + CONFIG_LZO=3Dy
> ++
> ++#
> ++# SPL / TPL
> ++#
> ++CONFIG_SUPPORT_SPL=3Dy
> ++CONFIG_SPL=3Dy
> ++CONFIG_SPL_BOARD_INIT=3Dy
> ++# CONFIG_SPL_BOOTROM_SUPPORT is not set
> ++CONFIG_SPL_RAW_IMAGE_SUPPORT=3Dy
> ++CONFIG_SPL_LEGACY_IMAGE_SUPPORT=3Dy
> ++CONFIG_SPL_SYS_MALLOC_SIMPLE=3Dy
> ++# CONFIG_TPL_SYS_MALLOC_SIMPLE is not set
> ++CONFIG_SPL_STACK_R=3Dy
> ++CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=3D0x100000
> ++CONFIG_SPL_SEPARATE_BSS=3Dy
> ++# CONFIG_SPL_DISPLAY_PRINT is not set
> ++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=3Dy
> ++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=3D0x300
> ++# CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION is not set
> ++# CONFIG_SPL_CRC32_SUPPORT is not set
> ++# CONFIG_SPL_MD5_SUPPORT is not set
> ++# CONFIG_SPL_SHA1_SUPPORT is not set
> ++# CONFIG_SPL_SHA256_SUPPORT is not set
> ++# CONFIG_SPL_FIT_IMAGE_TINY is not set
> ++# CONFIG_SPL_CPU_SUPPORT is not set
> ++# CONFIG_SPL_CRYPTO_SUPPORT is not set
> ++# CONFIG_SPL_HASH_SUPPORT is not set
> ++# CONFIG_SPL_DMA_SUPPORT is not set
> ++# CONFIG_SPL_ENV_SUPPORT is not set
> ++CONFIG_SPL_EXT_SUPPORT=3Dy
> ++# CONFIG_SPL_FPGA_SUPPORT is not set
> ++CONFIG_SPL_I2C_SUPPORT=3Dy
> ++# CONFIG_SPL_MMC_WRITE is not set
> ++# CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT is not set
> ++CONFIG_SPL_MTD_SUPPORT=3Dy
> ++CONFIG_SPL_MUSB_NEW_SUPPORT=3Dy
> ++CONFIG_SPL_NET_SUPPORT=3Dy
> ++CONFIG_SPL_NET_VCI_STRING=3D"AM335x U-Boot SPL"
> ++# CONFIG_SPL_NO_CPU_SUPPORT is not set
> ++# CONFIG_SPL_NOR_SUPPORT is not set
> ++# CONFIG_SPL_XIP_SUPPORT is not set
> ++# CONFIG_SPL_ONENAND_SUPPORT is not set
> ++CONFIG_SPL_OS_BOOT=3Dy
> ++# CONFIG_SPL_PCI_SUPPORT is not set
> ++# CONFIG_SPL_PCH_SUPPORT is not set
> ++# CONFIG_SPL_POST_MEM_SUPPORT is not set
> ++CONFIG_SPL_POWER_SUPPORT=3Dy
> ++# CONFIG_SPL_RAM_SUPPORT is not set
> ++# CONFIG_SPL_RTC_SUPPORT is not set
> ++# CONFIG_SPL_SATA_SUPPORT is not set
> ++# CONFIG_SPL_THERMAL is not set
> ++# CONFIG_SPL_USB_HOST_SUPPORT is not set
> ++# CONFIG_SPL_USB_GADGET_SUPPORT is not set
> ++# CONFIG_SPL_YMODEM_SUPPORT is not set

The original patch isn't yours, but, what?  Apply this patch, run 'make
am335x_evm_defconfig savedefconfig', copy 'defconfig' back over to
configs/am335x_evm_defconfig and see what actually changed vs top of
tree.  We really want to know what you're now turning off compared with
the regular config and perhaps look into why that's now overflowing, and
with what compiler?  That's some rather large growth.  Thanks!

--=20
Tom

--y9PDtDHaFrXNoMPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxhRKAAoJEIf59jXTHXZSBokP/itOyApyS4qv8+P+Mtooa56T
MFa2S5dKsByFnm/zZPxseUZz4u+ositrudBtnuLBjH7icq+wX2if6bqa4AbXwwxq
GqWsWfD46xbGH/t0lv5moGdMJzRX14A1sBXdlzn2oURiYola7Bwjx6pawpPDp3ti
V9yG5DQx87n/s9gab8JUcaeo/cZWZVwXdrEHj69E2A7u42kQZl9o0q9eUV1SxmKb
DTfhcLnfEpYpVEZvkHduG9EIRNTlI8SgMOlmTYGvsIAoJuwmEMmXksqMWD5va4rU
JgLCNGscv3g/VzkQKvAhne+lzhK6F5xLfuo50CzYeMv/z0zCCG1XEsE1mNWRc2SV
X5bMZ8wB/PhPz/53JX+xUXT+gMEwsOqCOHtVKenlq0VTmsPJA/7Qpyou6ytmp9zr
UkQ3n7Z4kuX7sk99AVH96RbtayiIICY8WhJ4z7gHlM2l3oSA9YB0pFBtPG2b0RZq
wvMbvyyJ14ojz2XiSQnzUEPmLtPK0VBUrMxG2u+3Rv1O7bqAAY5PGc+oBMSdXiTF
dNrrsS8jDiFELlIh+sXKZ2iDjqFZpI1CxrXnXVakckRk9qJOIT1fkjx0i1yYhsL2
NovaN1AmXzALPma6TXaWgVXMafkVqxCIUQYzwaeYp6YokU0jNKwhLnVlBKptAFok
CrIqVx5gWHixvJeS4qQ1
=iBaR
-----END PGP SIGNATURE-----

--y9PDtDHaFrXNoMPU--
