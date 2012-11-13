Return-Path: <flavio.alves@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24488E003D9
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 05:46:42 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id k11so12093848iea.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=JyMd4sEYcwJDgXlOgpqI9nuFtz8K4Bffv/Fmv20JTI0=;
	b=ztA6zdnE/05Z9WjSZwEEFIZ7B/6NCd6W7r+fyCqV84ymjshA4Fx6/zpILacdJRQoLf
	45jhSPTRcScw2JXSt9GxB4epnIOnqX67e/bJgOd0NlqoGygcCqRNfT/ABhusLCN7W5fs
	wuyzCvCcpi6rPGAsA89aj7/rWpzRYPJnWMA7Lt103/ZrgpZRTum8z6OtRsU18exSuTml
	6Z50kpcDKI+pQOWlbo73x898oqWvH9+VXmYGDuHQ407nsoM6QI+IJJpq5ShHcdw5Opr0
	lf5UiI/6Rb3B0nlZMylRuFHvzIcXXjFDLGWrm5ZTz3SXi8jQ5aYnHiYmAB9WtQVuiKwC
	V73A==
MIME-Version: 1.0
Received: by 10.50.173.37 with SMTP id bh5mr11237161igc.45.1352814401616; Tue,
	13 Nov 2012 05:46:41 -0800 (PST)
Received: by 10.42.24.212 with HTTP; Tue, 13 Nov 2012 05:46:41 -0800 (PST)
Date: Tue, 13 Nov 2012 11:46:41 -0200
Message-ID: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Tue, 13 Nov 2012 13:46:42 -0000
Content-Type: multipart/alternative; boundary=e89a8f6464ebdaf9fd04ce60a555

--e89a8f6464ebdaf9fd04ce60a555
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

I'm using Yocto Project and meta-ti to build an embedded Linux distribution
for BeagleBoard-xM.

I need to add gstreamer-ti into the project, and I'm having problems in
building this package with my configuration.

Here is the messages:

flavio@buildstation:/home/prjs/tk0001/philinux/philinux-beagleboard$
bitbake gstreamer-ti
WARNING: Host distribution "Ubuntu 12.04.1 LTS" has not been validated with
this version of the build system; you may possibly experience unexpected
failures. It is recommended that you use a tested distribution.
WARNING:
/home/prjs/tk0001/philinux/meta-openembedded/meta-oe/recipes-connectivity/networkmanager/
networkmanager_0.9.2.0.bb: it is recommended to set SYSTEMD_PACKAGES as
<existing-package>-systemd
WARNING: /home/prjs/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb:
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd0:01
Parsing recipes: 100%
|################################################################################################################|
Time: 00:00:53
Parsing of 1216 .bb files complete (0 cached, 1216 parsed). 1545 targets,
48 skipped, 7 masked, 0 errors.

