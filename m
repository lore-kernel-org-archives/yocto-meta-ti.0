Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1208.1580846354371243745
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 11:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=suxWkasV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-stiffler@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 014JxDCb090553;
	Tue, 4 Feb 2020 13:59:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580846353;
	bh=n8r83M8QrvgQggqpyOcMXamPFaw3PVI1iyMx/5C7mwI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=suxWkasVifNzwgGlhbxiMs1VldGFNy7ZrQIB+iZ9AuTxDCEEMmH0G2HsiF0uC7QT6
	 U34HqDgghYb9ZRZ57FzCdEO3/QaRHmt5yZ4bXpQvg0tlTMxX+qPXeajN623Tshb4PT
	 iH4IrkdmHEugqNQUe3RA+cMN6P0mL7C/c5kaPSiA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014JxD5k093606;
	Tue, 4 Feb 2020 13:59:13 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 4 Feb
 2020 13:59:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 4 Feb 2020 13:59:12 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014JxC8V126379;
	Tue, 4 Feb 2020 13:59:12 -0600
Subject: Re: [EXTERNAL] [meta-ti] [thud/master][PATCH 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
To: <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
 <20200203224309.19843-3-m-radhakrishnan2@ti.com>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <45deb203-0ccc-b461-1942-bf7345c74afe@ti.com>
Date: Tue, 4 Feb 2020 14:59:12 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203224309.19843-3-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------5D756D47B769BF262576EC60"
Content-Language: en-US

--------------5D756D47B769BF262576EC60
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 014JxDCb090553

I am getting a packaging error with this update:


ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Fatal errors=20
occurred in subprocesses:
Command '['aarch64-linux-gnu-strip', '--remove-section=3D.comment',=20
'--remove-section=3D.note',=20
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/sysroot-destdir/usr/share/ti/ti-pdk-=
tree/packages/ti/drv/sciclient/tools/bin2c/bin2c.out']'=20
returned non-zero exit status 1: Traceback (most recent call last):
 =C2=A0 File=20
"/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py",=20
line 272, in run
 =C2=A0=C2=A0=C2=A0 ret =3D self._target(*self._args, **self._kwargs)
 =C2=A0 File=20
"/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/package.py",=
=20
line 44, in runstrip
 =C2=A0=C2=A0=C2=A0 output =3D subprocess.check_output(stripcmd, stderr=3D=
subprocess.STDOUT)
 =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 626, in check_output
 =C2=A0=C2=A0=C2=A0 **kwargs).stdout
 =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run
 =C2=A0=C2=A0=C2=A0 output=3Dstdout, stderr=3Dstderr)
subprocess.CalledProcessError: Command '['aarch64-linux-gnu-strip',=20
'--remove-section=3D.comment', '--remove-section=3D.note',=20
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/sysroot-destdir/usr/share/ti/ti-pdk-=
tree/packages/ti/drv/sciclient/tools/bin2c/bin2c.out']'=20
returned non-zero exit status 1


ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Function=20
failed: sysroot_strip
ERROR: Logfile of failure stored in:=20
/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_e=
vm-linux/sciclient-rtos/1_2020.2.3-r1/temp/log.do_populate_sysroot.13772
ERROR: Task=20
(/media/hdd1/jake/oe/tisdk-thud/sources/meta-ti/recipes-bsp/sciclient/scic=
lient-rtos_git.bb:do_populate_sysroot)=20
failed with exit code '1'
ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Fatal errors occurred in=
=20
subprocesses:
Command '['aarch64-linux-gnu-objcopy', '--only-keep-debug',=20
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/bin2c.out',=20
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/.debug/bin2c.out']'=20
returned non-zero exit status 1: Traceback (most recent call last):
 =C2=A0 File=20
"/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py",=20
line 272, in run
 =C2=A0=C2=A0=C2=A0 ret =3D self._target(*self._args, **self._kwargs)
 =C2=A0 File=20
"/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/classes/package.bbcla=
ss",=20
line 414, in splitdebuginfo
 =C2=A0=C2=A0=C2=A0 subprocess.check_output([objcopy, '--only-keep-debug',=
 file,=20
debugfile], stderr=3Dsubprocess.STDOUT)
 =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 626, in check_output
 =C2=A0=C2=A0=C2=A0 **kwargs).stdout
 =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run
 =C2=A0=C2=A0=C2=A0 output=3Dstdout, stderr=3Dstderr)
subprocess.CalledProcessError: Command '['aarch64-linux-gnu-objcopy',=20
'--only-keep-debug',=20
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/bin2c.out',=20
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/.debug/bin2c.out']'=20
returned non-zero exit status 1


ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Function failed:=20
split_and_strip_files

On 2/3/2020 5:43 PM, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote=
:
> From: Mahesh Radhakrishnan <a0875154@UDA0875154>
>
> The license as such has not changed, but moved to a License file which
> is not expected to change frequently
> ---
>   recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/s=
ciclient/sciclient-rtos_git.bb
> index 6a3d79c3..1f65149c 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -7,12 +7,12 @@ TI_PDK_COMP =3D "ti.drv.sciclient"
>   PE =3D "1"
>  =20
>   LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://sciclient.h;beginline=3D1;endline=3D31;md5=
=
=3D7224b2eeca1444815f1737bfcdfa892a"
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D31;md5=
=
=3Dc05dd6e04691b3339c447a7a21691705"
>  =20
>   COMPATIBLE_MACHINE =3D "k3"
>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  =20
> -PR =3D "r0"
> +PR =3D "r1"
>  =20
>   DEPENDS_append =3D " osal-rtos common-csl-ip-rtos"
>  =20
>
>=20

