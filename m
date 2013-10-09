Return-Path: <b.hutchman@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55DD7E016C5
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 06:10:50 -0700 (PDT)
Received: by mail-ee0-f43.google.com with SMTP id e52so398073eek.16
	for <meta-ti@yoctoproject.org>; Wed, 09 Oct 2013 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=up9p6+WxvO1NRc0qeQQDACb7IPxUQgHqTj0kDwv7CdQ=;
	b=JVNsTNlCv9OABNNu5pCjBiV9rF+iJV63gDKBFrCIIWg7nJfdQf09jsClIRtYVPgsGe
	lRXWjq7FJ4FYwYX5Wb7VWSacJCHy/gFfKuoqCMMu14EotY2I+HmSE9vEyXD+7f8ae0l8
	vJvXprPGPRpj/BrEcoDufaB0M5q/sJ8yHH/IPvjE72qQ1yNYtN/w3NJufaYz9tzKveVw
	MIdpoN6kVJhA0KlcT3oUxvj/lAyWWdhhmG2tnyRfLc7WllMoICIzz7HipZVrsSqp5uPW
	V8x9V6OiVpS2shAqRv7sKrQgJ3kT9bAm1DNKq6A5nTBSyTJp3TcmO2Off/PXc+Hiqfa5
	yilQ==
MIME-Version: 1.0
X-Received: by 10.15.98.9 with SMTP id bi9mr3084741eeb.67.1381324249233; Wed,
	09 Oct 2013 06:10:49 -0700 (PDT)
Received: by 10.223.144.205 with HTTP; Wed, 9 Oct 2013 06:10:49 -0700 (PDT)
Date: Wed, 9 Oct 2013 09:10:49 -0400
Message-ID: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
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
X-List-Received-Date: Wed, 09 Oct 2013 13:10:51 -0000
Content-Type: multipart/alternative; boundary=089e0168147031fe1804e84e9db6

--089e0168147031fe1804e84e9db6
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I recently was able to get a master checkout of OECore + meta-ti to build
my custom board kernel using linux-ti81xx-psp_2.6.37.bb.  I tried to make
the same modifications to a master yocto + meta-ti checkout and when I try
to build, bitbake absolutely takes forever to build
linux-ti81xx-psp_2.6.37.bb and it gets stuck on the do_package.  I finally
just let it go (hours and hours on a very fast modern machine) and it looks
like it finally just gave up the ghost and ran out of memory or something.
I've never seen anything like it.  Anyone seen anything like this before:

