Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC2A7E00303
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 04:32:23 -0800 (PST)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAECWKVU015616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 14 Nov 2011 06:32:20 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAECWKOx014849;
	Mon, 14 Nov 2011 06:32:20 -0600 (CST)
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAECWJOI017849;
	Mon, 14 Nov 2011 06:32:20 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Mon, 14 Nov 2011 13:32:19 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: Peter Bigot <bigotp@acm.org>, Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] checksum and path issues building gstreamer-ti
Thread-Index: AQHMon7SKfLyJjPOrEC8Dam9USMp3JWrvr6AgAB5JwCAABVy0A==
Date: Mon, 14 Nov 2011 12:32:17 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF522445D348@DNCE02.ent.ti.com>
References: <CAPOJ94MU-om2UXuHBi+Vfdqr8e_MpWgTnHL__Y0KCELBv1tcpw@mail.gmail.com>
	<20111114045955.GB15557@denix.org>
	<CAPOJ94O6Meq2GuHX-dNrGh_Fv-Rp_Ox5xWOSAAbybdZ9i-P_Lw@mail.gmail.com>
In-Reply-To: <CAPOJ94O6Meq2GuHX-dNrGh_Fv-Rp_Ox5xWOSAAbybdZ9i-P_Lw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: checksum and path issues building gstreamer-ti
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
X-List-Received-Date: Mon, 14 Nov 2011 12:32:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 12:13:32, Peter Bigot wrote:
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] checksum and path issues building gstreamer-ti
>
> On Sun, Nov 13, 2011 at 10:59 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > On Sun, Nov 13, 2011 at 09:37:47PM -0600, Peter Bigot wrote:
> >> I didn't get an answer to this when I asked it as an aside on the
> >> BeagleBoard google group, but just verified that the same problems
> >> are present in oe-classic as is in oe-core.
> >>
> >> The recipe checksums don't match the current downloads:
> >>
> >> vmserver[52]$ cd Downloads/
> >> vmserver[53]$ md5sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> >> 5ee5c8e573ab0a1ba1249511d4a06c27
> >> ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> >> vmserver[54]$ sha256sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> >> 0cb99e755f5d06a74db22d7c814e4dfd36aa5fcb35eeab01ddb000aef99c08c1
> >> ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> >>
> >> When that's corrected still doesn't work because do_unpack puts the
> >> toolchain in  /opt/TI/TI_CGT_C6000_6.1.17/ instead of under
> >> ${installdir} where ti-paths.inc expects it.
> >>
> >> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Started
> >> ERROR: Logfile of failure stored in:
> >> /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti
> >> -
> c
> >> gt6x-1_6_1_17-r4/temp/log.do_install.20024
> >> Log data follows:
> >> | + do_install
> >> | + install -d
> >> | + /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-
> gnueabi/
> >> | + ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
> >> | + cp -pPrf '/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-
> linux-gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*'
> >> /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti
> >> -
> c
> >> gt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
> >> | cp: cannot stat
> >> `/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-
> gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*':
> >> No such file or directory
> >> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Failed
> >>
> >> For the version in meta-ti, the LIC_FILES_CHKSUM value was reverted
> >> to a wrong checksum when it got moved to the recipe file in commit
> >> 7feec8987.
> >>
> >> Or maybe somebody at TI updated
> >> ti_cgt_c6000_6.1.17_setup_linux_x86.bin and the recipe is now
> >> broken for anybody who doesn't have a cached copy of a previous releas=
e.
> >> I'm going to scrap this and move on, but it'd probably be worth
> >> verifying that current Angstrom (classic or core) works with
> >> current downloads of the codegen tools.
> >
> > Yes, the binary download of CGT 6.1.17 was updated, unfortunately:
> >
> > https://lists.yoctoproject.org/pipermail/meta-ti/2011-
> October/000016.h
> > tml
>
> Thanks.  Has anybody successfully built with the new binary?  My
> experiments suggest correcting the MD5 isn't enough; the installation
> process also needs to be modified in non-obvious ways.

Not specifically, but I've seen this bug before and submitted a patch a whi=
le back for this, so either the patch isn't in, or it's re-occurring with t=
he new binary.  I'll try to take a look.

>
> Peter
>
> > And we did follow up with CGT team. As one of the options to handle
> > this situation more gracefully, I pointed out at the way FSF handled
> > it for when they needed to update all previous releases of binutils
> > - they made available the updated binaries with a suffix.
> >
> > Anyway, we need to ping them again and see if this can be done
> > similarly with CGT updates...
> >
> > Roger/Jason,
> >
> > Would you mind?
> >
> > --
> > Denys
> >
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti




