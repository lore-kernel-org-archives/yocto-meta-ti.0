Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.782.1581531209617089795
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2020 10:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=adonzaGB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01CIDSxH038124;
	Wed, 12 Feb 2020 12:13:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581531208;
	bh=JRs+ybkxC+T/o+XkBHceXr+DbOT/CErwxF4TKyF39CA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=adonzaGBkQcCft0q3iB1wrCNw9SdrUjxvm9gbKLhaCz6a6d7sQwum7H9NIWxukWHZ
	 VnD+u1/UfbWST2WQ3hzmQvsyQb8jNXMNDTsA+/NkXYtFvS6lQwesmM5TLOKJpzxl8v
	 G521pN+rHuBbKHplanI/2MwfnxeQtMQvznoLi4QA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01CIDS0Z075196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2020 12:13:28 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 12:13:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 12:13:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CIDSr9107454;
	Wed, 12 Feb 2020 12:13:28 -0600
Date: Wed, 12 Feb 2020 13:13:28 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <j-stiffler@ti.com>
CC: <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [thud/master][PATCH 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
Message-ID: <20200212181327.GB30768@beryl>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
 <20200203224309.19843-3-m-radhakrishnan2@ti.com>
 <45deb203-0ccc-b461-1942-bf7345c74afe@ti.com>
MIME-Version: 1.0
In-Reply-To: <45deb203-0ccc-b461-1942-bf7345c74afe@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 01CIDSxH038124
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Any updates on this?

On Tue, Feb 04, 2020 at 02:59:12PM -0500, Jacob Stiffler via Lists.Yoctopr=
oject.Org wrote:
> I am getting a packaging error with this update:
>=20
>=20
> ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Fatal errors
> occurred in subprocesses:
> Command '['aarch64-linux-gnu-strip', '--remove-section=3D.comment',
> '--remove-section=3D.note', '/media/hdd1/jake/oe/tisdk-thud/build-tisdk/=
arago-aarch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3-r1/sysroo=
t-destdir/usr/share/ti/ti-pdk-tree/packages/ti/drv/sciclient/tools/bin2c/bi=
n2c.out']'
> returned non-zero exit status 1: Traceback (most recent call last):
> =A0 File
> "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py", l=
ine
> 272, in run
> =A0=A0=A0 ret =3D self._target(*self._args, **self._kwargs)
> =A0 File
> "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/package.py",
> line 44, in runstrip
> =A0=A0=A0 output =3D subprocess.check_output(stripcmd, stderr=3Dsubproce=
ss.STDOUT)
> =A0 File "/usr/lib/python3.5/subprocess.py", line 626, in check_output
> =A0=A0=A0 **kwargs).stdout
> =A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run
> =A0=A0=A0 output=3Dstdout, stderr=3Dstderr)
> subprocess.CalledProcessError: Command '['aarch64-linux-gnu-strip',
> '--remove-section=3D.comment', '--remove-section=3D.note', '/media/hdd1/=
jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_evm-linux/scic=
lient-rtos/1_2020.2.3-r1/sysroot-destdir/usr/share/ti/ti-pdk-tree/packages/=
ti/drv/sciclient/tools/bin2c/bin2c.out']'
> returned non-zero exit status 1
>=20
>=20
> ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Function failed=
:
> sysroot_strip
> ERROR: Logfile of failure stored in: /media/hdd1/jake/oe/tisdk-thud/buil=
d-tisdk/arago-aarch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3-r=
1/temp/log.do_populate_sysroot.13772
> ERROR: Task (/media/hdd1/jake/oe/tisdk-thud/sources/meta-ti/recipes-bsp/=
sciclient/sciclient-rtos_git.bb:do_populate_sysroot)
> failed with exit code '1'
> ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Fatal errors occurred in
> subprocesses:
> Command '['aarch64-linux-gnu-objcopy', '--only-keep-debug', '/media/hdd1=
/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_evm-linux/sci=
client-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/packages/ti/drv/=
sciclient/tools/bin2c/bin2c.out', '/media/hdd1/jake/oe/tisdk-thud/build-tis=
dk/arago-aarch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3-r1/pac=
kage/usr/share/ti/ti-pdk-tree/packages/ti/drv/sciclient/tools/bin2c/.debug/=
bin2c.out']'
> returned non-zero exit status 1: Traceback (most recent call last):
> =A0 File
> "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py", l=
ine
> 272, in run
> =A0=A0=A0 ret =3D self._target(*self._args, **self._kwargs)
> =A0 File "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/classes/pa=
ckage.bbclass",
> line 414, in splitdebuginfo
> =A0=A0=A0 subprocess.check_output([objcopy, '--only-keep-debug', file, d=
ebugfile],
> stderr=3Dsubprocess.STDOUT)
> =A0 File "/usr/lib/python3.5/subprocess.py", line 626, in check_output
> =A0=A0=A0 **kwargs).stdout
> =A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run
> =A0=A0=A0 output=3Dstdout, stderr=3Dstderr)
> subprocess.CalledProcessError: Command '['aarch64-linux-gnu-objcopy',
> '--only-keep-debug', '/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-a=
arch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/s=
hare/ti/ti-pdk-tree/packages/ti/drv/sciclient/tools/bin2c/bin2c.out', '/med=
ia/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_evm-li=
nux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/packages/=
ti/drv/sciclient/tools/bin2c/.debug/bin2c.out']'
> returned non-zero exit status 1
>=20
>=20
> ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Function failed:
> split_and_strip_files
>=20
> On 2/3/2020 5:43 PM, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wro=
te:
> >From: Mahesh Radhakrishnan <a0875154@UDA0875154>
> >
> >The license as such has not changed, but moved to a License file which
> >is not expected to change frequently
> >---
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/=
sciclient/sciclient-rtos_git.bb
> >index 6a3d79c3..1f65149c 100644
> >--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> >+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> >@@ -7,12 +7,12 @@ TI_PDK_COMP =3D "ti.drv.sciclient"
> >  PE =3D "1"
> >  LICENSE =3D "BSD-3-Clause"
> >-LIC_FILES_CHKSUM =3D "file://sciclient.h;beginline=3D1;endline=3D31;md=
5=3D7224b2eeca1444815f1737bfcdfa892a"
> >+LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D31;md=
5=3Dc05dd6e04691b3339c447a7a21691705"
> >  COMPATIBLE_MACHINE =3D "k3"
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >-PR =3D "r0"
> >+PR =3D "r1"
> >  DEPENDS_append =3D " osal-rtos common-csl-ip-rtos"
> >
> >

>=20

