Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.15334.1581972596858062626
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 12:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=A+HIb0X5;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01HKnumV079220
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Feb 2020 14:49:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581972596;
	bh=KKmmAKnas4ai3ldfqWc6wgM+0yrjeZ7FZTQeo/uzr/U=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=A+HIb0X5WozFKoRlAD60E8psY10TdILjEPcVHXmam4XcOsghAEJF5jn95DG/n4/52
	 dapiMcLr0+bK51r3KVzDIqwfaC4JvIcMVIc+HRk7nvgaYtsXX+LnCPaJF00YvROPO6
	 Xc2D/d0oMJT1ckcwEVzmSFJb3zd8qX6KXGbZN+ag=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01HKnuke102079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Feb 2020 14:49:56 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 14:49:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 14:49:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HKntIp088952;
	Mon, 17 Feb 2020 14:49:55 -0600
Date: Mon, 17 Feb 2020 15:49:55 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <j-stiffler@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [thud/master][PATCH 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
Message-ID: <20200217204955.GD720@beryl>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
 <20200203224309.19843-3-m-radhakrishnan2@ti.com>
 <45deb203-0ccc-b461-1942-bf7345c74afe@ti.com>
 <15F2BA41A55CAD04.13257@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15F2BA41A55CAD04.13257@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 01HKnumV079220
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ping

On Wed, Feb 12, 2020 at 01:13:28PM -0500, Denys Dmytriyenko via Lists.Yoct=
oproject.Org wrote:
> Any updates on this?
>=20
> On Tue, Feb 04, 2020 at 02:59:12PM -0500, Jacob Stiffler via Lists.Yocto=
project.Org wrote:
> > I am getting a packaging error with this update:
> >=20
> >=20
> > ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Fatal errors
> > occurred in subprocesses:
> > Command '['aarch64-linux-gnu-strip', '--remove-section=3D.comment',
> > '--remove-section=3D.note', '/media/hdd1/jake/oe/tisdk-thud/build-tisd=
k/arago-aarch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3-r1/sysr=
oot-destdir/usr/share/ti/ti-pdk-tree/packages/ti/drv/sciclient/tools/bin2c/=
bin2c.out']'
> > returned non-zero exit status 1: Traceback (most recent call last):
> > =A0 File
> > "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py",=
 line
> > 272, in run
> > =A0=A0=A0 ret =3D self._target(*self._args, **self._kwargs)
> > =A0 File
> > "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/package.py=
",
> > line 44, in runstrip
> > =A0=A0=A0 output =3D subprocess.check_output(stripcmd, stderr=3Dsubpro=
cess.STDOUT)
> > =A0 File "/usr/lib/python3.5/subprocess.py", line 626, in check_output
> > =A0=A0=A0 **kwargs).stdout
> > =A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run
> > =A0=A0=A0 output=3Dstdout, stderr=3Dstderr)
> > subprocess.CalledProcessError: Command '['aarch64-linux-gnu-strip',
> > '--remove-section=3D.comment', '--remove-section=3D.note', '/media/hdd=
1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_evm-linux/sc=
iclient-rtos/1_2020.2.3-r1/sysroot-destdir/usr/share/ti/ti-pdk-tree/package=
s/ti/drv/sciclient/tools/bin2c/bin2c.out']'
> > returned non-zero exit status 1
> >=20
> >=20
> > ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Function fail=
ed:
> > sysroot_strip
> > ERROR: Logfile of failure stored in: /media/hdd1/jake/oe/tisdk-thud/bu=
ild-tisdk/arago-aarch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3=
-r1/temp/log.do_populate_sysroot.13772
> > ERROR: Task (/media/hdd1/jake/oe/tisdk-thud/sources/meta-ti/recipes-bs=
p/sciclient/sciclient-rtos_git.bb:do_populate_sysroot)
> > failed with exit code '1'
> > ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Fatal errors occurred =
in
> > subprocesses:
> > Command '['aarch64-linux-gnu-objcopy', '--only-keep-debug', '/media/hd=
d1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_evm-linux/s=
ciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/packages/ti/dr=
v/sciclient/tools/bin2c/bin2c.out', '/media/hdd1/jake/oe/tisdk-thud/build-t=
isdk/arago-aarch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3-r1/p=
ackage/usr/share/ti/ti-pdk-tree/packages/ti/drv/sciclient/tools/bin2c/.debu=
g/bin2c.out']'
> > returned non-zero exit status 1: Traceback (most recent call last):
> > =A0 File
> > "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py",=
 line
> > 272, in run
> > =A0=A0=A0 ret =3D self._target(*self._args, **self._kwargs)
> > =A0 File "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/classes/=
package.bbclass",
> > line 414, in splitdebuginfo
> > =A0=A0=A0 subprocess.check_output([objcopy, '--only-keep-debug', file,=
 debugfile],
> > stderr=3Dsubprocess.STDOUT)
> > =A0 File "/usr/lib/python3.5/subprocess.py", line 626, in check_output
> > =A0=A0=A0 **kwargs).stdout
> > =A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run
> > =A0=A0=A0 output=3Dstdout, stderr=3Dstderr)
> > subprocess.CalledProcessError: Command '['aarch64-linux-gnu-objcopy',
> > '--only-keep-debug', '/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago=
-aarch64-tmp/work/am65xx_evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr=
/share/ti/ti-pdk-tree/packages/ti/drv/sciclient/tools/bin2c/bin2c.out', '/m=
edia/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_evm-=
linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/package=
s/ti/drv/sciclient/tools/bin2c/.debug/bin2c.out']'
> > returned non-zero exit status 1
> >=20
> >=20
> > ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Function failed:
> > split_and_strip_files
> >=20
> > On 2/3/2020 5:43 PM, Mahesh Radhakrishnan via Lists.Yoctoproject.Org w=
rote:
> > >From: Mahesh Radhakrishnan <a0875154@UDA0875154>
> > >
> > >The license as such has not changed, but moved to a License file whic=
h
> > >is not expected to change frequently
> > >---
> > >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bs=
p/sciclient/sciclient-rtos_git.bb
> > >index 6a3d79c3..1f65149c 100644
> > >--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > >+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > >@@ -7,12 +7,12 @@ TI_PDK_COMP =3D "ti.drv.sciclient"
> > >  PE =3D "1"
> > >  LICENSE =3D "BSD-3-Clause"
> > >-LIC_FILES_CHKSUM =3D "file://sciclient.h;beginline=3D1;endline=3D31;=
md5=3D7224b2eeca1444815f1737bfcdfa892a"
> > >+LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D31;=
md5=3Dc05dd6e04691b3339c447a7a21691705"
> > >  COMPATIBLE_MACHINE =3D "k3"
> > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >-PR =3D "r0"
> > >+PR =3D "r1"
> > >  DEPENDS_append =3D " osal-rtos common-csl-ip-rtos"
> > >
> > >
>=20
> >=20
>=20

>=20

