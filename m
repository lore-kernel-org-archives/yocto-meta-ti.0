Return-Path: <mrkanaly@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C752C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 19:31:54 +0000 (UTC)
Subject: AM4378 QSPI Boot
To: meta-ti@lists.yoctoproject.org
From: mrkanaly@gmail.com
X-Originating-Location: Chandler, Arizona, US (65.121.24.2)
X-Originating-Platform: Windows Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 09 Jun 2022 12:31:43 -0700
Message-ID: <7Ygb.1654803103493662641.dvas@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jun 2022 19:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14812

Hello,

I am booting a AM4378 platform and am running in to some issues.

I have modeled my board after am43xx_evm_defconfig and have achieved an exe=
cutable SPL that I can debug with JTAG.=20
>U-Boot SPL 2020.01-g2781231a33 (Sep 01 2021 - 12:00:00 +0000)
>WDT:   Not found!
>SPL: Unsupported Boot Device!
>SPL: failed to boot from all boot devices

After programming to the NOR that is connected via QSPI, I am able to break=
 at the QSPI memory mapped location (0x30000000) on boot and single step th=
rough instructions that I know resemble u-boot-spl (haven=E2=80=99t gotten =
symbol loading to work right with the memory map location). However I am ru=
nning in to trouble as at some point in the boot a data abort is thrown and=
 I haven=E2=80=99t figured out why/where yet.

Before I spend too long trying to debug this I wanted to ask a few question=
s:

* Is CONFIG_QSPI_BOOT required to boot an AM4378? Quoting the config, =E2=
=80=9CThis is not a must, some SoCs need this, some not.=E2=80=9D My search=
es only see it coming up in regard to TI_SECURE_DEVICE, which I am not atte=
mpting to do anything with (i.e. not doing a secure boot).
* am43xx_evm_qspiboot_defconfig Doesn=E2=80=99t use an SPL:
* * Can it?
* * Is an SPL necessary? My u-boot image currently exceeds available on chi=
p memory and I thought an SPL would be required so that u-boot would have R=
AM available to it. Does the =E2=80=9CeXecute in place=E2=80=9D work around=
 this on this platform such that you can skip using an SPL?  DDR will get i=
nitialized by u-boot since it is executing from the NOR and didn=E2=80=99t =
have to be loaded in to memory, then it can init the DDR so it has the room=
 to load Linux later on.
* * When I build this config with CONFIG_SPL=3Dy I get the error:
> arm-oe-linux-gnueabi-ld.bfd: invalid length for memory region .sram
But it does look as if the link script wasn=E2=80=99t processed correctly f=
or this build configuration, as all the variables aren=E2=80=99t filled in:
> MEMORY { .sram : ORIGIN =3D 0x402F4000, LENGTH =3D IMAGE_MAX_SIZE }
> MEMORY { .sdram : ORIGIN =3D CONFIG_SPL_BSS_START_ADDR, LENGTH =3D CONFIG=
_SPL_BSS_MAX_SIZE }
> OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
* Are these options and the extra options redundant or required? CONFIG_SYS=
_EXTRA_OPTIONS=3D"CONS_INDEX=3D1,QSPI,QSPI_BOOT"; CONFIG_QSPI_BOOT=3Dy; I w=
asn=E2=80=99t able to locate any CONFIG_QSPI in the code, only QSPI_BOOT.
* I am currently building with CONFIG_OF_EMBED=3Dy in order to get the abov=
e output from the UART. I understand this makes the DTB encoded in the exec=
utable ELF that I am debugging. Does this also mean the same for a binary t=
hat is flashed? Or does a flashed binary have to use OF_EMBED=3Dn and the D=
TB appended to the end of the image (u-boot[-spl].bin, versus (u-boot[-spl]=
-no-dtb.bin).=20

I appreciate any insight anyone might be able to offer.
Thanks,
Mike