OE Build Configuration:
BB_VERSION        = "1.15.2"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.2.1"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        =
"local/origin/denzil:73cdebf60df225ee10f2eb215935be3b61e1b831"
meta-ti           =
"local/origin/denzil:9c103ce85a6ecb836bcdc46137207e466846ee2e"
meta-oe           =
"local/origin/denzil:6e434777018b81bbd7873e7278f05425de18558a"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 778 of 1629 (ID: 587,
/home/prjs/tk0001/philinux/meta-ti/recipes-ti/devtools/
ti-xdctools_3.23.00.32.bb, do_patch)
NOTE: Running task 857 of 1629 (ID: 578,
/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/
ti-codec-engine_2.26.02.11.bb, do_fetch)
NOTE: package ti-xdctools-3_23_00_32-r0: task do_patch: Started
NOTE: package ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b: task
do_fetch: Started
ERROR: Error executing a python function in
/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/
ti-codec-engine_2.26.02.11.bb:
ExpansionError: Failure expanding variable FILESPATH, expression was
${@base_set_filespath([
"/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b",
"/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/ti-codec-engine-2_26_02_11",
"/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/ti-codec-engine",
"/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/ti-codec-engine-2_26_02_11",
"/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/ti-codec-engine",
"/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/files",
"/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine" ], d)} which
triggered exception SyntaxError: EOL while scanning string literal
(FILESPATH, line 1)

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "base_do_fetch", line 18, in <module>
ERROR:
ERROR:   File "base_do_fetch", line 13, in base_do_fetch
ERROR:
ERROR:   File "/home/prjs/poky/bitbake/lib/bb/fetch2/__init__.py", line
946, in download
ERROR:     ud.setup_localpath(self.d)
ERROR:
ERROR:   File "/home/prjs/poky/bitbake/lib/bb/fetch2/__init__.py", line
621, in setup_localpath
ERROR:     self.localpath = self.method.localpath(self.url, self, d)
ERROR:
ERROR:   File "/home/prjs/poky/bitbake/lib/bb/fetch2/local.py", line 54, in
localpath
ERROR:     filespath = data.getVar('FILESPATH', d, True)
ERROR:
ERROR:   File "/home/prjs/poky/bitbake/lib/bb/data.py", line 89, in getVar
ERROR:     return d.getVar(var, exp)
ERROR:
ERROR:   File "/home/prjs/poky/bitbake/lib/bb/data_smart.py", line 282, in
getVar
ERROR:     return self.expand(value, var)
ERROR:
ERROR:   File "/home/prjs/poky/bitbake/lib/bb/data_smart.py", line 151, in
expand
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:
ERROR:   File "/home/prjs/poky/bitbake/lib/bb/data_smart.py", line 141, in
expandWithRefs
ERROR:     raise ExpansionError(varname, s, exc)
ERROR:
ERROR: The code that was being executed was:
ERROR:      0014:        except bb.fetch2.BBFetchException, e:
ERROR:      0015:            raise bb.build.FuncFailed(e)
ERROR:      0016:
ERROR:      0017:
ERROR:  *** 0018:base_do_fetch(d)
ERROR:      0019:
ERROR: (file: 'base_do_fetch', lineno: 18, function: <module>)
ERROR:      0009: bb.data.update_data(localdata)
ERROR:      0010:
ERROR:      0011:        try:
ERROR:      0012:            fetcher = bb.fetch2.Fetch(src_uri, localdata)
ERROR:  *** 0013:            fetcher.download()
ERROR:      0014:        except bb.fetch2.BBFetchException, e:
ERROR:      0015:            raise bb.build.FuncFailed(e)
ERROR:      0016:
ERROR:      0017:
ERROR: (file: 'base_do_fetch', lineno: 13, function: base_do_fetch)
ERROR: Function failed: base_do_fetch
ERROR: Logfile of failure stored in:
/home/prjs/tk0001/philinux/philinux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b/temp/log.do_fetch.26599
NOTE: package ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b: task
do_fetch: Failed
ERROR: Task 578 (/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/
ti-codec-engine_2.26.02.11.bb, do_fetch) failed with exit code '1'
Waiting for 1 running tasks to finish:
0: ti-xdctools-3_23_00_32-r0 do_patch (pid 26598)
NOTE: package ti-xdctools-3_23_00_32-r0: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 857 tasks of which 855 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/
ti-codec-engine_2.26.02.11.bb, do_fetch
Summary: There were 3 WARNING messages shown.
Summary: There were 46 ERROR messages shown, returning a non-zero exit code.

Does anybody have any clue about how to solve this issue?

Best regards,

Flavio

-- 
Flavio de Castro Alves Filho

flavio.alves@gmail.com
www.linuxembarcado.com
Twitter: http://twitter.com/#!/fraviofii
LinkedIn profile: www.linkedin.com/in/flaviocastroalves

