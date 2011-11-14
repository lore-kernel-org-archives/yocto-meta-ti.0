Return-Path: <pabigot@gmail.com>
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A50A9E00305
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 19:37:48 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wwi18 with SMTP id 18so4362035wwi.5
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 19:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=gZYpBLEgMSbrun6qZskRZc1H3mH+JjdQPumg+aImwF4=;
	b=fY3ifYPOoeezIiEleDLcmz5IyoCU4NefCrlrDmpHJFXY3rsGqncWPoO87DOaUs4pGt
	UcxuMqW57sruD0PvFBma1fb0KdrzvuM/cxpOzhNE52lJO3wgFNbX8rklhea1Vc2CBExe
	bLhQiUbRQ2bk8hmoGH6GsObjScbXZiuePK1gk=
MIME-Version: 1.0
Received: by 10.227.205.132 with SMTP id fq4mr13741104wbb.5.1321241867303;
	Sun, 13 Nov 2011 19:37:47 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Sun, 13 Nov 2011 19:37:47 -0800 (PST)
Date: Sun, 13 Nov 2011 21:37:47 -0600
X-Google-Sender-Auth: Mhga7L9N_HJVxSLFn5VivWZvjHs
Message-ID: <CAPOJ94MU-om2UXuHBi+Vfdqr8e_MpWgTnHL__Y0KCELBv1tcpw@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Subject: checksum and path issues building gstreamer-ti
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
X-List-Received-Date: Mon, 14 Nov 2011 03:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

I didn't get an answer to this when I asked it as an aside on the
BeagleBoard google group, but just verified that the same problems are
present in oe-classic as is in oe-core.

The recipe checksums don't match the current downloads:

vmserver[52]$ cd Downloads/
vmserver[53]$ md5sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
5ee5c8e573ab0a1ba1249511d4a06c27 ti_cgt_c6000_6.1.17_setup_linux_x86.bin
vmserver[54]$ sha256sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
0cb99e755f5d06a74db22d7c814e4dfd36aa5fcb35eeab01ddb000aef99c08c1
ti_cgt_c6000_6.1.17_setup_linux_x86.bin

When that's corrected still doesn't work because do_unpack puts the
toolchain in  /opt/TI/TI_CGT_C6000_6.1.17/ instead of under
${installdir} where ti-paths.inc expects it.

NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Started
ERROR: Logfile of failure stored in:
/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/temp/log.do_install.20024
Log data follows:
| + do_install
| + install -d /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
| + cp -pPrf '/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*'
/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
| cp: cannot stat
`/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*':
No such file or directory
NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Failed

For the version in meta-ti, the LIC_FILES_CHKSUM value was reverted to
a wrong checksum when it got moved to the recipe file in commit
7feec8987.

Or maybe somebody at TI updated
ti_cgt_c6000_6.1.17_setup_linux_x86.bin and the recipe is now broken
for anybody who doesn't have a cached copy of a previous release.  I'm
going to scrap this and move on, but it'd probably be worth verifying
that current Angstrom (classic or core) works with current downloads
of the codegen tools.

Peter

