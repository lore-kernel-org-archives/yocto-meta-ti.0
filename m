Return-Path: <Rainer.Koenig@ts.fujitsu.com>
Received: from dgate20.ts.fujitsu.com (dgate20.ts.fujitsu.com [80.70.172.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA6EAE01341
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 02:07:24 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1536-bit key; insecure key) header.i=Rainer.Koenig@ts.fujitsu.com;
	x-dkim-adsp=none (insecure policy)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=SoNSE7HHagACEGgDdt0gifH4fwen3dW0Dg+bNO1oiI3x2SPhPJUbqL/H
	N6heQqIyAYyVJjIrJMgZNAfIImmC2elN51g7X2Kw4/AuC5+SnaOeoQUIp
	G7fe38iyAYWCFaBGyV7e8lJUZ1AvJ38zynn/ZVQ0TNsomQvBs2raOb5pp
	f6o45QEJHEeDr43iHMlzPwmgH+00zM1FQxnAZaWHkNdJj/YL477GxlpmH
	ClAwRm4p8FVXvVY4sN9Okx/OE3h6x;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1319188045; x=1350724045;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=EJXI1q6kj156hXQG6OvFcVGJ1GbyaIZkUtgEGjNrV5Q=;
	b=EMtDN1rBs1Ih1vFB6Fd0qBTn04Y1Y/HDW4BRZdvGuANQ72L8MuPuYWi4
	lju4Yamp7kkTgbMxRU3eAZQnm7fiHE2qhZXzYUIbqm5zVT/Ya+8TS+FoL
	JwaOP3SBwuGHXNy8C8TP3GZ3O9/laNRoXsJjBkV8bZTp95hapjlaY2B1m
	jx7YyW30NKApV6zNLsPfOuwdobxZYkDR+vwlWBTTCfOshgoATQ+J01y7h
	rZED0X69j8narCWLd+Dm2fZ5mu9xg;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,383,1315173600"; d="scan'208";a="77241498"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 21 Oct 2011 11:07:22 +0200
X-IronPort-AV: E=Sophos;i="4.69,384,1315173600"; d="scan'208";a="122113593"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 21 Oct 2011 11:07:22 +0200
Message-ID: <4EA1364A.8000605@ts.fujitsu.com>
Date: Fri, 21 Oct 2011 11:07:22 +0200
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111004 Icedove/3.0.11
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
X-Enigmail-Version: 1.0.1
Subject: Building for TI 8148 EVM
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 09:07:26 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi,

I'm currently trying to build an image for the TI 8148 EVM board. For
that I added the meta-ti layer to the standard Yocto/Edison environment.

meta-ti has under conf/machine a dm8148-evm.conf. So I wrote dm8148-evm
as MACHINE in my local.conf.

Build stopped at building u-boot_git.bb and William Mills pointed me to
u-boot_2010.06-psp.bb for the 8148 EVM board. I tried that but then the
build process complained about the SRCREV. Looking at the recipe I see:

require u-boot.inc

FILESPATHPKG =. "u-boot-psp-git:"

COMPATIBLE_MACHINE =
"am387x-evm|am389x-evm|c6a814x-evm|c6a816x-evm|dm814x-evm"

SRC_URI =
"git://arago-project.org/git/projects/u-boot-omap3.git;branch=${BRANCH};protocol=git"

BRANCH_ti814x = "ti81xx-master"
SRCREV_pn-${PN}_ti814x = "5fcf46a405fe8e8a59a04d3cebdafd39ac0c4bd0"
LIC_FILES_CHKSUM_pn-${PN}_ti814x =
"file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"

Questions: I can solve my SRCREV problem when I substite the ti814x in
BRANCH... and SRCREV with my actual dm8148-evm. That makes me ask, what
the purpose of the COMPATIBLE_MACHINE variable is?

If this what I (beginner level) found is a bug, then where do I report
it or submit a fix for it?

The recipe built u-boot.bin now, but I don't see an MLO file in my image
directory. What did I do wrong?

After the image compiled I put it on an SD card and tried to boot with
it, but the kernel runs into a panic:

USB Video Class driver (v1.0.0)
OMAP Watchdog Timer Rev 0x00: initial timeout 60 sec
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
Unable to handle kernel NULL pointer dereference at virtual address 00000002
pgd = c0004000
[00000002] *pgd=00000000
Internal error: Oops: 5 [#1]
last sysfs file:
Modules linked in:
CPU: 0    Not tainted  (2.6.37+ #2)
PC is at strcmp+0xc/0x40
LR is at omap_mbox_get+0x3c/0x1d0
pc : [<c01cf034>]    lr : [<c00566c4>]    psr: a0000013
sp : de83df28  ip : de83df38  fp : de83df34
r10: 00000000  r9 : 00000000  r8 : 00000000
r7 : 00000013  r6 : c0458048  r5 : c0503af8  r4 : c04de2e4
r3 : 00000064  r2 : 00000076  r1 : c0458048  r0 : 00000002
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387d  Table: 80004019  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xde83c2e8)
Stack: (0xde83df28 to 0xde83e000)
df20:                   de83df5c de83df38 c00566c4 c01cf034 c02cc038
c01cf034
df40: 00000000 c0503a9c c0503a98 00000000 de83df7c de83df60 c02cfb0c
c0056694
df60: 00000000 00000000 c0029c0c c0024034 de83dfa4 de83df80 c0024070
c02cf988
df80: de83c000 c0029c0c c0024034 00000000 00000013 00000000 de83dfdc
de83dfa8
dfa0: c00343b8 c0024040 de83dfc4 00000176 c04ea918 c006154c c0029c0c
c0029cb0
dfc0: c006154c 00000013 00000000 00000000 de83dff4 de83dfe0 c0008cf4
c0034304
dfe0: 00000000 c0008c40 00000000 de83dff8 c006154c c0008c4c 00010960
4a408a08
Backtrace:
[<c01cf028>] (strcmp+0x0/0x40) from [<c00566c4>] (omap_mbox_get+0x3c/0x1d0)
[<c0056688>] (omap_mbox_get+0x0/0x1d0) from [<c02cfb0c>]
(notify_shm_drv_setup+0x190/0x268)
 r6:00000000 r5:c0503a98 r4:c0503a9c
[<c02cf97c>] (notify_shm_drv_setup+0x0/0x268) from [<c0024070>]
(notify_init+0x3c/0x2b0)
 r5:c0024034 r4:c0029c0c
[<c0024034>] (notify_init+0x0/0x2b0) from [<c00343b8>]
(do_one_initcall+0xc0/0x194)
 r8:00000000 r7:00000013 r6:00000000 r5:c0024034 r4:c0029c0c
r3:de83c000
[<c00342f8>] (do_one_initcall+0x0/0x194) from [<c0008cf4>]
(kernel_init+0xb4/0x164)
 r9:00000000 r8:00000000 r7:00000013 r6:c006154c r5:c0029cb0
r4:c0029c0c
[<c0008c40>] (kernel_init+0x0/0x164) from [<c006154c>] (do_exit+0x0/0x61c)
 r5:c0008c40 r4:00000000
Code: e89da800 e1a0c00d e92dd800 e24cb004 (e4d03001)
---[ end trace e6ffc3d1c2d89a51 ]---
Kernel panic - not syncing: Attempted to kill init!

Now I start wondering if I'm using the right kernel for this board.
meta-ti/recipes-kernel/linux/lists recipes for a lot of kernels, but
according to the conf/machine/include/ti814x.inc I should have used the
right one. So how can I debug this kernel panic?

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html