--e89a8f6464ebdaf9fd04ce60a555
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hello all,</div><div><br></div><div>I&#39;m using Yocto Project and me=
ta-ti to build an embedded Linux distribution for BeagleBoard-xM.</div><div=
><br></div><div>I need to add gstreamer-ti into the project, and I&#39;m ha=
ving problems in building this package with my configuration.</div>
<div><br></div><div>Here is the messages:</div><div><br></div><div>flavio@b=
uildstation:/home/prjs/tk0001/philinux/philinux-beagleboard$ bitbake gstrea=
mer-ti</div><div>WARNING: Host distribution &quot;Ubuntu 12.04.1 LTS&quot; =
has not been validated with this version of the build system; you may possi=
bly experience unexpected failures. It is recommended that you use a tested=
 distribution.</div>
<div>WARNING: /home/prjs/tk0001/philinux/meta-openembedded/meta-oe/recipes-=
connectivity/networkmanager/<a href=3D"http://networkmanager_0.9.2.0.bb">ne=
tworkmanager_0.9.2.0.bb</a>: it is recommended to set SYSTEMD_PACKAGES as &=
lt;existing-package&gt;-systemd</div>
<div>WARNING: /home/prjs/poky/meta/recipes-extended/lighttpd/<a href=3D"htt=
p://lighttpd_1.4.30.bb">lighttpd_1.4.30.bb</a>: it is recommended to set SY=
STEMD_PACKAGES as &lt;existing-package&gt;-systemd0:01</div><div>Parsing re=
cipes: 100% |##############################################################=
##################################################| Time: 00:00:53</div>
<div>Parsing of 1216 .bb files complete (0 cached, 1216 parsed). 1545 targe=
ts, 48 skipped, 7 masked, 0 errors.</div><div><br></div><div>OE Build Confi=
guration:</div><div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.15.2&quot;</div><=
div>TARGET_ARCH =A0 =A0 =A0 =3D &quot;arm&quot;</div>
<div>TARGET_OS =A0 =A0 =A0 =A0 =3D &quot;linux-gnueabi&quot;</div><div>MACH=
INE =A0 =A0 =A0 =A0 =A0 =3D &quot;beagleboard&quot;</div><div>DISTRO =A0 =
=A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;</div><div>DISTRO_VERSION =A0 =A0=3D=
 &quot;1.2.1&quot;</div><div>TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neo=
n cortexa8&quot;</div>
<div>TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;</div><div>meta =A0 =
=A0 =A0 =A0 =A0 =A0 =A0</div><div>meta-yocto =A0 =A0 =A0 =A0=3D &quot;local=
/origin/denzil:73cdebf60df225ee10f2eb215935be3b61e1b831&quot;</div><div>met=
a-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;local/origin/denzil:9c103ce85a6ecb836bcd=
c46137207e466846ee2e&quot;</div>
<div>meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;local/origin/denzil:6e434777018b=
81bbd7873e7278f05425de18558a&quot;</div><div><br></div><div>NOTE: Resolving=
 any missing task queue dependencies</div><div>NOTE: Preparing runqueue</di=