--------------5D756D47B769BF262576EC60
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 014JxDCb090553

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>I am getting a packaging error with this update:</p>
    <p><br>
    </p>
    <p>ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Fatal
      errors occurred in subprocesses:<br>
      Command '['aarch64-linux-gnu-strip', '--remove-section=3D.comment',
      '--remove-section=3D.note',
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/sysroot-destdir/usr/share/ti/ti-pdk-=
tree/packages/ti/drv/sciclient/tools/bin2c/bin2c.out']'
      returned non-zero exit status 1: Traceback (most recent call
      last):<br>
      =C2=A0 File
      "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py=
",
      line 272, in run<br>
      =C2=A0=C2=A0=C2=A0 ret =3D self._target(*self._args, **self._kwargs)=
<br>
      =C2=A0 File
      "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/package.=
py",
      line 44, in runstrip<br>
      =C2=A0=C2=A0=C2=A0 output =3D subprocess.check_output(stripcmd,
      stderr=3Dsubprocess.STDOUT)<br>
      =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 626, in
      check_output<br>
      =C2=A0=C2=A0=C2=A0 **kwargs).stdout<br>
      =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run<br>
      =C2=A0=C2=A0=C2=A0 output=3Dstdout, stderr=3Dstderr)<br>
      subprocess.CalledProcessError: Command
      '['aarch64-linux-gnu-strip', '--remove-section=3D.comment',
      '--remove-section=3D.note',
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/sysroot-destdir/usr/share/ti/ti-pdk-=
tree/packages/ti/drv/sciclient/tools/bin2c/bin2c.out']'
      returned non-zero exit status 1<br>
      <br>
      <br>
      ERROR: sciclient-rtos-1_2020.2.3-r1 do_populate_sysroot: Function
      failed: sysroot_strip<br>
      ERROR: Logfile of failure stored in:
/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_e=
vm-linux/sciclient-rtos/1_2020.2.3-r1/temp/log.do_populate_sysroot.13772<br=
>
      ERROR: Task
(/media/hdd1/jake/oe/tisdk-thud/sources/meta-ti/recipes-bsp/sciclient/scic=
lient-rtos_git.bb:do_populate_sysroot)
      failed with exit code '1'<br>
      ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Fatal errors
      occurred in subprocesses:<br>
      Command '['aarch64-linux-gnu-objcopy', '--only-keep-debug',
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/bin2c.out',
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/.debug/bin2c.out']'
      returned non-zero exit status 1: Traceback (most recent call
      last):<br>
      =C2=A0 File
      "/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/lib/oe/utils.py=
",
      line 272, in run<br>
      =C2=A0=C2=A0=C2=A0 ret =3D self._target(*self._args, **self._kwargs)=
<br>
      =C2=A0 File
"/media/hdd1/jake/oe/tisdk-thud/sources/oe-core/meta/classes/package.bbcla=
ss",
      line 414, in splitdebuginfo<br>
      =C2=A0=C2=A0=C2=A0 subprocess.check_output([objcopy, '--only-keep-de=
bug', file,
      debugfile], stderr=3Dsubprocess.STDOUT)<br>
      =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 626, in
      check_output<br>
      =C2=A0=C2=A0=C2=A0 **kwargs).stdout<br>
      =C2=A0 File "/usr/lib/python3.5/subprocess.py", line 708, in run<br>
      =C2=A0=C2=A0=C2=A0 output=3Dstdout, stderr=3Dstderr)<br>
      subprocess.CalledProcessError: Command
      '['aarch64-linux-gnu-objcopy', '--only-keep-debug',
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/bin2c.out',
'/media/hdd1/jake/oe/tisdk-thud/build-tisdk/arago-aarch64-tmp/work/am65xx_=
evm-linux/sciclient-rtos/1_2020.2.3-r1/package/usr/share/ti/ti-pdk-tree/pac=
kages/ti/drv/sciclient/tools/bin2c/.debug/bin2c.out']'
      returned non-zero exit status 1<br>
      <br>
      <br>
      ERROR: sciclient-rtos-1_2020.2.3-r1 do_package: Function failed:
      split_and_strip_files<br>
      <br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/3/2020 5:43 PM, Mahesh
      Radhakrishnan via Lists.Yoctoproject.Org wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200203224309.19843-3-m-radhakrishnan2@ti.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Mahesh Radhakrishnan &l=
t;a0875154@UDA0875154&gt;

The license as such has not changed, but moved to a License file which
is not expected to change frequently
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sci=
client/sciclient-rtos_git.bb
index 6a3d79c3..1f65149c 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -7,12 +7,12 @@ TI_PDK_COMP =3D "ti.drv.sciclient"
 PE =3D "1"
=20
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://sc=
iclient.h;beginline=3D1;endline=3D31;md5=3D7224b2eeca1444815f1737bfcdfa892a=
">"file://sciclient.h;beginline=3D1;endline=3D31;md5=3D7224b2eeca1444815f17=
37bfcdfa892a"</a>
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://CO=
PYING.txt;beginline=3D1;endline=3D31;md5=3Dc05dd6e04691b3339c447a7a21691705=
">"file://COPYING.txt;beginline=3D1;endline=3D31;md5=3Dc05dd6e04691b3339c44=
7a7a21691705"</a>
=20
 COMPATIBLE_MACHINE =3D "k3"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-PR =3D "r0"
+PR =3D "r1"
=20
 DEPENDS_append =3D " osal-rtos common-csl-ip-rtos"
=20
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------5D756D47B769BF262576EC60--