Build Configuration:
BB_VERSION        = "1.20.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-7.1"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "c6a816x-evm"
DISTRO            = "poky"
DISTRO_VERSION    = "1.5"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto
meta-yocto-bsp    = "master:104166c804e9068d85ccdaa887a33df72c8aeb85"
meta-ti           = "master:9c36e6c7573c3e68c5816dd04f3dd43f485b0550"
meta-oe
meta-networking
meta-webserver    = "master:8aafddccb03f54923927e9d1c8c80223baf581de"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Error executing a python function in
/home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linux/
linux-ti81xx-psp_2.6.37.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'package_do_filedeps', lineno: 56, function:
<module>

     0052:    for pkg in provides_files:
     0053:        d.setVar("FILERPROVIDESFLIST_" + pkg, "
".join(provides_files[pkg]))
     0054:
     0055:
 *** 0056:package_do_filedeps(d)
     0057:
File: 'package_do_filedeps', lineno: 25, function: package_do_filedeps
     0021:
     0022:    import multiprocessing
     0023:    nproc = multiprocessing.cpu_count()
     0024:    pool =  bb.utils.multiprocessingpool(nproc)
 *** 0025:    processed = list(pool.imap(oe.package.filedeprunner, pkglist))
     0026:    pool.close()
     0027:    pool.join()
     0028:
     0029:    provides_files = {}
File: '/usr/lib/python2.7/multiprocessing/pool.py', lineno: 653, function:
next
     0649:
     0650:        success, value = item
     0651:        if success:
     0652:            return value
 *** 0653:        raise value
     0654:
     0655:    __next__ = next                    # XXX
     0656:
     0657:    def _set(self, i, obj):
Exception: OSError: [Errno 12] Cannot allocate memory

ERROR: Function failed: package_do_filedeps
ERROR: Logfile of failure stored in:
/home/hutch/yocto_master_wcs_10_4_2013/poky/build/tmp/work/c6a816x_evm-poky-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/temp/log.do_package.12766
ERROR: Task 200
(/home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linux/
linux-ti81xx-psp_2.6.37.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2756 tasks of which 2752 didn't need to be
rerun and 1 failed.
No currently running tasks (2023 of 2770)

Summary: 1 task failed:
  /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linux/
linux-ti81xx-psp_2.6.37.bb, do_package
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--089e0168147031fe1804e84e9db6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br></div>I recently was able to get a master =
checkout of OECore + meta-ti to build my custom board kernel using <a href=
=3D"http://linux-ti81xx-psp_2.6.37.bb">linux-ti81xx-psp_2.6.37.bb</a>.=A0 I=
 tried to make the same modifications to a master yocto + meta-ti checkout =
and when I try to build, bitbake absolutely takes forever to build <a href=
=3D"http://linux-ti81xx-psp_2.6.37.bb">linux-ti81xx-psp_2.6.37.bb</a> and i=
t gets stuck on the do_package.=A0 I finally just let it go (hours and hour=
s on a very fast modern machine) and it looks like it finally just gave up =
the ghost and ran out of memory or something.=A0 I&#39;ve never seen anythi=
ng like it.=A0 Anyone seen anything like this before:<br>
<br>Build Configuration:<br>BB_VERSION=A0=A0=A0=A0=A0=A0=A0 =3D &quot;1.20.=
0&quot;<br>BUILD_SYS=A0=A0=A0=A0=A0=A0=A0=A0 =3D &quot;x86_64-linux&quot;<b=
r>NATIVELSBSTRING=A0=A0 =3D &quot;Debian-7.1&quot;<br>TARGET_SYS=A0=A0=A0=
=A0=A0=A0=A0 =3D &quot;arm-poky-linux-gnueabi&quot;<br>
MACHINE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D &quot;c6a816x-evm&quot;<br>DISTRO=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D &quot;poky&quot;<br>DISTRO_VERSION=A0=
=A0=A0 =3D &quot;1.5&quot;<br>TUNE_FEATURES=A0=A0=A0=A0 =3D &quot;armv7a vf=
p neon&quot;<br>TARGET_FPU=A0=A0=A0=A0=A0=A0=A0 =3D &quot;vfp-neon&quot;<br=
>
meta=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <br>meta-yocto=A0=A0=A0=A0=A0=
=A0=A0 <br>meta-yocto-bsp=A0=A0=A0 =3D &quot;master:104166c804e9068d85ccdaa=
887a33df72c8aeb85&quot;<br>meta-ti=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D &quot;=
master:9c36e6c7573c3e68c5816dd04f3dd43f485b0550&quot;<br>meta-oe=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 <br>
meta-networking=A0=A0 <br>meta-webserver=A0=A0=A0 =3D &quot;master:8aafddcc=
b03f54923927e9d1c8c80223baf581de&quot;<br><br>NOTE: Preparing runqueue<br>N=
OTE: Executing SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>ERROR: E=
rror executing a python function in /home/hutch/yocto_master_wcs_10_4_2013/=
poky/meta-ti/recipes-kernel/linux/<a href=3D"http://linux-ti81xx-psp_2.6.37=
.bb">linux-ti81xx-psp_2.6.37.bb</a>:<br>
<br>The stack trace of python calls that resulted in this exception/failure=
 was:<br>File: &#39;package_do_filedeps&#39;, lineno: 56, function: &lt;mod=
ule&gt;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 <br>
=A0=A0=A0=A0 0052:=A0=A0=A0 for pkg in provides_files:<br>=A0=A0=A0=A0 0053=
:=A0=A0=A0=A0=A0=A0=A0 d.setVar(&quot;FILERPROVIDESFLIST_&quot; + pkg, &quo=
t; &quot;.join(provides_files[pkg]))<br>=A0=A0=A0=A0 0054:<br>=A0=A0=A0=A0 =
0055:<br>=A0*** 0056:package_do_filedeps(d)<br>=A0=A0=A0=A0 0057:<br>
File: &#39;package_do_filedeps&#39;, lineno: 25, function: package_do_filed=
eps<br>=A0=A0=A0=A0 0021:<br>=A0=A0=A0=A0 0022:=A0=A0=A0 import multiproces=
sing<br>=A0=A0=A0=A0 0023:=A0=A0=A0 nproc =3D multiprocessing.cpu_count()<b=
r>=A0=A0=A0=A0 0024:=A0=A0=A0 pool =3D=A0 bb.utils.multiprocessingpool(npro=
c)<br>
=A0*** 0025:=A0=A0=A0 processed =3D list(pool.imap(oe.package.filedeprunner=
, pkglist))<br>=A0=A0=A0=A0 0026:=A0=A0=A0 pool.close()<br>=A0=A0=A0=A0 002=
7:=A0=A0=A0 pool.join()<br>=A0=A0=A0=A0 0028:<br>=A0=A0=A0=A0 0029:=A0=A0=
=A0 provides_files =3D {}<br>File: &#39;/usr/lib/python2.7/multiprocessing/=
pool.py&#39;, lineno: 653, function: next<br>
=A0=A0=A0=A0 0649:<br>=A0=A0=A0=A0 0650:=A0=A0=A0=A0=A0=A0=A0 success, valu=
e =3D item<br>=A0=A0=A0=A0 0651:=A0=A0=A0=A0=A0=A0=A0 if success:<br>=A0=A0=
=A0=A0 0652:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return value<br>=A0*** 0653:=
=A0=A0=A0=A0=A0=A0=A0 raise value<br>=A0=A0=A0=A0 0654:<br>=A0=A0=A0=A0 065=
5:=A0=A0=A0 __next__ =3D next=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 # XXX<br>
=A0=A0=A0=A0 0656:<br>=A0=A0=A0=A0 0657:=A0=A0=A0 def _set(self, i, obj):<b=
r>Exception: OSError: [Errno 12] Cannot allocate memory<br><br>ERROR: Funct=
ion failed: package_do_filedeps<br>ERROR: Logfile of failure stored in: /ho=
me/hutch/yocto_master_wcs_10_4_2013/poky/build/tmp/work/c6a816x_evm-poky-li=
nux-gnueabi/linux-ti81xx-psp/2.6.37-r0/temp/log.do_package.12766<br>
ERROR: Task 200 (/home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipe=
s-kernel/linux/<a href=3D"http://linux-ti81xx-psp_2.6.37.bb">linux-ti81xx-p=
sp_2.6.37.bb</a>, do_package) failed with exit code &#39;1&#39;<br>NOTE: Ta=
sks Summary: Attempted 2756 tasks of which 2752 didn&#39;t need to be rerun=
 and 1 failed.<br>
No currently running tasks (2023 of 2770)<br><br>Summary: 1 task failed:<br=
>=A0 /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/lin=
ux/<a href=3D"http://linux-ti81xx-psp_2.6.37.bb">linux-ti81xx-psp_2.6.37.bb=
</a>, do_package<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
<br></div>

--089e0168147031fe1804e84e9db6--