v><div>NOTE: Executing SetScene Tasks</div>
<div>NOTE: Executing RunQueue Tasks</div><div>NOTE: Running task 778 of 162=
9 (ID: 587, /home/prjs/tk0001/philinux/meta-ti/recipes-ti/devtools/<a href=
=3D"http://ti-xdctools_3.23.00.32.bb">ti-xdctools_3.23.00.32.bb</a>, do_pat=
ch)</div>
<div>NOTE: Running task 857 of 1629 (ID: 578, /home/prjs/tk0001/philinux/me=
ta-ti/recipes-ti/codec-engine/<a href=3D"http://ti-codec-engine_2.26.02.11.=
bb">ti-codec-engine_2.26.02.11.bb</a>, do_fetch)</div><div>NOTE: package ti=
-xdctools-3_23_00_32-r0: task do_patch: Started</div>
<div>NOTE: package ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b: task d=
o_fetch: Started</div><div>ERROR: Error executing a python function in /hom=
e/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/<a href=3D"http://ti=
-codec-engine_2.26.02.11.bb">ti-codec-engine_2.26.02.11.bb</a>:</div>
<div>ExpansionError: Failure expanding variable FILESPATH, expression was $=
{@base_set_filespath([ &quot;/home/prjs/tk0001/philinux/meta-ti/recipes-ti/=
codec-engine/ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b&quot;, &quot;=
/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/ti-codec-engine-=
2_26_02_11&quot;, &quot;/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec=
-engine/ti-codec-engine&quot;, &quot;/home/prjs/tk0001/philinux/meta-ti/rec=
ipes-ti/codec-engine/ti-codec-engine-2_26_02_11&quot;, &quot;/home/prjs/tk0=
001/philinux/meta-ti/recipes-ti/codec-engine/ti-codec-engine&quot;, &quot;/=
home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine/files&quot;, &quo=
t;/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-engine&quot; ], d)} w=
hich triggered exception SyntaxError: EOL while scanning string literal (FI=
LESPATH, line 1)</div>
<div><br></div><div>ERROR: The stack trace of python calls that resulted in=
 this exception/failure was:</div><div>ERROR: =A0 File &quot;base_do_fetch&=
quot;, line 18, in &lt;module&gt;</div><div>ERROR:=A0</div><div>ERROR: =A0 =
File &quot;base_do_fetch&quot;, line 13, in base_do_fetch</div>
<div>ERROR:=A0</div><div>ERROR: =A0 File &quot;/home/prjs/poky/bitbake/lib/=
bb/fetch2/__init__.py&quot;, line 946, in download</div><div>ERROR: =A0 =A0=
 ud.setup_localpath(self.d)</div><div>ERROR:=A0</div><div>ERROR: =A0 File &=
quot;/home/prjs/poky/bitbake/lib/bb/fetch2/__init__.py&quot;, line 621, in =
setup_localpath</div>
<div>ERROR: =A0 =A0 self.localpath =3D self.method.localpath(self.url, self=
, d)</div><div>ERROR:=A0</div><div>ERROR: =A0 File &quot;/home/prjs/poky/bi=
tbake/lib/bb/fetch2/local.py&quot;, line 54, in localpath</div><div>ERROR: =
=A0 =A0 filespath =3D data.getVar(&#39;FILESPATH&#39;, d, True)</div>
<div>ERROR:=A0</div><div>ERROR: =A0 File &quot;/home/prjs/poky/bitbake/lib/=
bb/data.py&quot;, line 89, in getVar</div><div>ERROR: =A0 =A0 return d.getV=
ar(var, exp)</div><div>ERROR:=A0</div><div>ERROR: =A0 File &quot;/home/prjs=
/poky/bitbake/lib/bb/data_smart.py&quot;, line 282, in getVar</div>
<div>ERROR: =A0 =A0 return self.expand(value, var)</div><div>ERROR:=A0</div=
><div>ERROR: =A0 File &quot;/home/prjs/poky/bitbake/lib/bb/data_smart.py&qu=
ot;, line 151, in expand</div><div>ERROR: =A0 =A0 return self.expandWithRef=
s(s, varname).value</div>
<div>ERROR:=A0</div><div>ERROR: =A0 File &quot;/home/prjs/poky/bitbake/lib/=
bb/data_smart.py&quot;, line 141, in expandWithRefs</div><div>ERROR: =A0 =
=A0 raise ExpansionError(varname, s, exc)</div><div>ERROR:=A0</div><div>ERR=
OR: The code that was being executed was:</div>
<div>ERROR: =A0 =A0 =A00014: =A0 =A0 =A0 =A0except bb.fetch2.BBFetchExcepti=
on, e:</div><div>ERROR: =A0 =A0 =A00015: =A0 =A0 =A0 =A0 =A0 =A0raise bb.bu=
ild.FuncFailed(e)</div><div>ERROR: =A0 =A0 =A00016:</div><div>ERROR: =A0 =
=A0 =A00017:</div><div>ERROR: =A0*** 0018:base_do_fetch(d)</div>
<div>ERROR: =A0 =A0 =A00019:</div><div>ERROR: (file: &#39;base_do_fetch&#39=
;, lineno: 18, function: &lt;module&gt;)</div><div>ERROR: =A0 =A0 =A00009:<=
span class=3D"" style=3D"white-space:pre">	</span>bb.data.update_data(local=
data)</div><div>
ERROR: =A0 =A0 =A00010:</div><div>ERROR: =A0 =A0 =A00011: =A0 =A0 =A0 =A0tr=
y:</div><div>ERROR: =A0 =A0 =A00012: =A0 =A0 =A0 =A0 =A0 =A0fetcher =3D bb.=
fetch2.Fetch(src_uri, localdata)</div><div>ERROR: =A0*** 0013: =A0 =A0 =A0 =
=A0 =A0 =A0fetcher.download()</div><div>ERROR: =A0 =A0 =A00014: =A0 =A0 =A0=
 =A0except bb.fetch2.BBFetchException, e:</div>
<div>ERROR: =A0 =A0 =A00015: =A0 =A0 =A0 =A0 =A0 =A0raise bb.build.FuncFail=
ed(e)</div><div>ERROR: =A0 =A0 =A00016:</div><div>ERROR: =A0 =A0 =A00017:</=
div><div>ERROR: (file: &#39;base_do_fetch&#39;, lineno: 13, function: base_=
do_fetch)</div><div>ERROR: Function failed: base_do_fetch</div>
<div>ERROR: Logfile of failure stored in: /home/prjs/tk0001/philinux/philin=
ux-beagleboard/tmp/work/beagleboard-poky-linux-gnueabi/ti-codec-engine-2_26=
_02_11-${MACHINE_KERNEL_PR}b/temp/log.do_fetch.26599</div><div>NOTE: packag=
e ti-codec-engine-2_26_02_11-${MACHINE_KERNEL_PR}b: task do_fetch: Failed</=
div>
<div>ERROR: Task 578 (/home/prjs/tk0001/philinux/meta-ti/recipes-ti/codec-e=
ngine/<a href=3D"http://ti-codec-engine_2.26.02.11.bb">ti-codec-engine_2.26=
.02.11.bb</a>, do_fetch) failed with exit code &#39;1&#39;</div><div>Waitin=
g for 1 running tasks to finish:</div>
<div>0: ti-xdctools-3_23_00_32-r0 do_patch (pid 26598)</div><div>NOTE: pack=
age ti-xdctools-3_23_00_32-r0: task do_patch: Succeeded</div><div>NOTE: Tas=
ks Summary: Attempted 857 tasks of which 855 didn&#39;t need to be rerun an=
d 1 failed.</div>
<div><br></div><div>Summary: 1 task failed:</div><div>=A0 /home/prjs/tk0001=
/philinux/meta-ti/recipes-ti/codec-engine/<a href=3D"http://ti-codec-engine=
_2.26.02.11.bb">ti-codec-engine_2.26.02.11.bb</a>, do_fetch</div><div>Summa=
ry: There were 3 WARNING messages shown.</div>
<div>Summary: There were 46 ERROR messages shown, returning a non-zero exit=
 code.</div><div><br></div><div>Does anybody have any clue about how to sol=
ve this issue?</div><div><br></div><div>Best regards,</div><div><br></div>
<div>Flavio</div><div><br></div>-- <br>Flavio de Castro Alves Filho<br><br>=
<a href=3D"mailto:flavio.alves@gmail.com" target=3D"_blank">flavio.alves@gm=
ail.com</a><div><a href=3D"http://www.linuxembarcado.com" target=3D"_blank"=
>www.linuxembarcado.com</a><br>
Twitter: <a href=3D"http://twitter.com/#!/fraviofii" target=3D"_blank">http=
://twitter.com/#!/fraviofii</a><br></div><div>LinkedIn profile: <a href=3D"=
http://www.linkedin.com/in/flaviocastroalves" target=3D"_blank">www.linkedi=
n.com/in/flaviocastroalves</a></div>
<br>

--e89a8f6464ebdaf9fd04ce60a555--
